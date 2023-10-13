<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="tag" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ page import="com.jobConsultancyScheduler.model.User" %>
    <%@ page import="com.jobConsultancyScheduler.model.AccessRight" %>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
 <title>Job-Seekers

  </title>
  <link href="https://fonts.googleapis.com/css2?family=Lato&display=swap" rel="stylesheet">
  <link href="https://use.fontawesome.com/releases/v5.6.1/css/all.css" rel="stylesheet">
  
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
  <link rel="icon" type="image/x-icon" href="https://static.vecteezy.com/system/resources/previews/010/430/526/non_2x/job-for-immigrants-app-icon-refugee-employment-construction-worker-finding-work-abroad-hard-hat-worker-handyman-uiux-user-interface-web-or-mobile-application-isolated-illustration-vector.jpg">
  <link rel="preconnect" href="https://fonts.gstatic.com">
  <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500&display=swap" rel="stylesheet">
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<Style>

  /*  <!-- sidebar styling start here  -->*/

    @media print {
            table {
                width: 100%;
            }
        }

        @page {
            size: A4 portrait;
            margin: 0;
        }
    *{
  margin: 0;
  padding: 0;
  text-decoration: none;
}
:root {
  --accent-color: #fff;
  --gradient-color: #FBFBFB;
}
body{
  display: flex;
  flex-direction: column;
  /* justify-content: center; */
  align-items: center;
   width: 100vw;
  height: 100vh;
  background-image: linear-gradient(-45deg, #e3eefe 0%, #efddfb 100%);
}

.sidebar{
  position: fixed;
  width: 240px;
  left: -240px;
  height: 100%;
  background-color: #fff;
  transition: all .5s ease;
  z-index: 5;
}
.sidebar header{
  font-size: 28px;
  color: #353535;
  line-height: 70px;
  text-align: center;
  background-color: #fff;
  user-select: none;
  font-family: 'Lato', sans-serif;
}
.sidebar a{
  display: block;
  height: 65px;
  width: 100%;
  color: #353535;
  line-height: 65px;
  padding-left: 30px;
  box-sizing: border-box;
  border-left: 5px solid transparent;
  font-family: 'Lato', sans-serif;
  transition: all .5s ease;
}
a.active,a:hover{
  border-left: 5px solid var(--accent-color);
  color: #fff;
   background: linear-gradient(to left, var(--accent-color), var(--gradient-color));
}
.sidebar a i{
  font-size: 23px;
  margin-right: 16px;
}
.sidebar a span{
  letter-spacing: 1px;
  text-transform: uppercase;
}
#check{
  display: none;
}
label #btn,label #cancel{
  position: absolute;
  left: 5px;
  cursor: pointer;
  color: #d6adff;
  border-radius: 5px;
  margin: 15px 30px;
  font-size: 29px;
  background-color: #e8d1ff;
  box-shadow:inset 2px 2px 2px 0px rgba(255,255,255,.5),
    inset -7px -7px 10px 0px rgba(0,0,0,.1),
   3.5px 3.5px 20px 0px rgba(0,0,0,.1),
   2px 2px 5px 0px rgba(0,0,0,.1);
  height: 45px;
  width: 45px;
  text-align: center;
  text-shadow: 2px 2px 3px rgba(255,255,255,0.5);
  line-height: 45px;
  transition: all .5s ease;
  z-index: 5px;
}
label #cancel{
  opacity: 0;
  visibility: hidden;
}
#check:checked ~ .sidebar{
  left: 0;
}
#check:checked ~ label #btn{
  margin-left: 245px;
  opacity: 0;
  visibility: hidden;
}
#check:checked ~ label #cancel{
  margin-left: 245px;
  opacity: 1;
  visibility: visible;
}
@media(max-width : 860px){
  .sidebar{
    height: auto;
    width: 70px;
    left: 0;
    margin: 100px 0;
  }
  header,#btn,#cancel{
    display: none;
  }
  span{
    position: absolute;
    margin-left: 23px;
    opacity: 0;
    visibility: hidden;
  }
  .sidebar a{
    height: 60px;
  }
  .sidebar a i{
    margin-left: -10px;
  }
  a:hover {
    width: 200px;
    color: #9884e4;
    background: inherit;
    z-index: 5;
    
  }
  .sidebar a:hover span{
    opacity: 1;
    visibility: visible;
  }
}

.sidebar > a.active,.sidebar > a:hover:nth-child(even) {
  --accent-color: #52d6f4;
  --gradient-color: #c1b1f7;
}
.sidebar a.active,.sidebar > a:hover:nth-child(odd) {
  --accent-color: #c1b1f7;
  --gradient-color: #A890FE;
}


