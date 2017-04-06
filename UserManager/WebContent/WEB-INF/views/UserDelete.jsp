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
		<title>User Delete</title>
		<style type="text/css">
			.warning {
				color: red;
			}
		</style>
	</head>
	
	<body>
<c:import url="/WEB-INF/views/Menu.jsp" />
		<h1 class="warning">ARE YOU SURE YOU WANT TO DELETE THIS USER?</h1>
		<ul>
			<li>First name : ${user.getFirstname()}</li>
			<li>Last name : ${user.getLastname()}</li>
			<li>Age : ${user.getAge()}</li>
			<li>Email : ${user.getEmail()}</li> 
			${user.getId()}
		</ul>
		<form action="DeleteUser" method="post" onsubmit="return verifyDelete();">
			<input type="submit" value="YES I WANT TO DELETE HIM!" class="warning"/>
			<input type="hidden" name="user" value="${user.getId()}" />
		</form>
		
		<a href="AllUsers">View All Users</a> ||
		<a href="EditUser?user=${user.getId()}">Edit</a>
		<script type="text/javascript">
			function verifyDelete() {
				return confirm("Are you REALLY sure?");
			}
		</script>
	</body>
	
</html>