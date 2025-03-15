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
        String sql = "INSERT INTO CommentTBL (postId, userId, content, imageUrl, commentDate) VALUES (?, ?, ?, ?, GETDATE())";
        try (PreparedStatement st = getConnection().prepareStatement(sql)) {
            st.setInt(1, comment.getPostId());
            st.setInt(2, comment.getUserId());
            st.setString(3, comment.getContent());
            st.setString(4, comment.getImageUrl());
            st.executeUpdate();
        }
    }

    public List<Comment> getCommentsByPost(String postId) throws SQLException {
        List<Comment> comments = new ArrayList<>();
        String sql = "SELECT * FROM CommentTBL WHERE postId = ? ORDER BY commentDate ASC";
        try (PreparedStatement st = getConnection().prepareStatement(sql)) {
            st.setString(1, postId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Comment comment = new Comment();
                comment.setCommentId(rs.getInt("commentId"));
                comment.setPostId(rs.getInt("postId"));
                comment.setUserId(rs.getInt("userId"));
                comment.setContent(rs.getString("content"));
                comment.setImageUrl(rs.getString("imageUrl"));
                comment.setCommentDate(rs.getTimestamp("commentDate"));
                comments.add(comment);
            }
        }
        return comments;
    }
}
