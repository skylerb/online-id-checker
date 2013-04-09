<%@page import="SocialNetworkAcces.FacebookWrapper" %>
<%@page import="ProfileManager.Profile" %>
<%@page import="ProfileManager.Person" %>
<%@page import="GooglePlus.PlusSample" %>
<%@page import="User.MyConfigurationBuilder" %>
<%@page import="User.SearchUsers" %>
<%@page import="SearchHistory.SaveSearch" %>

<%
response.setHeader("Cache-Control","no-store");
response.setHeader("Pragma","no-cache");
response.setDateHeader("Expires",0);

//Post parameters
String name = request.getParameter("name");
String dob = request.getParameter("dob");
String phone = request.getParameter("phone");
String address = request.getParameter("address");
String city = request.getParameter("city");
String state = request.getParameter("state");
String country = request.getParameter("country");
String job = request.getParameter("job");
String degree = request.getParameter("degree");
String colleges = request.getParameter("colleges");
//String[] collegeArr = colleges.split(",");
int fbActive = 0;
int gpActive = 0;
int twtActive = 0;
int liActive = 0;
int igActive = 0;
if(request.getParameter("fbActive") != null) {
	fbActive = 1;
}
if(request.getParameter("gpActive") != null) {
	gpActive = 1;
}
if(request.getParameter("twtActive") != null) {
	twtActive = 1;
}
if(request.getParameter("liActive") != null) {
	liActive = 1;
}
if(request.getParameter("igActive") != null) {
	igActive = 1;
}
String fbID = request.getParameter("fb");
String gpID = request.getParameter("gp");
String twtID = request.getParameter("twt");
String liID = request.getParameter("li");
String igID = request.getParameter("ig");

%>

<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>


<!DOCTYPE html>

