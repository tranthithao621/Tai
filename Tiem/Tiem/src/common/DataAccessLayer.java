package common;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class DataAccessLayer {
	private static Connection con = null;
	
	static String JDBC_DRIVER = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
	static String DATABASE_URL = "jdbc:sqlserver://localhost:1433;databaseName=FPT;user=sa;password=12345678";
	public static Connection getConnection(){
		try {
			Class.forName(JDBC_DRIVER);
			con = DriverManager.getConnection(DATABASE_URL);
		} catch (ClassNotFoundException e) {
		
			e.printStackTrace();
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		return con;
	}
}