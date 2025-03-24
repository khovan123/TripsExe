package controller;

import CRUD.*;
import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;
import java.security.GeneralSecurityException;
import java.sql.*;
import java.util.*;
import model.*;
import service.UploadImageService;

@WebServlet(urlPatterns = {"/post-add", "/post-load"})
@MultipartConfig
public class PostServlet extends HttpServlet {

    private PostDAO postDAO;
    private UploadImageService uploadImageService = new UploadImageService();

    @Override
    public void init() {
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
            String content = request.getParameter("content");
            String activity = request.getParameter("activity");
            Post p = new Post();
            p.setUserId(user.getUserId());
            p.setContent(content);
            p.setActivity(activity);

            Part filePart = request.getPart("image");
            if (filePart == null || filePart.getSize() == 0) {
//                resp.getWriter().write("File is empty");
                return;
            }
            File tempFile = File.createTempFile("temp", null);
            try {
                filePart.write(tempFile.getAbsolutePath());
                String url = uploadImageService.uploadImageToDrive(tempFile);
                p.setImageUrl(url);
                postDAO.addPost(p);

                String loadMe = (String) request.getAttribute("me");

                if (loadMe != null && loadMe.equalsIgnoreCase("true")) {
                    response.sendRedirect(request.getContextPath() + "/post-load-me");
                    return;
                }
                response.sendRedirect(request.getContextPath() + "/post-load");
            } catch (Exception e) {
                session.setAttribute("error", e.getMessage());
                response.sendRedirect(request.getContextPath() + "/pages/ErrorPage.jsp");
            } finally {
                tempFile.delete();
            }
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
