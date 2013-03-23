<%@ page language="java" contentType="text/html;charset=windows-1256" pageEncoding="windows-1256" %>

<!DOCTYPE html>
<% if(session.getAttribute("username") == null) { %>
<html>
	<head>
		<title>Login Page</title>
		<link href="main.css" rel="stylesheet" type="text/css" />
	</head>
	<body>
		<div class="topbar-wrapper">
			<div class="topbar">
				<div style="float: left;">ONLINE ID CHECKER</div>
				<div style="font-size: 9pt; color: #86858e; float: right; 
padding-top: 5px;">
					<a href="#" style="color: #86858e;" 
>Login</a> | 
<a href="register.jsp" style="color: #86858e;">Register</a></div>
			</div>
		</div>
		<div class="shadow" id="login">
			<h4 style="margin-left: 10px;">Login</h4>
			<br />
			<form action="checkLogin.jsp" method="post">
				<input type="text" name="username" 
placeholder="Username..."/></br>
				<hr/>
 				<input type="password" name="pass" placeholder="Password..."/><br/>
				<div class="advanced"><a href="register.jsp">Create 
Account</a></div>
				<div style="padding-top: 30px; padding-right: 10px;">
					<input class="button" type="submit" value="Login">
				</div>
			</form>
		</div>
	</body>
</html>
<% } else {
	response.sendRedirect(request.getContextPath());
} %>
