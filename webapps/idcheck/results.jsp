
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

	
			<div style="width:100%; background-color: black; color: white; min-height: 30px; border-bottom: solid 1px #1c1c1c; padding: 6px 0 2px;">
				<div style="margin: auto; font: 18px Myriad Pro, sans-serif; width: 900px; position: relative;">
					<div style="float: left;">ONLINE ID CHECKER</div>
					<form action="logout.jsp">
						<input class="button" type="submit" value="Logout">
					</form>
				</div>
			</div>
			<div style="width:100%; height: 120px;  background-color: #080808; background-image: url(images/header.jpg); background-repeat: no-repeat; background-position: center top;">
				<div style="font: 10pt Myriad Pro, sans-serif; color: white; width: 900px; margin: auto; position: relative;">
					<ul>
						<li>
							<a href="index.jsp"><img src="images/home.png"></a><br/>
							Dashboard
						</li>
						<li><a href="search.jsp"><img src="images/search.png"></a><br/>Search</li>
					</ul>
				</div>
			</div>
			<div class="submenu">
				<div style="font: 10pt Myriad Pro, sans-serif; color: #999999; width: 900px; margin: auto; position: relative;">
					<div class="submenu-button selected">
						Results
					</div>
					<div class="submenu-button unselected">
						Locations
					</div>
					<div class="submenu-button unselected">
						Social Friends
					</div>
				</div>
			</div>
			<div class="bottom-content">
				<div class="shadow" style="width: 200px; height: 100px; background: white; padding: 5px; float: left; margin-right: 20px;">
					<h4>Lion-O</h4>
				</div>
				<div class="shadow" style="width: 200px; height: 100px; background: white; padding: 5px; float: left; margin-right: 20px;">
					<h4>#</h4>
				</div>
				<div class="shadow" style="width: 200px; height: 100px; background: white; padding: 5px; float: left; margin-right: 20px;">
					<h4>%</h4>
				</div>
				<div class="shadow" style="width: 200px; height: 100px; background: white; padding: 5px; float: left;">
					<h4>%</h4>
				</div>
			</div>
			<div class="bottom-content-results">
				<div class="shadow" style="width: 200px; height: 250px; background: white; padding: 5px; float: left; 
margin-right: 30px;">
					<h4>Facebook</h4>
				</div>
			</div>
		</body>
	<% } else { %>
		<jsp:forward page="login.jsp" />
	<% } %>
</html>
