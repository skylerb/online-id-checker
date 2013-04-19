<%@page import="ProfileAnalyzer.ProfileAnalyzer" %>
<%@page import="java.util.Map" %>
<%@page import="java.util.HashMap" %>
<%@page import="java.util.ArrayList" %>

<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>

<% //Begin awesome fake data...this will be replaced with POST data
    String fbName = "Calvin Sauer";
    String twtName = "Calvin Sauer";
    String plusName = "Cal Sauer";

    String fbDob = "01/23/1991";
    String twtDob = "03/12/1991";
    String plusDob = "";
 //End fake data %>


<%
	Map<String,String[]> parameters = request.getParameterMap();
	
	ArrayList<HashMap<String,String>> listOfAccounts = new ArrayList<HashMap<String,String>>();

	int acctsSelected = 0;
	String search_name = request.getParameter("search_name");
	String twitter_name = request.getParameter("twitter_name");
	if(twitter_name != null) {
		listOfAccounts.add(new HashMap());
		listOfAccounts.get(acctsSelected).put("network","Twitter");
		listOfAccounts.get(acctsSelected).put("name",twitter_name);
		String twitter_location = request.getParameter("twitter_location");
		if (twitter_location.equals("N/A")) {
			twitter_location = "-";
		}
		listOfAccounts.get(acctsSelected).put("location",twitter_location);
		String  twitter_timezone = request.getParameter("twitter_timezone");
		if(twitter_timezone == null) {
			twitter_timezone = "-";
		}
		listOfAccounts.get(acctsSelected).put("timezone",twitter_timezone);
		String  twitter_employment = request.getParameter("twitter_employment");	
		if(twitter_employment == null) {
			twitter_employment = "-";
		}
		listOfAccounts.get(acctsSelected).put("employment",twitter_employment);
		String  twitter_education = request.getParameter("twitter_education");
		if(twitter_education == null) {
			twitter_education = "-";
		}
		listOfAccounts.get(acctsSelected).put("education",twitter_education);
		String  twitter_gender = request.getParameter("twitter_education");
		if(twitter_gender == null) {
			twitter_gender = "-";
		}
		listOfAccounts.get(acctsSelected).put("gender",twitter_gender);
		String  twitter_phone = request.getParameter("twitter_phone");
		if(twitter_phone == null) {
			twitter_phone = "-";
		}
		listOfAccounts.get(acctsSelected).put("phone",twitter_phone);
		String  twitter_relationship = request.getParameter("twitter_relationship");
		if(twitter_relationship == null) {
			twitter_relationship = "-";
		}
		listOfAccounts.get(acctsSelected).put("relationship",twitter_relationship);
		acctsSelected++;
	}
	String facebook_name = request.getParameter("facebook_name");
	if(facebook_name != null) {
		listOfAccounts.add(new HashMap());
		listOfAccounts.get(acctsSelected).put("network","Facebook");
		listOfAccounts.get(acctsSelected).put("name",facebook_name);
		String  facebook_location = request.getParameter("facebook_location");
		if (facebook_location.equals("N/A")) {
			facebook_location = "-";
		}
		listOfAccounts.get(acctsSelected).put("location",facebook_location);
		String  facebook_timezone = request.getParameter("facebook_timezone");
		if(facebook_timezone == null) {
			facebook_timezone = "-";
		}
		listOfAccounts.get(acctsSelected).put("timezone",facebook_timezone);
		String  facebook_employment = request.getParameter("facebook_employment");	
		if(facebook_employment == null) {
			facebook_employment = "-";
		}
		listOfAccounts.get(acctsSelected).put("employment",facebook_employment);
		String  facebook_education = request.getParameter("facebook_education");
		if(facebook_education == null) {
			facebook_education = "-";
		}
		listOfAccounts.get(acctsSelected).put("education",facebook_education);
		String facebook_gender = request.getParameter("facebook_education");
		if(facebook_gender == null) {
			facebook_gender = "-";
		}
		listOfAccounts.get(acctsSelected).put("gender",facebook_gender);
		String  facebook_phone = request.getParameter("facebook_phone");
		if(facebook_phone == null) {
			facebook_phone = "-";
		}
		listOfAccounts.get(acctsSelected).put("phone",facebook_phone);
		String  facebook_relationship = request.getParameter("facebook_relationship");
		if(facebook_relationship == null) {
			facebook_relationship = "-";
		}
		listOfAccounts.get(acctsSelected).put("relationship",facebook_relationship);
		acctsSelected++;
	}
	String google_name = request.getParameter("google_name");
	if(google_name != null) {
		listOfAccounts.add(new HashMap());
		listOfAccounts.get(acctsSelected).put("network","Google+");
		listOfAccounts.get(acctsSelected).put("name",google_name);
		String  google_location = request.getParameter("google_location");
		if (google_location.equals("N/A")) {
			google_location = "-";
		}
		listOfAccounts.get(acctsSelected).put("location",google_location);
		String google_timezone = request.getParameter("google_timezone");
		if(google_timezone == null) {
			google_timezone = "-";
		}
		listOfAccounts.get(acctsSelected).put("timezone",google_timezone);
		String google_employment = request.getParameter("google_employment");	
		if(google_employment == null) {
			google_employment = "-";
		}
		listOfAccounts.get(acctsSelected).put("employment",google_employment);
		String  google_education = request.getParameter("google_education");
		if(google_education == null) {
			google_education = "-";
		}
		listOfAccounts.get(acctsSelected).put("education",google_education);
		String google_gender = request.getParameter("google_gender");
		if(google_gender == null) {
			google_gender = "-";
		}
		listOfAccounts.get(acctsSelected).put("gender",google_gender);
		String google_phone = request.getParameter("google_phone");
		if(google_phone == null) {
			google_phone = "-";
		}
		listOfAccounts.get(acctsSelected).put("phone",google_phone);
		String google_relationship = request.getParameter("google_relationship");
		if(google_relationship == null) {
			google_relationship = "-";
		}
		listOfAccounts.get(acctsSelected).put("relationship",google_relationship);
		acctsSelected++;
	}
	String linkedin_name = request.getParameter("linkedin_name");
	if(linkedin_name != null) {
		listOfAccounts.add(new HashMap());
		listOfAccounts.get(acctsSelected).put("network","LinkedIn");
		listOfAccounts.get(acctsSelected).put("name",linkedin_name);
		String linkedin_location = request.getParameter("linkedin_location");
		if (linkedin_location.equals("N/A")) {
			linkedin_location = "-";
		}
		listOfAccounts.get(acctsSelected).put("location",linkedin_location);
		String linkedin_timezone = request.getParameter("linkedin_timezone");
		if(linkedin_timezone == null) {
			linkedin_timezone = "-";
		}
		listOfAccounts.get(acctsSelected).put("timezone",linkedin_timezone);
		String linkedin_employment = request.getParameter("linkedin_employment");	
		if(linkedin_employment == null) {
			linkedin_employment = "-";
		}
		listOfAccounts.get(acctsSelected).put("employment",linkedin_employment);
		String linkedin_education = request.getParameter("linkedin_education");
		if(linkedin_education == null) {
			linkedin_education = "-";
		}
		listOfAccounts.get(acctsSelected).put("education",linkedin_education);
		String linkedin_gender = request.getParameter("linkedin_gender");
		if(linkedin_gender == null) {
			linkedin_gender = "-";
		}
		listOfAccounts.get(acctsSelected).put("gender",linkedin_gender);
		String linkedin_phone = request.getParameter("linkedin_phone");
		if(linkedin_phone == null) {
			linkedin_phone = "-";
		}
		listOfAccounts.get(acctsSelected).put("phone",linkedin_phone);
		String linkedin_relationship = request.getParameter("linkedin_relationship");
		if(linkedin_relationship == null) {
			linkedin_relationship = "-";
		}
		listOfAccounts.get(acctsSelected).put("relationship",linkedin_relationship);
		acctsSelected++;
	}
	if(acctsSelected < 2) {
		response.sendRedirect(request.getContextPath() + "/search.jsp");	
	} 
	int num_accounts = Integer.parseInt(request.getParameter("num_accounts"));
