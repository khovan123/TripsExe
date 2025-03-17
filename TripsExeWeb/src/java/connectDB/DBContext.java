package connectDB;

import java.sql.*;

public class DBContext implements DBInfor {

    public DBContext() {

    }

    public Connection getConnection() throws SQLException {
        try {
            Class.forName(driverName);
            Connection conn = DriverManager.getConnection(url, user, pass);
            if (conn != null) {
                System.out.println("Database connected successfully");
            }
            return conn;
        } catch (ClassNotFoundException e) {
            System.err.println("JDBC Driver not found: " + e.getMessage());
            throw new SQLException("Driver not found");
        } catch (SQLException e) {
            System.err.println("Database connection failed: " + e.getMessage());
            throw e;
        }
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
