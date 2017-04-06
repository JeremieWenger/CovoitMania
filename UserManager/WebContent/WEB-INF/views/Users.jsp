<%@ page language="java" 
    contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="java.util.*, com.cfranc.UserManger.model.*"
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
         <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
<!-- <link rel="stylesheet" href="WEB-INF/styles/style.css"> -->
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
    //var users = ${users};

    for (var key in users) {
        
        var latlng = new google.maps.LatLng(users[key].getCoord()[0], users[key].getCoord()[1]);

        var userMarker = new google.maps.Marker({
            position: latlng,
            map: carte,
            title: "JAVASBOURG",
            draggable: false
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
        <title>Users List</title>
    </head>
    <body onload="initialiser()">
    
    <c:import url="/WEB-INF/views/Menu.jsp" />
    <h2>Utilisateurs</h2>
    <div id="carte" style="width:100%; height: 60%"></div>
    <div class="container">
  <h2>Tableau</h2>
  
  
  
  <p>Voici la liste des ${users.size()} utilisateurs actuellement inscrits</p>            
  <table class="table">
    <thead>
      <tr>
        <th>Lastname</th>
        <th>Firstname</th>
        <th>Email</th>
        <th>Details</th>
        <th>Edit</th>
        <th>Delete</th>
      </tr>
    </thead>
    <tbody>
    <c:forEach var="user" items="${users}" varStatus="stat">
      <tr>
        <td>${user.value.getLastname()} </td>
        <td>${user.value.getFirstname()} </td>
        <td>${user.value.getEmail()}
        <td><a href="DetailUser?user=${user.key}">Details</a></td>
        <td><a href="EditUser?user=${user.key}">Edit</a></td>
        <td><a href="DeleteUser?user=${user.key}">Delete</a></td>        
      </tr>
    </c:forEach>
     
    </tbody>
  </table>
</div>
        <c:if test="${error != null}">${error}</c:if>
        <c:if test="${sucess != null}">${sucess}</c:if>
        
        
        
        
    </body>
    
</html>