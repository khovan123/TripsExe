package CRUD;

import connectDB.DBContext;
import java.sql.*;

public class LikeDAO extends DBContext {

    public void addLike(int postId, int userId) throws SQLException {
        String sql = "INSERT INTO LikeTBL (postId, userId) VALUES (?, ?)";
        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, postId);
            ps.setInt(2, userId);
            ps.executeUpdate();
        }
    }

    public void removeLike(int postId, int userId) throws SQLException {
        String sql = "DELETE FROM LikeTBL WHERE postId = ? AND userId = ?";
        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, postId);
            ps.setInt(2, userId);
            ps.executeUpdate();
        }
    }

    public boolean isLiked(int postId, int userId) throws SQLException {
        String sql = "SELECT COUNT(*) FROM LikeTBL WHERE postId = ? AND userId = ?";
        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, postId);
            ps.setInt(2, userId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) > 0;
            }
            return false;
        }
    }

    public int getLikeCount(int postId) throws SQLException {
        String sql = "SELECT COUNT(*) FROM LikeTBL WHERE postId = ?";
        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, postId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
            return 0;
        }
    }
}
