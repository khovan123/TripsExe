package CRUD;

import connectDB.DBContext;
import model.Post;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class PostDAO extends DBContext {

    public void addPost(Post post) throws SQLException {
    boolean hasImage = post.getImageUrl() != null;

    String sql = hasImage
            ? "INSERT INTO PostTBL(title, content, imageUrl) VALUES(?,?,?)"
            : "INSERT INTO PostTBL(title, content) VALUES(?,?)";

    try (PreparedStatement st = getConnection().prepareStatement(sql)) {
        st.setString(1, post.getTitle());
        st.setString(2, post.getContent());
        if (hasImage) {
            st.setString(3, post.getImageUrl());
        }
        st.executeUpdate();
    }
}

    public Post getPostById(int postId) throws SQLException {
        String sql = "SELECT * FROM PostTBL WHERE postId = ?";
        try (PreparedStatement st = getConnection().prepareStatement(sql)) {
            st.setInt(1, postId);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Post p = new Post();
                p.setPostId(rs.getInt("postId"));
                p.setTitle(rs.getString("title"));
                p.setPostDate(rs.getDate("postDate"));
                p.setContent(rs.getString("content"));
                p.setImageUrl(rs.getString("imageUrl"));
                return p;
            }
        }
        return null;
    }

    public void updatePost(Post post) throws SQLException {
        String sql = "UPDATE PostTBL SET title = ?, postDate = ?, content = ?, imageUrl = ? WHERE postId = ?";
        try (PreparedStatement st = getConnection().prepareStatement(sql)) {
            st.setString(1, post.getTitle());
            st.setTimestamp(2, new java.sql.Timestamp(post.getPostDate().getTime())); // Chuyển Date -> Timestamp
            st.setString(3, post.getContent());
            st.setString(4, post.getImageUrl());
            st.setInt(5, post.getPostId());
            st.executeUpdate();
        }
    }

    public void deletePost(int postId) throws SQLException {
        String sql = "DELETE FROM PostTBL WHERE postId = ?";
        try (PreparedStatement st = getConnection().prepareStatement(sql)) {
            st.setInt(1, postId);
            st.executeUpdate();
        }
    }

}
