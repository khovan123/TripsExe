package controller;

import CRUD.UserDAO;
import java.io.IOException;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.sql.*;
import model.User;

@WebServlet(urlPatterns = {"/signIn", "/signUp"})
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
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String remember = request.getParameter("remember");
        String confirmPassword = request.getParameter("confirm-password");

        if (email == null || email.trim().isEmpty() || password == null || password.trim().isEmpty()) {
            request.setAttribute("error", "Authentication failed!");
            request.getRequestDispatcher("/pages/ErrorPage.jsp").forward(request, response);
            return;
        }
        email = email.trim();
        password = password.trim();

        if (request.getRequestURI().endsWith("/signIn")) {
            try {
                User user = userDAO.getUserByEmail(email);
                if (user == null) {
                    request.setAttribute("error1", "Email is not correct!");
                    request.getRequestDispatcher("/pages/SignInPage.jsp").forward(request, response);
                    return;
                }

                if (!user.getPassword().equals(password)) {
                    request.setAttribute("error2", "Password is not correct!");
                    request.getRequestDispatcher("/pages/SignInPage.jsp").forward(request, response);
                    return;
                }

                Cookie cookie1 = new Cookie("userId", String.valueOf(user.getUserId()));
                response.addCookie(cookie1);
                cookie1.setDomain("localhost");
                cookie1.setHttpOnly(true);
                cookie1.setMaxAge(60 * 60 * 24 * 7);

                if (remember != null) {
                    Cookie cookie2 = new Cookie("logIned", "true");
                    response.addCookie(cookie2);
                    cookie2.setDomain("localhost");
                    cookie2.setHttpOnly(true);
                    cookie2.setMaxAge(60 * 60 * 24 * 7);
                }
                response.sendRedirect("/pages/AuthPage.jsp");
            } catch (SQLException e) {
                request.setAttribute("error", e.getMessage());
                request.getRequestDispatcher("/pages/ErrorPage.jsp").forward(request, response);
            }
        } else if (request.getRequestURI().endsWith("/signUp")) {
            if (confirmPassword == null || confirmPassword.trim().isEmpty()) {
                request.setAttribute("error", "Authentication failed!");
                request.getRequestDispatcher("/pages/ErrorPage.jsp").forward(request, response);
                return;
            }
            if (!confirmPassword.equals(password)) {
                request.setAttribute("error3", "Confirm password must be correct!");
                request.getRequestDispatcher("/pages/SignUpPage.jsp").forward(request, response);
                return;
            }
            try {
                try {
                    if (userDAO.getUserByEmail(email) != null) {
                        request.setAttribute("email", email);
                        request.setAttribute("error1", "Email already exists!");
                        request.getRequestDispatcher("/pages/SignUpPage.jsp").forward(request, response);
                        return;
                    }
                } catch (SQLException e) {

                }
                userDAO.addUser(email, password);
                User user = userDAO.getUserByEmail(email);
                if (user == null) {
                    request.setAttribute("error", "Create failed!");
                    request.getRequestDispatcher("/pages/ErrorPage.jsp").forward(request, response);
                    return;
                }
                Cookie cookie1 = new Cookie("userId", String.valueOf(user.getUserId()));
                response.addCookie(cookie1);
                cookie1.setDomain("localhost");
                cookie1.setHttpOnly(true);
                cookie1.setMaxAge(60 * 60 * 24 * 7);

                if (remember != null) {
                    Cookie cookie2 = new Cookie("logIned", "true");
                    response.addCookie(cookie2);
                    cookie2.setDomain("localhost");
                    cookie2.setHttpOnly(true);
                    cookie2.setMaxAge(60 * 60 * 24 * 7);
                }
                response.sendRedirect("/pages/AuthPage.jsp");
            } catch (SQLException e) {
                request.setAttribute("error", e.getMessage());
                request.getRequestDispatcher("/pages/ErrorPage.jsp").forward(request, response);
            }
        }
    }
}
