<%
	String username = null;
	
	try {
		session.setAttribute("username",null);
		username = request.getParameter("username");

		if(username.toLowerCase().trim().equals("admin")) { 
			session.setAttribute("username",username);
		%>
			<jsp:forward page="index.jsp"/>
		<% } else { %>
			<jsp:forward page="login.jsp"/>
		<% }
	} catch (Exception e) {
		System.out.println("error"+e);
	}
%>
