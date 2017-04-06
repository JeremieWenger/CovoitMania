<%@ page language="java" 
    contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
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
        <title>User Details</title>
    </head>
    
    <body>
<c:import url="/WEB-INF/views/Menu.jsp" />
<div class="container">
        <ul class="list-group">
            <li class="list-group-item">First name : ${user.getFirstname()}</li>
            <li class="list-group-item">Last name : ${user.getLastname()}</li>
            <li class="list-group-item">Age : ${user.getAge()}</li>
            <li class="list-group-item">Email : ${user.getEmail()}</li> 
            <li class="list-group-item">Adresse: ${user.getAddress()}</li>
            <li class="list-group-item">Code postal: ${user.getPostCode()}</li>
            <li class="list-group-item">Ville: ${user.getCity()}</li>
        </ul>
        </div>
        
        <a href="AllUsers">View All Users</a> ||
        <a href="EditUser?user=${user.getId()}">Edit</a>
        
    </body>
    
</html>