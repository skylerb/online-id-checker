<%@ page contentType="text/html" %>
<%@ page import="java.sql.*" %>
<%@ page import="org.sqlite.*" %>
<%
response.setHeader("Cache-Control","no-store");
response.setHeader("Pragma","no-cache");
response.setDateHeader("Expires",0);
%>

<!DOCTYPE html>
<html>

	<head>
		<title>Dashboard</title>
		<link href="main.css" rel="stylesheet" type="text/css" />
	</head>



	<% if((session.getAttribute("username") != null)) { 
		int id = (Integer)session.getAttribute("uid");%>
		<body>
		
			<div class="topbar-wrapper">
				<div class="topbar">
					<div style="float: left;">ONLINE ID CHECKER</div>
					<form action="logout.jsp">
						<input class="button" type="submit" value="Logout">
					</form>
					<div style="float:right; display:inline-block; padding-right: 25px; font-size: 10pt; 
padding-top: 5px;">
						<% out.print((String)session.getAttribute("username")); %>
					</div>

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
				<div class="shadow" style="width: 890px; padding: 5px; background: white;">
					<h4>Search History</h4>
				</div> 

			<table class="shadow" style="width: 900px; cellspacing: 0; cellpadding: 0;background: white; margin-top: 
20px; border-collapse: collapse;">
			<%	
				try {
					Class.forName("org.sqlite.JDBC");
					Connection conn = DriverManager.getConnection("jdbc:sqlite:" + System.getProperty("catalina.home") + "/dbs/database.db");
					Statement stmt = conn.createStatement();
					ResultSet rs = stmt.executeQuery("select * from search where uid =" + id);
					int cnt = 0;
					while(rs.next()) {
						cnt++;
						if(cnt % 2 == 0) { 
							out.println("<tr style='background: #808080;'>"); 
						} else {
							out.println("<tr>");
						}
						out.println("<td>" + rs.getDate("date").toString() + "</td>");
						out.println("<td>" + rs.getString("name") + "</td>");
						out.println("<td>" + rs.getString("address") + " " + rs.getString("city") + ", " + rs.getString("state") + ", " + rs.getString("country") + "</td>");
						out.println("</tr>");			
					}

					if(cnt == 0) {
						out.println("<tr><td>No search history available...</td></tr>");
					} 

					rs.close();
					conn.close();
				} catch(Exception e) {
					out.println("Unable to connect to database");
				}

			%>
			</table>
			</div>
		</body>
	<% } else {
		response.sendRedirect(request.getContextPath() + "/login.jsp");
	} %>
</html>
