<%@page import="ProfileAnalyzer.ProfileAnalyzer" %>
<%@page import="java.util.Map" %>

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
	int size = parameters.size();
	int num_accounts = 0;
	String search_name = request.getParameter("search_name");
	String twitter_name = request.getParameter("twitter_name");
	if(twitter_name == null) 
		twitter_name = "Albus Dumbledore";
	String twitter_location = request.getParameter("twitter_location");
	if (twitter_location == null)
	   twitter_location = "Hogwarts";
	String facebook_name = request.getParameter("facebook_name");
	if(facebook_name == null)
		facebook_name = "Albus Dumbledore";
	String facebook_location = request.getParameter("facebook_location");
	if (facebook_location == null)
	   facebook_location = "Hogwarts";
	String google_name = request.getParameter("google_name");
	if(google_name == null)
		google_name = "Albus Dumbledore";
	String google_location = request.getParameter("google_location");
	if(google_location == null)
		google_location = "Hogwarts";
	if(size < 6) {
		response.sendRedirect(request.getContextPath() + "/search.jsp");	
	} else if(size == 6) {
		num_accounts = 2;
	} else {
		num_accounts = 3;
	}
	//int num_accounts = Integer.parseInt(request.getParameter("num_accounts"));
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
    <script type="text/javascript">
	var sites = [
	['Home', 39.0333, 125.7500, 1, 'Best Korea']
];

	var map;

      function initialize() {
        var mapOptions = {
          center: new google.maps.LatLng(39.0333, 125.75),
          zoom: 8,
          mapTypeId: google.maps.MapTypeId.ROADMAP
        };

        map = new google.maps.Map(document.getElementById("map-canvas"),
            mapOptions);

	
	setMarkers(map, sites);
	AutoCenter();
      }

	function setMarkers(map, markers) {

		for (var i = 0; i < markers.length; i++) {
		    var sites = markers[i];
		    var siteLatLng = new google.maps.LatLng(sites[1], sites[2]);
		    var marker = new google.maps.Marker({
		        position: siteLatLng,
		        map: map,
		        title: sites[0],
		        zIndex: sites[3],
		        html: sites[4]
		    });
		}
	}

	function AutoCenter() {
		//  Create a new viewpoint bound
		var bounds = new google.maps.LatLngBounds();
		//  Go through each...
		$.each(sites, function (index, marker) {
			bounds.extend(marker.position);
		});
		//  Fit these bounds to the map
		map.fitBounds(bounds);

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
	float nameResult = ProfileAnalyzer.compareThreeProf(twitter_name, facebook_name,google_name);
	float locResult = ProfileAnalyzer.compareThreeProf(twitter_location, facebook_location, google_location);
        float average = (nameResult + locResult) / 2.0f;
        average *= 100;
    %>
    <div id="name-dob" class="shadow" style="width: 190px; height: 90px; background: white; padding: 10px; float: left; margin-right: 20px;" >
	 <h4 style="text-align:center; margin-top: 15px;"><% out.print(search_name); %></h4>
        <p style="text-align:center; font: 11pt Myriad Pro, sans-serif; font-weight: 700; color: #999"></p>
    </div>

    <div id="results-found" class="shadow" style="width: 190px; height: 90px; background: white; padding: 10px; float: left; margin-right: 20px;" >
        <h4 style="text-align:center; margin-top: 15px;"><% out.print(num_accounts); %></h4>
        <p style="text-align:center; font: 11pt Myriad Pro, sans-serif; font-weight: 700; color: #999">Accounts Selected</p>
    </div>

    <div id="percent-matched" class="shadow" style="width: 190px; height: 90px; background: white; padding: 10px; float: left; margin-right: 20px;" >
        <h4 style="text-align:center; margin-top: 15px;"><% out.print(average); %></h4>
        <p style="text-align:center; font: 11pt Myriad Pro, sans-serif; font-weight: 700; color: #999">percent matched</p>
    </div>

    <div id="other" class="shadow" style="width: 190px; height: 90px; background: white; padding: 10px; float: left; " >
        <h4 style="text-align:center; margin-top: 15px;">34.2%</h4>
        <p style="text-align:center; font: 11pt Myriad Pro, sans-serif; font-weight: 700; color: #999">some other stat</p>
    </div>
</div>

<div class="bottom-content-results" style="margin-bottom: 20px;">
	<table class="shadow" style="background: white; text-align:center;width:900px; font-size: 11pt; color: #808080; border-collapse: collapse;">
		<thead style="background:black; color:white; text-align:center;">
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>Facebook</td>
			<td>Twitter</td>
			<td>Google+</td>
			<td>% Matched</td>
		</thead>
		<tr style="background:#e1e1e1;">
			<td>&nbsp;</td>
			<td style="text-align:left;width:10%;">Name</td>
			<td><% out.print(facebook_name); %></td>
			<td><% out.print(twitter_name); %></td>
			<td><% out.print(google_name); %></td>
			<td><% out.print(nameResult * 100); %></td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td style="text-align:left;">Location</td>
			<td><% out.print(facebook_location); %></td>
			<td><% out.print(twitter_location); %></td>
			<td><% out.print(google_location); %></td>
			<td><% out.print(locResult * 100); %></td>
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
