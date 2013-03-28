<%
response.setHeader("Cache-Control","no-store");
response.setHeader("Pragma","no-cache");
response.setDateHeader("Expires",0);
%>

<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html>
<html>
	<head>
		<title>Search</title>
		<link href="main.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="js/jquery.js"></script>
		<script type="text/javascript" src="js/slider.js"></script>
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
						<li>
							<a href="index.jsp"><img src="images/home.png"></a>
							<p>Dashboard</p>
						</li>
						<li class="current">
							<a href="search.jsp"><img src="images/search.png"></a>
							<p>Search</p>
						</li>
					</ul>
				</div>
			</div>
			<div class="shadow" id="login" style="margin-top: 50px; margin-bottom: 50px;">			
				<h4 style="margin-left: 10px;">Search</h4>
				<br/>
				<form method="post" action="results.jsp">
					<a name="TOP"></a>
					<input type="text" name="name" placeholder="Name..."/><br/>
					<hr/>
					<input type="text" name="dob" placeholder="Date of Birth..."/><br/>
					<div class="dropdown">
						<hr/>
						<input type="text" name="phone" placeholder="Telephone Number..."/><br/>
						<hr/>
						<input type="text" name="address" placeholder="Street Address..."/><br/>
						<hr/>
						<input type="text" name="city" placeholder="City..."/><br/>
						<hr/>
						<input type="text" name="state" placeholder="State..."/><br/>
						<hr/>
						<input type="text" name="country" placeholder="Country..."/><br/>
						<hr/>
						<input type="text" name="job" placeholder="Employment Information..."/><br/>
					</div>
					<div class="advanced">Advanced</div>
					<div style="padding-top: 30px; float: right; padding-right: 10px;">
						<input class="button" type="submit" value="Search">
					</div>
				</form>			
			</div>
		</body>
	<% } else {
		response.sendRedirect(request.getContextPath() + "/login.jsp");
	} %>
</html>
