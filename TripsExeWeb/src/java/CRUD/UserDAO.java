package CRUD;

import connectDB.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.User;

public class UserDAO extends DBContext {
    
    public void addUser(User user) throws SQLException {
        String sql = "INSERT INTO UserTBL(username, password, email, avatarUrl, dob, gender, premiumExpirationDate, premiumAccount)"
                + " VALUES(?,?,?,?,?,?,GETDATE(),?)";
        try (PreparedStatement st = getConnection().prepareStatement(sql)) {
            st.setString(1, user.getUsername());
            st.setString(2, user.getPassword());
            st.setString(3, user.getEmail());
            st.setString(4, user.getAvatarUrl());
            st.setDate(5, user.getDob());
            st.setBoolean(6, user.isGender());
            st.setBoolean(7, user.isPremiumAccount());
            st.executeUpdate();
        }
    }

    public void updateUser(User user) throws SQLException {
        String sql = "UPDATE UserTBL SET username = ?, password = ?, email = ?, avatarUrl = ?, dob = ?, gender = ?, premiumExpirationDate = ?, premiumAccount = ? WHERE userId = ?";
        try (PreparedStatement st = getConnection().prepareStatement(sql)) {
            st.setString(1, user.getUsername());
            st.setString(2, user.getPassword());
            st.setString(3, user.getEmail());
            st.setString(4, user.getAvatarUrl());
            st.setDate(5, user.getDob());
            st.setBoolean(6, user.isGender());
            st.setDate(7, user.getPremiumExpirationDate());
            st.setBoolean(8, user.isPremiumAccount());
            st.setInt(9, user.getUserId());
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

    public List<User> getAllUsers() throws SQLException {
        List<User> list = new ArrayList<>();
        String sql = "SELECT * FROM UserTBL";
        try (PreparedStatement st = getConnection().prepareStatement(sql); ResultSet rs = st.executeQuery()) {
            while (rs.next()) {
                list.add(mapResultSetToUser(rs));
            }
        }
        return list;
    }

    public User getUserById(int userId) throws SQLException {
        String sql = "SELECT * FROM UserTBL WHERE userId = ?";
        try (PreparedStatement st = getConnection().prepareStatement(sql)) {
            st.setInt(1, userId);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return mapResultSetToUser(rs);
            }
            return null;
        }
    }

    public void updatePassword(int userId, String newPassword) throws SQLException {
        String sql = "UPDATE UserTBL SET password = ? WHERE userId = ?";
        try (PreparedStatement st = getConnection().prepareStatement(sql)) {
            st.setString(1, newPassword);
            st.setInt(2, userId);
            st.executeUpdate();
        }
    }

    public User login(String identifier, String password) throws SQLException {
        String sql = "SELECT * FROM UserTBL WHERE (username = ? OR email = ?) AND password = ?";
        try (PreparedStatement st = getConnection().prepareStatement(sql)) {
            st.setString(1, identifier);
            st.setString(2, identifier);
            st.setString(3, password);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return mapResultSetToUser(rs);
            }
            return null;
        }
    }

    public List<User> searchUsers(String keyword) throws SQLException {
        List<User> users = new ArrayList<>();
        String sql = "SELECT * FROM UserTBL WHERE username LIKE ? OR email LIKE ?";
        try (PreparedStatement st = getConnection().prepareStatement(sql)) {
            st.setString(1, "%" + keyword + "%");
            st.setString(2, "%" + keyword + "%");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                users.add(mapResultSetToUser(rs));
            }
        }
        return users;
    }

    public boolean isEmailExists(String email) throws SQLException {
        String sql = "SELECT 1 FROM UserTBL WHERE email = ?";
        try (PreparedStatement st = getConnection().prepareStatement(sql)) {
            st.setString(1, email);
            ResultSet rs = st.executeQuery();
            return rs.next();
        }
    }

    public boolean isUsernameExists(String username) throws SQLException {
        String sql = "SELECT 1 FROM UserTBL WHERE username = ?";
        try (PreparedStatement st = getConnection().prepareStatement(sql)) {
            st.setString(1, username);
            ResultSet rs = st.executeQuery();
            return rs.next();
        }
    }

    private User mapResultSetToUser(ResultSet rs) throws SQLException {
        User u = new User();
        u.setUserId(rs.getInt("userId"));
        u.setUsername(rs.getString("username"));
        u.setPassword(rs.getString("password"));
        u.setEmail(rs.getString("email"));
        u.setAvatarUrl(rs.getString("avatarUrl"));
        u.setDob(rs.getDate("dob"));
        u.setGender(rs.getBoolean("gender"));
        u.setPremiumExpirationDate(rs.getDate("premiumExpirationDate"));
        u.setPremiumAccount(rs.getBoolean("premiumAccount"));
        return u;
    }
}
