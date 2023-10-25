
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="tag" uri="http://java.sun.com/jsp/jstl/core"%>
    
    <%@ page import="com.jobConsultancyScheduler.model.User" %>
    <%@ page import="com.jobConsultancyScheduler.model.AccessRight" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css2?family=Lato&display=swap" rel="stylesheet">
    <link href="https://use.fontawesome.com/releases/v5.6.1/css/all.css" rel="stylesheet">
    <script src="https://kit.fontawesome.com/1a4bb98cfa.js" crossorigin="anonymous"></script>

    <meta charset="utf-8">
    <title>Job-Seekers

    </title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
    <link rel="icon" type="image/x-icon"
        href="https://static.vecteezy.com/system/resources/previews/010/430/526/non_2x/job-for-immigrants-app-icon-refugee-employment-construction-worker-finding-work-abroad-hard-hat-worker-handyman-uiux-user-interface-web-or-mobile-application-isolated-illustration-vector.jpg">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <Style>
        * {
            margin: 0;
            padding: 0;
            font-family: 'Poppins', sans-serif;
            box-sizing: border-box;
        }

        html {
            scroll-behavior: smooth;
        }

        body {
             background-image: linear-gradient(-45deg, #e3eefe 0%, #efddfb 100%); 
            color: #000000;
        }

        h2 {
            color: #855ba5;
        }

        #header {
            width: 100;
            height: 100vh;
            background-size: cover;
            background-position: center;
        }

        #about-us {
            width: 100;
            height: 100vh;
            background-size: cover;
            background-position: center;
        }

        /* .container{
            padding: 10px ;
        } */

        nav {

            display: flex;
            align-items: center;
            justify-content: space-between;
            flex-wrap: wrap;
            width: 100%;
            height: 60px;
            background-color: #ffffff;
            position: fixed;
        }

        .logo {
            width: 140px;
        }

        nav ul li {
            display: inline-block;
            list-style: none;
            margin: 10px 20px;
        }

        nav ul li a {
            color: #000000;
            text-decoration: none;
            font-size: 16px;
            position: relative;
        }

        nav ul li a::after {
            content: '';
            width: 0;
            height: 3px;
            background: #08d8ca;
            position: absolute;
            left: 0;
            bottom: -6px;
            transition: 0.4s;

        }

        nav ul li a:hover::after {
            width: 100%;

        }

        .header-text {
            margin-top: 45%;
            font-size: 22px;
        }

        .header-text h1 {
            font-size: 20px;
            margin-top: 40px;
        } 
        
        .header-text h2 {
              font-size: 60px;
            margin-top: 40px;
            color:#584674;
        }

        .header-text h1 span {
            color: #08d8ca;
        }

        /* ------------------about ------------------------------- */

        #about {
            padding: 80px 0;
            color: #ababab;

        }

        .row {
            display: flex;
            justify-content: space-between;
            flex-wrap: wrap;
        }

        .about-col-1 {
            flex-basis: 35%;
        }

        .about-col-1 img {
            width: 100%;
            border-radius: 15px;
        }

        .about-col-2 {
            flex-basis: 60%;
            text-align: justify;
        }

        .sub-title {
            font-size: 50px;
            font-weight: 600;
            color: #000000;
        }

        .tab-titles {
            display: flex;
            margin: 20px 0 40px;
        }

        .tab-links {
            margin-right: 50px;
            font-size: 18px;
            font-weight: 500;
            cursor: pointer;
            position: relative;
        }

        .tab-links::after {
            content: '';
            width: 0;
            height: 3px;
            background: #08d8ca;
            position: absolute;
            left: 0;
            bottom: -8px;
            transition: 0.5s;
        }

        .tab-links.active-link::after {
            width: 50%;
        }

        /* .tab-contents{
            font-size: 14px;
        } */
        .tab-contents ul li {
            list-style: none;
            margin: 10px 0px;

        }

        .tab-contents ul li span {
            color: #21dbcfe3;
            font-size: 14px;
        }

        .tab-contents {
            display: none;
        }

        .tab-contents.active-tab {
            display: block;
        }

        /* -------------services-------------- */

        #services {
            padding: 30px 0;
            height: 90vh;
        }

        .services {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            grid-gap: 40px;
            margin-top: 50px;
        }

        .services div {
            /* background: #262626; */
            padding: 40px;
            font-size: 13px;
            font-weight: 300;
            border-radius: 10px;
            transition: background 0.5s, transform 0.5s;
        }

        .services div i {
            font-size: 50px;
            margin-bottom: 30px;
        }

        .services div h2 {
            font-size: 30px;
            font-weight: 500;
            margin-bottom: 15px;
        }

        .services div a {
            text-decoration: none;
            color: #000000;
            font-size: 12px;
            margin-top: 20px;
            display: inline-block;
        }

        .services div:hover {
            /* background: #d6adff; */
            transform: translateY(-10px);
        }




        /* ///////////////// */

        .services-list {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            grid-gap: 40px;
            margin-top: 50px;
        }

        .services-list div {
            background: #262626;
            padding: 40px;
            font-size: 13px;
            font-weight: 300;
            border-radius: 10px;
            transition: background 0.5s, transform 0.5s;
        }

        .services-list div i {
            font-size: 50px;
            margin-bottom: 30px;
        }

        .services-list div h2 {
            font-size: 30px;
            font-weight: 500;
            margin-bottom: 15px;
        }

        .services-list div a {
            text-decoration: none;
            color: #000000;
            font-size: 12px;
            margin-top: 20px;
            display: inline-block;
        }

        .services-list div:hover {
            background: #d6adff;
            transform: translateY(-10px);
        }

        /* ---------------portfolio------------------------- */

        #portfolio {
            padding: 50px 0;
        }

        .work-list {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            grid-gap: 40px;
            margin-top: 50px;
        }

        .work {
            border-radius: 10px;
            position: relative;
            overflow: hidden;
        }

        /* .work img {
            width: 100%;
            border-radius: 10px;
            display: block;
            transition: transform 0.5s;


        } */

        .layer {
            width: 360px;
            height: 0;
            background: linear-gradient(rgba(187, 187, 187, 0.942), #3fcbe4);
            border-radius: 10px;
            position: absolute;
            left: 0;
            bottom: 0;
            overflow: hidden;
            display: flex;
            align-items: center;
            justify-content: center;
            flex-direction: column;
            padding: 0 40px;
            text-align: center;
            font-size: 14px;
            transition: height 0.5s;
            color: rgb(77, 77, 77);

        }

        .layer h3 {
            font-weight: 500;
            margin-bottom: 20px;
        }

        .layer a {
            margin-top: 20px;
            color: #d6adff;
            text-decoration: none;
            font-size: 18px;
            line-height: 60px;
            background: #020202;
            width: 60px;
            height: 60px;
            border-radius: 50%;
            text-align: center;
             transition: background 8s;
        }

     

        .work:hover .layer {
            height: 100%
        }

        .btn {
            display: block;
            margin: 50px auto;
            width: fit-content;
            border: 1px solid #d6adff;
            padding: 14px 50px;
            border-radius: 6px;
            text-decoration: none;
            color: #070707;
            transition: background 0.5s;

        }

        .btn:hover {
            background: #d6adff;
        }

        /* ----------------contact------------------- */

        .contact-left {
            flex-basis: 35%;
        }

        .contact-right {
            flex-basis: 60%;
        }

        .contact-left p {
            margin-top: 30px;
        }

        .contact-left p i {
            color: #d6adff;
            margin-right: 15px;
            font-size: 25px;

        }

        .social-icons {
            margin-top: 30px;
        }

        .social-icons a {
            text-decoration: none;
            font-size: 30px;
            margin-right: 15px;
            color: #ababab;
            display: inline-block;
            transition: transform 0.5s;
        }

        .social-icons a:hover {
            color: #d6adff;
            transform: translateY(-5px);
        }

        .btn.btn2 {
            display: inline-block;
            background: #d6adff;

        }

        .btn.btn2:hover {
            background: #5b4a6b;
            color: #ffffff;
        }

        .contact-right form {
            width: 100%;
        }

        form input,
        form textarea {
            width: 100%;
            border: 1px solid rgb(223, 179, 245);
            outline: none;
            background: #ffffff;
            padding: 15px;
            margin: 15px 0;
            color: #6c6c6c;
            font-size: 18px;
            border-radius: 6px;
        }

        form .btn2 {
            padding: 14px 60px;
            font-size: 18px;
            margin-top: 20px;
            cursor: pointer;

        }

        .copyright {
            width: 100%;
            text-align: center;
            padding-top: 20px;
            padding-bottom: 10px;
            background: #1a1a1add;
            font-weight: 100;
            margin-top: 20px;
            color: white;

        }

        .copyright i {
            color: #d6adff;
        }

        /* -----css for small screen------------ */
        nav .fas {
            display: none;
        }



        @media only screen and (max-width:600px) {

            .header-text {
                margin-top: 100%;
                font-size: 16px;
            }

            .header-text h1 {
                font-size: 30px;
            }

            .sub-title {
                font-size: 40px;
            }

            .about-col-1,
            .about-col-2 {
                flex-basis: 100%;
            }

            .about-col-1 {
                margin-bottom: 30px;
            }

            .about-col-2 {
                font-size: 14px;
            }

            .tab-links {
                font-size: 16px;
                margin-right: 20px;
            }

            .contact-left,
            .contact-right {
                flex-basis: 100%;
            }

            .copyright {
                font-size: 14px;
            }

        }

        .sub-title:hover {
            /* background: #d6adff; */
            transform: translateY(-10px);
        }

        .sub-title {
            transition: background 0.5s, transform 0.5s;
        }


        #msg {
            color: #08d8ca;
            margin-top: -40px;
            display: block;
        }

        .header-text {
            width: 70%;
            height: 250px;
            background-color: #ffffff;
            color: #000000;
            text-align: center;
        }

        #about-us::before {
            content: "";
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(190, 156, 209, 0.649);
            /* Adjust the color and opacity as needed */
            z-index: 0;
            /* You can also add other styles like gradients or patterns here */
        }

        body {
            display: flex;
            flex-direction: column;
            /* justify-content: center; */
            /* align-items: center; */
            /* width: 100vw; */
            /* height: 100vh; */
            /* background-image: linear-gradient(-45deg, #e3eefe 0%, #efddfb 100%); */
        }

        .sidebar {
            position: fixed;
            width: 240px;
            left: -240px;
            height: 100%;
            background-color: #fff;
            transition: all .5s ease;
            z-index: 5;
        }

        .sidebar header {
            font-size: 28px;
            color: #353535;
            line-height: 70px;
            text-align: center;
            background-color: #fff;
            user-select: none;
            font-family: 'Lato', sans-serif;
        }

        .sidebar a {
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

        a.active,
        a:hover {
            border-left: 5px solid var(--accent-color);
            color: #fff;
            background: linear-gradient(to left, var(--accent-color), var(--gradient-color));
        }

        .sidebar a i {
            font-size: 23px;
            margin-right: 16px;
        }

        .sidebar a span {
            letter-spacing: 1px;
            text-transform: uppercase;
        }

        #check {
            display: none;
        }

        label #btn,
        label #cancel {
            position: absolute;
            left: 5px;
            cursor: pointer;
            color: #d6adff;
            border-radius: 5px;
            margin: 15px 30px;
            font-size: 29px;
            background-color: #e8d1ff;
            box-shadow: inset 2px 2px 2px 0px rgba(255, 255, 255, .5),
                inset -7px -7px 10px 0px rgba(0, 0, 0, .1),
                3.5px 3.5px 20px 0px rgba(0, 0, 0, .1),
                2px 2px 5px 0px rgba(0, 0, 0, .1);
            height: 45px;
            width: 45px;
            text-align: center;
            text-shadow: 2px 2px 3px rgba(255, 255, 255, 0.5);
            line-height: 45px;
            transition: all .5s ease;
            z-index: 5px;
        }

        label #cancel {
            opacity: 0;
            visibility: hidden;
        }

        #check:checked~.sidebar {
            left: 0;
        }

        #check:checked~label #btn {
            margin-left: 245px;
            opacity: 0;
            visibility: hidden;
        }

        #check:checked~label #cancel {
            margin-left: 245px;
            opacity: 1;
            visibility: visible;
        }

        @media(max-width : 860px) {
            .sidebar {
                height: auto;
                width: 70px;
                left: 0;
                margin: 100px 0;
            }

            header,
            #btn,
            #cancel {
                display: none;
            }

            span {
                position: absolute;
                margin-left: 23px;
                opacity: 0;
                visibility: hidden;
            }

            .sidebar a {
                height: 60px;
            }

            .sidebar a i {
                margin-left: -10px;
            }

            a:hover {
                width: 200px;
                color: #9884e4;
                background: inherit;
                z-index: 5;

            }

            .sidebar a:hover span {
                opacity: 1;
                visibility: visible;
            }
        }

        .sidebar>a.active,
        .sidebar>a:hover:nth-child(even) {
            --accent-color: #52d6f4;
            --gradient-color: #c1b1f7;
        }

        .sidebar a.active,
        .sidebar>a:hover:nth-child(odd) {
            --accent-color: #c1b1f7;
            --gradient-color: #A890FE;
        }


        .frame {
            width: 50%;
            height: 30%;
            margin: auto;
            text-align: center;
        }

        /* consultat */

        @import url('https://fonts.googleapis.com/css?family=Montserrat');

        .card-container {
	background-color: #b88eda;
	border-radius: 5px;
	box-shadow: 0px 10px 20px -10px rgba(0,0,0,0.75);
	color: #ffffff;
	padding-top: 30px;
	position: relative;
	width: 350px;
	max-width: 100%;
	text-align: center;
}

