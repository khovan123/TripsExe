package CRUD;

import connectDB.DBContext;
import model.Post;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PostDAO extends DBContext {

    CommentDAO commentDAO = new CommentDAO();
    LikeDAO likeDAO = new LikeDAO();

    public void addPost(Post post) throws SQLException {
        String sql = "INSERT INTO PostTBL (userId, activity, content, imageUrl) VALUES(?,?,?,?)";
        try (PreparedStatement st = getConnection().prepareStatement(sql)) {
            st.setInt(1, post.getUserId());
            st.setString(2, post.getActivity());
            st.setString(3, post.getContent());
            st.setString(4, post.getImageUrl());
            st.executeUpdate();
        }
    }

    public Post getPostById(int postId) throws SQLException {
        String sql = "SELECT p.*, u.fullName, u.avatarUrl, COUNT(l.userId) AS likes, COUNT(c.userId) AS comments FROM PostTBL p JOIN UserTBL u ON p.userId = u.userId LEFT JOIN LikeTBL l ON p.postId = l.postId LEFT JOIN CommentTBL c ON p.postId = c.postId WHERE p.postId = ? GROUP BY p.postId, p.userId, p.activity, p.content, p.imageUrl, p.timestamp, u.fullName, u.avatarUrl ORDER BY p.timestamp DESC;";
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
                p.setAvatarUrl(rs.getString("avatarUrl"));
                p.setFullName(rs.getString("fullName"));
                p.setActivity(rs.getString("activity"));
                p.setLikes(rs.getInt("likes"));
                p.setComments(rs.getInt("comments"));
                return p;
            }
        }
        return null;
    }

    public void updatePost(Post post) throws SQLException {
        String sql = "UPDATE PostTBL SET activity = ?, content = ?, imageUrl = ? WHERE postId = ?";
        try (PreparedStatement st = getConnection().prepareStatement(sql)) {
            st.setString(1, post.getActivity());
            st.setString(2, post.getContent());
            st.setString(3, post.getImageUrl());
            st.setInt(4, post.getPostId());
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
        String sql = """
            SELECT 
            p.*, 
            u.fullName, 
            u.avatarUrl, 
            (SELECT COUNT(DISTINCT l.userId) FROM LikeTBL l WHERE l.postId = p.postId) AS likes,
            (SELECT COUNT(*) FROM CommentTBL c WHERE c.postId = p.postId) AS comments
            FROM PostTBL p 
            JOIN UserTBL u ON p.userId = u.userId 
            ORDER BY p.timestamp DESC
                     """;
        try (PreparedStatement st = getConnection().prepareStatement(sql)) {
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Post post = new Post();
                post.setPostId(rs.getInt("postId"));
                post.setUserId(rs.getInt("userId"));
                post.setPostDate(rs.getDate("timestamp"));
                post.setContent(rs.getString("content"));
                post.setImageUrl(rs.getString("imageUrl"));
                post.setAvatarUrl(rs.getString("avatarUrl"));
                post.setFullName(rs.getString("fullName"));
                post.setActivity(rs.getString("activity"));
                post.setLikes(rs.getInt("likes"));
                post.setComments(rs.getInt("comments"));
                posts.add(post);
            }
        }
        posts.forEach(post -> {
            try {
                post.setCommentList(commentDAO.getCommentHistory(post.getPostId(), 0, 3));
                if (likeDAO.isLiked(post.getPostId(), userId)) {
                    post.setLiked(true);
                }
            } catch (Exception e) {
                System.err.println(e.getMessage());
            }
        });
        return posts;
    }

    public List<Post> getAllPostsOfUser(int userId) throws SQLException {
        List<Post> posts = new ArrayList<>();
        String sql = """
            SELECT 
            p.*, 
            u.fullName, 
            u.avatarUrl, 
            (SELECT COUNT(DISTINCT l.userId) FROM LikeTBL l WHERE l.postId = p.postId) AS likes,
            (SELECT COUNT(*) FROM CommentTBL c WHERE c.postId = p.postId) AS comments
            FROM PostTBL p 
            JOIN UserTBL u ON p.userId = u.userId
            WHERE p.userId = ?
            ORDER BY p.timestamp DESC
                     """;
        try (PreparedStatement st = getConnection().prepareStatement(sql)) {
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Post post = new Post();
                post.setPostId(rs.getInt("postId"));
                post.setUserId(rs.getInt("userId"));
                post.setPostDate(rs.getDate("timestamp"));
                post.setContent(rs.getString("content"));
                post.setImageUrl(rs.getString("imageUrl"));
                post.setAvatarUrl(rs.getString("avatarUrl"));
                post.setFullName(rs.getString("fullName"));
                post.setActivity(rs.getString("activity"));
                post.setLikes(rs.getInt("likes"));
                post.setComments(rs.getInt("comments"));
                posts.add(post);
            }
        }
        posts.forEach(post -> {
            try {
                post.setCommentList(commentDAO.getCommentHistory(post.getPostId(), 0, 3));
                if (likeDAO.isLiked(post.getPostId(), userId)) {
                    post.setLiked(true);
                }
            } catch (Exception e) {
                System.err.println(e.getMessage());
            }
        });
        return posts;
    }        

}
