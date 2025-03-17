package websocket;

import CRUD.FriendDAO;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import model.User;

@WebServlet(urlPatterns = {"/chat"})
public class ChatServlet extends HttpServlet {

    private FriendDAO friendDAO = new FriendDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userId") == null) {
            response.sendRedirect(request.getContextPath() + "/signIn");
            return;
        }

        int userId = (Integer) session.getAttribute("userId");
        String fullName = (String) session.getAttribute("fullName");

        try {
            List<User> friends = friendDAO.getAll_Profile_OfFriends(userId);
            request.setAttribute("friends", friends);
            request.setAttribute("userId", userId);
            request.setAttribute("fullName", fullName);
            request.getRequestDispatcher("/pages/ChattingPage.jsp").forward(request, response);
        } catch (SQLException e) {
            request.setAttribute("error", "Error fetching friends: " + e.getMessage());
            request.getRequestDispatcher("/pages/ErrorPage.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response); // Gọi lại doGet để xử lý
    }
}