%>

<!DOCTYPE html>

<html>
<% if((session.getAttribute("username") != null)) { %>

<head>
<title>Compare</title>
<link href="main.css" rel="stylesheet" type="text/css" />

<meta charset="utf-8" />

<style type="text/css">
  #map-canvas { width: 900px; height: 400px; }
</style>

<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
    <script type="text/javascript"
      src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCkAhsg4jUFlMWiS_HS6P6MCKJc1Ms1DkY&sensor=true">
    </script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.1/jquery.min.js"></script>
    <script type="text/javascript">
	var sites = [
		<% int x = 0; 
		for(HashMap hm : listOfAccounts) {
			if(!hm.get("location").equals("-")) {
				out.println("'" + hm.get("location") + "',");
				x++;
			}
		} 
		if(x < 1) { out.println("'North Korea'"); } %> ];

	var map;
	var geocoder;
	var bounds;
	var marker;
	var bounds = new google.maps.LatLngBounds(); 

	

      function initialize() {
	geocoder = new google.maps.Geocoder();

        var mapOptions = {
		zoom: 5,
          mapTypeId: google.maps.MapTypeId.ROADMAP
        };

        map = new google.maps.Map(document.getElementById("map-canvas"), mapOptions);


	for (var i = 0; i < sites.length; i++) {		
	    geocoder.geocode( { 'address': sites[i]}, function(results, status) {		
	      if (status == google.maps.GeocoderStatus.OK) {		
		map.setCenter(results[0].geometry.location);
		addMarker(results[0].geometry.location,'Location',"active");
		bounds.extend(results[0].geometry.location);
		map.fitBounds(bounds);
		map.panToBounds(bounds);
	      }
	    });
	}	
	
      }

	function addMarker(location, name, active) {          
		var marker = new google.maps.Marker({
		    position: location,
		    map: map,
		    title: name,
		    status: active
		});
	}


      google.maps.event.addDomListener(window, 'load', initialize);

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
            <li>
            <a href="search.jsp"><img src="images/search.png"></a>
            <p>Search</p>
            </li>
        </ul>
    </div>
</div>

<div class="bottom-content">
    <% //Compute similarity...
	float nameResult = 0.0f;
	float locResult = 0.0f;
	float timeResult = 0.0f;
	float jobResult = 0.0f;
	float eduResult = 0.0f;
	float genderResult = 0.0f;
	float phoneResult = 0.0f;
	float relationshipResult = 0.0f;
	if(acctsSelected == 2) {
		nameResult = ProfileAnalyzer.compareTwoProf(listOfAccounts.get(0).get("name"), listOfAccounts.get(1).get("name"));
		locResult = ProfileAnalyzer.compareTwoProf(listOfAccounts.get(0).get("location"), listOfAccounts.get(1).get("location"));
		timeResult = ProfileAnalyzer.compareTwoProf(listOfAccounts.get(0).get("timezone"), listOfAccounts.get(1).get("timezone"));
		jobResult = ProfileAnalyzer.compareTwoProf(listOfAccounts.get(0).get("employment"), listOfAccounts.get(1).get("employment"));
		eduResult = ProfileAnalyzer.compareTwoProf(listOfAccounts.get(0).get("education"), listOfAccounts.get(1).get("education"));
		genderResult = ProfileAnalyzer.compareTwoProf(listOfAccounts.get(0).get("gender"), listOfAccounts.get(1).get("gender"));
		phoneResult = ProfileAnalyzer.compareTwoProf(listOfAccounts.get(0).get("phone"), listOfAccounts.get(1).get("phone"));
		relationshipResult = ProfileAnalyzer.compareTwoProf(listOfAccounts.get(0).get("relationship"), listOfAccounts.get(1).get("relationship"));
	} else if(acctsSelected == 3) {
		nameResult = ProfileAnalyzer.compareThreeProf(listOfAccounts.get(0).get("name"), listOfAccounts.get(1).get("name"),listOfAccounts.get(2).get("name"));
		locResult = ProfileAnalyzer.compareThreeProf(listOfAccounts.get(0).get("location"), listOfAccounts.get(1).get("location"),listOfAccounts.get(2).get("location"));
		timeResult = ProfileAnalyzer.compareThreeProf(listOfAccounts.get(0).get("timezone"), listOfAccounts.get(1).get("timezone"),listOfAccounts.get(2).get("timezone"));
		jobResult = ProfileAnalyzer.compareThreeProf(listOfAccounts.get(0).get("employment"), listOfAccounts.get(1).get("employment"),listOfAccounts.get(2).get("employment"));
		eduResult = ProfileAnalyzer.compareThreeProf(listOfAccounts.get(0).get("education"), listOfAccounts.get(1).get("education"),listOfAccounts.get(2).get("education"));
		genderResult = ProfileAnalyzer.compareThreeProf(listOfAccounts.get(0).get("gender"), listOfAccounts.get(1).get("gender"),listOfAccounts.get(2).get("gender"));
		phoneResult = ProfileAnalyzer.compareThreeProf(listOfAccounts.get(0).get("phone"), listOfAccounts.get(1).get("phone"),listOfAccounts.get(2).get("phone"));
		relationshipResult = ProfileAnalyzer.compareThreeProf(listOfAccounts.get(0).get("relationship"), listOfAccounts.get(1).get("relationship"),listOfAccounts.get(2).get("relationship"));
	} else {
		nameResult = ProfileAnalyzer.compareFourProf(listOfAccounts.get(0).get("name"), listOfAccounts.get(1).get("name"),listOfAccounts.get(2).get("name"),listOfAccounts.get(3).get("name"));
		locResult = ProfileAnalyzer.compareFourProf(listOfAccounts.get(0).get("location"), listOfAccounts.get(1).get("location"),listOfAccounts.get(2).get("location"),listOfAccounts.get(3).get("name"));
		timeResult = ProfileAnalyzer.compareFourProf(listOfAccounts.get(0).get("timezone"), listOfAccounts.get(1).get("timezone"),listOfAccounts.get(2).get("timezone"),listOfAccounts.get(3).get("timezone"));
		jobResult = ProfileAnalyzer.compareFourProf(listOfAccounts.get(0).get("employment"), listOfAccounts.get(1).get("employment"),listOfAccounts.get(2).get("employment"),listOfAccounts.get(3).get("employment"));
		eduResult = ProfileAnalyzer.compareFourProf(listOfAccounts.get(0).get("education"), listOfAccounts.get(1).get("education"),listOfAccounts.get(2).get("education"),listOfAccounts.get(3).get("education"));
		genderResult = ProfileAnalyzer.compareFourProf(listOfAccounts.get(0).get("gender"), listOfAccounts.get(1).get("gender"),listOfAccounts.get(2).get("gender"),listOfAccounts.get(3).get("gender"));
		phoneResult = ProfileAnalyzer.compareFourProf(listOfAccounts.get(0).get("phone"), listOfAccounts.get(1).get("phone"),listOfAccounts.get(2).get("phone"),listOfAccounts.get(3).get("phone"));
		relationshipResult = ProfileAnalyzer.compareFourProf(listOfAccounts.get(0).get("relationship"), listOfAccounts.get(1).get("relationship"),listOfAccounts.get(2).get("relationship"),listOfAccounts.get(3).get("relationship"));
	}
        float average = (nameResult + locResult + timeResult + jobResult + eduResult + genderResult + phoneResult + relationshipResult) / 8.0f;
        average *= 100;
    %>
    <div id="name-dob" class="shadow" style="width: 190px; height: 90px; background: white; padding: 10px; float: left; margin-right: 20px;" >
	 <h4 style="text-align:center; margin-top: 15px;"><% out.print(search_name); %></h4>
        <p style="text-align:center; font: 11pt Myriad Pro, sans-serif; font-weight: 700; color: #999"></p>
    </div>

    <div id="results-found" class="shadow" style="width: 190px; height: 90px; background: white; padding: 10px; float: left; margin-right: 20px;" >
        <h4 style="text-align:center; margin-top: 15px;"><% out.print(acctsSelected); %></h4>
        <p style="text-align:center; font: 11pt Myriad Pro, sans-serif; font-weight: 700; color: #999">Accounts Selected</p>
    </div>

    <div id="percent-matched" class="shadow" style="width: 190px; height: 90px; background: white; padding: 10px; float: left; margin-right: 20px;" >
        <h4 style="text-align:center; margin-top: 15px;"><% out.print(average); %>%</h4>
        <p style="text-align:center; font: 11pt Myriad Pro, sans-serif; font-weight: 700; color: #999">percent matched</p>
    </div>

    <div id="other" class="shadow" style="width: 190px; height: 90px; background: white; padding: 10px; float: left; " >
        <h4 style="text-align:center; margin-top: 15px;"><% out.print(num_accounts); %></h4>
        <p style="text-align:center; font: 11pt Myriad Pro, sans-serif; font-weight: 700; color: #999">Results Found</p>
    </div>
</div>

<div class="bottom-content-results" style="margin-bottom: 20px;">
	<table class="shadow" style="background: white; text-align:center;width:900px; font-size: 11pt; color: #808080; border-collapse: collapse;">
		<thead style="background:black; color:white; text-align:center;">
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<% for(HashMap hm : listOfAccounts) {
				out.println("<td>" + hm.get("network") + "</td>");
			} %>
			<td>% Matched</td>
		</thead>
		<tr style="background:#e1e1e1;">
			<td>&nbsp;</td>
			<td style="text-align:left;width:10%;">Name</td>
			<% for(HashMap hm : listOfAccounts) {
				out.println("<td>" + hm.get("name") + "</td>");
			} %>
			<td><% out.print(nameResult * 100); %></td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td style="text-align:left;">Location</td>
			<% for(HashMap hm : listOfAccounts) {
				out.println("<td>" + hm.get("location") + "</td>");
			} %>
			<td><% out.print(locResult * 100); %></td>
		</tr>
		<tr style="background:#e1e1e1;">
			<td>&nbsp;</td>
			<td style="text-align:left;width:10%;">Time Zone</td>
			<% for(HashMap hm : listOfAccounts) {
				out.println("<td>" + hm.get("timezone") + "</td>");
			} %>
			<td><% out.print(timeResult * 100); %></td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td style="text-align:left;">Employment</td>
			<% for(HashMap hm : listOfAccounts) {
				out.println("<td>" + hm.get("employment") + "</td>");
			} %>
			<td><% out.print(jobResult * 100); %></td>
		</tr>
		<tr style="background:#e1e1e1;">
			<td>&nbsp;</td>
			<td style="text-align:left;width:10%;">Education</td>
			<% for(HashMap hm : listOfAccounts) {
				out.println("<td>" + hm.get("education") + "</td>");
			} %>
			<td><% out.print(eduResult * 100); %></td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td style="text-align:left;">Gender</td>
			<% for(HashMap hm : listOfAccounts) {
				out.println("<td>" + hm.get("gender") + "</td>");
			} %>
			<td><% out.print(genderResult * 100); %></td>
		</tr>
		<tr style="background:#e1e1e1;">
			<td>&nbsp;</td>
			<td style="text-align:left;width:10%;">Phone</td>
			<% for(HashMap hm : listOfAccounts) {
				out.println("<td>" + hm.get("phone") + "</td>");
			} %>
			<td><% out.print(phoneResult * 100); %></td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td style="text-align:left;">Relationship</td>
			<% for(HashMap hm : listOfAccounts) {
				out.println("<td>" + hm.get("relationship") + "</td>");
			} %>
			<td><% out.print(relationshipResult * 100); %></td>
		</tr>
	</table>
</div>

<div class="bottom-content-results" style="margin-top: 0px;">
	<div class="shadow" style="background: white; width:900px;">
		<div id="map-canvas"/>
	</div>
</div>

<% } else {
response.sendRedirect(request.getContextPath() + "/login.jsp");
} %>
</html>
