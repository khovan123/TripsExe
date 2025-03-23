package controller;

import CRUD.*;
import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;
import java.sql.*;
import model.*;

@WebServlet(urlPatterns = {"/signIn", "/signUp", "/sign-out"})
public class AuthServlet extends HttpServlet {

    private UserDAO userDAO;
    private PostDAO postDAO;

    @Override
    public void init() throws ServletException {
        userDAO = new UserDAO();
        postDAO = new PostDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (request.getRequestURI().endsWith("/sign-out")) {
            for (Cookie cookie : request.getCookies()) {
                cookie.setMaxAge(0);
            }
            response.sendRedirect(request.getContextPath() + "/index.jsp");
        }
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
            session.setAttribute("error", "Authentication failed!");
            response.sendRedirect(request.getContextPath() + "/pages/ErrorPage.jsp");
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
                session.setAttribute("error2", "Password is not correct!");
                response.sendRedirect(request.getContextPath() + "/pages/SignInPage.jsp");
                return;
            }

            try {
                if (userDAO.checkDeleteAction(user.getUserId())) {
                    session.setAttribute("error1", "Email is not existed!");
                    response.sendRedirect(request.getContextPath() + "/pages/SignInPage.jsp");
                    return;
                } else {
                    userDAO.restoreAccount(user.getUserId());
                }
            } catch (SQLException e) {
                //empty in deleteaccount waiting table
            }

            session.setAttribute("user", user);

            if (remember != null) {
                Cookie cookie2 = new Cookie("logIned", "true");
                response.addCookie(cookie2);
                cookie2.setHttpOnly(true);
                cookie2.setMaxAge(60 * 60 * 24 * 7);
            }
            response.sendRedirect(request.getContextPath() + "/post-load");
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

                session.setAttribute("user", user);

                if (remember != null) {
                    Cookie cookie2 = new Cookie("logIned", "true");
                    response.addCookie(cookie2);
                    cookie2.setDomain("localhost");
                    cookie2.setHttpOnly(true);
                    cookie2.setMaxAge(60 * 60 * 24 * 7);
                }
                response.sendRedirect(request.getContextPath() + "/post-load");
            } catch (SQLException e) {
                session.setAttribute("error", e.getMessage());
                response.sendRedirect(request.getContextPath() + "/pages/ErrorPage.jsp");
            }
        }
    }
}
