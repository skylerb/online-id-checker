
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>

<!DOCTYPE html>

<html>
<% if((session.getAttribute("username") != null)) { %>

<head>
<title>Compare</title>
<link href="main.css" rel="stylesheet" type="text/css" />

<meta charset="utf-8" />

</head>

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

<div class="bottom-content">
    <div id="name-dob" class="shadow" style="width: 190px; height: 90px; background: white; padding: 10px; float: left; margin-right: 20px;" >
        <h4 style="text-align:center; margin-top: 15px;">John Doe</h4>
        <p style="text-align:center; font: 11pt Myriad Pro, sans-serif; font-weight: 700; color: #999">DOB: January 23, 1991</p>
    </div>

    <div id="results-found" class="shadow" style="width: 190px; height: 90px; background: white; padding: 10px; float: left; margin-right: 20px;" >
        <h4 style="text-align:center; margin-top: 15px;">12</h4>
        <p style="text-align:center; font: 11pt Myriad Pro, sans-serif; font-weight: 700; color: #999">Results Found</p>
    </div>

    <div id="percent-matched" class="shadow" style="width: 190px; height: 90px; background: white; padding: 10px; float: left; margin-right: 20px;" >
        <h4 style="text-align:center; margin-top: 15px;">98.4%</h4>
        <p style="text-align:center; font: 11pt Myriad Pro, sans-serif; font-weight: 700; color: #999">percent matched</p>
    </div>

    <div id="other" class="shadow" style="width: 190px; height: 90px; background: white; padding: 10px; float: left; " >
        <h4 style="text-align:center; margin-top: 15px;">34.2%</h4>
        <p style="text-align:center; font: 11pt Myriad Pro, sans-serif; font-weight: 700; color: #999">some other stat</p>
    </div>
</div>


<% } else {
response.sendRedirect(request.getContextPath() + "/login.jsp");
} %>
</html>