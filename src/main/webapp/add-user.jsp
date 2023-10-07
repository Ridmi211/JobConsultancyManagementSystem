<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="tag" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
	<head>
	
		<meta charset="ISO-8859-1">
		<title>Register</title>
 
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="icon" type="image/x-icon" href="https://static.vecteezy.com/system/resources/previews/010/430/526/non_2x/job-for-immigrants-app-icon-refugee-employment-construction-worker-finding-work-abroad-hard-hat-worker-handyman-uiux-user-interface-web-or-mobile-application-isolated-illustration-vector.jpg">
  <link rel="preconnect" href="https://fonts.gstatic.com">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
 
		
		<!-- Latest compiled and minified CSS -->
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
		<!-- Latest compiled JavaScript -->
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>		
	  <style>
    @import url('https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400');
    
    body, html {
      font-family: 'Source Sans Pro', sans-serif;
      background-color: #1d243d;
      padding: 0;
      margin: 0;
    }
    
    #particles-js {
      position: absolute;
      width: 100%;
      height: 100%;
    }
    
    .container{
      margin: 0;
      top: 20px;
      left: 50%;
      position: absolute;
      text-align: center;
      transform: translateX(-50%);
      background-color: rgb( 33, 41, 66 );
      border-radius: 9px;
      border-top: 10px solid #79a6fe;
      border-bottom: 10px solid #8BD17C;
      width: 600px;
      height: 800px;
      box-shadow: 1px 1px 108.8px 19.2px rgb(25,31,53);
    }
    
    .box h4 {
      font-family: 'Source Sans Pro', sans-serif;
      color: #5c6bc0; 
      font-size: 18px;
      margin-top:40px;;
    }
    
    .box h4 span {
      color: #dfdeee;
      font-weight: lighter;
    }
    
    .box h5 {
      font-family: 'Source Sans Pro', sans-serif;
      font-size: 13px;
      color: #a1a4ad;
      letter-spacing: 1.5px;
      margin-top: 5px;
      margin-bottom: 20px;
    }
    
    .box input[type = "text"],.box input[type = "password"] {
      display: block;
      margin: 10px auto;
      background: #262e49;
      border: 0;
      border-radius: 5px;
      padding: 6px 10px;
      width: 320px;
      outline: none;
      color: #d6d6d6;
          -webkit-transition: all .2s ease-out;
        -moz-transition: all .2s ease-out;
        -ms-transition: all .2s ease-out;
        -o-transition: all .2s ease-out;
        transition: all .2s ease-out;
      
    }
    ::-webkit-input-placeholder {
      color: #565f79;
    }
    
    .box input[type = "text"]:focus,.box input[type = "password"]:focus {
      border: 1px solid #79A6FE;
      
    }
    
    a{
      color: #5c7fda;
      text-decoration: none;
    }
    
    a:hover {
      text-decoration: underline;
    }
    
     label input[type = "checkbox"] {
      display: none; /* hide the default checkbox */
    }
    
    /* style the artificial checkbox */
    label span {
      height: 13px;
      width: 13px;
      border: 2px solid #464d64;
      border-radius: 2px;
      display: inline-block;
      position: relative;
      cursor: pointer;
      float: left;
      left: 7.5%;
    }
    
    .btn1 {
      border:0;
      background: #7f5feb;
      color: #dfdeee;
      border-radius: 100px;
      width: 340px;
      height: 49px;
      font-size: 16px;
      position: absolute;
      top: 85%;
      left: 8%;
      transition: 0.3s;
      cursor: pointer;
    }
    
    .btn1:hover {
      background: #5d33e6;
    }
    
    .rmb {
      position: absolute;
      margin-left: -24%;
      margin-top: 0px;
      color: #dfdeee;
      font-size: 13px;
    }
    
    .forgetpass {
      position: relative;
      float: right;
      right: 28px;
    }
    
    .dnthave{
        position: absolute;
        top: 92%;
        left: 29%;
    }
    
    [type=checkbox]:checked + span:before {/* <-- style its checked state */
        font-family: FontAwesome;
        font-size: 16px;
        content: "\f00c";
        position: absolute;
        top: -4px;
        color: #896cec;
        left: -1px;
        width: 13px;
    }
    
    .typcn {
      position: absolute;
      left: 339px;
      top: 282px;
      color: #3b476b;
      font-size: 22px;
      cursor: pointer;
    }      
    
    .typcn.active {
      color: #7f60eb;
    }
    
    .error {
      background: #ff3333;
      text-align: center;
      width: 337px;
      height: 20px;
      padding: 2px;
      border: 0;
      border-radius: 5px;
      margin: 10px auto 10px;
      position: absolute;
      top: 31%;
      left: 7.2%;
      color: white;
      display: none;
    }
    
    .footer {
        position: relative;
        left: 0;
        bottom: 0;
        top: 605px;
        width: 100%;
        color: #78797d;
        font-size: 14px;
        text-align: center;
    }
    
    .footer .fa {
      color: #7f5feb;;
    }
    .gender {
  display: flex;
  justify-content: center;
  align-items: center;
  margin: 0px auto;
  gap: 50px;
  font-size: 13px;
}

.gender label {
  color: #a1a4ad;
}
.usertype {
  display: flex;
  justify-content: center;
  align-items: center;
  margin: 10px auto;
  gap: 50px;
  font-size: 13px;
}

.usertype label {
  color: #a1a4ad;
}