.card-container .pro {
	color: #231E39;
	background-color: #FEBB0B;
	border-radius: 3px;
	font-size: 14px;
	font-weight: bold;
	padding: 3px 7px;
	position: absolute;
	top: 30px;
	left: 30px;
}

.card-container .round {
	border: 1px solid #03BFCB;
	border-radius: 50%;
	padding: 7px;
}

button.primary {
	background-color: #905abd;
	/* border: 1px solid #2D2747; */
	border-radius: 3px;
	color: white;
	font-family: Montserrat, sans-serif;
	font-weight: 500;
	padding: 10px 5px;
}

button.primary.ghost {
	background-color: transparent;
	color: #02899C;
}

.skills {
	background-color: #905abd;
	text-align: left;
	padding: 15px;
	margin-top: 10px;
}

.skills ul {
	list-style-type: none;
	margin: 0;
	padding: 0;
}

.skills ul li {
	border: 1px solid #2D2747;
	border-radius: 2px;
	display: inline-block;
	font-size: 12px;
	margin: 0 7px 7px 0;
	padding: 7px;
}
.name {
	
	display: inline-block;
	font-size: 20px;
	margin: 0 7px 7px 0;
	padding: 7px;
	color: #2D2747;
	font-weight:600;
}
.countries {
	
	text-align: center;
	padding: 15px;
	padding-bottom:0px;
	
}

