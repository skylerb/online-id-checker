<%
	String username = null;
	
	try {
		session.setAttribute("username",null);
		username = request.getParameter("username");

		if(username.toLowerCase().trim().equals("admin")) { 
			session.setAttribute("username",username);
			response.sendRedirect(request.getContextPath() + "/index.jsp");
		 } else {
			response.sendRedirect(request.getContextPath() + "/login.jsp");
		 }
	} catch (Exception e) {
		System.out.println("error"+e);
	}
%>


