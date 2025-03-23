package controller;

import CRUD.*;
import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;
import java.util.*;
import model.*;
import java.sql.Date;
import java.sql.SQLException;

@WebServlet(urlPatterns = {"/post-load-me", "/update-info-me", "/delete-me"})
public class UserProfileServlet extends HttpServlet {

    private PostDAO postDAO = new PostDAO();
    private UserDAO userDAO = new UserDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = request.getRequestURI();
        HttpSession session = request.getSession(false);
        User user = (User) session.getAttribute("user");
        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/pages/SignInPage.jsp");
            return;
        }

        if (url.endsWith("/post-load-me")) {
            try {
                List<Post> postsMe = postDAO.getAllPostsOfUser(user.getUserId());
                session.setAttribute("postsMe", postsMe);
                response.sendRedirect(request.getContextPath() + "/pages/UserProfile.jsp");
            } catch (Exception e) {
                response.sendRedirect(request.getContextPath() + "/pages/SignInPage.jsp");
                return;
            }
        } else if (url.endsWith("/delete-me")) {
            try {
                userDAO.signDeleteAccount(user.getUserId());
                response.sendRedirect(request.getContextPath() + "/sign-out");
            } catch (SQLException e) {
                response.sendRedirect(request.getContextPath() + "/sign-out");
            }
            return;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = request.getRequestURI();
        HttpSession session = request.getSession(false);
        User user = (User) session.getAttribute("user");
        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/pages/SignInPage.jsp");
            return;
        }
        if (url.endsWith("/update-info-me")) {
            try {
                String fullName = (String) request.getParameter("fullName");
                String overview = (String) request.getParameter("overview");
                String additionalName = (String) request.getParameter("additionalName");
                String username = (String) request.getParameter("username");
                String dob = (String) request.getParameter("dob");
                String phoneNumber = (String) request.getParameter("phoneNumber");
                String email = (String) request.getParameter("email");
                user.setFullName(fullName);
                user.setAdditionalName(additionalName);
                user.setOverview(overview);
                user.setUsername(username);
                user.setEmail(email);
                user.setPhoneNumber(phoneNumber);
                user.setDob(Date.valueOf(dob));
                userDAO.updateUser(user);
                session.setAttribute("user", user);
                session.setAttribute("success", "Sucessfully!");
                response.sendRedirect(request.getContextPath() + "/pages/SettingPage.jsp");
            } catch (SQLException e) {
                session.setAttribute("error", e.getMessage());
                response.sendRedirect(request.getContextPath() + "/pages/SettingPage.jsp");
            }
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
