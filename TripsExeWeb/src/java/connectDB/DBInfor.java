package connectDB;

public interface DBInfor {

    public static String driverName = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
    public static String url = "jdbc:sqlserver://MINHDEV\\SQLEXPRESS:1433;databaseName=TripsExeDB;encrypt=true;trustServerCertificate=true;zeroDateTimeBehavior=CONVERT_TO_NULL";
    public static String user = "minh";
    public static String pass = "1807";
}