/* Style the custom radio buttons */
.gender label span {
  height: 13px;
  width: 13px;
  border: 2px solid #464d64;
  border-radius: 50%;
  display: inline-block;
  position: relative;
  cursor: pointer;
  font-family: 'Source Sans Pro', sans-serif;
  font-size: 13px;
  background-color: #1d243d;
}
.usertype label span {
  height: 13px;
  width: 13px;
  border: 2px solid #464d64;
  border-radius: 50%;
  display: inline-block;
  position: relative;
  cursor: pointer;
  font-family: 'Source Sans Pro', sans-serif;
  font-size: 13px;
  background-color: #1d243d;
}

/* Style the checked state of the radio buttons */
.gender input[type="radio"]:checked + span:before {
  content: "\f111"; /* Use a checkmark icon from FontAwesome */
  font-family: 'Source Sans Pro', sans-serif;
  font-size: 11px;
  position: absolute;
  font-size: 13px;

  color: #896cec;
}

.usertype input[type="radio"]:checked + span:before {
  content: "\f111"; /* Use a checkmark icon from FontAwesome */
  font-family: 'Source Sans Pro', sans-serif;
  font-size: 11px;
  position: absolute;
  font-size: 13px;

  color: #896cec;
}
.box label[for="gender"]  {
  color:  #a1a4ad;
  display: block;
  margin-top: 0px;
  margin-left:22%;
  text-align: left;
  font-size: 13px;
  font-family: 'Source Sans Pro', sans-serif;
  
}
.box label[for="usertype"]  {
  color:  #a1a4ad;
  display: block;
  margin-top: 0px;
  margin-left:22%;
  text-align: left;
  font-size: 13px;
  font-family: 'Source Sans Pro', sans-serif;
  
}
.box label[for="birthdate"] {
  color:  #a1a4ad;
  display: block;
  margin-top: 0px;
  text-align: left;
  margin-left:22%;
  font-size: 13px;
}

.box input[type="date"][name="birthdate"] {
  display: block;
  margin: 5px auto;
  background: #262e49;
  border: 0;
  border-radius: 5px;
  padding: 6px 10px;
  width: 320px;
  outline: none;
  color:  #a1a4ad;
  transition: all 0.2s ease-out;
}

.box input[type="date"][name="birthdate"]:focus {
  border: 1px solid #79A6FE;
}

/* Style the Telephone Input */
.box label[for="telephone"] {
  color:  #a1a4ad;
  display: block;
  margin-top: 20px;
  text-align: left;
  margin-left:20%;
}

.box input[type="tel"][name="telephone"] {
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
}

.box input[type="tel"][name="telephone"]:focus {
  border: 1px solid #79A6FE;
}

/* Style the Job Type and Country Dropdowns */
.box label[for="jobtype"], .box label[for="country"], .box label[for="usertype"] {
  color:  #a1a4ad;
  display: block;
  margin-top: 10px;
  text-align: left;
  margin-left:22%;
  font-size: 13px;
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

p{ color:white;
}

 #feedback-container {
    background-color: #4CAF50; 
    color: white; 
    padding: 10px; 
    position: fixed; 
    bottom: 20px; 
    right: 20px; 
    border-radius: 5px; 
    opacity: 1; 
    transition: opacity 0.5s; 
  }

  #feedback-container p {
    margin: 0; /* Remove default margin for the <p> element */
  }

  /* Styling for the message when it's about to disappear */
  #feedback-container.hidden {
    opacity: 0; /* Fade out the message */
  }
  
  </style>
	
	</head>
	
	<body>		
	
			 <div class="container">
			<form name="form1" class="box" action="usermanager" method="post">
        <h4>Job<span>Consultancy</span></h4>
        <p>${feebackMessage}</p>
        <h5>Create a new account.</h5>
        <input type="text" name="name" placeholder="Name" id="name" autocomplete="off" required>
        <input type="tel" name="telephone" id="telephone" placeholder="Phone number" required>
        <input type="text" name="email" id ="email" placeholder="Email" autocomplete="off" required>
        <i class="typcn typcn-eye" id="eye"></i>
        <input type="password" name="password" placeholder="Passsword" id="password" autocomplete="off" required>
      
     
        <label for="birthdate">Birthdate:</label>
        <input type="date" name="birthdate" id="birthdate" required>
        <label for="gender">Gender:</label>
        <div class="gender">
            <label for="male">
                <input type="radio" name="gender" id="male" value="Male" required> Male
            </label>
            <label for="female">
                <input type="radio" name="gender" id="female" value="Female" required> Female
            </label>
            <label for="other">
                <input type="radio" name="gender" id="other" value="Other" required> Other
            </label>
        </div>
          
          <label for="jobtype">Job Type:</label>
          <select name="jobtype" id="jobtype" required>
              <option value="Full-time">Full-time</option>
              <option value="Part-time">Part-time</option>
              <option value="Freelance">Freelance</option>
              <option value="Contract">Contract</option>
          </select>
          
          <label for="country">Country:</label>
          <select name="country" id="country" required>
              <option value="USA">USA</option>
              <option value="Canada">Canada</option>
              <option value="UK">UK</option>
              <!-- Add more countries as needed -->
          </select>
          
          <label for="usertype">Tell us who you are?</label>
          <div class="usertype" >
            <label for="seeker" >
                <input type="radio" name="usertype" id="seeker" value="ROLE_USER" required>A Job Seeker
            </label>
            <label for="consultant">
                <input type="radio" name="usertype" id="consultant" value="ROLE_CONSULTANT" required> A Job consultant
            </label>
           
        </div>
        <div>
                 
          <input type="hidden" name="useractiontype" value="add"/>
          <button style="left: 21%; " class="btn1" type="submit">Create User</button>
        </div>
        </form>
          <a href="login.jsp" class="dnthave">Already have an account? Login</a>
    </div> 
      
 

</html>
