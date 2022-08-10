package picture.connection;

import java.sql.*;

public class ConnectionManager {
	
	// Postgresql Database
	private static String dbURL = "jdbc:postgresql://ec2-44-209-186-51.compute-1.amazonaws.com:5432/dbk80onkc7u62b?sslmode=require";
	private static String username = "wzmkpjkjcouxnh";
	private static String password = "dff033bb0b7254ed5cffbc0a3756f5733932973856ad4bddc67b4f6da7734239";
	
	// getConnection()
	public static Connection getConnection() {
		Connection connection = null;
		
		try {
			Class.forName("org.postgresql.Driver");
			connection = DriverManager.getConnection(dbURL, username, password);
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		
		return connection;
	}

}
