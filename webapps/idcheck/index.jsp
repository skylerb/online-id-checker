<%@ page contentType="text/html" %>
<%@ page import="java.sql.*" %>
<%@ page import="org.sqlite.*" %>
<%@ page import="java.text.*" %>
<%@ page import="java.util.Date" %>

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
					<div style="float:right; display:inline-block; padding-right: 25px; font-size: 10pt; padding-top: 5px;">
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

			<table class="shadow" style="width: 900px; cellspacing: 0; cellpadding: 0;background: white; margin-top: 20px; border-collapse: collapse; font-size: 11pt; color: #808080;">
				<thead>
					<td>&nbsp;</td>
					<td>Search Date</td>
					<td>Name</td>
					<td># of Networks Searched</td>
					<td>&nbsp;</td>
				</thead>
				<%	
				ResultSet rs = null;
				Connection conn = null;
				try {
					Class.forName("org.sqlite.JDBC");
					conn = DriverManager.getConnection("jdbc:sqlite:" + System.getProperty("catalina.home") + "/dbs/database.db");
					Statement stmt = conn.createStatement();
					rs = stmt.executeQuery("select * from search where uid =" + id);
					int cnt = 0;
					while(rs.next()) {
						int accts = 0;
						cnt++;
						if(cnt % 2 == 0) { 
							out.println("<tr style='background: #e1e1e1;'>"); 
						} else {
							out.println("<tr>");
						}
						if(rs.getInt("fbActive") == 1) {
							accts += 1;
						}
						if(rs.getInt("gpActive") == 1) {
							accts += 1;
						}
						if(rs.getInt("twtActive") == 1) {
							accts += 1;
						}
						if(rs.getInt("liActive") == 1) {
							accts += 1;
						}
						if(rs.getInt("igActive") == 1) {
							accts += 1;
						}
						out.println("<td>&nbsp;</td>");
						DateFormat df = new SimpleDateFormat("MM/dd/yyyy");
						out.println("<td>" + rs.getString("date") + "</td>");
						out.println("<td>" + rs.getString("name") + "</td>");
						out.println("<td>" + accts + "</td>");
						out.println("<td>Search</td>");
						out.println("</tr>");			
					}

					if(cnt == 0) {
						out.println("<tr><td>No search history available...</td></tr>");
					} 

					rs.close();
					conn.close();
				} catch(SQLException e) {
					out.println("Unable to connect to database");
					e.printStackTrace(response.getWriter());
				} finally {
					try {
						if(rs!=null){ rs.close(); }
					} catch(SQLException se) { }
					try {
						if(conn!=null) { conn.close(); }
					} catch(SQLException se) {}
				}

			%>
			</table>
			</div>

			<div class="bottom-content">
				<div class="shadow" style="width: 890px; padding: 5px; background: white;">
					<h4>Compare History</h4>				
				</div>	
			</div>
		</body>
	<% } else {
		response.sendRedirect(request.getContextPath() + "/login.jsp");
	} %>
</html>
