package picture.connection;

import java.sql.*;

public class TestConnection {

	public static void main(String[] args) {
		
		try {
			
			Connection connection = ConnectionManager.getConnection();
			
			if(connection != null)
				System.out.println("Connection success!");
			else 
				System.out.println("Connection failed.");
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}
