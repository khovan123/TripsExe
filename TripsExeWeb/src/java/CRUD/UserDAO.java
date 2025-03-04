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
    // Create (Thêm người dùng mới)
    public void createUser(User user) throws SQLException {
        String sql = "INSERT INTO Users(userID, username, password, email, avatar, premiumExpirationDate, premiumAccount)"
                + " VALUES(?,?,?,?,?,?,?)";
        try (PreparedStatement st = getConnection().prepareStatement(sql)) {
            st.setString(1, user.getUserID());
            st.setString(2, user.getUsername());
            st.setString(3, user.getPassword());
            st.setString(4, user.getEmail());
            st.setString(5, user.getAvatar());
            st.setDate(6, user.getPremiumExpirationDate());
            st.setBoolean(7, user.isPremiumAccount());
            st.executeUpdate();
        }
    }

    public User getUserByID(String userID) throws SQLException {
        String sql = "SELECT * FROM Users WHERE userID = ?";
        try (PreparedStatement st = getConnection().prepareStatement(sql)) {
            st.setString(1, userID);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                User u = new User();
                u.setUserID(rs.getString("userID"));
                u.setUsername(rs.getString("username"));
                u.setPassword(rs.getString("password"));
                u.setEmail(rs.getString("email"));
                u.setAvatar(rs.getString("avatar"));
                u.setPremiumExpirationDate(rs.getDate("premiumExpirationDate"));
                u.setPremiumAccount(rs.getBoolean("premiumAccount"));
                return u;
            }
            return null;
        }
    }

    public void updateUser(User user) throws SQLException {
        String sql = "UPDATE Users SET username = ?, password = ?, email = ?, avatar = ?,"
                + "premiumExpirationDate = ?, premiumAccount = ? WHERE userID = ?";
        try (PreparedStatement st = getConnection().prepareStatement(sql)) {
            st.setString(1, user.getUsername());
            st.setString(2, user.getPassword());
            st.setString(3, user.getEmail());
            st.setString(4, user.getAvatar());
            st.setDate(5, user.getPremiumExpirationDate());
            st.setBoolean(6, user.isPremiumAccount());
            st.executeUpdate();
        }
    }

    public void deleteUser(String userID) throws SQLException {
        String sql = "DELETE FROM Users Where userID = ?";
        try (PreparedStatement st = getConnection().prepareStatement(sql)) {
            st.setString(1, userID);
            st.executeUpdate();
        }
    }

    public void sendNotification(String userIdSend, String userIdReceive, String text, boolean markRead) throws SQLException {
        String sql = "INSERT INTO Notify (senderID, reciverID, notifyDate, content, markRead)"
                + "VALUES(?,?,GETDATE(),?,0)";
        try (PreparedStatement st = getConnection().prepareStatement(sql)) {
            st.setString(1, userIdSend);
            st.setString(2, userIdReceive);
            st.setString(3, text);
            st.executeUpdate();
        }
    }
    
    public List<Notify> getNotifications(String userId) throws SQLException{
        List<Notify> notifications = new ArrayList<>();  
        String sql = "SELECT FROM Notify Where recieverID = ? ORDER BY notifyDate DESC";
        try(PreparedStatement st = getConnection().prepareStatement(sql)){
            st.setString(1, userId);
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                Notify n = new Notify();
                n.setNotifyID(rs.getString("notifyID"));
                n.setSenderID(rs.getString("senderID"));
                n.setReceiverID(rs.getString("recieverID"));
                n.setNotifyDate(rs.getDate("notifyDate"));
                n.setContent(rs.getString("content"));
                n.setMarkRead(rs.getBoolean("markRead"));
                
                notifications.add(n);
            }
        }
        return notifications;
    }
    
    public void markNotificationAsRead(String notifyID) throws SQLException{
        String sql = "UPDATE Notify SET markRead = 1 WHERE notifyID = ?";
        try (PreparedStatement st = getConnection().prepareStatement(sql)){
            st.setString(1, notifyID); 
            st.executeUpdate();
        }
    }
}
