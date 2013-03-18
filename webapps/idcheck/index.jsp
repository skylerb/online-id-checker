<%
response.setHeader("Cache-Control","no-store");
response.setHeader("Pragma","no-cache");
response.setDateHeader("Expires",0);
%>

<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html>
<html>
	<head>
		<title>Change This</title>
	</head>
	
	<% if((session.getAttribute("username") != null)) { %>
		<body>
			<h1>THERE IS WHERE THE INDEX PAGE CODE WILL GO!</h1>
		</body>
	<% } else { %>
		<jsp:forward page="login.jsp" />
	<% } %>
</html>
