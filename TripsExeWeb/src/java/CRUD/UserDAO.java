package CRUD;

import connectDB.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Notify;
import model.User;

public class UserDAO extends DBContext {

    // CRUD 
    public void createUser(User user) throws SQLException {
        String sql = "INSERT INTO UserTBL(username, password, email, avatar, premiumExpirationDate, isPremiumAccount) "
                + "VALUES(?,?,?,?,?,?)";
        try (PreparedStatement st = getConnection().prepareStatement(sql)) {
            st.setString(1, user.getUsername());
            st.setString(2, user.getPassword());
            st.setString(3, user.getEmail());
            st.setString(4, user.getAvatar());
            st.setDate(5, user.getPremiumExpirationDate());
            st.setBoolean(6, user.isPremiumAccount());
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
                u.setAvatar(rs.getString("avatar"));
                u.setPremiumExpirationDate(rs.getDate("premiumExpirationDate"));
                u.setPremiumAccount(rs.getBoolean("PremiumAccount"));
                return u;
            }
            return null;
        }
    }

    public void updateUser(User user) throws SQLException {
        String sql = "UPDATE UserTBL SET username = ?, password = ?, email = ?, avatar = ?, "
                + "premiumExpirationDate = ?, isPremiumAccount = ? WHERE userId = ?";
        try (PreparedStatement st = getConnection().prepareStatement(sql)) {
            st.setString(1, user.getUsername());
            st.setString(2, user.getPassword());
            st.setString(3, user.getEmail());
            st.setString(4, user.getAvatar());
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
    
    public boolean isUserExist(int userId) throws SQLException {
        String sql = "SELECT * FROM UserTBL WHERE UserId = ?";
        try (PreparedStatement st = getConnection().prepareStatement(sql)){
            st.setInt(1, userId);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) > 0;
            }
            return false;
        }
    }
}
