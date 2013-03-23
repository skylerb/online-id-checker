<%@page import="SocialNetworkAcces.FacebookWrapper" %>
<%@page import="ProfileManager.Profile" %>
<%@page import="ProfileManager.Person" %>

<a href="search.jsp">Search again</a>
<ul>
<%
String name = request.getParameter("name");
FacebookWrapper fw = new FacebookWrapper();
Profile[] profiles = fw.findPossibleMatches(new Person(name));

for(Profile prof : profiles) {

%>

<li>
<img src="https://graph.facebook.com<% out.println(prof.url.getPath()); %>/picture">
    <a href="<% out.println(prof.url.toString()); %>"><% out.println(prof.person.getFullName()); %></a>
</li>
<%
}

%>
</ul>
