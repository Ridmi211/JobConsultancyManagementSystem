<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
    
    <%@ taglib prefix="tag" uri="http://java.sun.com/jsp/jstl/core"%>

    <%@ page import="com.jobConsultancyScheduler.model.User" %>
    <%@ page import="com.jobConsultancyScheduler.model.AccessRight" %>
    
    <%
User user = (User) session.getAttribute("user");
// Check if the user is logged in
if (session.getAttribute("user") == null) {
    // Redirect the user to a login page or display an error message
    response.sendRedirect("login.jsp");
    return; // Stop processing the current page
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

    <link href="https://fonts.googleapis.com/css2?family=Lato&display=swap" rel="stylesheet">
  <link href="https://use.fontawesome.com/releases/v5.6.1/css/all.css" rel="stylesheet">
  
 
  <title>Job-Seekers

  </title>

  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
  <link rel="icon" type="image/x-icon" href="https://pbs.twimg.com/profile_images/1486752160004018179/zpnSGdpM_400x400.jpg">
  <link rel="preconnect" href="https://fonts.gstatic.com">
  <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500&display=swap" rel="stylesheet">
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<Style>


    
    
    .container {
        
      margin: 150px auto;
      max-width: 1500px;
    
      
    }
    
    h1 {
      text-align: center;
      font-size: 24px;
      color: #7c6694;
      margin-bottom: 20px;
      margin-top: 80px;
      text-transform: uppercase;
    }
    
    /* Search bar  */
    .navbar {
      margin-bottom: 20px;
      justify-content: center;
      padding: 20px;
      background-image: linear-gradient(-45deg, #e3eefe 0%, #efddfb 100%);

    }
    
    .form-inline {
      display: flex;
      align-items: center;
    }
    
    .form-control[type="search"] {
      width:400px;
    
      margin-right: 10px; /* Add margin to create space between search bar and buttons */
    }
    
    .btn-outline-success {
      border-color:  #52d6f4;
      color: #1884a5;
    }
    
    .btn-outline-success:hover {
      /* background-color: #1884a5; */
      --accent-color: #52d6f4;
  --gradient-color: #c1b1f7;
      background: linear-gradient(to left, var(--accent-color), var(--gradient-color));
      color: #fff;
      border-color:  #c1b1f7;
    }
    
    .btn-outline-success:focus,
    .btn-outline-success.focus {
      box-shadow:  #c1b1f7;
    }
    
    /* Table */
    .table {
      width: 80%;
      border-collapse: collapse;
      background-color: #f8f8f8;
      /* background-image: linear-gradient(30deg, #44a7fd, #107fc0); */
      /* background-color:linear-gradient(-45deg, #e3eefe 0%, #efddfb 100%); */
      border-radius: 5px;
      box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    }
    
    .table th,
    .table td {
      padding: 10px;
    }
    
    .table thead th {
      background-color:#A890FE;
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
    

    /*  <!-- sidebar  -->*/
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
  font-size: 15px;
  color: #d6adff;
  margin: 0;
}

.nav{
position:relative;
top:1%;
left:10%;
width:70%;
}
.active{
background-color
}

    /*  <!-- sidebar end here  --> */
    </Style>

</head>
<body >

 <!-- sidebar start here  -->
   <input type="checkbox" id="check">
      <label style="position: fixed; top: 60px; z-index: 1; left: -5px;" for="check">
        <i class="fas fa-bars" id="btn"></i>
        <i class="fas fa-times" id="cancel"></i>
      </label>

<div class="sidebar">
  <header>Menu</header>
  <%-- Always display Dashboard --%>
   <a href="home.jsp">
    <i class="fas fa-qrcode"></i>
    <span>Home</span>
  </a>
  <a href="admin-dashboard.jsp" >
    <i class="fas fa-qrcode"></i>
    <span>Dashboard</span>
  </a>



  <%-- Display Events and Overview for Consultant --%>
  <% if (user != null && user.getAccessRight() == AccessRight.ROLE_CONSULTANT) { %>
    <a href="#">
      <i class="fas fa-calendar"></i>
      <span>Overview</span>
    </a>
    
     <a  >
       <i class="far fa-envelope"></i>
       <span>Consultant</span>
       
     </a>
  <% } %>

  <%-- Display About and Services for Admin --%>
  <% if (user != null && user.getAccessRight() == AccessRight.ROLE_ADMIN) { %>
       
      <a href="getuser?useractiontype=all"  class="active">
       <i class="far fa-envelope"></i>
       <span>View All</span>
       
     </a>
     
       <a  >
       <i class="far fa-envelope"></i>
       <span>Admin</span>
       
     </a>
  <% } %>

  <%-- Display Services for all users, regardless of role --%>
 

  <%-- Display Contact for User and Consultant --%>
  <% if (user != null && (user.getAccessRight() == AccessRight.ROLE_USER || user.getAccessRight() == AccessRight.ROLE_CONSULTANT)) { %>
    <a href="#">
      <i class="far fa-envelope"></i>
      <span>Contact</span>
    </a>
     <a href="view-profile.jsp">
    <i class="fas fa-sliders-h"></i>
    <span>Profile</span>
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


    <h1>Registered Job Seekers </h1>
<p style='color:magenta'>${message}</p>	

     <!-- Search abr  -->
     <nav class="navbar navbar-light bg-light">
      <form class="form-inline">
     <!--    <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search" [(ngModel)]="requestedNIC" name="searchInp">
        <button class="btn btn-outline-success my-2 my-sm-0" type="submit" (click)="search(requestedNIC)">Search</button> -->
      </form>
    </nav>
<!-- table -->
    <!-- <div class="col-sm"> -->
      <table class="table table-hover">
        <thead>
          <tr >
            <th scope="col" class="text-center">Count </th>
            <th scope="col" class="text-center">User ID</th>
            <th scope="col" class="text-center">Name</th>
            <th scope="col" class="text-center">Email</th>
           <!--    <th scope="col" class="text-center">Role</th> -->
           <!--  <th scope="col">Role</th> -->
            <th scope="col">View</th>
            <th  scope="col" >Delete</th>
          </tr>
        </thead>
       <!--  <tbody> -->
        <tag:forEach var="user" items="${userList}">
          <tr >
            <td scope="row">
            </td>
            <td class="text-center">
           ${user.userId}
            </td>
            <td class="text-center">
           ${user.name}
            </td>
            <td class="text-center">
          ${user.email}
            </td>
            <%--   <td class="text-center">
          ${user.accessRight.displayName}
            </td> --%>
              
             <%--     <td class="text-center">${user.accessRight.displayName}</td> --%>
            <td class="btn-column">
    <form action="usermanager" method="post">
        <input type="hidden" name="userId" value="${user.userId}">
        <input type="hidden" name="useractiontype" value="view">
        <button type="submit" class="btn btn-primary">View</button>
    </form>
</td>

            
            <td class="btn-column">
    <form onsubmit="return confirmDelete();" action="usermanager" method="post">								
        <input type="hidden" name="userId" value="${user.userId}">
        <input type="hidden" name="useractiontype" value="delete">
        <button type="submit" class="btn btn-danger">Delete</button>
    </form>
</td>
            
          </tr>
        </tag:forEach>
      <!--   </tbody> -->
      </table>
      
      
  <script>
function confirmDelete() {
    return confirm("Are you sure you want to delete this user?");
}
</script>
  
</body>
</html>
