package controller;

import CRUD.PostDAO;
import CRUD.*;
import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;
import java.sql.*;
import model.*;

@WebServlet(urlPatterns = {"/post-add"})
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
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String requestURI = request.getRequestURI();
        HttpSession session = request.getSession(false);
        if (session.getAttribute("userId") == null) {
            response.sendRedirect(request.getContextPath() + "/pages/SignInPage.jsp");
            return;
        }
        if (requestURI.endsWith("/post-add")) {
            int userId = (Integer) session.getAttribute("userId");
            String content = request.getParameter("content");
            String imageUrl = request.getParameter("imageUrl");

            Post p = new Post();
            p.setUserId(userId);
            p.setContent(content);
            p.setImageUrl(imageUrl);

            try {
                postDAO.addPost(p);
                response.sendRedirect(request.getContextPath() + "/pages/HomePage.jsp");
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
