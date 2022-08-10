<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Upload Picture</title>
</head>
<body>
<h1>Upload File</h1>
<form method="post" enctype="multipart/form-data" >
	Picture:<br>
	<input type="file" accept="image/pdf" id="testFile" name="testFile"><br><br>
	<button type="submit" formaction="FileServlet?action=addFile">Submit</button>
	<button formaction="test.jsp">Test Page</button>
	<button formaction="display.jsp">Display Page</button>
</form>

</body>
</html>