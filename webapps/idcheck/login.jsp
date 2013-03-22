<%@ page language="java" contentType="text/html;charset=windows-1256" pageEncoding="windows-1256" %>

<!DOCTYPE html>
<% if(session.getAttribute("username") == null) { %>
<html>
	<head>
		<title>Login Page</title>
		<link href="main.css" rel="stylesheet" type="text/css" />
	</head>
	<body>
		<div style="width:100%; background-color:black; color:white; height: 30px; border-bottom: solid 1px #1c1c1c;">
			<div style="margin: auto; width: 900px; font: 18px Myriad Pro,sans-serif; position: relative; padding-top: 5px;">
				<div style="float: left;">ONLINE ID CHECKER</div>
				<div style="font-size: 9pt; color: #a2b1b9; float: right; 
padding-top: 5px;">
					<a href="#" style="color: #a2b1b9;" 
>Login</a> | 
<a href="register.jsp" style="color: #a2b1b9;">Register</a></div>
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
