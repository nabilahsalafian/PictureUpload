<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form method="post">
	<% 
		String path = null;
	
		if(request.getAttribute("uploadPath") != null) {
			path = (String)request.getAttribute("uploadPath");
		} else {
			path = "Press the button to search upload path.";
		}
	
	%>
	
	<button formaction="FileServlet?action=getUploadDirectory&page=test.jsp">Get Upload Directory</button>
	
	Current File Upload Directory: <%=path%> <br><br>
	
	<button formaction="upload.jsp">Back To Upload</button>
	<button formaction="display.jsp">Image Displayer</button>
</form>
</body>
</html>