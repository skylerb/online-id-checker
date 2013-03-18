<%
	String username, password = null;
	
	try {
		session.setAttribute("username",null);
		session.setAttribute("password",null);

		username = request.getParameter("username");
		password = request.getParameter("pass");

		if(username.toLowerCase().trim().equals("admin") && password.toLowerCase().trim().equals("admin")) { 
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