.countries ul {
	list-style-type: none;
	margin: 0;
	padding: 0;
}

.countries ul li {
	background-color: #03BFCB;
	border: 1px solid #03BFCB;
	border-radius: 3px;
	color: #231E39;
	display: inline-block;
	font-size: 12px;
	margin: 0 7px 7px 0;
	padding: 7px;
}


.qualifications {
	
	text-align: center;
	padding: 15px;
	padding-bottom:0px;
	
}

.qualifications ul {
	list-style-type: none;
	margin: 0;
	padding: 0;
}

.qualifications ul li {
	
	border: 1px solid #00433f;
	border-radius: 3px;
	color: #231E39;
	display: inline-block;
	font-size: 12px;
	margin: 0 7px 7px 0;
	padding: 7px;
}

.days {
	
	text-align: left;
	padding: 5px;
	margin-top: 10px;
}

.days ul {
	list-style-type: none;
	margin: 0;
	padding: 0;
}

.days ul li {
	border: 1px solid #2D2747;
	border-radius: 2px;
	display: inline-block;
	font-size: 12px;
	margin: 0 4px 4px 0;
	padding: 5px;
}

     
     
     
     
.box select[name="jobtype"], .box select[name="country"] {
  display: block;
  margin: 5px auto;
  background: #262e49;
  border: 0;
  border-radius: 5px;
  padding: 8px 10px;
  width: 320px;
  outline: none;
  color:  #a1a4ad;
  transition: all 0.2s ease-out;
  margin-left:22%;
  font-size: 13px;
}

