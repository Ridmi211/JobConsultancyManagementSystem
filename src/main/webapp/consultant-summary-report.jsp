<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="tag" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.jobConsultancyScheduler.model.User"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0-beta3/css/all.min.css"> -->
<link rel="stylesheet" type="text/css" href="css/reports.css">
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
  <!-- exportas pdf -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.5.3/jspdf.min.js"></script> 
  <script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.9.3/html2pdf.bundle.min.js"></script>
   <!-- exportas pdf -->
    <title>Consultant Summary Report</title>

    <style>

    </style>
</head>
<body style="margin: 0; padding: 0;
            background-color: #efdfff;">
	<input type="checkbox" id="check">
	<label style="position: fixed; top: 60px; z-index: 1; left: -5px;"
		for="check"> <i class="fas fa-bars" id="btn"></i> <i
		class="fas fa-times" id="cancel"></i>
	</label>

	<%
	// Get the user object from the session
	User user = (User) session.getAttribute("user");
	%>

	<div class="sidebar">
		<jsp:include page="sidebar.jsp" />

	</div>
	 <button id="print" style="background-color: #9884e4;border: #9884e4; margin-top: 20px;position: fixed; left:85%;z-index: 80;" type="button" onclick="generatePDF()" class="btn btn-primary">Export as PDF</button>
	  <script type="text/javascript">
  function generatePDF() {
        
        // Choose the element id which you want to export.
        var element = document.getElementById('divToExport');
        element.style.width = '790px';
        // element.style.height = '900px';
        var opt = {
            margin:       0,
            filename:     'Registered Job Consultants.pdf',
            image:        { type: 'jpeg', quality: 1},
            html2canvas:  { scale: 2 },
            jsPDF:        { unit: 'in', format: 'A4', orientation: 'portrait',precision: '12' }
          };
        
        // choose the element and pass it to html2pdf() function and call the save() on it to save as pdf.
        html2pdf().set(opt).from(element).save();
      }
