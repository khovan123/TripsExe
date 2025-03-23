package CRUD;

import connectDB.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Comment;

public class CommentDAO extends DBContext {

    public void addComment(Comment comment) throws SQLException {
        String sql = "INSERT INTO CommentTBL (postId, userId, text, imageUrl) VALUES (?, ?, ?, ?)";
        try (PreparedStatement st = getConnection().prepareStatement(sql)) {
            st.setInt(1, comment.getPostId());
            st.setInt(2, comment.getUserId());
            st.setString(3, comment.getText());
            st.setString(4, comment.getImageUrl());
            st.executeUpdate();
        }
    }

    public List<Comment> getCommentHistory(int postId, int offset, int limit) throws SQLException {
        List<Comment> comments = new ArrayList<>();
        String sql = "SELECT * FROM CommentTBL c JOIN UserTBL u ON c.userId = u.userId WHERE postId = ? ORDER BY timestamp DESC OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        try (PreparedStatement st = getConnection().prepareStatement(sql)) {
            st.setInt(1, postId);
            st.setInt(2, offset);
            st.setInt(3, limit);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Comment comment = new Comment();
                comment.setPostId(rs.getInt("postId"));
                comment.setUserId(rs.getInt("userId"));
                comment.setText(rs.getString("text"));
                comment.setImageUrl(rs.getString("imageUrl"));
                comment.setTimestamp(rs.getDate("timestamp"));
                comment.setFullName(rs.getString("fullName"));
                comment.setAvatarUrl(rs.getString("avatarUrl"));
                comments.add(comment);
            }
        }
        return comments;
    }
    
    public Comment getComment(int postId, int offset, int limit) throws SQLException {
        String sql = "SELECT * FROM CommentTBL c JOIN UserTBL u ON c.userId = u.userId WHERE postId = ? ORDER BY timestamp DESC OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        try (PreparedStatement st = getConnection().prepareStatement(sql)) {
            st.setInt(1, postId);
            st.setInt(2, offset);
            st.setInt(3, limit);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Comment comment = new Comment();
                comment.setPostId(rs.getInt("postId"));
                comment.setUserId(rs.getInt("userId"));
                comment.setText(rs.getString("text"));
                comment.setImageUrl(rs.getString("imageUrl"));
                comment.setTimestamp(rs.getDate("timestamp"));
                comment.setFullName(rs.getString("fullName"));
                comment.setAvatarUrl(rs.getString("avatarUrl"));
            }
        }
        return null;
    }

    public int getTotalComments(int postId) throws SQLException {
        String sql = "SELECT COUNT(*) FROM CommentTBL WHERE postId = ?";
        try (PreparedStatement ps = getConnection().prepareStatement(sql)) {
            ps.setInt(1, postId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
            return 0;
        }
    }
}
