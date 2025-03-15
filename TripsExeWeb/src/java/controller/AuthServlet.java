package controller;

import CRUD.UserDAO;
import java.io.IOException;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.sql.*;
import model.User;

@WebServlet("/signIn")
public class AuthServlet extends HttpServlet {

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
        String email = (String) request.getParameter("email").trim();
        String password = (String) request.getParameter("password").trim();

        if (email == null || email.trim().isEmpty() || password == null || password.trim().isEmpty()) {
            request.setAttribute("error", "Athenticate failed!");
            request.getRequestDispatcher("error.jsp").forward(request, response);
            return;
        }
        try {
            User user = userDAO.getUserByEmail(email);
            if (user == null) {
                request.setAttribute("error1", "Email is not correct!");
                request.getRequestDispatcher("SignInPage.jsp").forward(request, response);
                return;
            }

            if (!user.getPassword().equals(password)) {
                request.setAttribute("error2", "Password is not correct!");
                request.getRequestDispatcher("SignInPage.jsp").forward(request, response);
                return;
            }

            Cookie userIdCookie = new Cookie("userId", String.valueOf(user.getUserId()));
            userIdCookie.setMaxAge(60 * 60 * 24 * 7);
            response.addCookie(userIdCookie);
            response.sendRedirect("pages/HomePage.jsp");

        } catch (SQLException e) {
            request.setAttribute("error", e.getMessage());
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }

}
