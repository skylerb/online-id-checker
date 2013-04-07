<%@page import="auth.LoginCheck" %>

<%

      try {
	  String password = "me";
	  String username = "test";

	  LoginCheck lc = new LoginCheck();
	  
	  out.println(lc.createUser(username, password));

      } catch (Exception e) {
	  out.println("error" + e);
      }

%>

