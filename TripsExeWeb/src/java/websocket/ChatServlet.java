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
            response.sendRedirect(request.getContextPath() + "/pages/SignInPage.jsp");
            return;
        }

        int userId = (Integer) session.getAttribute("userId");
        String fullName = (String) session.getAttribute("fullName");

        try {
            List<User> friends = friendDAO.getAll_Profile_OfFriends(userId);
            session.setAttribute("friends", friends);
            session.setAttribute("userId", userId);
            session.setAttribute("fullName", fullName);
            response.sendRedirect(request.getContextPath() + "/pages/ChattingPage.jsp");
        } catch (SQLException e) {
            session.setAttribute("error", e.getMessage());
            response.sendRedirect(request.getContextPath() + "/pages/ErrorPage.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response); // Gọi lại doGet để xử lý
    }
}
