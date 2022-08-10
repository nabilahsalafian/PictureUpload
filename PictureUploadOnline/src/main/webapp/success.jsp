<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Success</title>
</head>
<body>
<form>
	Upload Success!
	<p>File name: <%= (String)request.getAttribute("filename") %></p>
	<button formaction="upload.jsp">Back To Upload</button>
	<button formaction="display.jsp">Image Displayer</button>
	<button formaction="test.jsp">Test Page</button>
</form>
</body>
</html>