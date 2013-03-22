<%@page import="auth.LoginCheck" %>

<%
String username = null;
String password = null;

try {
    session.setAttribute("username", null);

    username = request.getParameter("username");
    if (username == null) {
	response.sendRedirect(request.getContextPath() + "/login.jsp");
    }    

    password = request.getParameter("pass");
    if (password == null) {
	response.sendRedirect(request.getContextPath() + "/login.jsp");
    }
    out.println(username);
    out.println(password);

    LoginCheck lc = new LoginCheck();
    
    if (lc.validate(username, password)) {
	session.setAttribute("username", username);
	response.sendRedirect(request.getContextPath());
    }
    else {
	response.sendRedirect(request.getContextPath() + "/login.jsp");
    }
	 
	
} catch (Exception e) {
    System.out.println("error"+e);
}


%>


