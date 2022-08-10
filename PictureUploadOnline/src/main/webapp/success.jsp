<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Success</title>
</head>
<body>
<form method="post">
	<h2>Upload Success!</h2>
	<p>File name: <%= (String)request.getAttribute("filename") %></p>
	<button formaction="upload.jsp">Back To Upload</button>
	<button formaction="FileServlet?action=getApplicationPath&page=display.jsp">Image Displayer</button>
	<button formaction="find.jsp">Find Application Path</button>
</form>
</body>
</html>