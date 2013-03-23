<%@ page language="java" contentType="text/html;charset=windows-1256" pageEncoding="windows-1256" %>

<!DOCTYPE html>

<% if(session.getAttribute("username") == null) { %>

<html>
	<head>
		<title>Register Page</title>
		<link href="main.css" rel="stylesheet" type="text/css" />
	</head>
	<body>
		<div class="topbar-wrapper">
			<div class="topbar">
				<div style="float: left;">ONLINE ID CHECKER</div>
				<div style="font-size: 9pt; color: #86858e; float: right; 
padding-top: 5px;">
					<a href="login.jsp" style="color: #86858e;" 
>Login</a> | 
<a href="#" style="color: #86858e;">Register</a></div>
			</div>
		</div>
		<div class="shadow" id="login" style="height: 305px;">
			<h4 style="margin-left: 10px;">Register</h4>
			<br />
			<form action="chkReg.jsp" method="post">
				<input type="text" name="username" 
placeholder="Username..."/></br>
				<hr/>
 				<input type="password" name="pass" placeholder="Password..."/><br/>
 				<hr/>
				<input type="password" name="pass_ver" 
placeholder="Password Again..."/><br/>				
				<div style="padding-top: 30px; padding-right: 10px;">
					<input class="button" type="submit" 
value="Register">
				</div>
			</form>
		</div>
	</body>
</html>

<% } else {
	response.sendRedirect(request.getContextPath());
}
%>
