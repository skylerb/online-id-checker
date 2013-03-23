<%@page import="auth.LoginCheck" %>

<%

String username = null;
String pass = null;
String pass_ver = null;

try {
	
    username = request.getParameter("username");
    if (username == null) {
	response.sendRedirect(request.getContextPath() + "/register.jsp");
    }    

    pass = request.getParameter("pass");
    if (pass == null) {
	response.sendRedirect(request.getContextPath() + "/register.jsp");
    }

    pass_ver = request.getParameter("pass_ver");
    if (pass_ver == null) {
	response.sendRedirect(request.getContextPath() + "/register.jsp");
    }
    
    
    if (!pass.equals(pass_ver)) {
	response.sendRedirect(request.getContextPath() + "/register.jsp");
    }

    LoginCheck lc = new LoginCheck();
    
    if (!lc.userExists(username, pass)) {

	int ret = lc.createUser(username,pass);

	if (ret == LoginCheck.DB_CONNECTION_ERROR) {
	    response.sendRedirect(request.getContextPath() + "/register.jsp?err=db");
	} 
	else {
	    session.setAttribute("username", username);
	    response.sendRedirect(request.getContextPath());
	}
    }
    else {
	response.sendRedirect(request.getContextPath() + "/register.jsp?err=ut");
    }



} catch (Exception e) {
    out.println("error" + e);
}


%>
