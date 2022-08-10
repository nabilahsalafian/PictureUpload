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
	Search image: <input type="text" name="searchName">
	<button formaction="display.jsp">Search</button> <br><br><br>
	
	<button formaction="upload.jsp">Back To Upload</button>
	<button formaction="find.jsp">Find Application Path</button>
	<button formaction="FileServlet?action=getApplicationPath&page=display.jsp">Image Displayer</button>
	
	<br><br>
	
	<table style="border: 2px solid grey; padding: 5px; width: 100%; text-align: center; align-items: center;">
		<tr>
			<th>No.</th>
			<th>ID</th>
			<th>File Name</th>
			<th>Image</th>
		</tr>
		
		<%-- SQL SEARCH --%>
	<%	
		// Get Application Path
		String appPath = (String)session.getAttribute("appPath");
	
		// File Search
		int imgCounter = 0;
		String searchName = null;
		String fileName = null;
		String query = null;
		char quote ='"';
		int imageFolderIndex = 0;
		String uploadPath = null;
		
		if(request.getParameter("searchName") !=  null) {
			searchName = request.getParameter("searchName");
			query = "SELECT fileid, filename, filedata, LENGTH(filedata) AS " + quote + "datalength" + quote + "FROM filedetails " +
					"WHERE LOWER(filename) LIKE '%" + searchName + "%' " +
					"OR UPPER(filename) LIKE '%" + searchName + "%' " +
					"OR filename LIKE '%" + searchName + "%'";
		
		} else {
			searchName = "";
			query = "SELECT fileid, filename, filedata, LENGTH(filedata) AS " + quote + "datalength" + quote + "FROM filedetails";
		}
	

		try (Connection connection = ConnectionManager.getConnection();
			 PreparedStatement searchSQL = connection.prepareStatement(query);
			 ResultSet result = searchSQL.executeQuery()) {
			
			while(result.next()){
				imgCounter++;
				System.out.println("Image: " + imgCounter);
				
				// Create Temp Directory first
				uploadPath = appPath + File.separator + "images" + File.separator + "tempFileDisplay" + File.separator + result.getInt("fileid");
				
				File fileUploadDirectory = new File(uploadPath);
		        
				if (!fileUploadDirectory.exists()) {
		            fileUploadDirectory.mkdirs();
		            System.out.println("Directory added.\n - - - ");
		        }
		        else {
		        	System.out.println("Directory exists.\n - - - ");
		        }
				
				// Fetch Image (Get full image path)
				fileName = result.getString("filename");
				File storedFile = new File(uploadPath + File.separator + fileName);
				System.out.println("File path detected: " + storedFile + "\n - - - ");
				
				// Write file to temporary upload path
				try(FileOutputStream fileOutputStream = new FileOutputStream(storedFile)) {
					
					int length = result.getInt("datalength");
					byte[] byteArray = result.getBytes("filedata");
					fileOutputStream.write(byteArray, 0, length); // write(byte[] bytes,int offset, int length)
					
				%>
					<tr>
						<td><%=imgCounter%></td>
						<td><%=result.getInt("fileid") %></td>
						<td><%=result.getString("filename")%></td>
						<td><iframe src="images\tempFileDisplay\<%=result.getInt("fileid")%>\<%=fileName %>" style="width: 500px; height: 680px;"></iframe></td>
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
</form>
</body>
</html>