package CRUD;

import connectDB.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.User;

public class FriendDAO extends DBContext {

    public boolean isFriendshipExist(int userId1, int userId2) throws SQLException {
        String sql = "SELECT * FROM FriendsTBL Where userId1 = ? AND userId2 = ?";
        try (PreparedStatement st = getConnection().prepareStatement(sql)) {
            st.setInt(1, userId1);
            st.setInt(2, userId2);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) > 0;
            }
            return false;
        }
    }

    public void addFriends(int userId1, int userId2) throws SQLException {
        String sql = "INSERT INTO FriendsTBL(userId1, userId2) VALUES (? , ?)";
        try (PreparedStatement st = getConnection().prepareStatement(sql)) {
            st.setInt(1, userId1);
            st.setInt(2, userId2);
            st.executeUpdate();
        }
    }

    public List<Integer> getAll_Id_OfFriends(int userId) throws SQLException {
        List<Integer> list = new ArrayList<>();
        String sql = "SELECT CASE WHEN userId1 = ? THEN userId2 ELSE userId1 END AS friendId FROM FriendTBL WHERE userId1 = ? OR userId2 = ?;";
        try (PreparedStatement st = getConnection().prepareStatement(sql)) {
            st.setInt(1, userId);
            st.setInt(2, userId);
            st.setInt(3, userId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(rs.getInt("friendId"));
            }
        }
        return list;
    }

    public User getProfileOfFriendById(int userId) throws SQLException {
        String sql = "SELECT userId, fullName, avatarUrl FROM UserTBL WHERE userId = ?";
        try (PreparedStatement st = getConnection().prepareStatement(sql)) {
            st.setInt(1, userId);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                User friend = new User();
                friend.setUserId(rs.getInt("userId"));
                friend.setFullName(rs.getString("fullName"));
                friend.setAvatarUrl(rs.getString("avatarUrl"));
                return friend;
            } else {
                throw new SQLException();
            }
        }
    }

    public List<User> getAll_Profile_OfFriends(int userId) throws SQLException {
        List<User> list = new ArrayList<>();
        this.getAll_Id_OfFriends(userId).forEach(friendId -> {
            try {
                list.add(this.getProfileOfFriendById(friendId));
            } catch (Exception e) {

            }
        });
        return list;
    }

}