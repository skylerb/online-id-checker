
<%
response.setHeader("Cache-Control","no-store");
response.setHeader("Pragma","no-cache");
response.setDateHeader("Expires",0);
%>

<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html>
<html>

	<head>
		<title>Dashboard</title>
		<link href="main.css" rel="stylesheet" type="text/css" />
	</head>



	<% if((session.getAttribute("username") != null)) { %>
		<body>
		
			<div class="topbar-wrapper">
				<div class="topbar">
					<div style="float: left;">ONLINE ID CHECKER</div>
					<form action="logout.jsp">
						<input class="button" type="submit" value="Logout">
					</form>
				</div>
			</div>
			<div class="mainmenu-wrapper">
				<div class="mainmenu">
					<ul>
						<li class="current">
							<a href="#"><img src="images/home.png"></a>
							<p>Dashboard</p>
						</li>
						<li>
							<a href="search.jsp"><img src="images/search.png"></a>
							<p>Search</p>
						</li>
					</ul>
				</div>
			</div>
			<div class="bottom-content">
				<div class="shadow" style="width: 100%; background: white; padding: 5px;">
					<h4>Search History</h4>
				</div> 
			</div>
		</body>
	<% } else {
		response.sendRedirect(request.getContextPath() + "/login.jsp");
	} %>
</html>
