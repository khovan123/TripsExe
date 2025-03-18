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
        HttpSession session = request.getSession(false);
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
            User user = null;
            try {
                user = userDAO.getUserByEmail(email);
            } catch (SQLException e) {
                session.setAttribute("email", email);
                session.setAttribute("error1", "Email is not correct!");
                response.sendRedirect(request.getContextPath() + "/pages/SignInPage.jsp");
                return;
            }

            if (!user.getPassword().equals(password)) {
                session.setAttribute("email", email);
                request.setAttribute("error2", "Password is not correct!");
                request.getRequestDispatcher("/pages/SignInPage.jsp").forward(request, response);
                return;
            }

            session.setAttribute("userId", user.getUserId());
            session.setAttribute("fullName", user.getFullName());

            if (remember != null) {
                Cookie cookie2 = new Cookie("logIned", "true");
                response.addCookie(cookie2);
                cookie2.setHttpOnly(true);
                cookie2.setMaxAge(60 * 60 * 24 * 7);
            }

            response.sendRedirect(request.getContextPath() + "/pages/HomePage.jsp");

        } else if (request.getRequestURI().endsWith("/signUp")) {
            if (confirmPassword == null || confirmPassword.trim().isEmpty()) {
                response.sendRedirect(request.getContextPath() + "/pages/ErrorPage.jsp");
                return;
            }
            if (!confirmPassword.equals(password)) {
                session.setAttribute("error3", "Confirm password must be correct!");
                response.sendRedirect(request.getContextPath() + "/pages/SignUpPage.jsp");
                return;
            }
            try {
                try {
                    if (userDAO.getUserByEmail(email) != null) {
                        session.setAttribute("error1", "Email already exists!");
                        response.sendRedirect(request.getContextPath() + "/pages/SignUpPage.jsp");
                        return;
                    }
                } catch (SQLException e) {
                    session.setAttribute("error", e.getMessage());
                    response.sendRedirect(request.getContextPath() + "/pages/ErrorPage.jsp");
                    return;
                }
                userDAO.addUser(email, password);
                User user = userDAO.getUserByEmail(email);
                if (user == null) {
                    response.sendRedirect(request.getContextPath() + "/pages/ErrorPage.jsp");
                    return;
                }

                session.setAttribute("userId", user.getUserId());
                session.setAttribute("fullName", user.getFullName());

                if (remember != null) {
                    Cookie cookie2 = new Cookie("logIned", "true");
                    response.addCookie(cookie2);
                    cookie2.setDomain("localhost");
                    cookie2.setHttpOnly(true);
                    cookie2.setMaxAge(60 * 60 * 24 * 7);
                }
                response.sendRedirect(request.getContextPath() + "/pages/AuthPage.jsp");
            } catch (SQLException e) {
                session.setAttribute("error", e.getMessage());
                response.sendRedirect(request.getContextPath() + "/pages/ErrorPage.jsp");
            }
        }
    }
}
