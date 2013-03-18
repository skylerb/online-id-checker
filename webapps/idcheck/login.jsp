<%@ page language="java" contentType="text/html;charset=windows-1256" pageEncoding="windows-1256" %>

<!DOCTYPE html>

<html>
	<head>
		<title>Login Page</title>
		<link href="main.css" rel="stylesheet" type="text/css" />
	</head>
	<body>
		<div style="width:100%; background-color:black; color:white; height: 30px; padding-top: 10px;">
			<div style="align: left; padding-left: 100px; font: 18px Myriad Pro,sans-serif;">
				ONLINE ID CHECKER
			</div>
		</div>
		<div class="shadow" style="background: white; min-height: 230px; width: 400px; margin: 150px auto 0 auto; padding: 10px 20px 0 20px; position: 
relative;">
			<h4>Login</h4>
			<form action="checkLogin.jsp">
				<input type="text" name="username"/></br>
				<hr/>
				<input type="text" name="pass"/><br/>
				<input type="submit" value="submit">
			</form>
		</div>
	</body>
</html>