<html>
<% if((session.getAttribute("username") != null)) { 
	if(name != null) { 

	int id = (Integer)session.getAttribute("uid");
	//Save Search History
	SaveSearch saveSearch = new SaveSearch();
	boolean saved = false;
	try {
		saved = saveSearch.save(id,name,dob,phone,address,city,state,country,job,degree,colleges,fbActive,fbID,gpActive,gpID,twtActive,twtID,liActive,liID,igActive,igID);
	} catch(SQLException e) {
		e.printStackTrace(response.getWriter());
	}

	//out.print(saved);
	%>

	<head>
		<title>Results | <% out.print(name); %></title>
    		<link href="main.css" rel="stylesheet" type="text/css" />
    
    		<meta charset="utf-8" />
    		<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css" />
    		<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
    		<script src="http://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>


 		<style>
   			#feedback { font-size: 1.4em; }
   			table .ui-selectee  { background: white; border: solid; border-width:1px; border-color: grey;}
   			table .ui-selecting { background: white;}
   			table .ui-selected  { background: #FFE685; color: black}
   			#selectable .ui-selectee { background: white;}
   			#selectable .ui-selecting { background: blue; }
   			#selectable .ui-selected { background: white; border-width:1px; border-color:black; }
   			#selectable { list-style-type: none; margin: 0; padding: 0; width: 700px; }
   			#selectable li { margin: 3px; padding: 1px; float: left; width: 670px; height: 20px; font-size: 1.4m; text-align: center; margin-right:15px }
		</style>

<script>
  $(function() {
  $( "#selectable" ).selectable({
  stop: function() {
  $('#twitter-results, #facebook-results, #google-results, #linkedin-results').hide();
  $( ".ui-selected", this ).each(function() {

  var index = $( "#selectable li" ).index( this );
  if (index === 0)  {
   $('#twitter-results').show();
  } else if (index === 1){
  $('#facebook-results').show();
  } else if (index === 2){
  $('#linkedin-results').show();
  } else if (index === 3){
  $('#google-results').show();
  }

  });
  }
  });
  });
</script>

  </head>
  
  <body>

    <div class="topbar-wrapper">
      <div class="topbar">
	<div style="float: left;">ONLINE ID CHECKER</div>
	<form action="logout.jsp">
	  <input class="button" type="submit" value="Logout">
	  </form>
	</div>
      </div>

      <div class="mainmenu-wrapper">
	<div class="mainmenu">
	  <ul>
	    <li>
	      <a href="index.jsp"><img src="images/home.png"></a>
	      <p>Dashboard</p>
	    </li>
	    <li class="current">
	      <a href="search.jsp"><img src="images/search.png"></a>
	      <p>Search</p>
	    </li>
	  </ul>
	</div>
      </div>

	<div class="submenu-wrapper">
		<div class="submenu" id="pages">
	  		<div class="submenu-button selected">Twitter</div>
	  		<div class="submenu-button unselected">Facebook</div>
	  		<div class="submenu-button unselected">LinkedIn</div>
			<div class="submenu-button unselected">Google+</div>
			<div class="submenu-button unselected">Instagram</div>
			<div class="submenu-button compare">Compare</div>
		</div>
      	</div>

      <div class="bottom-content">
	<div class="shadow" style="width: 190px; height: 90px; background: white; padding: 10px; float: left; margin-right: 20px;">
	  <p style="text-align:center; font: 15pt Myriad Pro, 
		    sans-serif; font-weight: 700;"><% out.print(name); %></p>
	</div>

	<div style="border-style:none; width: 650px; height: 100px padding: 10px; float: left; margin-right: 0px;">
	  <ol id="selectable">
	  <li class="ui-state-default">Twitter</li>
	  <li class="ui-state-default">Facebook</li>
	  <li class="ui-state-default">LinkedIn</li>
	  <li class="ui-state-default">Google+</li>
	  </ol>
	</div>
      </div>

      <div class="bottom-content-results">
	<div id="twitter-results">  
	  <table>
	    <tr>
	      <% 
	      SearchUsers search = new SearchUsers();
	      String[] twitter = search.getResults(name);
	      int i = 0;
	      for(String twt : twitter) {
	      if(twt != null) {
	      String[] arr = twt.split(";");
	      %>

	      <%
	      i++;
	      if (i != 4) {
	      out.println("<td><div class=\"tdItem\" style=\"width:200px; height: 100px; padding: 5px; margin-left: 0; float: left; margin-bottom: 20px; margin-right:15px;\">");
	      }
	      else if (i == 4) {
	      out.println("<td><div class=\"tdItem\" style=\"width:200px; height: 100px; padding: 5px; margin-left: 0; float: left; margin-bottom: 20px; margin-right:0px;\">");
	      }
	      %>

	      <img src="<% out.print(arr[2]); %>"/>
	      <br/>
	      <h4><% out.print(arr[0]); %></h4>
	      
	      <h5 style="padding-top: 0; margin-top: 0;">
		<% if(!arr[1].equals("null")) { out.print(arr[1]); } else { out.print("N/A"); } %>
	      </h5>

	      <% 
	      out.println("</div></td>"); 
	      if (i == 4) { i = 0; out.println("</tr><tr>"); }
	      } } //End For loop
	      out.println("</table>");
	      %>

	    </div>

 
	    <div id="facebook-results">
	    <%-- <table>
		<tr>
		  
		  <%
		  
		  //Paste in access token here!
		  FacebookWrapper fw = new FacebookWrapper("AAACEdEose0cBAIodR2jcshTEydFfinlfzhW6hHG1ywAlr0QvTxpU3TqZCV7gjjkUseVYEXj0M4UqBJA8mw6UhNkVvhnAIOhAvonDk5VFsCx505fkW");
		  Profile[] profiles = fw.findPossibleMatches(new Person(name));
		  i = 0;
		  for(Profile prof : profiles) {
		  
		  %>

		  <%
		  i++;
		  if (i != 4) {
		  out.println("<td><div class=\"tdItem\" style=\"width:200px; height: 100px; padding: 5px; margin-left: 0; float: left; margin-bottom: 20px; margin-right:15px;\">");
		  }
		  else if (i == 4) {
		  out.println("<td><div class=\"tdItem\" style=\"width:200px; height: 100px; padding: 5px; margin-left: 0; float: left; margin-bottom: 20px; margin-right:0px;\">");
		  }
		  %>
		  <h4><% out.println(prof.person.getFullName()); %></h4>
		  <img src="https://graph.facebook.com<% out.println(prof.url.getPath()); %>/picture">

		  <% 
		  out.println("</div></td>"); 
		  if (i == 4) { i = 0; out.println("</tr><tr>"); }
		  } //End For loop
		  out.println("</table>");
		  %>
		--%>	
		</div>
		
		<div id="linkedin-results">
		</div>


		<div id="google-results">  
		<%--
		  <table>
		    <tr>
		      <% 
		      PlusSample goo = new PlusSample();
					String []gplus = goo.getProfile(name);
					i=0;
           				for (String person : gplus) {
           					if(person!=null){
           						String [] as = person.split(";");
		      %>

		      <%
		      i++;
		      if (i != 4) {
		      out.println("<td><div class=\"tdItem\" style=\"width:200px; height: 100px; padding: 5px; margin-left: 0; float: left; margin-bottom: 20px; margin-right:15px;\">");
		      }
		      else if (i == 4) {
		      out.println("<td><div class=\"tdItem\" style=\"width:200px; height: 100px; padding: 5px; margin-left: 0; float: left; margin-bottom: 20px; margin-right:0px;\">");
		      }
		      %>

		      <img src="<% out.print(as[1]); %>"/>
		      <br/>
		      <h4><% out.print(as[0]); %></h4>
		      
		      <h5 style="padding-top: 0; margin-top: 0;">
			<% if(!as[2].equals("null")) { out.print(as[2]); } else { out.print("N/A"); } %>
		      </h5>

		      <% 
		      out.println("</div></td>"); 
		      if (i == 4) { i = 0; out.println("</tr><tr>"); }
		      } } //End For loop
		      out.println("</table>");
		      %>
			--%>
	    	</div>


	      </div>
	      
    	<script>
	  $("table").selectable({
	  filter: ".tdItem"
	  });
	  
	</script>

      </body>
      <% 	} else {
			response.sendRedirect(request.getContextPath() + "/search.jsp");
		}
	} else {
      response.sendRedirect(request.getContextPath() + "/login.jsp");
      } %>   
</html>
