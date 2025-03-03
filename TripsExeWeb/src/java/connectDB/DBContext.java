package connectDB;

import java.sql.*;

public class DBContext implements DBInfor {

    public DBContext() {

    }

    public Connection getConnection() {
        Connection conn = null;
        try {
            Class.forName(driverName);
            conn = DriverManager.getConnection(url, user, pass);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return conn;
    }

    public void close(Connection conn, PreparedStatement ps, ResultSet rs) throws SQLException {
        if (rs != null && !rs.isClosed()) {
            rs.close();
        }
        if (ps != null && !ps.isClosed()) {
            ps.close();
        }
        if (conn != null && !conn.isClosed()) {
            conn.close();
        }
    }

}
