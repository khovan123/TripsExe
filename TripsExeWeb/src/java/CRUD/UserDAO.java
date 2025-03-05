package CRUD;

import connectDB.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Notify;
import model.User;

public class UserDAO extends DBContext {

    // CRUD Cho User
    public void createUser(User user) throws SQLException {
        String sql = "INSERT INTO UserTBL(userId, username, password, email, avatar, premiumExpirationDate, isPremiumAccount)"
                + " VALUES(?,?,?,?,?,?,?)";
        try (PreparedStatement st = getConnection().prepareStatement(sql)) {
            st.setString(1, user.getUserId());
            st.setString(2, user.getUsername());
            st.setString(3, user.getPassword());
            st.setString(4, user.getEmail());
            st.setString(5, user.getAvatar());
            st.setDate(6, user.getPremiumExpirationDate());
            st.setBoolean(7, user.isPremiumAccount());
            st.executeUpdate();
        }
    }

    public User getUserById(String userId) throws SQLException {
        String sql = "SELECT * FROM UserTBL WHERE userId = ?";
        try (PreparedStatement st = getConnection().prepareStatement(sql)) {
            st.setString(1, userId);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                User u = new User();
                u.setUserId(rs.getString("userId"));
                u.setUsername(rs.getString("username"));
                u.setPassword(rs.getString("password"));
                u.setEmail(rs.getString("email"));
                u.setAvatar(rs.getString("avatar"));
                u.setPremiumExpirationDate(rs.getDate("premiumExpirationDate"));
                u.setPremiumAccount(rs.getBoolean("isPremiumAccount"));
                return u;
            }
            return null;
        }
    }

    public void updateUser(User user) throws SQLException {
        String sql = "UPDATE UserTBL SET username = ?, password = ?, email = ?, avatar = ?," +
                " premiumExpirationDate = ?, isPremiumAccount = ? WHERE userId = ?";
        try (PreparedStatement st = getConnection().prepareStatement(sql)) {
            st.setString(1, user.getUsername());
            st.setString(2, user.getPassword());
            st.setString(3, user.getEmail());
            st.setString(4, user.getAvatar());
            st.setDate(5, user.getPremiumExpirationDate());
            st.setBoolean(6, user.isPremiumAccount());
            st.setString(7, user.getUserId());
            st.executeUpdate();
        }
    }

    public void deleteUser(String userId) throws SQLException {
        String sql = "DELETE FROM UserTBL WHERE userId = ?";
        try (PreparedStatement st = getConnection().prepareStatement(sql)) {
            st.setString(1, userId);
            st.executeUpdate();
        }
    }
    
    // Notification giua cac User
    public void sendNotification(String senderId, String receiverId, String messageContent, boolean isRead) throws SQLException {
        String sql = "INSERT INTO NotifyTBL (senderId, receiverId, notificationDate, messageContent, isRead)"
                + " VALUES (?,?,GETDATE(),?,?)"; 
        try (PreparedStatement st = getConnection().prepareStatement(sql)) {
            st.setString(1, senderId);
            st.setString(2, receiverId);
            st.setString(3, messageContent);
            st.setBoolean(4, isRead); 
            st.executeUpdate();
        }
    }
    
    public List<Notify> getNotifications(String receiverId) throws SQLException {
        List<Notify> notifications = new ArrayList<>();  
        String sql = "SELECT * FROM NotifyTBL WHERE receiverId = ? ORDER BY notificationDate DESC"; 
        try (PreparedStatement st = getConnection().prepareStatement(sql)) {
            st.setString(1, receiverId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Notify n = new Notify();
                n.setNotifyId(rs.getString("notifyId"));
                n.setSenderId(rs.getString("senderId"));
                n.setReceiverId(rs.getString("receiverId")); 
                n.setNotificationDate(rs.getDate("notificationDate"));
                n.setMessageContent(rs.getString("messageContent"));
                n.setRead(rs.getBoolean("isRead"));
                notifications.add(n);
            }
        }
        return notifications;
    }
    
    public void markNotificationAsRead(String notifyId) throws SQLException {
        String sql = "UPDATE NotifyTBL SET isRead = 1 WHERE notifyId = ?";
        try (PreparedStatement st = getConnection().prepareStatement(sql)) {
            st.setString(1, notifyId); 
            st.executeUpdate();
        }
    }
}
