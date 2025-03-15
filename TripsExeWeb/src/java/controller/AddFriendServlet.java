package controller;

import CRUD.FriendsDAO;
import CRUD.NotifyDAO;
import CRUD.UserDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.User;

@WebServlet(urlPatterns = {"/add"})
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

        String requestURI = request.getRequestURI();

        if (!requestURI.endsWith("/add")) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid request endpoint.");
            return;
        }

        String userId1_raw = request.getParameter("userId1");
        String userId2_raw = request.getParameter("userId2");

        try {
            int userId1 = Integer.parseInt(userId1_raw);
            int userId2 = Integer.parseInt(userId2_raw);

            User user1 = userDAO.getUserById(userId1);
            User user2 = userDAO.getUserById(userId2);

            if (user1 == null) {
                request.setAttribute("errorMsg", "Error: User " + userId1 + " does not exist.");
                request.getRequestDispatcher("error.jsp").forward(request, response);
                return;
            }

            if (user2 == null) {
                request.setAttribute("errorMsg", "Error: User " + userId2 + " does not exist.");
                request.getRequestDispatcher("error.jsp").forward(request, response);
                return;
            }

            if (friendsDAO.isFriendshipExist(userId1, userId2)) {
                request.setAttribute("errorMsg", "Error: Users are already friends.");
                request.getRequestDispatcher("error.jsp").forward(request, response);
                return;
            }

            friendsDAO.addFriends(userId1, userId2);

            String msgForUser2 = user1.getUsername() + " has added you as a friend.";
            notifyDAO.sendNotification(userId2, msgForUser2, false);

            String msgForUser1 = "You have sent a friend request to " + user2.getUsername() + ".";
            notifyDAO.sendNotification(userId1, msgForUser1, false);

            request.setAttribute("successMsg", "Friend request sent successfully!");
            request.getRequestDispatcher("success.jsp").forward(request, response);

        } catch (NumberFormatException ex) {
            request.setAttribute("errorMsg", "Error: Invalid ID format. Please provide numeric IDs.");
            request.getRequestDispatcher("error.jsp").forward(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(AddFriendServlet.class.getName()).log(Level.SEVERE, null, ex);
            request.setAttribute("errorMsg", "Error: Failed to add friend or send notification.");
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
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
