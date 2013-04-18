<%@page import="SocialNetworkAcces.FacebookWrapper" %>
<%@page import="ProfileManager.Profile" %>
<%@page import="ProfileManager.Person" %>
<%@page import="GooglePlus.PlusSample" %>
<%@page import="User.MyConfigurationBuilder" %>
<%@page import="User.SearchUsers" %>
<%@page import="SearchHistory.SaveSearch" %>
<%@page import="java.util.ArrayList" %>
<%@page import="ProfileManager.ProfileHashMap" %>
<%@page import="SocialNetworkAcces.LinkedinWrapper" %>


<%
response.setHeader("Cache-Control","no-store");
response.setHeader("Pragma","no-cache");
response.setDateHeader("Expires",0);


///////////
String FBTok = "AAACEdEose0cBAMdVwCvzlZAyLDQOcsxy0TINXZAhgCyls4XvnRDfs2ZBc5XZBJZCHj2YuhGGcQ9RV9yMSaGsR4jLYqBPXs5Axbgxs16aCDnousZB1D8n4m";
/////////


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
	/*Save Search History 
	SaveSearch saveSearch = new SaveSearch();
	boolean saved = false;
	try {
		saved = saveSearch.save(id,name,dob,phone,address,city,state,country,job,degree,colleges,fbActive,fbID,gpActive,gpID,twtActive,twtID,liActive,liID,igActive,igID);
	} catch(SQLException e) {
	   	//e.printStackTrace(response.getWriter());
	}
	//out.print(saved); */
	%>

	<head>
	<script language="javascript">
	function post(dictionary, url, method) {
	    method = method || "post"; 
 
	    var form = document.createElement("form");
	    form.setAttribute("method", method);
	    form.setAttribute("action", url);

	    for (key in dictionary) {

		var hiddenField = document.createElement("input");
		hiddenField.setAttribute("type", "hidden");
		hiddenField.setAttribute("name", key);
		hiddenField.setAttribute("value", dictionary[key]);
		form.appendChild(hiddenField);
	    }
 
	    document.body.appendChild(form);
	    form.submit();
	}
	</script>

		<title>Results | <% out.print(name); %></title>
    		<link href="main.css" rel="stylesheet" type="text/css" />
    
    		<meta charset="utf-8" />
    		<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css" />
    		<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
    		<script src="http://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>

 		<style>
   			#feedback { font-size: 1.4em; }

   			table .ui-selectee  { background: white;}
   			table .ui-selecting { background: white;}
   			table .ui-selected  { background: #FFE685; color: black}

   			#selectable .ui-selectee { 
			    border-top: solid 1px #65666d;
			    border-bottom: solid 1px #1d1d22;
			    color: #aeadbb;
			    text-shadow: 0px 1px #000000;

			    /* IE */
			    background-image: -ms-linear-gradient(top,#494b54 0%, #393b41 100%);

			    /* FF */
			    background-image: -moz-linear-gradient(top,#494b54 0%, #393b41 100%);
	
			    /* Opera */
			    background-image: -o-linear-gradient(top,#494b54 0%, #393b41 100%);

			    /* WebKit 1 */
			    background-image: -webkit-gradient(linear,left top, left bottom, color-stop(0,#494b54), color-stop(1,#393b41));

			    /* Webkit 2 */
			    background-image: -webkit-linear-gradient(top, #494b54 0%, #393b41 100%);

			    /* Other */
			    background-image: linear-gradient(to bottom, #494b54 0%, #393b41 100%);
			}

   			#selectable .ui-selecting { 

			}

   			#selectable .ui-selected {	
				color:#54545b;
			    border-bottom: solid 1px #494a4f;
			    background-color: #212228;
			    -moz-box-shadow: inset 0 0 10px #1a1b20;
			    -webkit-box-shadow: inset 0 0 10px #1a1b20;
			    box-shadow: inset 0 0 10px #1a1b20;
			    text-shadow: 0px -1px #000000;
				background: none;
				border-top: none; 
			}

			#selectable {
				font: 10pt Myriad Pro, sans-serif;
				color: #999999;
				width:900px;
				margin: auto;
				position: relative;
			}

   			#selectable div { }
			    border-radius: 5px;
			    -moz-border-radius: 5px;
			    margin-top: 15px;
			    margin-right: 25px;
			    padding: 5px 25px;
			    float: left;
			    cursor: pointer;
			}

		</style>

<script language="javascript">
	var myDictionary = [];
	var type = "twitter";

	<%
	   SearchUsers search = new SearchUsers();
	   ArrayList<ProfileHashMap> twitter = search.getResults(name);
	   int twtSize = twitter.size();	
	%>

	var TwitterResults = new Array();
	var TwitterSize = <% out.print(twtSize); %>;
	
	<%
	for (int i = 0; i < twtSize; i++) {
	    %> TwitterResults[<%out.print(i);%>] = { }; <%
	    if (twitter.get(i).information.containsKey("name")) {
		%>TwitterResults[<%out.print(i);%>]["name"] = "<%out.print(twitter.get(i).information.get("name"));%>";<%
	    }

	    if (twitter.get(i).information.containsKey("location")) {
		%>TwitterResults[<%out.print(i);%>]["location"] = "<%out.print(twitter.get(i).information.get("location"));%>";<%
	    }

	    if (twitter.get(i).information.containsKey("timezone")) {
		%>TwitterResults[<%out.print(i);%>]["timezone"] = "<%out.print(twitter.get(i).information.get("timezone"));%>";<%
	    }

	    if (twitter.get(i).information.containsKey("url")) {
		%>TwitterResults[<%out.print(i);%>]["url"] = "<%out.print(twitter.get(i).information.get("url"));%>";<%
	    }

	    if (twitter.get(i).information.containsKey("pic")) {
		%>TwitterResults[<%out.print(i);%>]["pic"] = "<%out.print(twitter.get(i).information.get("pic"));%>";<%
	    }

	    out.println();
	    
	}

	PlusSample goo = new PlusSample();
	ArrayList<ProfileHashMap> gplus = goo.getProfile(name);
	int gooSize = gplus.size();
	%>

	var GoogleResults = new Array();
	var GoogleSize = <% out.print(gooSize); %>;

	<%
	for (int i = 0; i < gooSize; i++) {
	    %> GoogleResults[<%out.print(i);%>] = { }; <%

	    if (gplus.get(i).information.containsKey("name")) {
		%>GoogleResults[<%out.print(i);%>]["name"] = "<%out.print(gplus.get(i).information.get("name"));%>";<%
		    }

	    if (gplus.get(i).information.containsKey("location")) {
		%>GoogleResults[<%out.print(i);%>]["location"] = "<%out.print(gplus.get(i).information.get("location"));%>";<%
		    }
	    
	    if (gplus.get(i).information.containsKey("timezone")) {
		%>GoogleResults[<%out.print(i);%>]["timezone"] = "<%out.print(gplus.get(i).information.get("timezone"));%>";<%
		    }

	    if (gplus.get(i).information.containsKey("url")) {
		%>GoogleResults[<%out.print(i);%>]["url"] = "<%out.print(gplus.get(i).information.get("url"));%>";<%
		    }

	    if (gplus.get(i).information.containsKey("pic")) {
		%>GoogleResults[<%out.print(i);%>]["pic"] = "<%out.print(gplus.get(i).information.get("pic"));%>";<%
		    }

	    if (gplus.get(i).information.containsKey("previouslocation")) {
		%>GoogleResults[<%out.print(i);%>]["previouslocation"] = "<%out.print(gplus.get(i).information.get("previouslocation"));%>";<%
		    }

	    if (gplus.get(i).information.containsKey("gender")) {
		%>GoogleResults[<%out.print(i);%>]["gender"] = "<%out.print(gplus.get(i).information.get("gender"));%>";<%
		    }

	    if (gplus.get(i).information.containsKey("relationship")) {
		%>GoogleResults[<%out.print(i);%>]["relationship"] = "<%out.print(gplus.get(i).information.get("relationship"));%>";<%
		    }

	    if (gplus.get(i).information.containsKey("employment")) {
		%>GoogleResults[<%out.print(i);%>]["employment"] = "<%out.print(gplus.get(i).information.get("employment"));%>";<%
		    }

	    if (gplus.get(i).information.containsKey("education")) {
		%>GoogleResults[<%out.print(i);%>]["education"] = "<%out.print(gplus.get(i).information.get("education"));%>";<%
		    }

		out.println();

	}


	LinkedinWrapper wrap = new LinkedinWrapper();
	ArrayList<ProfileHashMap> LinkedIn = wrap.findPossibleMatches(new Person(name));	
	int linkedSize = LinkedIn.size();
	%>

	var LinkedInResults = new Array();
	var LinkedInSize = <% out.print(linkedSize); %>;

	<%


	
	for (int i = 0; i < linkedSize; i++) {
	    %> LinkedInResults[<%out.print(i);%>] = { }; <%

	    if (LinkedIn.get(i).information.containsKey("name")) {
		%>LinkedInResults[<%out.print(i);%>]["name"] = "<%out.print(LinkedIn.get(i).information.get("name"));%>";<%
		    }

	    if (LinkedIn.get(i).information.containsKey("location")) {
		%>LinkedInResults[<%out.print(i);%>]["location"] = "<%out.print(LinkedIn.get(i).information.get("location"));%>";<%
		    }
	    
	    if (LinkedIn.get(i).information.containsKey("timezone")) {
		%>LinkedInResults[<%out.print(i);%>]["timezone"] = "<%out.print(LinkedIn.get(i).information.get("timezone"));%>";<%
		    }

	    if (LinkedIn.get(i).information.containsKey("url")) {
		%>LinkedInResults[<%out.print(i);%>]["url"] = "<%out.print(LinkedIn.get(i).information.get("url"));%>";<%
		    }

	    if (LinkedIn.get(i).information.containsKey("pic")) {
		%>LinkedInResults[<%out.print(i);%>]["pic"] = "<%out.print(LinkedIn.get(i).information.get("pic"));%>";<%
		    }

	    if (LinkedIn.get(i).information.containsKey("previouslocation")) {
		%>LinkedInResults[<%out.print(i);%>]["previouslocation"] = "<%out.print(LinkedIn.get(i).information.get("previouslocation"));%>";<%
		    }

	    if (LinkedIn.get(i).information.containsKey("gender")) {
		%>LinkedInResults[<%out.print(i);%>]["gender"] = "<%out.print(LinkedIn.get(i).information.get("gender"));%>";<%
		    }

	    if (LinkedIn.get(i).information.containsKey("relationship")) {
		%>LinkedInResults[<%out.print(i);%>]["relationship"] = "<%out.print(LinkedIn.get(i).information.get("relationship"));%>";<%
		    }

	    if (LinkedIn.get(i).information.containsKey("employment")) {
		%>LinkedInResults[<%out.print(i);%>]["employment"] = "<%out.print(LinkedIn.get(i).information.get("employment"));%>";<%
		    }

	    if (LinkedIn.get(i).information.containsKey("education")) {
		%>LinkedInResults[<%out.print(i);%>]["education"] = "<%out.print(LinkedIn.get(i).information.get("education"));%>";<%
		    }

		out.println();
	}

	FacebookWrapper fw = new FacebookWrapper(FBTok);
	ArrayList<ProfileHashMap> Facebook = fw.findPossibleMatches(new Person(name));
	int fbSize = Facebook.size();
	%>

	var FacebookResults = new Array();
	var FacebookSize = <% out.print(fbSize); %>;


	<%
	for (int i = 0; i < fbSize; i++) {
	    %> FacebookResults[<%out.print(i);%>] = { }; <%
	    if (Facebook.get(i).information.containsKey("name")) {
		%>FacebookResults[<%out.print(i);%>]["name"] = "<%out.print(Facebook.get(i).information.get("name"));%>";<%
	    }

	    if (Facebook.get(i).information.containsKey("location")) {
		%>FacebookResults[<%out.print(i);%>]["location"] = "<%out.print(Facebook.get(i).information.get("location"));%>";<%
	    }

	    if (Facebook.get(i).information.containsKey("id")) {
		%>FacebookResults[<%out.print(i);%>]["id"] = "<%out.print(Facebook.get(i).information.get("id"));%>";<%
	    }

	    if (Facebook.get(i).information.containsKey("url")) {
		%>FacebookResults[<%out.print(i);%>]["url"] = "<%out.print(Facebook.get(i).information.get("url"));%>";<%
	    }

	    if (Facebook.get(i).information.containsKey("pic")) {
		%>FacebookResults[<%out.print(i);%>]["pic"] = "<%out.print(Facebook.get(i).information.get("pic"));%>";<%
	    }

	    out.println();
	    
	}

	%>

</script>

<script>
	$(function() {
		$( "#selectable" ).selectable({
			stop: function() {		    
			    $('#twitter-results, #facebook-results, #google-results, #linkedin-results').hide();
			    $( ".ui-selected", this ).each(function() {
	
				    var index = $( "#selectable div" ).index( this );
				    if (index === 0)  {
					$('#twitter-results').show();
					type = "twitter";
				    } else if (index === 1){
					$('#facebook-results').show();
					type = "facebook";
				    } else if (index === 2){
					$('#linkedin-results').show();
					type = "linkedin";
				    } else if (index === 3){
					$('#google-results').show();
					type = "google";
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
	<div class="submenu" id="selectable">
	  <div class="submenu-button ui-selected">Twitter</div>

	  <div class="submenu-button">Facebook</div>

	  <div class="submenu-button">LinkedIn</div>

	  <div class="submenu-button">Google+</div>

	  <div class="submenu-button">Instagram</div>


	</div>
	<div class="submenu-button" style="padding:0; margin-top:15px;">
	    		<input style="height: 25px; width:90px" class="button compare"  value="      Compare" onclick="javascript:post(myDictionary, 'compare.jsp');">
	  </div>

      </div>

      <div class="bottom-content">

	<div id="twitter-results"> 
	  <div class="bottom-content" style="margin-bottom:20px;">
	    <div class="shadow" style="width:890px; padding: 5px; background: white; min-height:30px;">
	      <div style="float:left;">Twitter</div>
	      <div style="float:right; display:inline-block;"><% out.print(twtSize); %></div>
	    </div>
	  </div>

	  <table>
	<%
	int i = 0;
	for (ProfileHashMap identity : twitter) {
	    i++;

	    if (i == 1) { 
		out.println("<tr>"); 
	    }

	    if (i != 4) {
		out.println("<td><div class='shadow tdItem' style=\"width:200px; height: 100px; padding: 5px; margin-left: 0; float: left; margin-bottom: 20px; margin-right:15px;\">");
	    }
	    else if (i == 4) {
		out.println("<td><div class='shadow tdItem' style=\"width:200px; height: 100px; padding: 5px; margin-left: 0; float: left; margin-bottom: 20px; margin-right:0px;\">");
	    }
	
	    %>

	<div style="padding-right: 2px; float:left; margin-top: 15px; margin-left: 10px;">
	  <img height="73" width="73" src="<% out.print(identity.information.get("pic")); %>"/>
	</div>
	<div style="float:right; width: 110px; margin-top: 15px;">
	  <h4 style="color:#a2b1b9;"><% int l = identity.information.get("name").trim().length(); out.print(identity.information.get("name").trim().substring(0,Math.min(10,l))); %></h4>	
   	  <h5 style="color:#a2b1b9; float: left; padding-top: 0; margin-top: 0;"><% int x = identity.information.get("location").trim().length();out.print(identity.information.get("location").trim().substring(0,Math.min(10,x))); %></h5>
	</div>

	    <%

	    out.println("</div></td>"); 
	    
	    if (i == 4) {
		i = 0;
		out.println("</tr>");
	    }
	}
	%>
	</table>
	  
	</div>



 	<div id="facebook-results" style="display:none">
	
	  <div class="bottom-content" style="margin-bottom:20px;">
	    <div class="shadow" style="width:890px; padding: 5px; background: white; min-height:30px;">
	      <div style="float:left;">Facebook</div>
	      <div style="float:right; display:inline-block;"><% out.print(fbSize); %></div>
	    </div>
	  </div>

	  <table>
	<%
	i = 0;
	for (ProfileHashMap identity : Facebook) {
	    i++;

	    if (i == 1) { 
		out.println("<tr>"); 
	    }

	    if (i != 4) {
		out.println("<td><div class='shadow tdItem' style=\"width:200px; height: 100px; padding: 5px; margin-left: 0; float: left; margin-bottom: 20px; margin-right:15px;\">");
	    }
	    else if (i == 4) {
		out.println("<td><div class='shadow tdItem' style=\"width:200px; height: 100px; padding: 5px; margin-left: 0; float: left; margin-bottom: 20px; margin-right:0px;\">");
	    }
	
	    %>

	<div style="padding-right: 2px; float:left; margin-top: 15px; margin-left: 10px;">
	  <img height="73" width="73" src="<% out.print(identity.information.get("pic")); %>"/>
	</div>
	<div style="float:right; width: 110px; margin-top: 15px;">
	  <h4 style="color:#a2b1b9;"><% int l = identity.information.get("name").trim().length(); out.print(identity.information.get("name").trim().substring(0,Math.min(10,l))); %></h4>	
   	  <h5 style="color:#a2b1b9; float: left; padding-top: 0; margin-top: 0;"><% int x = identity.information.get("location").trim().length();out.print(identity.information.get("location").trim().substring(0,Math.min(10,x))); %></h5>
	</div>

	    <%

	    out.println("</div></td>"); 
	    
	    if (i == 4) {
		i = 0;
		out.println("</tr>");
	    }
	}
	%>
	</table>
	  
	</div>
	
	<div id="linkedin-results" style="display:none">

	<div class="bottom-content" style="margin-bottom:20px;">
	    <div class="shadow" style="width:890px; padding: 5px; background: white; min-height:30px;">
	      <div style="float:left;">LinkedIn</div>
	      <div style="float:right; display:inline-block;"><% out.print(linkedSize); %></div>
	    </div>
	  </div>
	
	<table>
	<%
	i = 0;
	for (ProfileHashMap identity : LinkedIn) {
	    i++;

	    if (i == 1) { 
		out.println("<tr>"); 
	    }

	    if (i != 4) {
		out.println("<td><div class='shadow tdItem' style=\"width:200px; height: 100px; padding: 5px; margin-left: 0; float: left; margin-bottom: 20px; margin-right:15px;\">");
	    }
	    else if (i == 4) {
		out.println("<td><div class='shadow tdItem' style=\"width:200px; height: 100px; padding: 5px; margin-left: 0; float: left; margin-bottom: 20px; margin-right:0px;\">");
	    }
	
	    %>

	<div style="padding-right: 2px; float:left; margin-top: 15px; margin-left: 10px;">
	  <img height="73" width="73" src="<% out.print(identity.information.get("pic")); %>"/>
	</div>
	<div style="float:right; width: 110px; margin-top: 15px;">
	  <h4 style="color:#a2b1b9;"><% int l = identity.information.get("name").trim().length(); out.print(identity.information.get("name").trim().substring(0,Math.min(10,l))); %></h4>	
   	  <h5 style="color:#a2b1b9; float: left; padding-top: 0; margin-top: 0;"><% int x = identity.information.get("location").trim().length();out.print(identity.information.get("location").trim().substring(0,Math.min(10,x))); %></h5>
	</div>

	    <%

	    out.println("</div></td>"); 
	    
	    if (i == 4) {
		i = 0;
		out.println("</tr>");
	    }
	}
	%>
	</table>

	</div>


	<div id="google-results" style="display:none">
	<div class="bottom-content" style="margin-bottom:20px;">
	    <div class="shadow" style="width:890px; padding: 5px; background: white; min-height:30px;">
	      <div style="float:left;">Google</div>
	      <div style="float:right; display:inline-block;"><% out.print(gooSize); %></div>
	    </div>
	  </div>
	
	<table>
	<%
	i = 0;
	for (ProfileHashMap identity : gplus) {
	    i++;

	    if (i == 1) { 
		out.println("<tr>"); 
	    }

	    if (i != 4) {
		out.println("<td><div class='shadow tdItem' style=\"width:200px; height: 100px; padding: 5px; margin-left: 0; float: left; margin-bottom: 20px; margin-right:15px;\">");
	    }
	    else if (i == 4) {
		out.println("<td><div class='shadow tdItem' style=\"width:200px; height: 100px; padding: 5px; margin-left: 0; float: left; margin-bottom: 20px; margin-right:0px;\">");
	    }
	
	    %>

	<div style="padding-right: 2px; float:left; margin-top: 15px; margin-left: 10px;">
	  <img height="73" width="73" src="<% out.print(identity.information.get("pic")); %>"/>
	</div>
	<div style="float:right; width: 110px; margin-top: 15px;">
	  <h4 style="color:#a2b1b9;"><% int l = identity.information.get("name").trim().length(); out.print(identity.information.get("name").trim().substring(0,Math.min(10,l))); %></h4>	
   	  <h5 style="color:#a2b1b9; float: left; padding-top: 0; margin-top: 0;"><% int x = identity.information.get("location").trim().length();out.print(identity.information.get("location").trim().substring(0,Math.min(10,x))); %></h5>
	</div>

	    <%

	    out.println("</div></td>"); 
	    
	    if (i == 4) {
		i = 0;
		out.println("</tr>");
	    }
	}
	%>
	</table>


	</div>

      </div>
	      
    	<script>
	  $("table").selectable({
		  filter: ".tdItem",
		  stop: function() {
		      var index = 0;
		      $( ".ui-selected", this ).each(function() {
			      index = $( ".tdItem" ).index( this );
		      });
		      
		      var res;
		      var prefix;

		      if (index < TwitterSize) {
			  res = TwitterResults;
			  prefix = "twitter_";
		      }
		      else if (index < FacebookSize + TwitterSize) {
			  index = index - TwitterSize;
			  res = FacebookResults;
			  prefix = "facebook_";

		      }
		      else if (index < FacebookSize + TwitterSize + LinkedInSize) {
			  index = index - FacebookSize;
			  index = index - TwitterSize;
			  res = LinkedInResults
			  prefix = "linkedin_";
		      }
		      else if (index < FacebookSize + TwitterSize + LinkedInSize + GoogleSize) {
			  index = index - FacebookSize;
			  index = index - TwitterSize;
			  index = index - LinkedInSize;
			  res = GoogleResults
			  prefix = "google_";

		      }

		      if ('name' in res[index]) {
			  myDictionary[prefix + "name"] = res[index]["name"];
		      }

		      if ('location' in res[index]) {
			  myDictionary[prefix + "location"] = res[index]["location"];
		      }

		      if ('timezone' in res[index]) {
			  myDictionary[prefix + "timezone"] = res[index]["timezone"];
		      }

		      if ('employment' in res[index]) {
			  myDictionary[prefix + "employment"] = res[index]["employment"];
		      }

		      if ('education' in res[index]) {
			  myDictionary[prefix + "education"] = res[index]["education"];
		      }
		      
		      if ('gender' in res[index]) {
			  myDictionary[prefix + "gender"] = res[index]["gender"];
		      }

		      if ('phone' in res[index]) {
			  myDictionary[prefix + "phone"] = res[index]["phone"];
		      }

		      if ('relationship' in res[index]) {
			  myDictionary[prefix + "relationship"] = res[index]["relationship"];
		      }
		      
		      myDictionary["num_accounts"] = GoogleSize + LinkedInSize + FacebookSize + TwitterSize;
		      myDictionary["search_name"] = <% out.println("\"" + name.trim() + "\""); %>;

		  }
	  });
	</script>

  </body>
  <% 
     } else {
     response.sendRedirect(request.getContextPath() + "/search.jsp");
     }
     }else {
     response.sendRedirect(request.getContextPath() + "/login.jsp");
     } 
     %>   
</html>
