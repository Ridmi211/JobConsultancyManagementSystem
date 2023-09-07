<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

    <link href="https://fonts.googleapis.com/css2?family=Lato&display=swap" rel="stylesheet">
  <link href="https://use.fontawesome.com/releases/v5.6.1/css/all.css" rel="stylesheet">
  
  <title>Job-Seekers

  </title>
  <base href="/">
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
  padding-bottom: 50px;
  background-attachment: fixed;
      background-image: linear-gradient(-45deg, #bfdef7 0%, #dfb9f9 100%);
background-repeat: no-repeat;
/* background-position: ; */
  /* padding-top: 0px; */
  display: flex;
  flex-direction: column;
  /* justify-content: center; */
  align-items: center;
   width: 100vw;
  height: 100vh;
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
  position: fixed;
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

h1 {
  text-align: center;
  font-size: 24px;
  color: #685081;
  margin-bottom: 20px;
  text-transform: uppercase;
}



/* snack bar */
.success-snackbar {
  background-color: green;
  color: white;
}

.form-group {
  margin-bottom: 20px;
}

label {
  font-weight: bold;
}



button[type="submit"] {
  width: 100%;
}

.btn-primary {
  background-color:#8e73f0 ;
  color: #fff;
  border: none;
  border-radius: 4px;
  padding: 10px 20px;
  cursor: pointer;
}

.btn-primary:hover {
  background-color: #7d64d8;
}

.container{
  background-color:white;
  /* background:#d6cdf1; */
  max-width: 800px;
  border-radius: .5em;
  margin-top: 100px;
  margin-bottom: 100px;
  padding: 50px;
    /* background-image: linear-gradient(-45deg, #bfdef7 0%, #dfb9f9 100%); */

}
label{
  color:#685081;
}
/* input{
  border-color: #9884e4;
} */
.bottom-image{
  height: 20px;
  background-image: url('img_girl.jpg');
}

input[type="file"]{
  /* background-color:#8e73f0 ; */
  color: #685081;
  border-color: #8e73f0;
  border-radius: 4px;
  /* padding: 10px 20px; */
  cursor: pointer;
} 

</Style>

</head>
<body >
 <!-- sidebar start here  -->
 <div>
   <input type="checkbox" id="check">
   <label for="check">
     <i class="fas fa-bars" id="btn"></i>
     <i class="fas fa-times" id="cancel"></i>
   </label>
   <div class="sidebar">
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
</div>  
  <!-- sidebar end here  -->  


<div class="container">
  <h1>   Book an Appointment</h1>
  <form>
    <div class="form-group">
      <label for="exampleFormControlInput1">Appointment ID</label>
      <input type="text" class="form-control" id="appointmentId" name="appointmentId"  placeholder="appointmentId" required>
    </div>
    <div class="form-group">
      <label for="exampleFormControlInput1">Job seeker Name</label>
      <input type="text" class="form-control" id="jobSeekerName" name="jobSeekerName"placeholder="jobSeekerName" required>
    </div>
    <div class="form-group">
      <label for="exampleFormControlInput1">Job seeker Occupation</label>
      <input type="text" class="form-control" id="jobSeekerOccupation" name="jobSeekerOccupation" placeholder="jobSeekerOccupation" required>
    </div>
    <div class="form-group">
      <label for="exampleFormControlInput1">Job seeker contact no.</label>
      <input type="text" class="form-control" id="jobSeekerContact" name="jobSeekerContact" placeholder="jobSeekerContact" required>
    </div>
    <div class="form-group">
      <label for="exampleFormControlInput1">Job consultant name</label>
      <input type="text" class="form-control" id="consultantName" name="consultantName" placeholder="consultantName" required>
    </div>
    <div class="form-group">
      <label for="exampleFormControlInput1">Booking date</label>
      <input type="date" class="form-control" id="scheduledDateAndTime" name="scheduledDateAndTime" placeholder="name@example.com" required>
    </div>
    <div class="form-group">
      <label for="exampleFormControlInput1">Booking time</label>
      <input type="time" class="form-control" id="startTime" name="startTime" placeholder="startTime" required>
    </div>
    <div class="form-group mt-3">
      <label class="mr-2">Upload your CV:</label>
      <input type="file" name="file" id="file">
    </div>
    <div class="form-group">
      <label for="exampleFormControlTextarea1">Comments</label>
      <textarea class="form-control" id="notes" name="notes" rows="3"></textarea>
    </div>
   
    <button type="submit" class="btn btn-primary"  name="">Book</button>
  </form>
</div>
<div class="bottom-image" ></div>
</body>
</html>
