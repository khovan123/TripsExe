package CRUD;

import connectDB.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Friends;

public class FriendsDAO extends DBContext {

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

    public List<Friends> getFriendsListOfUser(int userId) throws SQLException {
        List<Friends> list = new ArrayList<>();
        String sql = "SELECT * FROM Friend WHERE userId = ?";
        try (PreparedStatement st = getConnection().prepareStatement(sql)) {
            st.setInt(1, userId);
            ResultSet rs = st.executeQuery();
            while (rs.next()){
                Friends f = new Friends();
                f.setUserId1(rs.getInt("userId1"));
                f.setUserId2(rs.getInt("userId2"));
                list.add(f);
            }
        }
        return list;
    }

}
