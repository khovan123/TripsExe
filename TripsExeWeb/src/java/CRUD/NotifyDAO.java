package CRUD;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Notify;
import connectDB.DBContext;

public class NotifyDAO extends DBContext {

    public void sendNotification(int senderId, int receiverId, String messageContent, boolean markRead) throws SQLException { // Đổi String thành int, isRead thành markRead
        String sql = "INSERT INTO NotifyTBL (sendID, receiverID, notifyDate, messageContent, markRead) "
                + "VALUES (?,?,GETDATE(),?,?)";
        try (PreparedStatement st = getConnection().prepareStatement(sql)) {
            st.setInt(1, senderId);
            st.setInt(2, receiverId);
            st.setString(3, messageContent);
            st.setBoolean(4, markRead);
            st.executeUpdate();
        }
    }

    public List<Notify> getNotifications(int receiverId) throws SQLException {
        List<Notify> notifications = new ArrayList<>();
        String sql = "SELECT * FROM NotifyTBL WHERE receiverID = ? ORDER BY notifyDate DESC";
        try (PreparedStatement st = getConnection().prepareStatement(sql)) {
            st.setInt(1, receiverId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Notify n = new Notify();
                n.setNotifyId(rs.getInt("notifyId"));
                n.setNotificationDate(rs.getDate("notifyDate"));
                n.setMessageContent(rs.getString("messageContent"));
                n.setMarkRead(rs.getBoolean("isRead"));
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