</script>
	
    <div id="divToExport" class="a4-container" >
     <div class="">
            <div class="page-title d-flex align-items-center align-self-center">Consultant Summary Report</div>
        </div>
        <!-- Card 1  numbers -->
        
        
            ////////////////////////

        <div class=" card-container">
            <div class="col">
                <div class=" common-border">
                    <div class="card-title common-border">Chart title       </div>
                </div>
                
                <div class=" common-border">
                    <div class="card-comment common-border">Description
                    </div>
                </div>
            
                <div class="row common-border m-0">
                    <div class="col-sm col-12 common-border pb-2 " style="height:250px">
               <canvas id="accessRightsChart" width="10" height="10"></canvas>
                      
                    </div>
                </div>
            </div>
        </div>

        ///////////
        
               
            ////////////////////////

        <div class=" card-container">
            <div class="col">
                <div class=" common-border">
                    <div class="card-title common-border">Chart title       </div>
                </div>
                
                <div class=" common-border">
                    <div class="card-comment common-border">Description
                    </div>
                </div>
            
                <div class="row common-border m-0">
                    <div class="col-sm col-12 common-border pb-2 " style="height:250px">
              <canvas id="genderDistributionChart" width="40" height="40"></canvas>
                      
                    </div>
                </div>
            </div>
        </div>

        ///////////
        
               
            ////////////////////////

        <div class=" card-container">
            <div class="col">
                <div class=" common-border">
                    <div class="card-title common-border">Chart title       </div>
                </div>
                
                <div class=" common-border">
                    <div class="card-comment common-border">Description
                    </div>
                </div>
            
                <div class="row common-border m-0">
                    <div class="col-sm col-12 common-border pb-2 " style="height:250px">
              <canvas id="geographicalDistributionChart" width="40" height="40"></canvas>

                      
                    </div>
                </div>
            </div>
        </div>

        ///////////
        <div class="">
            <div class="page-title d-flex align-items-center align-self-center">User Registration Report</div>
        </div>
        <!-- Card 1  numbers -->
        
        
            ////////////////////////

        <div class=" card-container">
            <div class="col">
                <div class=" common-border">
                    <div class="card-title common-border">Chart title       </div>
                </div>
                
                <div class=" common-border">
                    <div class="card-comment common-border">Description
                    </div>
                </div>
            
                <div class="row common-border m-0">
                    <div class="col-sm col-12 common-border pb-2 " style="height:250px">
               <canvas id="accessRightsChart" width="10" height="10"></canvas>
                      
                    </div>
                </div>
            </div>
        </div>

        ///////////
        
               
            ////////////////////////

        <div class=" card-container">
            <div class="col">
                <div class=" common-border">
                    <div class="card-title common-border">Chart title       </div>
                </div>
                
                <div class=" common-border">
                    <div class="card-comment common-border">Description
                    </div>
                </div>
            
                <div class="row common-border m-0">
                    <div class="col-sm col-12 common-border pb-2 " style="height:250px">
              <canvas id="genderDistributionChart" width="40" height="40"></canvas>
                      
                    </div>
                </div>
            </div>
        </div>

        ///////////
        
               
            ////////////////////////

        <div class=" card-container">
            <div class="col">
                <div class=" common-border">
                    <div class="card-title common-border">Chart title       </div>
                </div>
                
                <div class=" common-border">
                    <div class="card-comment common-border">Description
                    </div>
                </div>
            
                <div class="row common-border m-0">
                    <div class="col-sm col-12 common-border pb-2 " style="height:250px">
              <canvas id="geographicalDistributionChart" width="40" height="40"></canvas>

                      
                    </div>
                </div>
            </div>
        </div>

        ///////////
        
         <div class="">
            <div class="page-title d-flex align-items-center align-self-center">Consultant availability Report</div>
        </div>
        <!-- Card 1  numbers -->
        
        
            ////////////////////////

        <div class=" card-container">
            <div class="col">
                <div class=" common-border">
                    <div class="card-title common-border">Chart title       </div>
                </div>
                
                <div class=" common-border">
                    <div class="card-comment common-border">Description
                    </div>
                </div>
            
                <div class="row common-border m-0">
                    <div class="col-sm col-12 common-border pb-2 " style="height:250px">
               <canvas id="accessRightsChart" width="10" height="10"></canvas>
                      
                    </div>
                </div>
            </div>
        </div>

        ///////////
        
               
            ////////////////////////

        <div class=" card-container">
            <div class="col">
                <div class=" common-border">
                    <div class="card-title common-border">Chart title       </div>
                </div>
                
                <div class=" common-border">
                    <div class="card-comment common-border">Description
                    </div>
                </div>
            
                <div class="row common-border m-0">
                    <div class="col-sm col-12 common-border pb-2 " style="height:250px">
              <canvas id="genderDistributionChart" width="40" height="40"></canvas>
                      
                    </div>
                </div>
            </div>
        </div>

        ///////////
        
               
            ////////////////////////

        <div class=" card-container">
            <div class="col">
                <div class=" common-border">
                    <div class="card-title common-border">Chart title       </div>
                </div>
                
                <div class=" common-border">
                    <div class="card-comment common-border">Description
                    </div>
                </div>
            
                <div class="row common-border m-0">
                    <div class="col-sm col-12 common-border pb-2 " style="height:250px">
              <canvas id="geographicalDistributionChart" width="40" height="40"></canvas>

                      
                    </div>
                </div>
            </div>
        </div>

        ///////////
        
        <script>
    // Dummy data for illustration purposes
    var accessRightsData = [30, 20, 50]; // User, Admin, Consultant
    var genderDistributionData = [45, 55]; // Male, Female
    var geographicalDistributionData = [25, 35, 40]; // Country A, Country B, Country C

    // Pie Chart: Distribution of users by access rights
    var accessRightsChart = new Chart(document.getElementById('accessRightsChart'), {
        type: 'pie',
        data: {
            labels: ['User', 'Admin', 'Consultant'],
            datasets: [{
                data: accessRightsData,
                backgroundColor: ['red', 'green', 'blue']
            }]
        }
    });

    // Bar Chart: Gender distribution of users
    var genderDistributionChart = new Chart(document.getElementById('genderDistributionChart'), {
        type: 'bar',
        data: {
            labels: ['Male', 'Female'],
            datasets: [{
                data: genderDistributionData,
                backgroundColor: ['blue', 'pink']
            }]
        }
    });

    // Bar Chart: Geographical distribution of users
    var geographicalDistributionChart = new Chart(document.getElementById('geographicalDistributionChart'), {
        type: 'bar',
        data: {
            labels: ['Country A', 'Country B', 'Country C'],
            datasets: [{
                data: geographicalDistributionData,
                backgroundColor: ['orange', 'purple', 'yellow']
            }]
        }
    });
</script>
       
    <!--     ////////////////////////

        <div class=" card-container">
            <div class="col">
                <div class=" common-border">
                    <div class="card-title common-border">44                   </div>
                </div>
                
                <div class=" common-border">
                    <div class="card-comment common-border">wwwwwwwwwwwwwww
                    </div>
                </div>
            
                <div class="row common-border m-0">
                    <div class="col-sm col-6 common-border pb-2 ">
                        <div class="row common-border">
                            <div class="card-year">
                                1111
                            </div>
                        </div>
                        <div class="row common-border m-0">
                            <div class="col-2 common-border card-text-whole">44</div>
                            <div class="col-10 common-border ">
                                <div class="custom-text-blue text-center font-weight-bold">
                                    <span class="card1-custom-text-large "> 11111</span>
                                    <span>1111</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm col-6 common-border pb-2 ">
                       
                        <div class="row common-border m-0">
                            <div class="card-year">
                               11111
                            </div>
                        </div>
                        <div class="row common-border m-0">
                            <div class="col-2 common-border card-text-whole">44</div>
                            <div class="col-10 common-border ">
                                <div class="custom-text-blue text-center font-weight-bold">
                                    <span
                                        class="card1-custom-text-large ">1111</span>
                                    <span>11111</span>
                                </div>
                            </div>
                        </div>
                      
                    </div>
                </div>
            </div>
        </div>

        /////////// -->


    <div class="pebble-footer">
        <div class="row page-footer">
            <div class="col-4 body-text"></div>
            <div class="col-5"></div>
            <div class="col-3">2022/12/05 </div>
        </div>
    </div>
      
        <!-- Card structure-->
    </div>

    <!-- footer template -->
  
</body>
</html>