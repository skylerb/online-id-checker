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
		<script type="text/javascript" src="js/jquery.js"></script>
		<script type="text/javascript" src="js/slider.js"></script>
	</head>
	
	<% if((session.getAttribute("username") != null)) { %>
		<body>
			<div style="width:100%; background-color: black; color: white; min-height: 30px; border-bottom: solid 1px #1c1c1c; padding: 6px 0 2px;">
				<div style="margin: auto; font: 18px Myriad Pro, sans-serif; width: 900px; position: relative;">
					<div style="float: left;">ONLINE ID CHECKER</div>
					<form action="logout.jsp">
						<input class="button" type="submit" value="Logout">
					</form>
				</div>
			</div>
			<div style="width:100%; height: 120px;  background-color: #080808; background-image: url(images/header.jpg); background-repeat: no-repeat; background-position: center top;">
				<div style="font: 11pt Myriad Pro, sans-serif; color: white; width: 900px; margin: auto; position: relative;">
					<ul>
						<li><a href="index.jsp"><img src="images/home.png"></a><br/>Dashboard</li>
						<li><a href="search.jsp"><img src="images/search.png"></a><br/>Search</li>
					</ul>
				</div>
			</div>
			<div class="shadow" id="login" style="margin-top: 50px;">			
				<h4 style="margin-left: 10px;">Search</h4>
				<br/>
				<form action="#">
					<input type="text" name="name" placeholder="Name..."/><br/>
					<hr/>
					<input type="text" name="dob" placeholder="Date of Birth..."/><br/>
					<div class="dropdown">
						<hr/>
						<input type="text" name="?" placeholder="Something.."/><br/>
						<hr/>
						<input type="text" name="?" placeholder="Something else..."/><br/>
					</div>
					<div class="advanced">Advanced</div>
					<div style="padding-top: 30px; float: right; padding-right: 10px;">
						<input class="button" type="submit" value="Search">
					</div>
				</form>			
			</div>
		</body>
	<% } else { %>
		<jsp:forward page="login.jsp" />
	<% } %>
</html>
