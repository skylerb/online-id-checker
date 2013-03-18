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
		<link href="main.css" rel="stylesheet" type="text/css" />
	</head>
	
	<% if((session.getAttribute("username") != null)) { %>
		<body>
			<div style="width:100%; background-color: black; color: white; height: 30px; border-bottom: solid 1px #1c1c1c;">
				<div style="margin: auto; font: 18px Myriad Pro, sans-serif; width: 900px; position: relative; padding-top: 5px;">
					ONLINE ID CHECKER
				</div>
			</div>
			<div style="width:100%; height: 120px;  background-color: #080808; background-image: url(images/header.jpg); background-repeat: no-repeat; 
background-position: center top;">
				&nbsp;
			</div>
			
		</body>
	<% } else { %>
		<jsp:forward page="login.jsp" />
	<% } %>
</html>
