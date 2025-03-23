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
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect(request.getContextPath() + "/pages/SignInPage.jsp");
            return;
        }

        User user = (User) session.getAttribute("user");

        try {
            List<User> friends = friendDAO.getAll_Profile_OfFriends(user.getUserId());
            session.setAttribute("friends", friends);
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