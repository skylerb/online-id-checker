<% 
session.removeAttribute("username");
session.invalidate();
%>
<jsp:forward page="index.jsp"/>

