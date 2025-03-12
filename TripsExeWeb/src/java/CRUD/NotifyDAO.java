package CRUD;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Notify;
import connectDB.DBContext;

public class NotifyDAO extends DBContext{
   
    public void sendNotification(int userId, String messageContent, boolean markRead) throws SQLException {
        String sql = "INSERT INTO NotifyTBL (userId, notificationDate, messageContent, markRead) " +
                     "VALUES (?, GETDATE(), ?, ?)";
        try (PreparedStatement st = getConnection().prepareStatement(sql)) {
            st.setInt(1, userId);
            st.setString(2, messageContent);
            st.setBoolean(3, markRead);
            st.executeUpdate();
        }
    }

    public List<Notify> getNotifications(int userId) throws SQLException {
        List<Notify> notifications = new ArrayList<>();
        String sql = "SELECT * FROM NotifyTBL WHERE userId = ? ORDER BY notificationDate DESC";
        try (PreparedStatement st = getConnection().prepareStatement(sql)) {
            st.setInt(1, userId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Notify n = new Notify();
                n.setNotifyId(rs.getInt("notifyId"));
                n.setUserId(rs.getInt("userId"));
                n.setNotificationDate(rs.getDate("notificationDate"));
                n.setMessageContent(rs.getString("messageContent"));
                n.setMarkRead(rs.getBoolean("markRead"));
                notifications.add(n);
            }
        }
        return notifications;
    }

    public void markNotificationAsRead(int notifyId) throws SQLException {
        String sql = "UPDATE NotifyTBL SET markRead = 1 WHERE notifyId = ?";
        try (PreparedStatement st = getConnection().prepareStatement(sql)) {
            st.setInt(1, notifyId);
            st.executeUpdate();
        }
    }
}
