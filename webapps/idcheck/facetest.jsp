<%@page import="SocialNetworkAcces.FacebookWrapper" %>

<ul>
<%
FacebookWrapper fw = new FacebookWrapper();

for(String user : fw.userarray) {

%>
<li><% out.println(user); %></li>
<%
}

%>
</ul>
