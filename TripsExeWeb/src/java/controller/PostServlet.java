package controller;

import CRUD.PostDAO;
import CRUD.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import model.Post;

@WebServlet(name = "PostServlet", urlPatterns = {"/post"})
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
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        String title = request.getParameter("postTitle");
        String content = request.getParameter("postContent");
        String imageUrl = request.getParameter("postImage");

        if (title == null || title.trim().isEmpty() || content == null || content.trim().isEmpty()) {
            request.setAttribute("errorMsg", "Error: Title and content cannot be null");
            request.getRequestDispatcher("something.jsp").forward(request, response); 
            return;
        }

        Post p = new Post();
        p.setTitle(title);
        p.setContent(content);
        p.setImageUrl(imageUrl);

        try {
            postDAO.addPost(p);

            request.setAttribute("postSuccess", "Post has been successfully created!");
            request.getRequestDispatcher("something.jsp").forward(request, response); 
        } catch (SQLException ex) {
            ex.printStackTrace();
            request.setAttribute("errorMsg", "Error: Unable to create post. Please try again.");
            request.getRequestDispatcher("something.jsp").forward(request, response); 
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