.box select[name="jobtype"]:focus {
  border: 1px solid #79A6FE;
  
}

input[type="text"] {
    width: 100%;
    padding: 5px;
    margin: 5px 0;
    border: 1px solid #ccc;
    border-radius: 4px;
}
       
        /*  <!-- sidebar styling end here  --> */
    </Style>

</head>

<body>
   <!-- sidebar start here  -->
   <input type="checkbox" id="check">
      <label style="position: fixed; top: 60px; z-index: 1; left: -5px;" for="check">
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
   <a href="home.jsp"  class="active">
    <i class="fas fa-qrcode"></i>
    <span>Home</span>
  </a>
  <a href="admin-dashboard.jsp" >
    <i class="fas fa-qrcode"></i>
    <span>Dashboard</span>
  </a>

<a href="getuser?useractiontype=consultants" >
    <i class="fas fa-qrcode"></i>
    <span>Consultants</span>
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
       
      <a href="getuser?useractiontype=all" >
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

 
  <!-- sidebar end here  -->  
   <nav class="p-0 m-0 pt-2" style="z-index:10;">
    <img src="images/logo.png" alt="logo">
    <ul class="" id="sidemenu" >
        <li><a href="#header">Home</a></li>
        <li><a href="#about">About</a></li>
        <li><a href="#services">Extra-Curricular</a></li>
        <li><a href="#portfolio">Projects</a></li>
        <li><a href="#contact">Contact</a></li>
        
       
          
    <li ><a href="view-profile.jsp"><i class="fa fa-user-circle" aria-hidden="true" ></i>&nbsp;&nbsp; name</a></li> 
    
    <li ><a href="login.jsp"><i class="fa fa-user-circle" aria-hidden="true" ></i>&nbsp;&nbsp; Login</a></li> 

         
         <i class="fas fa-solid fa-xmark" onclick="closemenu()"> </i>
    </ul>
    
   
    <i class="fas fa-solid fa-bars" onclick="openmenu()"></i>
  </nav>
  
  <%
    User consultant = (User) request.getAttribute("consultant");
