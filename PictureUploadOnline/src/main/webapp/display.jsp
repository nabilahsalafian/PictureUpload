<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="picture.connection.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Display Image</title>
</head>
<body>
<form method="post">

	
	<h1>Image Displayer </h1><br>
	Search image: <input type="text" name="fileName">
	<button formaction="display.jsp">Search</button> <br><br>
	
	
	
	<table style="border: 2px solid grey; padding: 5px;">
		<tr>
			<th>ID</th>
			<th>File Name</th>
			<th>Image</th>
		</tr>
		
		<%-- SQL SEARCH --%>
	<%	
		// File Search
		int SQLcounter = 0;
		String fileName = null;
		String filepath = null;
		String imageName = null;
		String query = null;
		char quote ='"';
		
		int imageFolderIndex = 0;
		String uploadDirectory = null;
		
		if(request.getParameter("fileName") !=  null) {
			fileName = request.getParameter("fileName");
			query = "SELECT fileid, filename, filedata, filepath, LENGTH(filedata) AS " + quote + "datalength" + quote + "FROM filedetails " +
					"WHERE LOWER(filename) LIKE '%" + fileName + "%' " +
					"OR UPPER(filename) LIKE '%" + fileName + "%' " +
					"OR filename LIKE '%" + fileName + "%'";
		
		} else {
			fileName = "";
			query = "SELECT fileid, filename, filedata, filepath, LENGTH(filedata) AS " + quote + "datalength" + quote + "FROM filedetails";
		}
	

		try (Connection connection = ConnectionManager.getConnection();
			 PreparedStatement searchSQL = connection.prepareStatement(query);
			 ResultSet result = searchSQL.executeQuery()) {
			
			while(result.next()){
				SQLcounter++;
				System.out.println("Image: " + SQLcounter);
				
				filepath = result.getString("filepath");
				imageFolderIndex = filepath.indexOf("images");
				System.out.println("imageFolderIndex: " + imageFolderIndex);
				System.out.println(filepath.substring(0, imageFolderIndex));
				
				// Create Temp Directory first
				uploadDirectory = filepath.substring(0, imageFolderIndex) + "images";
				
				File fileUploadDirectory = new File(uploadDirectory);
		        
				if (!fileUploadDirectory.exists()) {
		            fileUploadDirectory.mkdirs();
		            System.out.println("Directory added.\n - - - ");
		        }
		        else {
		        	System.out.println("Directory exists.\n - - - ");
		        }
				
				// Fetch Image
				File storedFile = new File(filepath);
				System.out.println("File path detected: " + filepath + "\n - - - ");
				imageName = result.getString("filename");
				
				
				// Write file to temporary upload path
				try(FileOutputStream fileOutputStream = new FileOutputStream(storedFile)) {
					
					int length = result.getInt("datalength");
					byte[] byteArray = result.getBytes("filedata");
					fileOutputStream.write(byteArray, 0, length); // write(byte[] bytes,int offset, int length)
					
				%>
					<tr>
						<td><%=result.getInt("fileid") %></td>
						<td><%=result.getString("filename")%></td>
						<td><iframe src="images\<%=imageName %>" style="width: 500px; height: 680px;"></iframe></td>
					</tr>
				<%
				
				} catch (IOException e) {
					e.printStackTrace();
				}

			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	
	
	%>
		

	</table>
	<img src="">
	
	<button formaction="upload.jsp">Back To Upload</button>
	<button formaction="display.jsp">Image Displayer</button>
</form>
</body>
</html>