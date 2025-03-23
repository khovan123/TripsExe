package controller;

import com.paypal.base.rest.PayPalRESTException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import model.User;

@WebServlet(urlPatterns = {"/authorize-payment"})
public class AuthorizePaymentServlet extends HttpServlet {

    private PayPalService payPalService;

    @Override
    public void init() throws ServletException {
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
        User user = (User) session.getAttribute("user");
        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/pages/SignInPage.jsp");
            return;
        }

        String amountRaw = request.getParameter("amount");
        String packageDescription = request.getParameter("packageDescription");

        if (amountRaw == null || amountRaw.trim().isEmpty()) {
            session.setAttribute("error", "Amount is required!");
            response.sendRedirect(request.getContextPath() + "/pages/ErrorPage.jsp");
            return;
        }
        if (packageDescription == null || packageDescription.trim().isEmpty()) {
            packageDescription = "Upgrade account to Premium";
        }

        double amount;
        try {
            amount = Double.parseDouble(amountRaw);
            if (amount <= 0) {
                throw new NumberFormatException("Amount must be greater than 0");
            }
        } catch (NumberFormatException | ClassCastException e) {
            session.setAttribute("error", e.getMessage());
            response.sendRedirect(request.getContextPath() + "/pages/ErrorPage.jsp");
            return;
        }

        try {
            String approvalLink = payPalService.authorizePayment(user, amount, packageDescription);
            if (approvalLink == null || approvalLink.trim().isEmpty()) {
                session.setAttribute("error", "Failed to generate approval link!");
                response.sendRedirect(request.getContextPath() + "/pages/ErrorPage.jsp");
            } else {
                response.sendRedirect(approvalLink);
            }
        } catch (PayPalRESTException e) {
            request.setAttribute("error", "Failed to initiate payment: " + e.getMessage());
            response.sendRedirect(request.getContextPath() + "/pages/ErrorPage.jsp");
        }
    }
}