.frame {
  width: 50%;
  height: 30%;
  margin: auto;
  text-align: center;
}

h2 {
  position: relative;
  text-align: center;
  color: #353535;
  font-size: 60px;
  font-family: 'Lato', sans-serif;
  margin: 0;
  color: #a759f5;
}

p {
  font-family: 'Lato', sans-serif;
  font-weight: 300;
  text-align: center;
  font-size: 30px;
  color: #d6adff;
  margin: 0;
}
 /*  <!-- sidebar styling end here  --> */
 
 /* page- header */
.pageHeader {
  position: fixed;
  top: 60px;
  left: 0;
  width: 100%;
  height: 60px;
  background-image: linear-gradient(30deg, #44a7fd, #107fc0);
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
  transition: background-color 0.3s ease-in-out;
  z-index: 9995;
 
}

.pageHeader .container {
  display: flex;
  justify-content: space-between; 
  align-items: center;
  max-width: 1200px; 
  margin: 0 auto; 

}

.pageHeader .navbar-brand {
  padding-top: 5px;
  margin-left: 1050px; 
  color: rgb(255, 255, 255);
  font-size: 20px;
}

/* end of page header */

.container {
  max-width: 1200px;
  margin: 150px auto;
  padding: 20px;
  padding-left: 200px;
  left: 303px;
  
}

h1 {
  text-align: center;
  font-size: 24px;
  color: #1884a5;
  margin-bottom: 20px;
  text-transform: uppercase;
}

h2{text-align: center;}
/* Search bar  */
.navbar {
  margin-bottom: 20px;
  justify-content: center;
  padding: 20px;
}

.form-inline {
  display: flex;
  align-items: center;
}

.form-control[type="search"] {
  width: 400px;
  margin-right: 10px; /* Add margin to create space between search bar and buttons */
}

.btn-outline-success {
  border-color: #1884a5;
  color: #1884a5;
}

.btn-outline-success:hover {
  background-color: #1884a5;
  color: #fff;
}

.btn-outline-success:focus,
.btn-outline-success.focus {
  box-shadow: 0 0 0 0.2rem rgba(24, 132, 165, 0.5);
}


/* Card */



.card {
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
  transition: 0.3s;
  width: 900px;
  margin-bottom: 80px;
}

.card:hover {
  box-shadow: 0 8px 16px 0 rgba(0, 0, 0, 0.2);
}

.card-img-top {
  width: 100%;
  height: 200px; /* Adjust the height as desired */
  object-fit: cover;
}

.card-title {
  font-size: 24px;
}
.card-text {
  font-size: 16px;
  line-height: 1.5;
  font-weight: 500;     
}

.list-group-item {
  font-size: 14px;
  border: none; /* Remove borders from list items */
  padding: 5px 0; /* Adjust padding as desired */
}

/* .btn {
  margin-top: 10px;
  font-size: 16px;
  padding: 8px 16px;
} */

/* buttons */

.btn{
  
  margin: 10px;
  padding: 10px;
  width:400px ;
  border-radius: 4px;
  font-size: 14px;
  cursor: pointer;
  
}

.btn-outline-success{
  width:150px ;
  margin: 5px;
  padding: 8px;
  border-radius: 8px;
  font-size: 14px;
  cursor: pointer;
}




/* Table */
.table {
  margin-top: 50px;
  width: 100%;
  border-collapse: collapse;
  background-color: #f8f8f8;
  border-radius: 5px;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.table th,
.table td {
  padding: 10px;
}

.table thead th {
  background-color: #036685;
  color: #fff;
  height: 60px;
  margin-bottom: 100px;
}

.table tbody tr:nth-child(even) {
  background-color: #f2f2f2;
}

.table-hover tbody tr:hover {
  background-color: #d4eaff;
}

.btn-column {
  /* display: flex; */
  justify-content: center;
  align-items: center;
  padding: 0;
}

.btn-column button {
  margin: 0 5px;
  padding: 5px 10px;
  width:70px ;
  border-radius: 15px;
  font-size: 14px;
  cursor: pointer;
  
}

.btn-primary {
  background-color: #2db6e0;
  color: #fff;
  border-color: #2db6e0;
}

.btn-primary:hover {
  background-color: #136d8f;
  border-color: #136d8f;
}

.btn-success {
  background-color: #63c45d;
  color: #fff;
  border-color: #63c45d;
}

.btn-success:hover {
  background-color: #449140;
  border-color: #4da249;
}

.btn-danger {
  background-color: #e74c3c;
  color: #fff;
  border-color: #e74c3c;
}

.btn-danger:hover {
  background-color: #bd2918;
  border-color: #c23c2d;
}


    </Style>

</head>
<body >
  <!-- sidebar start here  -->
   <input type="checkbox" id="check">
   <label for="check">
     <i class="fas fa-bars" id="btn"></i>
     <i class="fas fa-times" id="cancel"></i>
   </label>
   <%
// Get the user object from the session
User user = (User) session.getAttribute("user");
%>
 
<div class="sidebar">
  <header>Menu</header>
  <%-- Always display Dashboard --%>
  <a href="admin-dashboard.jsp" class="active">
    <i class="fas fa-qrcode"></i>
    <span>Dashboard</span>
  </a>



  <%-- Display Events and Overview for Consultant --%>
  <% if (user != null && user.getAccessRight() == AccessRight.ROLE_CONSULTANT) { %>
    <a href="#">
      <i class="fas fa-calendar"></i>
      <span>Overview</span>
    </a>
  <% } %>

  <%-- Display About and Services for Admin --%>
  <% if (user != null && user.getAccessRight() == AccessRight.ROLE_ADMIN) { %>
    <a href="search-and-update-user.jsp">
      <i class="far fa-question-circle"></i>
      <span>Update user</span>
    </a>
    <a href="view-all-users-and-delete-specific.jsp">
      <i class="fas fa-sliders-h"></i>
      <span>View all</span>
    </a>
  <% } %>

  <%-- Display Services for all users, regardless of role --%>
  <a href="view-profile.jsp">
    <i class="fas fa-sliders-h"></i>
    <span>Profile</span>
  </a>

  <%-- Display Contact for User and Consultant --%>
  <% if (user != null && (user.getAccessRight() == AccessRight.ROLE_USER || user.getAccessRight() == AccessRight.ROLE_CONSULTANT)) { %>
    <a href="#">
      <i class="far fa-envelope"></i>
      <span>Contact</span>
    </a>
  <% } %>
  
  
    <%-- Display Login or Logout based on user status --%>
  <% if (user != null) { %>
    <a href="logout.jsp">
      <i class="fas fa-stream"></i>
      <span>Logout</span>
    </a>
  <% } else { %>
    <a href="login.jsp">
      <i class="fas fa-sign-in-alt"></i>
      <span>Login</span>
    </a>
  <% } %>
</div>
   
   
  <!-- sidebar end here  -->  
  
  <div class="container">


    <h1>MY PROFILE</h1>
   
 <%--   <%
// Get the user object from the session
User user = (User) session.getAttribute("user");
%> --%>

    <div class="card" >
    <img class="card-img-top" src="https://assets.contenthub.wolterskluwer.com/api/public/content/20fc8b2fb1a445f78a9be1ca7fda9a35" alt="Card image cap">
    <div class="card-body">
      <h2 class="card-title"><%= user.getName() %></h2>
      
      <ul class="list-group">
        <p class="card-text">User ID :<%= user.getUserId() %> </p>
        <li class="list-group-item"></li>
        <p class="card-text">Gender :<%= user.getGender() %></p>
        <li class="list-group-item"></li>
        <p class="card-text">Birthdate :<%= user.getBirthdate() %></p>
        <li class="list-group-item"></li>
        <p class="card-text">Occupation : <%= user.getOccupation() %></p>
        <li class="list-group-item"></li>
        <p class="card-text">Country : <%= user.getCountry() %></p>
        <li class="list-group-item"></li>
        <p class="card-text">Email : <%= user.getEmail() %></p>
        <li class="list-group-item"></li>
        <p class="card-text">Conatct Number : <%= user.getPhoneNumber() %></p>
        <li class="list-group-item"></li>
 <p class="card-text">You are registered as   : <%= user.getAccessRight().getDisplayName() %></p>

        <li class="list-group-item"></li>
       <p class="card-text">specializedJobs : <%= user.getSpecializedJobs() %></p>
        <li class="list-group-item"></li>
        <p class="card-text">specializedCountries : <%= user.getSpecializedCountries() %></p>
        <li class="list-group-item"></li>
        <p class="card-text">specializedJobs : <%= user.getEducationalQualifications() %></p>
        <li class="list-group-item"></li>
      </ul>
      <a  class="btn btn-primary" (click)="onBackClick()" >Back</a>
      
       
         <a  class="btn btn-primary" href="update-profile.jsp"  >Edit</a>
         
 <!--      <input type="hidden" name="useractiontype" value="edit"/>				
				<button type="submit" ">Update </button>	 -->
     
    </div>
  </div>


  
</div>
</body>
</html> 