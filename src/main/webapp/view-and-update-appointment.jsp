<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
      <%@ taglib prefix="tag" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ page import="com.jobConsultancyScheduler.model.User" %>
    <%@ page import="com.jobConsultancyScheduler.model.AccessRight" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
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
<title>Insert title here</title>
  <link href="https://fonts.googleapis.com/css2?family=Lato&display=swap" rel="stylesheet">
  <link href="https://use.fontawesome.com/releases/v5.6.1/css/all.css" rel="stylesheet">
  
  <meta charset="utf-8">
  <title>Job-Seekers

  </title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
  <link rel="icon" type="image/x-icon" href="https://static.vecteezy.com/system/resources/previews/010/430/526/non_2x/job-for-immigrants-app-icon-refugee-employment-construction-worker-finding-work-abroad-hard-hat-worker-handyman-uiux-user-interface-web-or-mobile-application-isolated-illustration-vector.jpg">
  <link rel="preconnect" href="https://fonts.gstatic.com">
  <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500&display=swap" rel="stylesheet">
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="css/navbar-style.css">
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

body{
 
  /* justify-content: center; */
  align-items: center;
   width: 100vw;
  height: 100vh;
  background-image: linear-gradient(-45deg, #e3eefe 0%, #efddfb 100%);
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
  margin-left: 1200px; 
  color: rgb(255, 255, 255);
  font-size: 20px;
}

/* end of page header */ 


.container {
    max-width: 900px;
    margin: 150px auto;
    padding: 20px;
    left: 303px;
    
  }
  
  h1 {
    text-align: center;
    font-size: 24px;
    color: #1884a5;
    margin-bottom: 20px;
    text-transform: uppercase;
  }
  
  
  .form-group {
    margin-bottom: 20px;
  }
  
  label {
    font-weight: bold;
  }
  
  input[type="text"],
  input[type="date"],
  textarea {
    width: 100%;
    padding: 8px;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
  }
  
  
  .btn{
    
    margin: 10px;
    padding: 10px;
    width:400px ;
    border-radius: 4px;
    font-size: 14px;
    cursor: pointer;
    
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
    margin-right: 10px; 
    background-color: #fff;
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
  .btn-outline-success{
    width:auto ;
    margin: 5px;
    padding: 7px;
    border-radius: 8px;
    font-size: 14px;
    cursor: pointer;
  }
 
  
    </Style>

</head>
<body class="m-0 p-0" >
 <!-- sidebar start here  -->
  <!-- sidebar start here  -->
   <input type="checkbox" id="check">
      <label style="position: fixed; top: 60px; z-index: 1; left: -5px;" for="check">
        <i class="fas fa-bars" id="btn"></i>
        <i class="fas fa-times" id="cancel"></i>
      </label>



<div class="sidebar">
 <jsp:include page="sidebar.jsp" />
  
</div>
 
 
  <div class="row m-0 p-0">
 <div class="col-12 m-0 p-0">
   <nav class="p-0 m-0 ">
    <img class="logo-img" src="" alt="logo">
    <!-- images/navabar-logo.jpg -->
    <ul class="" id="sidemenu" >      
        
          <% if (user != null) { %>
          
    <li ><a href="view-profile.jsp"><i class="fa fa-user-circle" aria-hidden="true" ></i>&nbsp;&nbsp; <%= user.getName() %></a></li> 
        <li ><a href="logout.jsp"><i class="fa fa-sign-out" aria-hidden="true" ></i>&nbsp;&nbsp;Logout</a></li> 
  <% } else { %>
    <li ><a href="login.jsp"><i class="fa fa-user-circle" aria-hidden="true" ></i>&nbsp;&nbsp; Login</a></li> 
  <% } %>        
        
    </ul> 
   
   
  </nav>
 </div>
  </div>
  <!-- sidebar end here  -->  

 <div class="row m-0 ">
    <div class="col-1 m-0"></div>
    <div class="col-10 m-0 d-flex justify-content-center">
    <div class="page-title">Update Appointment</div>
</div>
    <div class="col-1 m-0"></div>
</div>

<div class="row m-0 d-flex justify-content-center">
<%-- <p style='color:magenta'>${message}</p>	 --%>
</div>

		<div class="row m-0">
     <!-- Search abr  -->   <div class="col-1 m-0"></div>
    <div class="col-10 m-0 d-flex justify-content-center">
<form action="appointmentManager" method="post">	
 
    <input class="form-control" type="number" id="appointmentId" name="appointmentId"  readonly="readonly" value="${appointment.appointmentId}"/>
    <label for="userIdUpdate">consultantId:</label>
    <input class="form-control" type="number" id="consultantId" name="consultantId" readonly="readonly" value="${appointment.consultantId}"/>
        <label for="email">seekerId:</label>
    <input class="form-control" type="number" id="seekerId" name="seekerId" readonly="readonly" value="${appointment.seekerId}"/>
    <label for="scheduledDate"> scheduledDate:</label>
    <input class="form-control" type="text" id="scheduledDate" name="scheduledDate" value="${appointment.scheduledDate}"/>
    
      <label for="startTime"> startTime:</label>
    <input class="form-control" type="text" id="startTime" name="startTime" value="${appointment.startTime}"/>
  
      <label for="startTime">notes</label>
    <textarea class="form-control" style="height:100px"   type="text" id="notes" name="notes" value="${appointment.notes}">${appointment.notes}</textarea>
      <label for="gender">Gender:</label>
    <input class="form-control" type="text" id="job" name="job" value="${appointment.job}"/>
      <label for="occupation">Occupation:</label>
    <input class="form-control" type="text" id="country" name="country" value="${appointment.country}"/>
    <label for="country">status:</label>
    <input class="form-control" type="text" id="status" name="status" value="${appointment.status.displayName}"/>
   
       <label for="consultantName">Consultant Phone consultantName:</label>
<input class="form-control" type="text" id="consultantName" name="consultantName" value="${appointment.consultantName}"/>

<label for="seekerName">Consultant Email:</label>
<input class="form-control" type="text" id="seekerName" name="seekerName" value="${appointment.seekerName}"/>
   
 
   
   <label for="seekerEmail">Seeker Email:</label>
<input class="form-control" type="text" id="seekerEmail" name="seekerEmail" value="${appointment.seekerEmail}"/>

<label for="seekerPhoneNumber">Seeker Phone Number:</label>
<input class="form-control" type="text" id="seekerPhoneNumber" name="seekerPhoneNumber" value="${appointment.seekerPhoneNumber}"/>

<label for="seekerJob">Seeker Job:</label>
<input class="form-control" type="text" id="seekerJob" name="seekerJob" value="${appointment.seekerJob}"/>

<label for="seekerCountry">Seeker Country:</label>
<input class="form-control" type="text" id="seekerCountry" name="seekerCountry" value="${appointment.seekerCountry}"/>
   
   
   
    <input class="form-control" type="hidden" id="status" name="enum-status" value="${appointment.status}"/>
   
    
    
  <%--   <c:if test="${user.accessRight == 'ROLE_CONSULTANT'}">
    <label for="educationalQualifications">Educational Qualifications:</label>
    <input class="form-control" type="text" id="educationalQualifications" name="educationalQualifications" value="${user.educationalQualifications}"/>
    
    <label for="specializedCountries">Specialized Countries:</label>
    <input class="form-control" type="text" id="specializedCountries" name="specializedCountries" value="${user.specializedCountries}"/>
    
    <label for="specializedJobs">Specialized Jobs:</label>
    <input class="form-control" type="text" id="specializedJobs" name="specializedJobs" value="${user.specializedJobs}"/>
    
      <label for="availableDays">availableDays:</label>
    <input class="form-control" type="text" id="availableDays" name="availableDays" value="${user.availableDays}"/>
    
      <label for="availableTimeSlots">availableTimeSlotss:</label>
    <input class="form-control" type="text" id="availableTimeSlots" name="availableTimeSlots" value="${user.availableTimeSlots}"/>
</c:if> --%>
     <%--  <label for="country">educational Qualifications:</label>
    <input class="form-control" type="text" id="educationalQualifications" name="educationalQualifications" value="${user.educationalQualifications}"/>
      <label for="country">specializedCountries:</label>
    <input class="form-control" type="text" id="specializedCountries" name="specializedCountries" value="${user.specializedCountries}"/>
      <label for="country">specializedJobs:</label>
    <input class="form-control" type="text" id="specializedJobs" name="specializedJobs" value="${user.specializedJobs}"/> --%>
    <%--  <label for="country">Registered as :</label>
    <input class="form-control" type="text" id="accessRight" name="accessRight" readonly="readonly" value="${user.accessRight.displayName}"/>
    
    
     --%>

  
      
				<input type="hidden" name="appactiontype" value="editAppointment"/>
				
				<button type="submit" class="btn btn-success">Update </button>	

           <a id="backButton" class="btn btn-primary">Back</a>

<script>
  document.getElementById('backButton').addEventListener('click', function() {
    window.history.back(); // This will navigate back to the previous page in the browser's history.
  });
</script>
 <script>
function confirmUpdate() {
    return confirm("Are you sure you want to update this user?");
}
</script>
 
 </form>
  </div> 
     <div class="col-1"></div>
    
</div>

  
</body>
</html>
