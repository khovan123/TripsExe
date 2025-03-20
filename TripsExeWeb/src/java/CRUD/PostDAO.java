package CRUD;

import connectDB.DBContext;
import model.Post;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PostDAO extends DBContext {

    public void addPost(Post post) throws SQLException {
        String sql = "INSERT INTO PostTBL (userId, content, imageUrl) VALUES(?,?,?)";

        try (PreparedStatement st = getConnection().prepareStatement(sql)) {
            st.setInt(1, post.getUserId());
            st.setString(2, post.getContent());
            st.setString(3, post.getImageUrl());
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
                p.setUserId(rs.getInt("userId"));
                p.setPostDate(rs.getDate("timestamp"));
                p.setContent(rs.getString("content"));
                p.setImageUrl(rs.getString("imageUrl"));
                return p;
            }
        }
        return null;
    }

    public void updatePost(Post post) throws SQLException {
        String sql = "UPDATE PostTBL SET content = ?, imageUrl = ? WHERE postId = ?";
        try (PreparedStatement st = getConnection().prepareStatement(sql)) {
            st.setString(1, post.getContent());
            st.setString(2, post.getImageUrl());
            st.setInt(3, post.getPostId());
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

    public List<Post> getAllPosts(int userId) throws SQLException {
        List<Post> posts = new ArrayList<>();
        String sql = "SELECT * FROM PostTBL WHERE userId = ? ORDER BY timestamp DESC";
        try (PreparedStatement st = getConnection().prepareStatement(sql)) {
            st.setInt(1, userId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Post post = new Post();
                post.setPostId(rs.getInt("postId"));
                post.setUserId(rs.getInt("userId"));
                post.setPostDate(rs.getDate("timestamp"));
                post.setContent(rs.getString("content"));
                post.setImageUrl(rs.getString("imageUrl"));
                posts.add(post);
            }
        }
        return posts;
    }

}
