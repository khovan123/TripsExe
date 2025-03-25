package CRUD;

import connectDB.DBContext;
import java.sql.*;
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
        String sql = "UPDATE UserTBL SET username = ?, email = ?, phoneNumber = ?, fullName = ?, additionalName = ?, overview = ?, dob = ?, gender = ? WHERE userId = ?";
        try (PreparedStatement st = getConnection().prepareStatement(sql)) {
            st.setString(1, user.getUsername());
            st.setString(2, user.getEmail());
            st.setString(3, user.getPhoneNumber());
            st.setString(4, user.getFullName());
            st.setString(5, user.getAdditionalName());
            st.setString(6, user.getOverview());
            st.setDate(7, user.getDob());
            st.setBoolean(8, user.isGender());
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
//            (SELECT COUNT(DISTINCT l.userId) FROM LikeTBL l WHERE l.postId = p.postId) AS likes,

    public User getUserByEmail(String email) throws SQLException {
        String sql = """
                    SELECT 
                         u.userId, 
                     	u.username,
                         u.email,
                     	u.password,	
                         u.fullName,
                     	u.additionalName,
                     	u.dob,
                     	u.gender,
                     	u.phoneNumber,
                         u.avatarUrl,
                     	u.overview,
                     	u.premiumExpirationDate,
                     	u.premiumAccount,
                         COUNT(DISTINCT p.postId) AS posts, 
                         COUNT(DISTINCT CASE WHEN f.userId1 = u.userId THEN f.userId2 
                                             WHEN f.userId2 = u.userId THEN f.userId1 
                                             END) AS friends
                     FROM UserTBL u 
                     LEFT JOIN PostTBL p ON p.userId = u.userId 
                     LEFT JOIN FriendTBL f ON f.userId1 = u.userId OR f.userId2 = u.userId 
                     WHERE u.email = ?
                     GROUP BY u.userId, 
                     	u.username,
                         u.email,
                     	u.password,	
                         u.fullName,
                     	u.additionalName,
                     	u.dob,
                     	u.gender,
                     	u.phoneNumber,
                         u.avatarUrl,
                     	u.overview,
                     	u.premiumExpirationDate,
                     	u.premiumAccount
                     ORDER BY u.userId;
        """;
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
        u.setPosts(rs.getInt("posts"));
        u.setFriends(rs.getInt("friends"));
        return u;
    }

    public void signDeleteAccount(int userId) throws SQLException {
        String sql = "INSERT INTO DeleteAccountTBL(userId) VALUES(?)";
        try (PreparedStatement pstm = getConnection().prepareStatement(sql)) {
            pstm.setInt(1, userId);
            pstm.executeUpdate();
        }
    }
    
    public void restoreAccount(int userId) throws SQLException {
        String sql = "DELETE FROM DeleteAccountTBL WHERE userId = ?";
        try (PreparedStatement pstm = getConnection().prepareStatement(sql)) {
            pstm.setInt(1, userId);
            pstm.executeUpdate();
        }
    }

    public boolean checkDeleteAction(int userId) throws SQLException {
        String sql = "SELECT timestamp FROM DeleteAccountTBL WHERE userId = ?";
        try (PreparedStatement pstm = getConnection().prepareStatement(sql)) {
            pstm.setInt(1, userId);
            ResultSet rs = pstm.executeQuery();
            if (rs.next()) {
                Timestamp deletedTime = rs.getTimestamp("timestamp");
                Timestamp now = new Timestamp(System.currentTimeMillis());
                long thirtyDaysMillis = 30L * 24 * 60 * 60 * 1000;
                Timestamp thirtyDaysAgo = new Timestamp(deletedTime.getTime() + thirtyDaysMillis);
                if(now.after(thirtyDaysAgo)){
                    this.deleteUser(userId);
                    return true;
                }else{
                    this.restoreAccount(userId);
                }
            }
        }
        return false;
    }
    
    public void updateUserPremiumStatus(int userId, boolean premiumAccount, Date premiumExpirationDate) throws SQLException {
        String sql = "UPDATE UserTBL SET premiumAccount = ?, premiumExpirationDate = ? WHERE userId = ?";
        try (PreparedStatement st = getConnection().prepareStatement(sql)) {
            st.setBoolean(1, premiumAccount); 
            if (premiumExpirationDate != null) {
                st.setTimestamp(2, new java.sql.Timestamp(premiumExpirationDate.getTime()));
            } else {
                st.setNull(2, java.sql.Types.TIMESTAMP); 
            }
            st.setInt(3, userId); 
            int rowsAffected = st.executeUpdate();
            if (rowsAffected == 0) {
                throw new SQLException("User with ID " + userId + " not found.");
            }
        }
    }
}
