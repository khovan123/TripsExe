package CRUD;

import connectDB.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.User;

public class UserDAO extends DBContext {

    public void addUser(String email, String password) throws SQLException {
        String sql = "INSERT INTO UserTBL(username, email, password) VALUES(?, ?, ?)";
        try (PreparedStatement st = getConnection().prepareStatement(sql)) {
            st.setString(1, email);
            st.setString(2, email);
            st.setString(3, password);
            st.executeUpdate();
        }
    }

    public void updateUser(User user) throws SQLException {
        String sql = "UPDATE UserTBL SET username = ?, password = ?, email = ?, phoneNumber = ?, fullName = ?, additionalName = ?, avatarUrl = ?, overview = ?, dob = ?, gender = ?, premiumExpirationDate = ?, premiumAccount = ? WHERE userId = ?";
        try (PreparedStatement st = getConnection().prepareStatement(sql)) {
            st.setString(1, user.getUsername());
            st.setString(2, user.getPassword());
            st.setString(3, user.getEmail());
            st.setString(4, user.getPhoneNumber());
            st.setString(5, user.getFullName());
            st.setString(6, user.getAdditionalName());
            st.setString(7, user.getAvatarUrl());
            st.setString(8, user.getOverview());
            st.setDate(9, user.getDob());
            st.setBoolean(10, user.isGender());
            st.setDate(11, user.getPremiumExpirationDate());
            st.setBoolean(12, user.isPremiumAccount());
            st.setInt(13, user.getUserId());
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
            } else {
                throw new SQLException();
            }
        }
    }

    public User getUserByEmail(String email) throws SQLException {
        String sql = "SELECT * FROM UserTBL WHERE email = ?";
        try (PreparedStatement st = getConnection().prepareStatement(sql)) {
            st.setString(1, email);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return mapResultSetToUser(rs);
            } else {
                throw new SQLException();
            }
        }
    }

    private User mapResultSetToUser(ResultSet rs) throws SQLException {
        User u = new User();
        u.setUserId(rs.getInt("userId"));
        u.setUsername(rs.getString("username"));
        u.setPassword(rs.getString("password"));
        u.setEmail(rs.getString("email"));
        u.setPhoneNumber(rs.getString("phoneNumber"));
        u.setFullName(rs.getString("fullName"));
        u.setAdditionalName(rs.getString("additionalName"));
        u.setAvatarUrl(rs.getString("avatarUrl"));
        u.setOverview(rs.getString("overview"));
        u.setDob(rs.getDate("dob"));
        u.setGender(rs.getBoolean("gender"));
        u.setPremiumExpirationDate(rs.getDate("premiumExpirationDate"));
        u.setPremiumAccount(rs.getBoolean("premiumAccount"));
        return u;
    }
}
