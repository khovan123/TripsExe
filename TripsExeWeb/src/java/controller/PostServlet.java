package controller;

import CRUD.PostDAO;
import CRUD.*;
import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;
import java.sql.*;
import java.util.*;
import model.*;

@WebServlet(urlPatterns = {"/post-add", "/post-load"})
public class PostServlet extends HttpServlet {

    private UserDAO userDAO;
    private PostDAO postDAO;

    @Override
    public void init() {
        userDAO = new UserDAO();
        postDAO = new PostDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String requestURI = request.getRequestURI();
        HttpSession session = request.getSession(false);
        User user = (User) session.getAttribute("user");
        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/pages/SignInPage.jsp");
            return;
        }
        if (requestURI.endsWith("/post-load")) {
            try {
                List<Post> posts = postDAO.getAllPosts(user.getUserId());
                session.setAttribute("posts", posts);
                response.sendRedirect(request.getContextPath() + "/pages/HomePage.jsp");
            } catch (SQLException e) {
                response.sendRedirect(request.getContextPath() + "/pages/SignInPage.jsp");
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String requestURI = request.getRequestURI();
        HttpSession session = request.getSession(false);
        User user = (User) session.getAttribute("user");
        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/pages/SignInPage.jsp");
            return;
        }
        if (requestURI.endsWith("/post-add")) {
            int userId = user.getUserId();
            String content = request.getParameter("content");
            String imageUrl = request.getParameter("imageUrl");
            String activity = request.getParameter("activity");
            Post p = new Post();
            p.setUserId(userId);
            p.setContent(content);
            p.setImageUrl(imageUrl);
            p.setActivity(activity);
            try {
                postDAO.addPost(p);
                response.sendRedirect(request.getContextPath() + "/post-load");
            } catch (SQLException ex) {
                ex.printStackTrace();
                response.sendRedirect(request.getContextPath() + "/pages/ErrorPage.jsp");
            }
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
