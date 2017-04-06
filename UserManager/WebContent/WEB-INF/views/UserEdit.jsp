<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User Edit</title>
</head>
<body>
<c:import url="/WEB-INF/views/Menu.jsp" />
<h2>Update User</h2>
<form action="EditUser" method="post">

<div class="form-group">

<label for="firstname">Firstname</label> <input type="text" class="form-control" name="firstname"  value="${user.getFirstname()}"></div>
<p><label for="lastname">Lastname</label> <input type="text"  class="form-control" name="lastname" value="${user.getLastname()}"></p>
<p><label for="age">Age</label> <input type="text" class="form-control"  name="age" value="${user.getAge()}"></p>
<p><label for="email">Email adress</label> <input type="email" class="form-control"  name="email"  value="${user.getEmail()}"></p>
<p><input type="submit" class="btn btn-default" value="Save new User"/></p>
</form>
</div>
<p><input type="submit" value="Update User"/></p>
</form>

</body>
</html>