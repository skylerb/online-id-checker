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


///////////
String FBTok = "BAACEdEose0cBADtC4jaZBmY0nPh0tBBSUXwUl7EguvfZAnIumVLPexy2jH31FGUISjZBzTAMkGKCauE17ZB4rGMXIJ3hEyvPOspmqUZCdQSJkt1H3C2PNpDnvR6cSiS1aJ5u28wMMLXb1USa3obN3HA9JUkZBEMDxKq2pMgk7WuVZALOAO6rTELshTQkz6CWSPIkCbBpBZBmwgZDZD";
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
	//Save Search History
   /*
	SaveSearch saveSearch = new SaveSearch();
	boolean saved = false;
	try {
		saved = saveSearch.save(id,name,dob,phone,address,city,state,country,job,degree,colleges,fbActive,fbID,gpActive,gpID,twtActive,twtID,liActive,liID,igActive,igID);
	} catch(SQLException e) {
	   	//e.printStackTrace(response.getWriter());
	}
	 */
	//out.print(saved);
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

   			table .ui-selectee  { background: white; border: solid; border-width:1px; border-color: grey;}
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
		
			    border-bottom: solid 1px #494a4f;
			    background-color: #212228;
			    -moz-box-shadow: inset 0 0 10px #1a1b20;
			    -webkit-box-shadow: inset 0 0 10px #1a1b20;
			    box-shadow: inset 0 0 10px #1a1b20;
			    text-shadow: 0px -1px #000000; 
			}

   			#selectable { }
   			#selectable div { 
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
	  <div class="ui-state-selected">Twitter</div>

	  <div class="ui-selectee unselected">Facebook</div>

	  <div class="submenu-button unselected">LinkedIn</div>

	  <div class="submenu-button unselected">Google+</div>

	  <div class="submenu-button unselected">Instagram</div>


	</div>
		  <div class="submenu-button" style="padding:0; margin-top:15px;">
	    <input style="height: 25px; width:90px" class="button"  value="      Compare" onclick="javascript:post(myDictionary, 'compare.jsp');">
	  </div>

      </div>

      <div class="bottom-content">
	<div id="twitter-results">  
	  <table>
	      <% 
	      SearchUsers search = new SearchUsers();
	      String[] twitter = search.getResults(name);
	      int i = 0;
	      for(String twt : twitter) {
	      if(twt != null) {
	      String[] arr = twt.split(";");
	      i++;
		if(i == 1) { out.println("<tr>"); }
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
	      
	      <h5 style="padding-top: 0; margin-top: 0;"><% if(!arr[1].equals("null")) { out.print(arr[1]); } else { out.print("N/A"); } %></h5>

	      <% 
	      out.println("</div></td>"); 
	      if (i == 4) { i = 0; out.println("</tr>"); }
	      } } //End For loop
	      out.println("</table>");
	      %>

	    </div>

 	<div id="facebook-results" style="display:none">
		<table>
			<tr>
		  	<% 

			    //Paste in access token here!
		 		FacebookWrapper fw = new FacebookWrapper(FBTok);
		  		Profile[] profiles = fw.findPossibleMatches(new Person(name));
		  		i = 0;
		  		for(Profile prof : profiles) {
		 			i++;
		  			if (i != 4) {
		  				out.println("<td><div class=\"tdItem\" style=\"width:200px; height: 100px; padding: 5px; margin-left: 0; float: left; margin-bottom: 20px; margin-right:15px;\">");
		  			} else if (i == 4) {
		  				out.println("<td><div class=\"tdItem\" style=\"width:200px; height: 100px; padding: 5px; margin-left: 0; float: left; margin-bottom: 20px; margin-right:0px;\">");
		  			} %>
		  			<img src="https://graph.facebook.com<% out.println(prof.url.getPath()); %>/picture">
		  			<h4><% out.print(prof.person.getFullName()); %></h4>
					 <h5 style="padding-top: 0; margin-top: 0;">N/A</h5>
		  			<% out.println("</div></td>"); 
		  			if (i == 4) { i = 0; out.println("</tr><tr>"); }
		  		} //End For loop
		  out.println("</table>"); 

					   %>
	</div>
		
		<div id="linkedin-results" style="display:none">
		</div>


		<div id="google-results" style="display:none">  
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
		      <h5 style="padding-top: 0; margin-top: 0;"><% if(!as[2].equals("null")) { out.print(as[2]); } else { out.print("N/A"); } %></h5>

		      <% 
		      out.println("</div></td>"); 
		      if (i == 4) { i = 0; out.println("</tr><tr>"); }
		      } } //End For loop
		      out.println("</table>");
	
		      %>
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

		      var val = $(".tdItem").eq(index).html();

		      var re = new RegExp("<\s*h4[^>]*>(.*?)<\s*/\s*h4>", "g");
		      var myArray = re.exec(val);
		      if ( myArray != null) {
			  for ( i = 0; i < myArray.length; i++ ) {
			      var result = "myArray[" + i + "] = " + myArray[i];
			  }
		      }

		      var newtype = type + "_name"
		      myDictionary[newtype] = myArray[1];
		      
		      var val = $(".tdItem").eq(index).html();
		      var re = new RegExp("<\w*h5[^>]*>(.*?)<\w*/\w*h5>");
		      var myArray = re.exec(val);
		      if ( myArray != null) {
			  for ( i = 0; i < myArray.length; i++ ) {
			      var result = "myArray[" + i + "] = " + myArray[i];
			  }
		      }

		      var newtype = type + "_location";
		      myDictionary[newtype] = myArray[1];

		      myDictionary["num_accounts"] = 12;
		      myDictionary["search_name"] = <% out.print(name); %>;

		  }
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
