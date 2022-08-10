<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Find Application Path</title>
</head>
<body>
<form method="post">
	<% 
		String path = null;
	
		if(session.getAttribute("appPath") != null) {
			path = (String)session.getAttribute("appPath");
		} else {
			path = "Press the button to search for application path.";
		}
	
	%>
	
	<button formaction="FileServlet?action=getApplicationPath&page=find.jsp">Get Upload Directory</button>
	
	Application Core Path: <%=path%> <br><br>
	
	<button formaction="upload.jsp">Back To Upload</button>
	<button formaction="FileServlet?action=getApplicationPath&page=display.jsp">Image Displayer</button>
</form>
</body>
</html>