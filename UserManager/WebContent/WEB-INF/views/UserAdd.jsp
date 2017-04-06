<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User Add</title>
</head>
<body>
<c:import url="/WEB-INF/views/Menu.jsp" />
<h2>Nouvel Utilisateur</h2>
<c:if test="${error != null}">${error}</c:if>
<div class="container">
  <h2>formulaire d'ajout</h2>
<form action="AddUser" onsubmit="return myFunction()" method="post">
<div class="form-group">

<label for="firstname">Firstname</label> <input type="text" class="form-control" name="firstname" placeholder="first name"></div>
<p><label for="lastname">Lastname</label> <input type="text"  class="form-control" name="lastname" placeholder="last name"></p>
<p><label for="age">Age</label> <input type="text" class="form-control"  name="age" placeholder="age"></p>
<p><label for="email">Email adress</label> <input type="email" class="form-control"  name="email" placeholder="email"></p>
<p><label for="address">Adress</label> <input type="text" class="form-control"  name="address" placeholder="address"></p>
<p><label for="Postal Code">Postal Code</label> <input type="number" class="form-control"  name="postalCode" placeholder="postalCode"></p>
<p><label for="city">City</label> <input type="text" class="form-control"  name="city" placeholder="City"></p>
<p><label for="password">Mot de Passe</label> <input id="pass1" type="password" class="form-control"  name="password" placeholder="mot de passe"></p>
<p><label for="password2">Repeter le Mot de Passe</label> <input id="pass2" type="password" class="form-control"  name="password2" placeholder=" repeter mot de passe"></p>
<p><input type="submit" class="btn btn-default" value="Save new User"/></p>
</form>
</div>
<script>
function myFunction() {
    var pass1 = document.getElementById("pass1").value;
    var pass2 = document.getElementById("pass2").value;

    if (pass1 != pass2 || pass1 == "") {
        //alert("Passwords Do not match");
        document.getElementById("pass1").style.borderColor = "#E34234";
        document.getElementById("pass2").style.borderColor = "#E34234";
       return false;
    }
   
    return true;
}
</script>

</body>
</html>