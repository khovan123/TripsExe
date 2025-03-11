package CRUD;

import connectDB.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


public class FriendsDAO extends DBContext {

    public boolean isFriendshipExist(int userId1, int userId2) throws SQLException {
        String sql = "SELECT * FROM FriendsTBL Where userId1 = ? AND userId2 = ?";
        try(PreparedStatement st = getConnection().prepareStatement(sql)){
            st.setInt(1, userId1);
            st.setInt(2, userId2);
            ResultSet rs = st.executeQuery();
            if(rs.next()){
                return rs.getInt(1) > 0;
            }
            return false;
        }
    }

    public void addFriends(int senderId, int recieverId) throws SQLException {
        String sql = "INSERT INTO FriendsTBL(userId1, userId2) VALUES (? , ?)";
        try (PreparedStatement st = getConnection().prepareStatement(sql)){
            st.setInt(1, senderId);
            st.setInt(2, recieverId);
            st.executeUpdate();
        }
    }

}
