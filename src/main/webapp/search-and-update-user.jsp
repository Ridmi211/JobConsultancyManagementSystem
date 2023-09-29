<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Update User</title>
		
		<!-- Latest compiled and minified CSS -->
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
		<!-- Latest compiled JavaScript -->
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>	
	</head>
	<body>
		<div class="container">
			<ul class="nav nav-tabs">
			  <li class="nav-item">
			    <a class="nav-link" aria-current="page" href="add-user.jsp">Add Product</a>
			  </li>
			  <li class="nav-item">
			    <a class="nav-link active" href="#">Search & Update the Product</a>
			  </li>
			  <li class="nav-item">
			    <a class="nav-link" href="getproduct?actiontype=all">View All & Delete Specific</a>
			  </li>
			</ul>			
			<br/>
			<h2>Search & update the product</h2>
			<p style='color:magenta'>${feebackMessage}</p>
			<br/>
			
			<form action="getuser">			
				<label for="userId">Enter UserId:</label>
				<input class="form-control" type="number" id="userId" name="userId" placeholder="Type the userId" required/>
				<input type="hidden" name="useractiontype" value="single"/>
				<br/>
				<button type="submit" class="btn btn-info">Search</button>			
			</form>
			<hr/>
			<form action="usermanager" method="post">			
				<label for="userIdUpdate">User ID:</label>
				<input class="form-control" type="number" id="userIdUpdate" name="userId" readonly="readonly" value="${user.userId}"/>
				
				<label for="name"> Name:</label>
				<input class="form-control" type="text" id="name" name="name" value="${user.name}"/>
				
					<label for="phoneNumber">Phone number:</label>
				<input class="form-control" type="text" id="phoneNumber" name="phoneNumber" value="${user.phoneNumber}"/>
					<label for="email">Email:</label>
				<input class="form-control" type="text" id="email" name="email" value="${user.email}"/>
					<label for="birthdate">Birth-date:</label>
				<input class="form-control" type="date" id="birthdate" name="birthdate" value="${user.birthdate}"/>
					<label for="gender">Gender:</label>
				<input class="form-control" type="text" id="gender" name="gender" value="${user.gender}"/>
					<label for="occupation">Occupation:</label>
				<input class="form-control" type="text" id="occupation" name="occupation" value="${user.occupation}"/>
				<label for="country">Country:</label>
				<input class="form-control" type="text" id="country" name="country" value="${user.country}"/>
				
				
				
				<input type="hidden" name="useractiontype" value="edit"/>
				<br/>
				<button type="submit" class="btn btn-warning">Update User</button>			
			</form>
					
		</div>	
	</body>
</html>