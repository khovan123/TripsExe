package controller;

import CRUD.*;
import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;
import java.util.*;
import model.*;

@WebServlet(urlPatterns = {"/post-load-me", "/update-info-me"})
public class UserProfileServlet extends HttpServlet {

    private PostDAO postDAO = new PostDAO();

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
        if(url.endsWith("/update-info-me")){
            String fullName = (String) request.getParameter("fullName");
            String overview = (String) request.getParameter("overview");
            String additionalName = (String) request.getParameter("additionalName");
            String username = (String) request.getParameter("username");
            String dob = (String) request.getParameter("dob");
            String phoneNumber = (String) request.getParameter("phoneNumber");
            String email = (String) request.getParameter("email");
            
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