%>
    
<div class="row p-5 pb-0 m-0 mt-5" style="text-align: center;">
    
      
         <h2> Check out our availability and book the date and time that works for you</h2>
         
        
       
        
  </div>
  
 

  
   
        <!-- ---------------------------------------Consultants--------------------------------------------------------------------- -->




        <div class="row p-0 p-5  " style="margin-left: 140px; margin-top:0px;">
        
           <div class="container">
    <div class="row">
        <div class="col-sm mb-5">
            <div class="work">
                <div class="card-container">
                    <span class="pro">PRO</span>
                    <img class="round" src="https://randomuser.me/api/portraits/women/79.jpg" alt="user" />
                    <br>
                    <div class="name"><%= consultant.getName() %></div>
                    <h6><%= consultant.getOccupation() %></h6>
                    <div class="qualifications">
                        <ul>
                            <%
                                String educationalQualifications = consultant.getEducationalQualifications();
                                if (educationalQualifications != null && !educationalQualifications.isEmpty()) {
                                    String[] edus = educationalQualifications.split(",");
                                    for (String edu : edus) {
                            %>
                            <li><%= edu.trim() %></li>
                            <%
                                    }
                                }
                            %>
                        </ul>
                    </div>
                    <div class="countries">
                        <h6>Specialized Countries</h6>
                       <ul id="availableCountriesList">
                            <%
                                String specializedCountries = consultant.getSpecializedCountries();
                                if (specializedCountries != null && !specializedCountries.isEmpty()) {
                                    String[] countries = specializedCountries.split(",");
                                    for (String country : countries) {
                            %>
                            <li><%= country.trim() %></li>
                            <%
                                    }
                                }
                            %>
                        </ul>
                    </div>
                    <div class="skills">
                        <h6>Specialized Jobs</h6>
                        <ul id="availableJobsList">
                            <%
                                String specializedJobs = consultant.getSpecializedJobs();
                                if (specializedJobs != null && !specializedJobs.isEmpty()) {
                                    String[] jobs = specializedJobs.split(",");
                                    for (String job : jobs) {
                            %>
                            <li><%= job.trim() %></li>
                            <%
                                    }
                                }
                            %>
                        </ul>
                    </div>
                </div>
                <div class="layer">
                    <div class="days">
                        <h6>Available Days</h6>
                       <ul id="availableDaysList">
                            <%
                                String availableDays = consultant.getAvailableDays();
                                if (availableDays != null && !availableDays.isEmpty()) {
                                    String[] days = availableDays.split(",");
                                    for (String day : days) {
                            %>
                            <li><%= day.trim() %></li>
                            <%
                                    }
                                }
                            %>
                        </ul>
                    </div>
                    <div class="days">
                        <h6>Available Time Slots</h6>
                        <ul id="availableTimeSlotsList">
                            <%
                                String availableTimeSlots = consultant.getAvailableTimeSlots();
                                if (availableTimeSlots != null && !availableTimeSlots.isEmpty()) {
                                    String[] timeSlots = availableTimeSlots.split(",");
                                    for (String timeSlot : timeSlots) {
                            %>
                            <li><%= timeSlot.trim() %></li>
                            <%
                                    }
                                }
                            %>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
  


                              <div class="col-sm mb-5 p-5 m-5 mt-0 pt-1">
                                <div class="row"> 
                           <form  action="appointmentManager" method="post">
         <h4>Job<span>Consultancy</span></h4>
        <p>${feebackMessage}</p>
            <!-- Add the hidden input fields for consultantId and seekerId -->
            <input type="hidden" name="consultantId" value="<%= consultant.getUserId() %>">
            <input type="hidden" name="seekerId" value="<%= user.getUserId() %>">

            <div class="row mb-1">Select a Date</div>
            <div class="row">
                <input type="date" id="date" name="date" required>
            </div>

            <div class="row mb-1 mt-1">Select Time</div>
            <div class="row">
                <select name="time" id="time" required>
                    <!-- Add time options here -->
                </select>
            </div>

            <div class="row mb-1 mt-3">Select the country</div>
            <div class="row">
                <select name="country" id="country" required>
                    <!-- Add country options here -->
                </select>
            </div>

            <div class="row mb-1 mt-3">Select the job</div>
            <div class="row">
                <select name="job" id="job" required>
                    <!-- Add job options here -->
                </select>
            </div>

            <div class="row mb-1 mt-3">Add your qualifications so we can help you better</div>
            <div class="row">
                <textarea name="notes" style="height: 100px" required></textarea>
            </div>

           <!--  <input type="submit" value="Add Appointment"> -->
           
             
        <div>
                 
          <input type="hidden" name="appactiontype" value="addAppointment"/>
          <button style="position:relative;left:0%; " class="btn1" type="submit">Create User</button>
        </div>
        </form>
                            </div>

                        </div>
                        
                        
                        
                     <%--    
                        
                        <div class="col-sm mb-5 p-5 m-5 mt-0 pt-1">
    <div class="row">
    <!--     <form action="AddAppointmentServlet" method="post"> -->
        
        <form name="form1" class="box" action="appointmentManager" method="post">
         <h4>Job<span>Consultancy</span></h4>
        <p>${feebackMessage}</p>
            <!-- Add the hidden input fields for consultantId and seekerId -->
            <input type="hidden" name="consultantId" value="<%= consultant.getUserId() %>">
            <input type="hidden" name="seekerId" value="<%= session.getAttribute("userId") %>">

            <div class="row mb-1">Select a Date</div>
            <div class="row">
                <input type="date" id="date" name="date" required>
            </div>

            <div class="row mb-1 mt-1">Select Time</div>
            <div class="row">
                <select name="time" id="time" required>
                    <!-- Add time options here -->
                </select>
            </div>

            <div class="row mb-1 mt-3">Select the country</div>
            <div class="row">
                <select name="country" id="country" required>
                    <!-- Add country options here -->
                </select>
            </div>

            <div class="row mb-1 mt-3">Select the job</div>
            <div class="row">
                <select name="job" id="job" required>
                    <!-- Add job options here -->
                </select>
            </div>

            <div class="row mb-1 mt-3">Add your qualifications so we can help you better</div>
            <div class="row">
                <textarea name="notes" style="height: 100px" required></textarea>
            </div>

           <!--  <input type="submit" value="Add Appointment"> -->
           
             
        <div>
                 
          <input type="hidden" name="useractiontype" value="addAppointment"/>
          <button style="position:relative;left:0%; " class="btn1" type="submit">Create User</button>
        </div>
        </form>
    </div>
