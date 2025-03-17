package CRUD;

import java.util.List;
import model.Message;
import connectDB.DBContext;
import java.sql.*;
import java.util.ArrayList;

public class ChatDAO extends DBContext {

    public List<Message> getMessageHistory(String roomId) throws SQLException {
        List<Message> messageHistory = new ArrayList<>();
        String sql = "SELECT * FROM Messages WHERE roomId = ? ORDER BY timestamp";
        try (PreparedStatement pstm = getConnection().prepareStatement(sql)) {
            pstm.setString(1, roomId);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                Message message = new Message();
                message.setMessageId(rs.getInt("messageId"));
                message.setUserId(rs.getInt("userId"));
                message.setRoomId(rs.getString("roomId"));
                message.setFullName(rs.getString("fullName"));
                message.setContent(rs.getString("content"));
                message.setImageUrl(rs.getString("imageUrl"));
                message.setTimestamp(rs.getDate("timestamp"));
                messageHistory.add(message);
            }
        } catch (SQLException e) {
            System.err.println("SQL Error in getMessageHistory: " + e.getMessage());
            throw e;
        }
        System.out.println("Retrieved " + messageHistory.size() + " messages for roomId: " + roomId);
        return messageHistory;
    }

    public void addMessage(Message message) throws SQLException {
        String sql = "INSERT INTO Messages (userId, roomId, fullName, content) VALUES (?, ?, ?, ?)";
        try (PreparedStatement pstm = getConnection().prepareStatement(sql)) {
            pstm.setInt(1, message.getUserId());
            pstm.setString(2, message.getRoomId());
            pstm.setString(3, message.getFullName());
            pstm.setString(4, message.getContent());
            pstm.executeUpdate();
        }
    }

}
