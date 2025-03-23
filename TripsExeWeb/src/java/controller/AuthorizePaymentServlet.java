package controller;

import CRUD.UserDAO;
import com.paypal.base.rest.PayPalRESTException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.PayPalService;
import model.User;

@WebServlet(name = "AuthorizePaymentServlet", urlPatterns = {"/authorize_payment"})
public class AuthorizePaymentServlet extends HttpServlet {

    private UserDAO userDAO;
    private PayPalService payPalService;

    @Override
    public void init() throws ServletException {
        userDAO = new UserDAO();
        payPalService = new PayPalService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userId") == null) {
            response.sendRedirect(request.getContextPath() + "/pages/SignInPage.jsp");
            return;
        }

        String amountRaw = request.getParameter("ammount");
        String packageDescription = request.getParameter("packageDescription");

        if (amountRaw == null || amountRaw.trim().isEmpty()) {
            request.setAttribute("error", "Amount is required!");
            request.getRequestDispatcher("/pages/ErrorPage.jsp").forward(request, response);
            return;
        }
        if (packageDescription == null || packageDescription.trim().isEmpty()) {
            packageDescription = "Upgrade account to Premium";
        }

        int userId;
        double amount;
        try {
            userId = (int) session.getAttribute("userId");
            amount = Double.parseDouble(amountRaw);
            if (amount <= 0) {
                throw new NumberFormatException("Amount must be greater than 0");
            }
        } catch (NumberFormatException | ClassCastException e) {
            request.setAttribute("error", e.getMessage());
            request.getRequestDispatcher("/pages/ErrorPage.jsp").forward(request, response);
            return;
        }

        try {
            User user = userDAO.getUserById(userId);
            if (user == null) {
                request.setAttribute("error", "User not found!");
                request.getRequestDispatcher("/pages/ErrorPage.jsp").forward(request, response);
                return;
            }

            String approvalLink = payPalService.authorizePayment(user, amount, packageDescription);
            if (approvalLink == null || approvalLink.trim().isEmpty()) {
                request.setAttribute("error", "Failed to generate approval link!");
                request.getRequestDispatcher("/pages/ErrorPage.jsp").forward(request, response);
            } else {
                response.sendRedirect(approvalLink);
            }
        } catch (PayPalRESTException e) {
            request.setAttribute("error", "Failed to initiate payment: " + e.getMessage());
            request.getRequestDispatcher("/pages/ErrorPage.jsp").forward(request, response);
        } catch (SQLException e) {
            request.setAttribute("error", "Database error: " + e.getMessage());
            request.getRequestDispatcher("/pages/ErrorPage.jsp").forward(request, response);
        }
    }
}