</div>
                        
 --%>
                              <div class="col-sm mb-5 p-5  mt-0 pt-1">
                              Your booking details are as follows
                              <div class="card-container mt-2" >
                              <div  style=" padding-left: 30px; text-align: left;line-height: 2.5rem">
                               
                                   <li > Name:Ridmi yatigammana  </li>
                                   <li >Email: ridmi.y@gmail.com </li>
                                   <li >Consultant:jhjh jhjhj</li>
                                   <li >Selected job:jhjh jhjhj</li>
                                   <li>Selected country:jhjh jhjhj</li>
                                   
                              </div>
                                                                  
                                            
                                              <div class="skills" style=" padding-left: 30px; ">
                                                <li class="pb-2">Selected date and time</li>
                                                <ul style="padding-left: 30px;">
                                                    <li>10/20/2023 </li>
                                                  
                                                  <li>10.00am </li>
                                              
                                                   </ul>
                                            </div>

                                            <div class="countries">
                                                <!-- <h6>  Country you need help with</h6>  -->
                                                <ul>
                                                    
                                                    <li> Confirm Booking</li>
                                                   
                                                
                                                </ul>
                                               
                                         </div>
                               </div>
                                          
                           </div>
                              </div>
                         
         
<!--bnbnbnbnbnbnb  -->



        
        <!-- ------------------------------contact-------------------------------- -->
     
          

            <div class="copyright">
                <p> Copyright � Ridmi. Made with <i class="fa-solid fa-heart"></i> by Easy Tutorials</p>
            </div>

        </div>

        <!-- --------------------javascript-------------------------- -->


      <!--   <script>
            // Get the date input element
            const dateInput = document.getElementById("date");
    
            // Replace this with your consultant's available days
            const availableDays = ["Monday", "Tuesday", "Wednesday"]; // Example available days
    
            dateInput.addEventListener("input", function() {
                // Get the selected date
                const selectedDate = dateInput.value;
    
                // Get the current day of the week (e.g., "Monday")
                const currentDay = new Date(selectedDate).toLocaleDateString('en-US', { weekday: 'long' });
    
                if (availableDays.includes(currentDay)) {
                    // The selected date is available
                    dateInput.setCustomValidity(""); // Clear any custom validation messages
                } else {
                    // The selected date is unavailable
                    dateInput.setCustomValidity("Consultant is not available on " + currentDay);
                }
            });
        </script> -->



