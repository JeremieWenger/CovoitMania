<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!DOCTYPE html>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="initial-scale=1.0, user-scalable=no">
<link rel="stylesheet" href="WEB-INF/styles/style.css">
<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false&key=AIzaSyBBqYxzbViJA31VFQiVNXUqQHKfSbISNZY"></script>
<script type="text/javascript">
function initialiser() {
	var latlng = new google.maps.LatLng(48.578480, 7.751519);
	var options = {
			center: latlng,
			zoom: 16,
			mapTypeId: google.maps.MapTypeId.ROADMAP
	};
	var carte = new google.maps.Map(document.getElementById("carte"), options);

	for(var i=0; i< ${users.size()}; i++) {
		var marker = new google.maps.Marker({
			position: new google.maps.LatLng(48.578480, 7.751519),
			map: carte,
			title: "JAVASBOURG",
			draggable: false
		});
		
		var contentMarker = "Vous êtes ici!";
		
		var infoWindow = new google.maps.InfoWindow({
			content: contentMarker,
			position: latlng
		});
		
		google.maps.event.addListener(marker, 'click', function() {
			infoWindow.open(carte, marker);
		});
		
	}
	var marker = new google.maps.Marker({
		position: new google.maps.LatLng(48.578480, 7.751519),
		map: carte,
		title: "JAVASBOURG",
		draggable: false
	});
	
	var contentMarker = "JAVASBOURG";
	
	var infoWindow = new google.maps.InfoWindow({
		content: contentMarker,
		position: latlng
	});
	
	google.maps.event.addListener(marker, 'click', function() {
		infoWindow.open(carte, marker);
	});

}
</script>
<title>Users</title>
</head>
<body onload="initialiser()">
<c:import url="/WEB-INF/views/Menu.jsp" />
<h2>Home page for UserManager</h2>
<p><a href="AllUsers">List of Users</a>
<div id="carte" style="width:100%; height:100%"></div>
<p><%= new java.util.Date() %></p>

</body>
</html>