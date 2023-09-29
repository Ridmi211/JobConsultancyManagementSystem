<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
    
<%@ taglib prefix="tag" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>View all and delete</title>
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
			    <a class="nav-link" href="search-and-update-user.jsp">Search & Update the Product</a>
			  </li>
			  <li class="nav-item">
			    <a class="nav-link active" href="#">View All & Delete Specific</a>
			  </li>
			</ul>			
			<br/>
			<h2>View All & Delete Specific Product</h2>
			<p style='color:magenta'>${message}</p>			
			<br/>		
			<table class="table table-striped">
				<thead>
					<tr>
						<th>Product Code</th>
						<th>Product Name</th>
						<th>Price [LKR]</th>
					</tr>
				</thead>			
				<tbody>
					<tag:forEach var="user" items="${userList}">
						<tr>
							<td>${user.userId}</td>
							<td>${user.name}</td>
							<td>${user.email}</td>
							<td>
								<form action="usermanager" method="post">								
									<input type="hidden" name="userId" value="${user.userId}">
									<input type="hidden" name="useractiontype" value="delete">
									<button type="submit" class="btn btn-danger">Delete the Product</button>
								</form>							
							</td>
						</tr>
					</tag:forEach>
				</tbody>
			</table>	
		</div>
	</body>
</html>