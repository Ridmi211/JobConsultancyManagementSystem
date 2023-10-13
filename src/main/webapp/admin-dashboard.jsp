<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="tag" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ page import="com.jobConsultancyScheduler.model.User" %>
    <%@ page import="com.jobConsultancyScheduler.model.AccessRight" %>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
 <link href="https://fonts.googleapis.com/css2?family=Lato&display=swap" rel="stylesheet">
  <link href="https://use.fontawesome.com/releases/v5.6.1/css/all.css" rel="stylesheet">
  
  <title>Admin dashboard </title>
  <!-- <base href="/"> -->
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


 h1 {
    text-align: center;
    font-size: 24px;
    color: #7c6694;
    margin-top: 50px;
    margin-bottom: 20px;
    text-transform: uppercase;
  }
  
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
  
  /* Table */
  .table {
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
    background-color: #2ccaed;
    color: #fff;
    border-color: #52d6f4;
  }
  
  .btn-success:hover {
    background-color: #23aac8;
    border-color: #23aac8;
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
  

    /* image  */

.img-top{
  width: 540px;
  height: 400px;
  position: relative;
  margin-bottom: 50px;
  /* top: 150px; */
  left: 0px;
}

/* cards */


@import url('https://fonts.googleapis.com/css2?family=Open+Sans:wght@600;700&display=swap');

* {
  box-sizing: border-box;
}

.page-contain {

  border-radius: .6em;
    margin-top: 10px;
  display: flex;
  /* min-height: 40vh; */
  /* align-items: center; */
  justify-content: center;
  background:#d6cdf1;
  /* background-image: linear-gradient(-45deg, #e3eefe 0%, #efddfb 100%); */


  /* --accent-color: #52d6f4;
  --gradient-color: #c1b1f7;
      background: linear-gradient(to left, var(--accent-color), var(--gradient-color));
      color: #574770; */
  /* border: .5em solid white; */
  padding: 2em;
  font-family: 'Open Sans', sans-serif;
}

.data-card {
  display: flex;
  flex-direction: column;
  max-width: 18.75em;
  min-height: 15.75em;
  overflow: hidden;
  border-radius: .5em;
  text-decoration: none;
  background: white;
  margin: 1em;
  margin-left: 3em;
  padding: 1.75em 1.5em;
  box-shadow: 0 1.5em 2.5em -.5em rgba(0, 0, 0, .1);
  transition: transform .45s ease, background .45s ease;
}

.data-card h3 {
  color: #2E3C40;
  font-size: 2.5em;
  font-weight: 600;
  line-height: 1;
  padding-bottom: .5em;
  margin: 0 0 0.142857143em;
  border-bottom: 2px solid #a759f5;
  transition: color .45s ease, border .45s ease;
}

.data-card h4 {
  color: #627084;
  text-transform: uppercase;
  font-size: 1.125em;
  font-weight: 700;
  /* line-height: 1; */
  line-height: 1.2;
  letter-spacing: 0.1em;
  margin: 0 0 1.777777778em;
  transition: color .45s ease;
}

.data-card p {
  opacity: 0;
  color: #FFFFFF;
  font-weight: 600;
  line-height: 1.5;
  margin: 0 0 1.25em;
  font-size: 15px;
  transform: translateY(-1em);
  transition: opacity .45s ease, transform .5s ease;
}

.data-card .link-text {
  display: block;
  color: #18a0bf;
  font-size: 1em;
  font-weight: 600;
  line-height: 1.2;
  margin: auto 0 0;
  transition: color .45s ease;
}

.data-card .link-text svg {
  margin-left: .5em;
  transition: transform .6s ease;
}

.data-card .link-text svg path {
  transition: fill .45s ease;
}

.data-card:hover {
  background: #906bcf;
  transform: scale(1.02);

  /* --accent-color: #52d6f4;
  --gradient-color: #c1b1f7;
      background: linear-gradient(to left, var(--accent-color), var(--gradient-color));
      color: #574770; */
      border-color:  #c1b1f7;
}

.data-card:hover h3 {
  color: #FFFFFF;
  border-bottom-color: #52d6f4;
}

.data-card:hover h4 {
  color: #FFFFFF;
}

.data-card:hover p {
  opacity: 1;
  transform: none;
}

.data-card:hover .link-text {
  color: #FFFFFF;
}

.data-card:hover .link-text svg {
  animation: point 1.25s infinite alternate;
}

.data-card:hover .link-text svg path {
  fill: #52d6f4;
}

@keyframes point {
  0% {
    transform: translateX(0);
  }
  100% {
    transform: translateX(.125em);
  }
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
  
   <a href="home.jsp" class="active">
    <i class="fas fa-qrcode"></i>
    <span>Home</span>
  </a>
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
   
      <a href="getuser?useractiontype=all">
       <i class="far fa-envelope"></i>
       <span>View All</span>
       
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

   
   
   
<!--    <div class="sidebar">
     <header>Menu</header>
     <a href="#" class="active">
       <i class="fas fa-qrcode"></i>
       <span>Dashboard</span>
     </a>
     <a href="#">
       <i class="fas fa-link"></i>
       <span>Shortcuts</span>
     </a>
     <a href="#">
       <i class="fas fa-stream"></i>
       <span>Overview</span>
     </a>
     <a href="#">
        <i class="fas fa-calendar"></i>
       <span>Events</span>
     </a>
     <a href="#">
       <i class="far fa-question-circle"></i>
       <span>About</span>
     </a>
     <a href="#">
       <i class="fas fa-sliders-h"></i>
       <span>Services</span>
     </a>
     <a href="#">
       <i class="far fa-envelope"></i>
       <span>Contact</span>
     </a>
   </div>
</div>  --> 
  <!-- sidebar end here  -->  
  


  <h1><b>Admin - DASHBOARD</b></h1>
  
    <div>
    <% 
  /*   User user = (User) session.getAttribute("user"); */
    if (user != null) {
    %>
    <h1>Welcome, <%= user.getName() %>!</h1>
      <p>Your access right: <%= user.getAccessRight() %></p>
    <% } else { %>
     <h1>Welcome,!</h1>
    <!-- Handle the case where the user is not in the session -->
    <% } %>
</div>
 
  <section class="page-contain">
    <a href="/patients/list" class="data-card">
      <h3>12 </h3>
      <h4> Ongoing<br> Appointments</h4>
      
    
      <!-- <p>Manage registered patients</p> -->
      <span class="link-text">
        View All
        <svg width="25" height="16" viewBox="0 0 25 16" fill="none" xmlns="http://www.w3.org/2000/svg">
          <path fill-rule="evenodd" clip-rule="evenodd"
            d="M17.8631 0.929124L24.2271 7.29308C24.6176 7.68361 24.6176 8.31677 24.2271 8.7073L17.8631 15.0713C17.4726 15.4618 16.8394 15.4618 16.4489 15.0713C16.0584 14.6807 16.0584 14.0476 16.4489 13.657L21.1058 9.00019H0.47998V7.00019H21.1058L16.4489 2.34334C16.0584 1.95281 16.0584 1.31965 16.4489 0.929124C16.8394 0.538599 17.4726 0.538599 17.8631 0.929124Z"
            fill="#753BBD" />
        </svg>
      </span>
    </a>
    <a href="/admins/all" class="data-card">
      <h3> 25</h3>
      <h4> completed <br>Appointments</h4>
      <!-- <p>Manage Registered Pharmacists</p> -->
      <span class="link-text">
        View All 
        <svg width="25" height="16" viewBox="0 0 25 16" fill="none" xmlns="http://www.w3.org/2000/svg">
          <path fill-rule="evenodd" clip-rule="evenodd"
            d="M17.8631 0.929124L24.2271 7.29308C24.6176 7.68361 24.6176 8.31677 24.2271 8.7073L17.8631 15.0713C17.4726 15.4618 16.8394 15.4618 16.4489 15.0713C16.0584 14.6807 16.0584 14.0476 16.4489 13.657L21.1058 9.00019H0.47998V7.00019H21.1058L16.4489 2.34334C16.0584 1.95281 16.0584 1.31965 16.4489 0.929124C16.8394 0.538599 17.4726 0.538599 17.8631 0.929124Z"
            fill="#753BBD" />
        </svg>
      </span>
    </a>
    <a href="/admins/all" class="data-card">
      <h3> 11</h3>
      <h4> Registered <br>Job<br>  Consultants</h4>
      <!-- <p>Manage Registered Pharmacists</p> -->
      <span class="link-text">
        View All 
        <svg width="25" height="16" viewBox="0 0 25 16" fill="none" xmlns="http://www.w3.org/2000/svg">
          <path fill-rule="evenodd" clip-rule="evenodd"
            d="M17.8631 0.929124L24.2271 7.29308C24.6176 7.68361 24.6176 8.31677 24.2271 8.7073L17.8631 15.0713C17.4726 15.4618 16.8394 15.4618 16.4489 15.0713C16.0584 14.6807 16.0584 14.0476 16.4489 13.657L21.1058 9.00019H0.47998V7.00019H21.1058L16.4489 2.34334C16.0584 1.95281 16.0584 1.31965 16.4489 0.929124C16.8394 0.538599 17.4726 0.538599 17.8631 0.929124Z"
            fill="#753BBD" />
        </svg>
      </span>
    </a>
    <a href="/prescriptions/list" class="data-card">
      <h3>13</h3>
      <h4> Registered <br>Job<br> seekers</h4>
      <!-- <p>Manage Issued Prescriptions</p> -->
      <span class="link-text">
        View All 
        <svg width="25" height="16" viewBox="0 0 25 16" fill="none" xmlns="http://www.w3.org/2000/svg">
          <path fill-rule="evenodd" clip-rule="evenodd"
            d="M17.8631 0.929124L24.2271 7.29308C24.6176 7.68361 24.6176 8.31677 24.2271 8.7073L17.8631 15.0713C17.4726 15.4618 16.8394 15.4618 16.4489 15.0713C16.0584 14.6807 16.0584 14.0476 16.4489 13.657L21.1058 9.00019H0.47998V7.00019H21.1058L16.4489 2.34334C16.0584 1.95281 16.0584 1.31965 16.4489 0.929124C16.8394 0.538599 17.4726 0.538599 17.8631 0.929124Z"
            fill="#753BBD" />
        </svg>
      </span>
    </a>

  </section>
  <!-- <img class="img-top" src="https://unblast.com/wp-content/uploads/2020/10/Pharmacist-Vector-Illustration.jpg"> -->
  <h1>New Appointment Requests</h1>

  <!-- table -->
  <div class="col-sm">
    <table class="table table-hover">
      <thead>
        <tr>
          <th scope="col">Row count </th>
          <th scope="col">AppointmentID</th>
          <th scope="col">Jobseeker</th>
          <th scope="col">Job-consultant</th>
          <th scope="col">Date</th>
          <th scope="col">Time</th>
          <th scope="col">Status</th>
          <!-- <th scope="col">View</th> -->
          <th scope="col">Issue Bill</th>
        </tr>
      </thead>
      <tbody>
        <tr *ngFor="let prescription of prescriptions; let i = index">
          <td scope="row">1</td>
          <td class="text-center">23456</td>
          <td class="text-center">Peter Parker</td>
          <td class="text-center">Bruce Wayne</td>
          <td class="text-center">02-09-2023</td>
          <td class="text-center">09:00 AM</td>
          <td class="text-center">Requested</td>
          <td class="btn-column">
            <button type="button" class="btn btn-success" (click)="detailsPage(prescription)">Confirm</button>

          </td>
        </tr>
        <tr *ngFor="let prescription of prescriptions; let i = index">
          <td scope="row">2</td>
          <td class="text-center">34567</td>
            <td class="text-center">Clark Kent</td>
            <td class="text-center">Diana Prince</td>
            <td class="text-center">03-09-2023</td>
            <td class="text-center">10:00 AM</td>
          <td class="text-center">Requested</td>
          <td class="btn-column">
            <button type="button" class="btn btn-success" (click)="detailsPage(prescription)">Confirm</button>

          </td>
        </tr>
        <tr *ngFor="let prescription of prescriptions; let i = index">
            <td scope="row">3</td>
            <td class="text-center">45678</td>
            <td class="text-center">Tony Stark</td>
            <td class="text-center">Natasha Romanoff</td>
            <td class="text-center">04-09-2023</td>
            <td class="text-center">11:00 AM</td>
          <td class="text-center">Requested</td>
          <td class="btn-column">
            <button type="button" class="btn btn-success" (click)="detailsPage(prescription)">Confirm</button>

          </td>
        </tr>
        <tr *ngFor="let prescription of prescriptions; let i = index">
          <td scope="row">4</td>
          <td class="text-center">56789</td>
          <td class="text-center">Steve Rogers</td>
          <td class="text-center">Thor Odinson</td>
          <td class="text-center">05-09-2023</td>
          <td class="text-center">12:00 PM</td>
          <td class="text-center">Requested</td>
          <td class="btn-column">
            <button type="button" class="btn btn-success" (click)="detailsPage(prescription)">Issue</button>

          </td>
        </tr>
        <tr *ngFor="let prescription of prescriptions; let i = index">
          <td scope="row">5</td>
          <td class="text-center">67890</td>
          <td class="text-center">Wanda Maximoff</td>
          <td class="text-center">Hank Pym</td>
          <td class="text-center">06-09-2023</td>
          <td class="text-center">01:00 PM</td>
          <td class="text-center">Requested</td>
          <td class="btn-column">
            <button type="button" class="btn btn-success" (click)="detailsPage(prescription)">Issue</button>

          </td>
        </tr>
        <tr *ngFor="let prescription of prescriptions; let i = index">
          <td scope="row">6</td>
            <td class="text-center">78901</td>
            <td class="text-center">Scott Lang</td>
            <td class="text-center">James "Rhodey" Rhodes</td>
            <td class="text-center">07-09-2023</td>
            <td class="text-center">02:00 PM</td>
          <td class="text-center">Requested</td>
          <td class="btn-column">
            <button type="button" class="btn btn-success" (click)="detailsPage(prescription)">Issue</button>

          </td>
        </tr>
        <tr *ngFor="let prescription of prescriptions; let i = index">
          <td scope="row">7</td>
          <td class="text-center">89012</td>
          <td class="text-center">Natalia Alianovna Romanova</td>
          <td class="text-center">Sam Wilson</td>
          <td class="text-center">08-09-2023</td>
          <td class="text-center">03:00 PM</td>
          <td class="text-center">Requested</td>
          <td class="btn-column">
            <button type="button" class="btn btn-success" (click)="detailsPage(prescription)">Issue</button>

          </td>
        </tr>
        <tr *ngFor="let prescription of prescriptions; let i = index">
          <td scope="row">8</td>
          <td class="text-center">90123</td>
          <td class="text-center">T'Challa</td>
          <td class="text-center">Stephen Strange</td>
          <td class="text-center">09-09-2023</td>
          <td class="text-center">04:00 PM</td>
          <td class="text-center">Requested</td>
          <td class="btn-column">
            <button type="button" class="btn btn-success" (click)="detailsPage(prescription)">Issue</button>

          </td>
        </tr>
      </tbody>
    </table>
  </div>
</body>
</html>
