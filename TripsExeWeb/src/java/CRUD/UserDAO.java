package CRUD;

import connectDB.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Comment;
import model.Notify;
import model.Post;
import model.User;

public class UserDAO extends DBContext {

    // CRUD 
    public void createUser(User user) throws SQLException {
        String sql = "INSERT INTO UserTBL(username, password, email, avatarUrl, premiumExpirationDate, premiumAccount)"
                + " VALUES(?,?,?,?,GETDATE(),?)";
        try (PreparedStatement st = getConnection().prepareStatement(sql)) {
            st.setString(1, user.getUsername());
            st.setString(2, user.getPassword());
            st.setString(3, user.getEmail());
            st.setString(4, user.getAvatarUrl());
            st.setBoolean(5, user.isPremiumAccount());
            st.executeUpdate();
        }
    }

    public User getUserById(int userId) throws SQLException {
        String sql = "SELECT * FROM UserTBL WHERE userId = ?";
        try (PreparedStatement st = getConnection().prepareStatement(sql)) {
            st.setInt(1, userId);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                User u = new User();
                u.setUserId(rs.getInt("userId"));
                u.setUsername(rs.getString("username"));
                u.setPassword(rs.getString("password"));
                u.setEmail(rs.getString("email"));
                return u;
            }
            return null;
        }
    }

    public void updateUser(User user) throws SQLException {
        String sql = "UPDATE UserTBL SET username = ?, password = ?, email = ?, avatar = ?, premiumExpirationDate = ?, premiumAccount = ? WHERE userId = ?";
        try (PreparedStatement st = getConnection().prepareStatement(sql)) {
            st.setString(1, user.getUsername());
            st.setString(2, user.getPassword());
            st.setString(3, user.getEmail());
            st.setString(4, user.getAvatarUrl());
            st.setDate(5, user.getPremiumExpirationDate());
            st.setBoolean(6, user.isPremiumAccount());
            st.setInt(7, user.getUserId());
            st.executeUpdate();
        }
    }

    public void deleteUser(int userId) throws SQLException {
        String sql = "DELETE FROM UserTBL WHERE userId = ?";
        try (PreparedStatement st = getConnection().prepareStatement(sql)) {
            st.setInt(1, userId);
            st.executeUpdate();
        }
    }

    // Notification 
    public void sendNotification(Notify notify) throws SQLException {
        String sql = "INSERT INTO NotifyTBL (notifyId, userId, notificationDate, messageContent) VALUES (?, ?, GETDATE(), ?)";
        try (PreparedStatement st = getConnection().prepareStatement(sql)) {
            st.setInt(1, notify.getNotifyId());
            st.setInt(2, notify.getUserId());
            st.setString(3, notify.getMessageContent());
            st.executeUpdate();
        }
    }

    public List<Notify> getNotifications(String userId, boolean sender) throws SQLException {
        List<Notify> notifications = new ArrayList<>();
        String sql = sender ? "SELECT * FROM NotifyTBL WHERE senderId = ? ORDER BY notificationDate DESC"
                : "SELECT * FROM NotifyTBL WHERE receiverId = ? ORDER BY notificationDate DESC";
        try (PreparedStatement st = getConnection().prepareStatement(sql)) {
            st.setString(1, userId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Notify n = new Notify();
                n.setNotifyId(rs.getInt("notifyId"));
                n.setUserId(rs.getInt(userId));
                n.setNotificationDate(rs.getDate("notificationDate"));
                n.setMessageContent(rs.getString("messageContent"));
                n.setMarkRead(rs.getBoolean("markRead"));
                notifications.add(n);
            }
        }
        return notifications;
    }

    public void markNotificationAsRead(String notifyId) throws SQLException {
        String sql = "UPDATE NotifyTBL SET markRead = 1 WHERE notifyId = ?";
        try (PreparedStatement st = getConnection().prepareStatement(sql)) {
            st.setString(1, notifyId);
            st.executeUpdate();
        }
    }
// Login

    public User login(String identifier, String password) throws SQLException {
        String sql = "SELECT * FROM UserTBL WHERE (username = ? OR email = ?) AND password = ?";
        try (PreparedStatement st = getConnection().prepareStatement(sql)) {
            st.setString(1, identifier);
            st.setString(2, identifier);
            st.setString(3, password);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                User u = new User();
                u.setUserId(rs.getInt("userId"));
                u.setUsername(rs.getString("username"));
                u.setPassword(rs.getString("password"));
                u.setEmail(rs.getString("email"));
                return u;
            }
            return null;
        }
    }

    // Post
    public void createPost(Post post) throws SQLException {
        String sql = "INSERT INTO PostTBL (title, postDate, content, imageUrl) VALUES (?, ?, ?, ?)";
        try (PreparedStatement st = getConnection().prepareStatement(sql)) {
            st.setString(1, post.getTitle());
            st.setDate(2, post.getPostDate());
            st.setString(3, post.getContent());
            if (post.getImageUrl() != null) {
                st.setString(4, post.getImageUrl());
            } else {
                st.setNull(4, java.sql.Types.VARCHAR);
            }
            st.executeUpdate();
        }
    }

    public List<Post> getAllPosts() throws SQLException {
        List<Post> posts = new ArrayList<>();
        String sql = "SELECT * FROM PostTBL ORDER BY postDate DESC";
        try (PreparedStatement st = getConnection().prepareStatement(sql); ResultSet rs = st.executeQuery()) {
            while (rs.next()) {
                Post post = new Post();
                post.setPostId(rs.getInt("postId"));
                post.setTitle(rs.getString("title"));
                post.setPostDate(rs.getDate("postDate"));
                post.setContent(rs.getString("content"));
                post.setImageUrl(rs.getString("imageUrl"));
                posts.add(post);
            }
        }
        return posts;
    }

    // Comment
    public void addComment(Comment comment) throws SQLException {
        String sql = "INSERT INTO CommentTBL (postId, userId, content, imageUrl, commentDate) VALUES (?, ?, ?, ?, GETDATE())";
        try (PreparedStatement st = getConnection().prepareStatement(sql)) {
            st.setString(1, comment.getPostId());
            st.setString(2, comment.getUserId());
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
                comment.setCommentId(rs.getString("commentId"));
                comment.setPostId(rs.getString("postId"));
                comment.setUserId(rs.getString("userId"));
                comment.setContent(rs.getString("content"));
                comment.setImageUrl(rs.getString("imageUrl"));
                comment.setCommentDate(rs.getTimestamp("commentDate"));
                comments.add(comment);
            }
        }
        return comments;
    }

}
