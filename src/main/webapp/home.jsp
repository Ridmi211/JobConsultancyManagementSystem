<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ taglib prefix="tag" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ page import="com.jobConsultancyScheduler.model.User" %>
    <%@ page import="com.jobConsultancyScheduler.model.AccessRight" %>
     <%@ page import="com.jobConsultancyScheduler.service.AppointmentService" %>
        <%@ page import="com.jobConsultancyScheduler.service.UserService" %>
          <%@ page import="com.jobConsultancyScheduler.service.MessageService" %>
       
       
       <%@ page import="java.time.Year" %>
<%@ page import="java.util.List" %>
<%@ page import="com.jobConsultancyScheduler.dao.AppointmentManagerImpl" %>

<%
    // Instantiate the AppointmentManagerImpl or get it from your application context
    AppointmentManagerImpl appointmentManager = new AppointmentManagerImpl();

    // Get the monthly appointment counts for the current year
    List<Integer> monthlyCounts = appointmentManager.getMonthlyAppointmentCounts();
%>   
          <%



  
    	  AppointmentService appointmentService = AppointmentService.getAppointmentService();
          UserService userService = UserService.getUserService();

        int totalAppointmentsCount = appointmentService.getTotalAppointmentsCount();
        int completedAppointmentsCount = appointmentService.getCompletedAppointmentsCount();
        int requestedAppointmentsCount = appointmentService.getRequestedAppointmentsCount();
        int consultantConfirmedAppointmentsCount = appointmentService.getConsultantConfirmedAppointmentsCount();
        int consultantRejectedAppointmentsCount = appointmentService.getConsultantRejectedAppointmentsCount();
        int seekerCancelledAppointmentsCount = appointmentService.getSeekerCancelledAppointmentsCount();
        int adminRequestedAllAppointmentsCount =appointmentService.getAdminRequestedAllAppointmentsCount();
        int allUserCount=userService.getAllUsersCount();
        int pendingUserCount=userService.getPendingUsersCount();
   
        MessageService messageService = MessageService.getMessageService();
        int newMessagesCount = messageService.getNewMessagesCount();
  
%>
   
    
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
<link rel="stylesheet" type="text/css" href="css/home-style.css">

<link rel="stylesheet" type="text/css" href="css/navbar-style.css">

<Style>
.main-title{
  color: #584674;
            font-size: 60px;
}


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
 <jsp:include page="sidebar.jsp" />
  
</div>

 
  <!-- sidebar end here  -->  
  
  
  <!--   nav -->
  <nav class="p-0 m-0 pt-0">
    <img src="images/logo.png" alt="logo">
    <ul class="" id="sidemenu" >
        <li><a href="#header">Home</a></li>
        <li><a href="#about">About</a></li>
        <li><a href="#services">Extra-Curricular</a></li>
        <li><a href="#portfolio">Projects</a></li>
        <li class="m-0"><a class="m-0" href="#contact">Contact</a></li>
        
               <% if (user != null) { %>
          
    <li ><a href="view-profile.jsp"><i class="fa fa-user-circle" aria-hidden="true" ></i>&nbsp;&nbsp; <%= user.getName() %></a></li> 
        <li ><a href="logout.jsp"><i class="fa fa-sign-out" aria-hidden="true" ></i>&nbsp;&nbsp;Logout</a></li> 
  <% } else { %>
    <li ><a href="login.jsp"><i class="fa fa-user-circle" aria-hidden="true" ></i>&nbsp;&nbsp; Login</a></li> 
  <% } %>
         
  </nav>
<!--   nav -->
  <div class="row p-0 m-0">
    <div class="p-0 m-0 d-flex align-items-end d-flex justify-content-center" id="header" style="background-image: url(https://images.successstory.com/img_inspiration/Career-Development-for-Success-101:-What-You-Need-to-Know-About-Advancing-Your-Professional-Life-for-the-Better_1508758128.jpg);"  >
  
      <div class="container d-flex justify-content-center p-0 m-0">       

        <div class="header-text pt-2" >
          <div class="mt-2" ><p>Unlock Your International Career Potential</p></div>
          <div class="main-title">THRIVE GLOBALLY</div>
         <a href="getuser?useractiontype=consultants" class="btn-purple" style="text-size:12px;">Schedule Your Consultation</a>
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
          <a href="#" class="btn-purple">See more</a>
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
          <a href="#" class="btn-purple">See more</a>
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
            <a href="#" class="btn-purple">See more</a>
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
          
         <%--    <script>
              const data1 = {
                labels: ['hello', 'February', 'March', 'April', 'May'],
                datasets: [{
                  label: 'Monthly Sales',
                  data: [<%= completedAppointmentsCount %>, <%= consultantRejectedAppointmentsCount %>, <%= totalAppointmentsCount %>, <%= newMessagesCount %>, <%= pendingUserCount %>],
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
            </script> --%>
            
            <script>
    const data1 = {
        labels: ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'],
        datasets: [{
            label: 'Monthly Appointments',
            data: [<%= monthlyCounts.get(0) %>, <%= monthlyCounts.get(1) %>, <%= monthlyCounts.get(2) %>, <%= monthlyCounts.get(3) %>, <%= monthlyCounts.get(4) %>, <%= monthlyCounts.get(5) %>, <%= monthlyCounts.get(6) %>, <%= monthlyCounts.get(7) %>, <%= monthlyCounts.get(8) %>, <%= monthlyCounts.get(9) %>, <%= monthlyCounts.get(10) %>, <%= monthlyCounts.get(11) %>],
            borderColor: 'rgb(75, 192, 192)',
            borderWidth: 2,
            fill: false,
        }]
    };

    const ctx1 = document.getElementById('myLineChart').getContext('2d');
    const myLineChart = new Chart(ctx1, {
        type: 'line',
        data: data1,
        options: {
            scales: {
                x: {
                    type: 'category',
                    labels: ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'],
                },
                y: {
                    beginAtZero: true,
                }
            }
        }
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
          <div class="tab-contents " id="Languages">

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
  
    <a href="add-user.jsp"  class="btn btn2">Register Now</a>
  </div>

</div>


<!-- ------------------------------contact-------------------------------- -->
<div id="contact" >
 <jsp:include page="contact.jsp" />
 <!--  <div class="container">
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
     <form name="form1" class="box" action="contactManager" method="post" onsubmit="resetForm()">
        <input type="text" name="messangerName" placeholder="Your Name" required >
        <input type="text" name="messangerEmail" placeholder="Your Email"  required>
        <textarea name="messageBody" rows="6" placeholder="Your Message"></textarea>
        <button type="submit" class="btn btn2">Submit</button>
         <div>
                 
          <input type="hidden" name="msgactiontype" value="addMessage"/>
          <button  class="btn btn2" type="submit">Send</button>
        </div>
      </form>
      <span id="msg"></span>
    </div>
    </div>
  </div>

  <div class="copyright">
    <p> Copyright © Ridmi. Made with <i class="fa-solid fa-heart"></i> by Easy Tutorials</p>
  </div> -->
  
</div>

<!-- --------------------javascript-------------------------- -->
<script>
    function resetForm() {
        document.getElementById("form1").reset();
    }
</script>

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

<!-- <script>
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
</script> -->
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
        data: [<%= completedAppointmentsCount %>, <%= consultantRejectedAppointmentsCount %>, <%= totalAppointmentsCount %>, <%= newMessagesCount %>, <%= pendingUserCount %>],
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