<script>
    // Get the date input element
    const dateInput = document.getElementById("date");

    // Initialize availableDays as an empty array
    let availableDays = [];

    // Replace this with your consultant's available days
    // This code will populate availableDays from the HTML list
    const availableDaysList = document.getElementById("availableDaysList");
    const availableDaysItems = availableDaysList.getElementsByTagName("li");
    
    for (let i = 0; i < availableDaysItems.length; i++) {
        availableDays.push(availableDaysItems[i].textContent.trim());
    }

    dateInput.addEventListener("input", function() {
        // Get the selected date
        const selectedDate = dateInput.value;

        // Get the current day of the week (e.g., "Monday")
        const currentDay = new Date(selectedDate).toLocaleDateString('en-US', { weekday: 'long' });

        if (availableDays.includes(currentDay)) {
            // The selected date is available
            dateInput.setCustomValidity(""); // Clear any custom validation messages
        } else {
            // The selected date is unavailable
            dateInput.setCustomValidity("Consultant is not available on " + currentDay);
        }
    });
</script>


<script>
    // Get the time select element
    const timeSelect = document.getElementById("time");

    // Initialize availableTimeSlots as an empty array
    let availableTimeSlots = [];

    // Replace this with your consultant's available time slots
    // This code will populate availableTimeSlots from the HTML list
    const availableTimeSlotsList = document.getElementById("availableTimeSlotsList");
    const availableTimeSlotsItems = availableTimeSlotsList.getElementsByTagName("li");

    for (let i = 0; i < availableTimeSlotsItems.length; i++) {
        availableTimeSlots.push(availableTimeSlotsItems[i].textContent.trim());
    }

    // Populate the select options
    availableTimeSlots.forEach((timeSlot) => {
        const option = document.createElement("option");
        option.value = timeSlot;
        option.textContent = timeSlot;
        timeSelect.appendChild(option);
    });
