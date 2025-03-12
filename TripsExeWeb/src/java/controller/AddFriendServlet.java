package controller;

import CRUD.FriendsDAO;
import CRUD.NotifyDAO;
import CRUD.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Friend;
import model.User;

@WebServlet(name = "AddFriendServlet", urlPatterns = {"/addfriend"})
public class AddFriendServlet extends HttpServlet {

    private UserDAO userDAO;
    private FriendsDAO friendsDAO;
    private NotifyDAO notifyDAO;

    @Override
    public void init() throws ServletException {
        userDAO = new UserDAO();
        friendsDAO = new FriendsDAO();
        notifyDAO = new NotifyDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String senderId_Raw = request.getParameter("senderId");
        String receiverId_Raw = request.getParameter("receiverId");

        try {
            int senderId = Integer.parseInt(senderId_Raw);
            int receiverId = Integer.parseInt(receiverId_Raw);

            User user1 = userDAO.getUserById(senderId);
            User user2 = userDAO.getUserById(receiverId);

            if (user1 == null) {
                request.setAttribute("errorMsg", "Error: User " + senderId + " does not exist.");
                request.getRequestDispatcher("something.jsp").forward(request, response);
                return;
            }

            if (user2 == null) {
                request.setAttribute("errorMsg", "Error: User " + receiverId + " does not exist.");
                request.getRequestDispatcher("something.jsp").forward(request, response);
                return;
            }

            if (friendsDAO.isFriendshipExist(senderId, receiverId)) {
                request.setAttribute("errorMsg", "Error: Users are already friends.");
                request.getRequestDispatcher("something.jsp").forward(request, response);
                return;
            }

            friendsDAO.addFriends(senderId, receiverId);

            String messageContent = user1.getUsername() + " had added you as a friends";
            notifyDAO.sendNotification(senderId, receiverId, messageContent, false);

        } catch (NumberFormatException ex) {
            request.setAttribute("errorMsg", "Error: Invalid ID format. Please provide numeric IDs");
        } catch (SQLException ex) {
            Logger.getLogger(AddFriendServlet.class.getName()).log(Level.SEVERE, null, ex);
            request.setAttribute("errorMsg", "Error: Failed to add friend or send notification");
        }
        request.getRequestDispatcher("something.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    public String getServletInfo() {
        return "Servlet to add a friend and send a notification";
    }

}
