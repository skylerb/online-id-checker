<%@page import="SocialNetworkAcces.FacebookWrapper" %>
<%@page import="ProfileManager.Profile" %>
<%@page import="ProfileManager.Person" %>

<%@page import="User.MyConfigurationBuilder" %>
<%@page import="User.SearchUsers" %>

<%
response.setHeader("Cache-Control","no-store");
response.setHeader("Pragma","no-cache");
response.setDateHeader("Expires",0);

//Post parameters
String name = request.getParameter("name");
String dob = request.getParameter("dob");
%>

<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>

<!DOCTYPE html>
<html>
	<head>
		<title>Results | <% out.print(name); %></title>
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
			<div class="submenu-wrapper">
				<div class="submenu">
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
				<div class="shadow" style="width: 190px; height: 90px; background: white; padding: 10px; float: left; margin-right: 20px;">
					<p style="text-align:center; font: 15pt Myriad Pro, 
sans-serif; font-weight: 700;"><% out.print(name); %></p>
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
			<%--
				<div class="shadow" style="width: 100%; background: white; padding: 5px 0 20px 0; float: left; margin-right: 30px;">
					<h4>Facebook</h4>
                    <%
                        FacebookWrapper fw = new FacebookWrapper();
                        Profile[] profiles = fw.findPossibleMatches(new Person(name));

                        for(Profile prof : profiles) {
                    %>
                    <div style="-webkit-box-shadow: 2px 2px 16px #999; box-shadow: 2px 2px 16px #999; padding: 30px; margin: 15px; 0 15px 0;">
                    <img src="https://graph.facebook.com<% out.println(prof.url.getPath()); %>/picture">
                    <a style="color: #777; font-size: 1.8em; float:right; margin-top: 1.7em;"href="<% out.println(prof.url.toString()); %>"><% out.println(prof.person.getFullName()); %></a>
                    </div>
                    <%
                        }
                    %>
			
				</div>
			--%>
				<% 
					SearchUsers search = new SearchUsers();
					String[] twitter = search.getResults(name);
					int i = 0;
					for(String twt : twitter) {
						if(twt != null) {
							String[] arr = twt.split(";");
				%>
				<div class="shadow" style="width: 200px; height: 100px; background: white; padding: 5px; float: left; margin-bottom: 
20px; <% if(i != 3) { out.print("margin-right: 20px;"); i++;} else { i = 0; } %>">
					<img src="<% out.print(arr[2]); %>" /><br/>
					<h4><% out.print(arr[0]); %></h4>
					<h5 style="padding-top: 0; margin-top: 0;"><% if(!arr[1].equals("null")) { out.print(arr[1]); } else { 
out.print("N/A"); } %></h5>

				</div>
				<% } } %>
			</div>
		</body>
	<% } else {
		response.sendRedirect(request.getContextPath() + "/login.jsp");
	} %>
</html>
