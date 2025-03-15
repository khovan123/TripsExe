package controller;

import CRUD.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.User;

@WebServlet("/signIn")
public class SignInServlet extends HttpServlet {

    private UserDAO userDAO;

    @Override
    public void init() throws ServletException {
        userDAO = new UserDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        email.trim();
        password.trim();

        if (email == null || email.trim().isEmpty() || password == null || password.trim().isEmpty()) {
            request.setAttribute("errorMsg", "Email and Password cannot be empty.");
            request.getRequestDispatcher("signInPage.jsp").forward(request, response);
            return;
        }
        try {
            User user = userDAO.getUserByEmail(email);
            if (user == null) {
                request.setAttribute("errorMsg", "Cannot found user with this email.");
                request.getRequestDispatcher("signInPage.jsp").forward(request, response);
                return;
            }

            if (!user.getPassword().equals(password)) {
                request.setAttribute("errorMsg", "Incorrect Password.");
                request.getRequestDispatcher("signInPage.jsp").forward(request, response);
                return;
            }
            
            Cookie userIdCookie = new Cookie("userId", String.valueOf(user.getUserId()));
            userIdCookie.setMaxAge(60 * 60 * 24 * 7); // 7 ngày
            userIdCookie.setPath("/");
            response.addCookie(userIdCookie);
            
            response.sendRedirect("pages/HomePage.jsp");

        } catch (SQLException ex) {
            Logger.getLogger(SignInServlet.class.getName()).log(Level.SEVERE, null, ex);
            request.setAttribute("errorMsg", "An error occurred while signing in. Please try again.");
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }

}
