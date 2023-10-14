<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ taglib prefix="tag" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ page import="com.jobConsultancyScheduler.model.User" %>
    <%@ page import="com.jobConsultancyScheduler.model.AccessRight" %>
<!DOCTYPE html>
<html>

    <link href="https://fonts.googleapis.com/css2?family=Lato&display=swap" rel="stylesheet">
  <link href="https://use.fontawesome.com/releases/v5.6.1/css/all.css" rel="stylesheet">
  <script src="https://kit.fontawesome.com/1a4bb98cfa.js" crossorigin="anonymous"></script>
  
	<meta charset="ISO-8859-1">
  <title>Job-Seekers

  </title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
  <link rel="icon" type="image/x-icon" href="https://static.vecteezy.com/system/resources/previews/010/430/526/non_2x/job-for-immigrants-app-icon-refugee-employment-construction-worker-finding-work-abroad-hard-hat-worker-handyman-uiux-user-interface-web-or-mobile-application-isolated-illustration-vector.jpg">
  <link rel="preconnect" href="https://fonts.gstatic.com">
  <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500&display=swap" rel="stylesheet">
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<Style>
*{margin:0;
        padding: 0;
        font-family: 'Poppins',sans-serif;
        box-sizing: border-box;
        }
        
        html{
            scroll-behavior: smooth;
        }
        
        body{
            /* background: #080808; */
            color:#000000;
        }
        #header{
            width: 100;
            height: 100vh;
            background-size: cover;
            background-position:center  ;
        }

        #about-us{
            width: 100;
            height: 100vh;
            background-size: cover;
            background-position:center  ;
        }
        
        /* .container{
            padding: 10px ;
        } */
        
        nav{
        
            display: flex;
            align-items: center;
            justify-content: space-between;
            flex-wrap: wrap;
            width: 100%;
            height: 60px;
            background-color: #ffffff;
            position: fixed;
        }
        
        .logo{
            width:140px;
            }
        
        nav ul li {
            display: inline-block;
            list-style:none;
            margin: 10px 20px;
        }
        
        nav ul li a{
            color: #000000;
            text-decoration: none ;
            font-size:16px;
            position: relative;
        }
        
        nav ul li a::after{ 
            content: '';
            width :0;
            height:3px;
            background:#08d8ca;
            position:absolute;
            left:0;
            bottom:-6px;
            transition: 0.4s;
        
        }
        
        nav ul li a:hover::after{
        width:100%;
        
        }
        .header-text{
        margin-top: 15%;
        font-size: 22px;
        }
        .header-text h1{
            font-size: 50px;
            margin-top: 20px;
        }
        
        .header-text h1 span{
            color: #08d8ca ;
        }
        
        /* ------------------about ------------------------------- */
        
        #about{
            padding: 80px 0;
            color:#ababab;
        
        }
        .row{
            display:flex;
            justify-content:space-between;
            flex-wrap : wrap;
        }
        
        .about-col-1{
            flex-basis: 35%;
        }
        
        .about-col-1 img {
            width:100%;
            border-radius: 15px;
        }
        .about-col-2{
            flex-basis:60%;
            text-align: justify;
        }
        .sub-title{
            font-size: 50px;
            font-weight: 600;
            color: #000000;
        }
        .tab-titles{
            display: flex;
            margin: 20px 0 40px;
        }
        .tab-links{
            margin-right: 50px;
            font-size: 18px;
            font-weight: 500;
            cursor: pointer;
            position: relative;
        }
        .tab-links::after{
            content: '';
            width: 0;
            height: 3px;
            background: #08d8ca;
            position: absolute;
            left: 0;
            bottom: -8px;
            transition: 0.5s;
        }
        
        .tab-links.active-link::after{
            width: 50%;
        }
        /* .tab-contents{
            font-size: 14px;
        } */
        .tab-contents ul li{
            list-style:none;
            margin: 10px 0px;
            
        }
        .tab-contents ul li span {
            color: #21dbcfe3;
            font-size: 14px;
        }
        
        .tab-contents{
            display: none;
        }
        
        .tab-contents.active-tab{
            display: block;
        }
        
        /* -------------services-------------- */
        
        #services{
            padding: 30px 0;  
            height: 90vh;
        }
        .services{
            display: grid;
            grid-template-columns: repeat(auto-fit,minmax(250px,1fr));
            grid-gap:40px;
            margin-top: 50px;
        }
        
        .services div{
            /* background: #262626; */
            padding:40px;
            font-size: 13px;
            font-weight: 300;
            border-radius:10px;
            transition:background 0.5s , transform 0.5s;
        }
        
        .services div i{
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
        
        .services div:hover{
            /* background: #d6adff; */
            transform: translateY(-10px);
        }
        



        /* ///////////////// */

        .services-list{
            display: grid;
            grid-template-columns: repeat(auto-fit,minmax(250px,1fr));
            grid-gap:40px;
            margin-top: 50px;
        }
        
        .services-list div{
            background: #262626;
            padding:40px;
            font-size: 13px;
            font-weight: 300;
            border-radius:10px;
            transition:background 0.5s , transform 0.5s;
        }
        
        .services-list div i{
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
        
        .services-list div:hover{
            background: #d6adff;
            transform: translateY(-10px);
        }
        
        /* ---------------portfolio------------------------- */
        
        #portfolio{
            padding: 50px 0;
        }
        .work-list{
            display: grid;
            grid-template-columns: repeat(auto-fit,minmax(250px,1fr));
            grid-gap:40px;
            margin-top: 50px;
        }
        
        .work{
            border-radius:10px ;
            position:relative;
            overflow: hidden;
        }
        
        .work img{
            width: 100%;
            border-radius:10px ;
            display: block;
            transition: transform 0.5s;
            
        
        }
        .layer{
            width: 100%;
            height:0;
            background: linear-gradient(rgba(0,0,0,0.6),#d6adff);
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
            transition:height 0.5s;
        
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
            width:60px;
            height: 60px;
            border-radius:50% ;
            text-align: center;
        }
        
        .work:hover img{
            transform: scale(1.1);
        
        }
        
        .work:hover .layer{
            height: 100%
        }
        
        .btn{
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
        
        .btn:hover{
            background: #d6adff;
        }
        
        /* ----------------contact------------------- */
        
        .contact-left{ 
            flex-basis: 35%;
        }
        
        .contact-right{ 
            flex-basis: 60%;
        }
        .contact-left p{
            margin-top: 30px;
        }
        
        .contact-left p i{
            color:#d6adff;
            margin-right: 15px;
            font-size: 25px;
        
        }
        .social-icons{
            margin-top:30px;
        }
        
        .social-icons a{
            text-decoration: none;
            font-size: 30px;
            margin-right: 15px;
            color: #ababab;
            display: inline-block;
            transition: transform 0.5s;
        }
        .social-icons a:hover{
            color: #d6adff;
            transform: translateY(-5px);
        }
        
        .btn.btn2{
            display: inline-block;
            background: #d6adff;
            
        }

        .btn.btn2:hover{
            background: #5b4a6b;
            color: #ffffff;
        }
        .contact-right form{
            width:100%;
        }
        form input, form textarea{
            width: 100%;
            border: 0;
            outline: none;
           /*  background: #262626; */
            padding: 15px;
            margin: 15px 0;
            color:#000000;
            font-size: 18px;
            border-radius:6px;
            border: 1px solid #d6adff;
        }
        form .btn2{
            padding: 14px 60px;
            font-size: 18px;
            margin-top: 20px;
            cursor: pointer;
        
        }
        
        .copyright{
            width: 100%;
            text-align: center;
            padding: 25px 0;
            background: #262626;
            font-weight: 300;
            margin-top: 20px;
        
        }
        .copyright i{
            color: #d6adff;
        }
        /* -----css for small screen------------ */
        nav .fas {
            display: none;
        }
        
        @media only screen and (max-width:600px) {
           
            .header-text{
                margin-top: 100%;
                font-size: 16px;
            }
            .header-text h1{
                font-size: 30px;
            }

            .sub-title{
                font-size: 40px;
            }
        
            .about-col-1, .about-col-2{
                flex-basis: 100%;
            }
            .about-col-1{
                margin-bottom:30px ;
            }
            .about-col-2{
                font-size: 14px;
            }
            .tab-links{
                font-size:16px ;
                margin-right: 20px;
            }
            .contact-left, .contact-right{
                flex-basis: 100%;
            }
            .copyright{
                font-size: 14px;
            }
        
        }
        #msg{
            color: #08d8ca;
            margin-top: -40px;
            display: block;
        }

        .header-text{
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
  background: rgba(190, 156, 209, 0.649); /* Adjust the color and opacity as needed */
  z-index: 0;
  /* You can also add other styles like gradients or patterns here */
}



    /*  <!-- sidebar styling start here  -->*/

    /* @media print {
            table {
                width: 100%;
            }
        } */

        /* @page {
            size: A4 portrait;
            margin: 0;
        } */
    /* *{
  margin: 0;
  padding: 0;
  text-decoration: none;
}
:root {
  --accent-color: #fff;
  --gradient-color: #FBFBFB;
} */
body{
  display: flex;
  flex-direction: column;
  /* justify-content: center; */
  /* align-items: center; */
   /* width: 100vw; */
  /* height: 100vh; */
  /* background-image: linear-gradient(-45deg, #e3eefe 0%, #efddfb 100%); */
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

/* h2 {
  position: relative;
  text-align: center;
  color: #353535;
  font-size: 60px;
  font-family: 'Lato', sans-serif;
  margin: 0;
  color: #a759f5;
} */

/* p {
  font-family: 'Lato', sans-serif;
  font-weight: 300;
  text-align: center;
  font-size: 30px;
  color: #d6adff;
  margin: 0;
} */
 /*  <!-- sidebar styling end here  --> */
    </Style>

</head>
<body >
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
  
  
  <!--   nav -->
  <nav class="p-0 m-0 pt-2">
    <img src="images/logo.png" alt="logo">
    <ul class="" id="sidemenu" >
        <li><a href="#header">Home</a></li>
        <li><a href="#about">About</a></li>
        <li><a href="#services">Extra-Curricular</a></li>
        <li><a href="#portfolio">Projects</a></li>
        <li><a href="#contact">Contact</a></li>
        
          <% if (user != null) { %>
          
    <li ><a href="view-profile.jsp"><i class="fa fa-user-circle" aria-hidden="true" ></i>&nbsp;&nbsp; <%= user.getName() %></a></li> 
    
  <% } else { %>
    <li ><a href="login.jsp"><i class="fa fa-user-circle" aria-hidden="true" ></i>&nbsp;&nbsp; Login</a></li> 
  <% } %>
         
         <i class="fas fa-solid fa-xmark" onclick="closemenu()"> </i>
    </ul>
    
   
    <i class="fas fa-solid fa-bars" onclick="openmenu()"></i>
  </nav>
<!--   nav -->
  <div class="row p-0 m-0">
    <div class="p-0 m-0 d-flex align-items-end d-flex justify-content-center" id="header" style="background-image: url(https://chuckgarcia.com/wp-content/uploads/2017/12/bigstock-167128436.jpg);"  >
  
      <div class="container d-flex justify-content-center p-0 m-0">       

        <div class="header-text pt-2" >
          <p>Software Engineering Undergarduate</p>
          <h2>Hi, I'm <span>Ridmi Yatigammana </span> <br> from Sri Lanka</h2>
          <a href="#" class="btn">See more</a>
        </div>
        
      </div>
    </div>
  </div>

 <!-- Services  -->


 <div id="services" class="mt-3 mb-3 pt-5" >
  <div class="container pt-5" style="text-align: center;height: 90vh;">
    <!-- <h1>Extra-Curricular Activities</h1> -->
    <div class="services justify-content-center">


        <div class="m-2">
          <!-- <i class="fa-sharp fa-solid fa-people-group"></i> -->
          <h2>Services</h2>
          <p style="text-align: justify;">
            I'm a paragraph.
            Click here to add your own text and edit me.
              It’s easy. Just click “Edit Text” or double click
              me to add your own content and make changes to the font.
                I’m a great place for you to tell a story and let your
                users know a little more about you.
          </p>
          <a href="#" class="btn">See more</a>
        </div>

   
        <div class="m-2">
          <!-- <i class="fa-sharp fa-solid fa-people-group"></i> -->
          <h2>Services</h2>
          <p style="text-align: justify;">
            I'm a paragraph.
              Click here to add your own text and edit me.
              It’s easy. Just click “Edit Text” or double click
                me to add your own content and make changes to the font.
                I’m a great place for you to tell a story and let your
                  users know a little more about you.
          </p>
          <a href="#" class="btn">See more</a>
        </div>
       
          <div class="m-2">
            <!-- <i class="fa-sharp fa-solid fa-people-group"></i> -->
            <h2>Services</h2>
            <p style="text-align: justify;">
              I'm a paragraph.
                Click here to add your own text and edit me.
                It’s easy. Just click “Edit Text” or double click
                  me to add your own content and make changes to the font.
                  I’m a great place for you to tell a story and let your
                    users know a little more about you.
            </p>
            <a href="#" class="btn">See more</a>
          </div>
 
    </div>
  </div>

<!-- About us -->


<div class="p-0 m-0 d-flex align-items-center services justify-content-center" id="about-us" style="background-image: url(https://images.unsplash.com/photo-1474127773417-aec7504236d2?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aWN5JTIwbW91bnRhaW58ZW58MHx8MHx8fDA%3D&w=1000&q=80); position: relative;">
  <div style="text-align: center; z-index: 1;">
    <h1>About Us</h1>
    <p>Software Engineering Undergraduate</p>
  </div>
</div>

<!--  -->

  <div class="p-0 m-0 " style=" background-color: #ffffff; height:60vh;color: #5b4a6b; font-size: 2.5rem;">
    <!-- <div class="container m-0 p-0 pt-2" style="text-align: center;height: 70vh; background-color: #5b4a6b; width: 100%;"> -->
<div class="row p-0 m-0 pt-5 font-weight-bold" style="text-align: center;margin-top: 50px;"> <h1> <b> We are good with numbers</b> </h1></div>
    <div class="m-0 services justify-content-center">
    
      <div class="m-2 font-weight-bold" style="font-size: 5.5rem">
        <!-- <i class="fa-sharp fa-solid fa-people-group"></i> -->
        10 <br>
        <span><h5>Years of Experience</h2></span>
      
      </div>
     
      <div class="m-2 font-weight-bold" style="font-size: 5.5rem">
        <!-- <i class="fa-sharp fa-solid fa-people-group"></i> -->
        23<br>
        <span><h5>Qualified Experts</h2></span>
      
      </div>
      <div class="m-2 font-weight-bold" style="font-size: 5.5rem">
        <!-- <i class="fa-sharp fa-solid fa-people-group"></i> -->
        93 <br>
        <span><h5>Clients Every Year</h2></span>
      
      </div>
      <div class="m-2 font-weight-bold" style="font-size: 5.5rem">
        <!-- <i class="fa-sharp fa-solid fa-people-group"></i> -->
        88<br>
        <span><h5>Success Stories</h2></span>
      
      </div>
    </div>

</div>
<!-- ////////////// -->





  <!-------------------------------------------------- about  ----------------------------------------- -->
<div id="about" style=" background-color:rgba(218, 186, 247, 0.195)">
  <div class="container" style="height: 85vh; ">
    <div class="row mt-5">
      <div class="about-col-1 ">
        
        <h1 class="mt-5 pt-5 sub-title " style="color: #5b4a6b;">Our Experts Are the Finest</h1>
        <!-- <img src="https://images.inc.com/uploaded_files/image/1920x1080/getty_468868827_970566970450047_60099.jpg" alt="user image"> -->
      </div>
      <div class="about-col-2">
        <p>I'm a paragraph. Click here to add your own text and edit me.
          <div class="tab-titles">
            <p class="tab-links active-link" onclick="opentab('Skills')">Skills</p>
            <p class="tab-links"onclick="opentab('Education')">Education</p>
            <!-- <p class="tab-links"onclick="opentab('Extra-Curricular')">Extra-Curricular</p> -->
            <p class="tab-links"onclick="opentab('Languages')">Languages</p>
          </div>
          <!-- skills -->
          <div class="tab-contents active-tab" id="Skills">
            
            <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
            <div >
              <canvas id="myLineChart"></canvas>
            </div>
          
            <script>
              const data1 = {
                labels: ['January', 'February', 'March', 'April', 'May'],
                datasets: [{
                  label: 'Monthly Sales',
                  data: [50, 60, 70, 65, 80],
                  borderColor: 'rgb(75, 192, 192)', // Line color
                  borderWidth: 2, // Line width
                  fill: false, // Do not fill the area under the line
                }]
              };
          
              const ctx1 = document.getElementById('myLineChart').getContext('2d');
              const myLineChart = new Chart(ctx1, {
                type: 'line', // Specify the chart type as 'line'
                data: data1
              });
            </script>
          </div>          
          <!-- Education -->
          <div class="tab-contents" id="Education">
           
    <div>
      <canvas id="myChart"></canvas>
    </div>
    

 
          </div>
          <!-- Extra-Curricular -->
          <!-- <div class="tab-contents" id="Extra-Curricular">
            <ul>
              <li><span>2018 - 2019</span><br> Senior Prefect <br>Pushpadana Girls' College. Kandy</li>
              <li><span>2017 - 2018</span><br> Committee member of English 
                medium unit<br>Pushpadana Girls' College. Kandy</li>
              
            </ul>
          </div> -->
          <!-- Work History  -->
          <div class="tab-contents row" id="Languages">

            <div style="width: 320px; height: 420px;">
              <canvas id="doughnutChart"></canvas>
            </div>
            <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
            <script>
              const data = {
                labels: ['Red', 'Blue', 'Yellow'],
                datasets: [{
                  label: 'My First Dataset',
                  data: [300, 50, 100],
                  backgroundColor: ['rgb(255, 99, 132)', 'rgb(54, 162, 235)', 'rgb(255, 205, 86)'],
                  hoverOffset: 4
                }]
              };
            
              const chartContext = document.getElementById('doughnutChart').getContext('2d');
              const myChart = new Chart(chartContext, {
                type: 'doughnut',
                data: data
              });
            </script>
            
            
          </div>
      </div>
    </div>

  </div>
</div>
<!-- ///////////// -->


  <div class="p-0 m-0 " style=" background-color: #ffffff; height: 40vh;color: #5b4a6b; font-size: 2.5rem;">
    <!-- <div class="container m-0 p-0 pt-2" style="text-align: center;height: 70vh; background-color: #5b4a6b; width: 100%;"> -->
<div class="row pt-5  font-weight-bold" style="text-align: center;padding-top: 500px; "> <h1> <b> Our Partners</b> </h1></div>
    <div class="m-0 services justify-content-center" style="margin-top: 50px;">
      <div class="m-2 font-weight-bold" style="font-size: 2.5rem">
        <!-- <i class="fa-sharp fa-solid fa-people-group"></i> -->
        werewrer
      
      </div>
     
      <div class="m-2 font-weight-bold" style="font-size: 2.5rem">
        <!-- <i class="fa-sharp fa-solid fa-people-group"></i> -->
        werewrer
      
      </div>
      <div class="m-2 font-weight-bold" style="font-size: 2.5rem">
        <!-- <i class="fa-sharp fa-solid fa-people-group"></i> -->
        werewrer
      </div>
      <div class="m-2 font-weight-bold" style="font-size: 2.5rem">
        <!-- <i class="fa-sharp fa-solid fa-people-group"></i> -->
        werewrer
      
      </div>
    </div>
  <!-- </div> -->
</div>
<!-- ---------------------------------------services--------------------------------------------------------------------- -->



<!-- ----------------portfolio-------------------------------------------------- -->


<div class="p-0 m-0 " style=" background-color: #f9f2fc; height:60vh;color: #5b4a6b; font-size: 2.5rem;">
<div class="row pt-5 font-weight-bold p-0 m-0" style="text-align: center;margin-top:100px;"> <h1 style="margin-top: 70px;"> <b> Start your global work adventure</b> </h1></div>
  <div class="m-0 services justify-content-center">
  
    <a href="#"  class="btn btn2">Register Now</a>
  </div>

</div>
<!-- ------------------------------contact-------------------------------- -->
<div id="contact" >
  <div class="container">
    <div class="row" style=" margin-top: 100px;">
      <div class="contact-left">
        <h1 class="sub-title margin-top: 50px;">Contact Us</h1>
        <p><i class="fa-solid fa-paper-plane"></i> ridmiyatigammana@gmail.com</p>
        <p><i class="fa-solid fa-square-phone"></i> (+94)71-954 3823</p>
        <div class="social-icons">
          <a href="https://www.linkedin.com/in/ridmi-yatigammana-b42383214/"><i class="fa-brands fa-linkedin"></i></a>
          <a href="https://github.com/Ridmi211"><i class="fa-brands fa-github"></i></a>
         <a href="https://www.instagram.com/ridmi_y_y/"><i class="fa-brands fa-instagram"></i></a> 
        </div>
        <a href="images/Resume- Ridmi Yatigammana.pdf" download class="btn btn2">Download CV</a>
      </div>
      <div class="contact-right">
      <form name="submit-to-google-sheet">
        <input type="text" name="Name" placeholder="Your Name" required >
        <input type="email" name="email" placeholder="Your Email"  required>
        <textarea name="Message" rows="6" placeholder="Your Message"></textarea>
        <button type="submit" class="btn btn2">Submit</button>
      </form>
      <span id="msg"></span>
    </div>
    </div>
  </div>

  <div class="copyright">
    <p> Copyright © Ridmi. Made with <i class="fa-solid fa-heart"></i> by Easy Tutorials</p>
  </div>
  
</div>

<!-- --------------------javascript-------------------------- -->

<script>

  var tablinks= document.getElementsByClassName("tab-links");
  var tabcontents= document.getElementsByClassName("tab-contents");
  function opentab(tabname){
    for(tablink of tablinks){
      tablink.classList.remove("active-link");
    }
    for(tabcontent of tabcontents){
      tabcontent.classList.remove("active-tab");
    }
    event.currentTarget.classList.add("active-link");
    document.getElementById(tabname).classList.add("active-tab");

  }
</script>

<script>
  var sidemenu=document.getElementById("sidemenu");

  function openmenu(){
    sidemenu.style.right="0"
  }

  function closemenu(){
    sidemenu.style.right="-200px"
  }





</script>

<script>
  const scriptURL = 'https://script.google.com/macros/s/AKfycbwjcx0iILVo5hybLY6R97WYDrv3PQ7RoVLotpwiMk7FAUS7EPA5Ajsnsw6sr7zWa1V6/exec'
  const form = document.forms['submit-to-google-sheet']
  const msg= document.getElementById("msg")

  form.addEventListener('submit', e => {
    e.preventDefault()
    fetch(scriptURL, { method: 'POST', body: new FormData(form)})
      .then(response => {
        msg.innerHTML="Message sent successfully"
        setTimeout(function(){
          msg.innerHTML=""
        },5000)
      form.reset()
      })


      .catch(error => console.error('Error!', error.message))
  })
</script>
<!-- chart-js -->
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

   
<script>
  const ctx = document.getElementById('myChart');

  new Chart(ctx, {
    type: 'bar',
    data: {
      labels: ['Red', 'Blue', 'Yellow', 'Green', 'Purple', 'Orange'],
      datasets: [{
        label: '# of Votes',
        data: [12, 19, 3, 5, 2, 3],
        borderWidth: 1
      }]
    },
    options: {
      scales: {
        y: {
          beginAtZero: true
        }
      }
    }
  });
</script>


</body>
</html>

