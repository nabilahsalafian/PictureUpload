package picture.dao;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.*;
import picture.connection.*;
import picture.javabean.*;

public class FileDetailsDAO {

	// Connection object
	Connection connection = null;
	
	// Attributes
	
	private String filename;
	private String filepath; // Binary Stream = bytea in PostgreSQL 

	// CRUD methods
	
	// Add file
	public void addFile(FileDetails newFile) throws SQLException {
		
		try {
			// Get connection
			connection = ConnectionManager.getConnection();
			
			// Get values
			filename = newFile.getFilename();
			filepath = newFile.getFilepath();

			// Prepare SQL Statement
			PreparedStatement addSQL = connection.prepareStatement
			( "INSERT INTO filedetails "
			+ "(filename, filedata, filepath) "
			+ "VALUES (?,?,?)");
			
	        File img = new File(filepath);
	        
	        try (FileInputStream fileinputstream = new FileInputStream(img)) {
	        	
	        	// Set ? Values
	        	addSQL.setString(1, filename);
				addSQL.setBinaryStream(2, fileinputstream, (int)img.length());
				addSQL.setString(3, filepath);
				
				// Execute SQL
				addSQL.executeUpdate();
				
				// Check SQL
				System.out.println(addSQL);
				System.out.println("File successfully added.\n - - - ");
	        	
	        } catch (IOException e) {
	        	e.printStackTrace();
	        }

			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
	}


}
