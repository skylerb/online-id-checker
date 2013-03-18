<%@ page language="java" contentType="text/html;charset=windows-1256" pageEncoding="windows-1256" %>

<!DOCTYPE html>

<html>
	<head>
		<title>Login Page</title>
		<link href="main.css" rel="stylesheet" type="text/css" />
	</head>
	<body>
		<div style="width:100%; background-color:black; color:white; height: 30px; border-bottom: solid 1px #1c1c1c;">
			<div style="margin: auto; width: 900px; font: 18px Myriad Pro,sans-serif; position: relative; padding-top: 5px;">
				ONLINE ID CHECKER
			</div>
		</div>
		<div class="shadow" id="login">
			<h4 style="margin-left: 10px;">Login</h4>
			<br />
			<form action="checkLogin.jsp">
				<input type="text" name="username" placeholder="Email Address..."/></br>
				<hr/>
				<input type="text" name="pass" placeholder="Password..."/><br/>
				<div style="padding-top: 30px; padding-right: 10px;">
					<input class="button" type="submit" value="Login">
				</div>
			</form>
		</div>
	</body>
</html>