</script>


<script>
    // Get the country and job select elements
    const countrySelect = document.getElementById("country");
    const jobSelect = document.getElementById("job");

    // Initialize arrays for available countries and jobs
    let availableCountries = [];
    let availableJobs = [];

    // Replace this with your consultant's available countries and jobs
    // This code will populate availableCountries and availableJobs from the HTML lists
    const availableCountriesList = document.getElementById("availableCountriesList");
    const availableCountriesItems = availableCountriesList.getElementsByTagName("li");
    const availableJobsList = document.getElementById("availableJobsList");
    const availableJobsItems = availableJobsList.getElementsByTagName("li");

    for (let i = 0; i < availableCountriesItems.length; i++) {
        availableCountries.push(availableCountriesItems[i].textContent.trim());
    }

    for (let i = 0; i < availableJobsItems.length; i++) {
        availableJobs.push(availableJobsItems[i].textContent.trim());
    }

    // Populate the select options for country
    availableCountries.forEach((country) => {
        const option = document.createElement("option");
        option.value = country;
        option.textContent = country;
        countrySelect.appendChild(option);
    });

    // Populate the select options for job
    availableJobs.forEach((job) => {
        const option = document.createElement("option");
        option.value = job;
        option.textContent = job;
        jobSelect.appendChild(option);
    });
</script>

</body>

</html>