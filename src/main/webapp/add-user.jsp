<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="tag" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
	<head>
	
		<meta charset="ISO-8859-1">
		<title>KFC Sri Lanka onAir</title>
		
		<!-- Latest compiled and minified CSS -->
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
		<!-- Latest compiled JavaScript -->
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>		
	</head>
	
	<body>		
		
			<h2>Register Product</h2>
			<p>${feebackMessage}</p>
			<br/>
			<form action="usermanager" method="post">
			  <label for="usertype">Tell us who you are?</label>
          <div class="usertype">
            <label for="seeker">
                <input type="radio" name="usertype" id="seeker" value="ROLE_USER">A Job Seeker
            </label>
            <label for="consultant">
                <input type="radio" name="usertype" id="consultant" value="ROLE_CONSULTANT"> A Job consultant
            </label>
             </div>
            
				<label for="name"> Name:</label>
				<input class="form-control" type="text" name="name" id="name"/>
				<br/>
			    <label for="telephone">Telephone No:</label>
			    <input class="form-control" type="tele" id="telephone" name="telephone">
			    <br/>
			    
			    <input type="hidden" name="useractiontype" value="add"/>
			    <button class="btn btn-info" type="submit">Create User</button>
			</form>
			
		</div>
	</body>
</html>