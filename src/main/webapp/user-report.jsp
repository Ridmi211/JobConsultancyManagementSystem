<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="tag" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.jobConsultancyScheduler.model.User"%>
<%@ page import="com.jobConsultancyScheduler.model.User"%>
<%@ page import="com.jobConsultancyScheduler.model.AccessRight"%>
<%@ page import="com.jobConsultancyScheduler.service.AppointmentService"%>
<%@ page import="com.jobConsultancyScheduler.service.UserService"%>
<%@ page import="com.jobConsultancyScheduler.service.MessageService"%>


<%@ page import="java.time.Year"%>
<%@ page import="java.util.List"%>
<%@ page import="com.jobConsultancyScheduler.dao.AppointmentManagerImpl"%>

<%@ page import="java.util.Map"%>
<%@ page import="java.util.stream.Collectors"%>
<%@ page import="java.util.ArrayList"%>

<%@ page import="com.fasterxml.jackson.databind.ObjectMapper"%>
<%@ page import="com.fasterxml.jackson.core.JsonProcessingException"%>

<%@ page import="java.sql.SQLException"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="com.jobConsultancyScheduler.dao.UserManagerImpl"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.Arrays"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.Map.Entry"%>
<%@ page import="java.awt.Color"%>
<%@ page import="java.util.Random"%>

<%@ page import="java.util.Calendar"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.Set"%>
<%@ page import="java.util.stream.Collectors"%>
<%@ page import="java.util.stream.IntStream"%>
<%@ page import="java.time.Year"%>
<%@ page import="com.jobConsultancyScheduler.dao.UserManager"%>

<%@ page import="com.fasterxml.jackson.databind.ObjectMapper"%>


<%
UserManagerImpl userManager = new UserManagerImpl();
Map<String, Integer> consultantCountByCountry = userManager.getConsultantCountByCountry();

// Extract countries and counts
Set<Entry<String, Integer>> entrySet = consultantCountByCountry.entrySet();
List<String> countries = entrySet.stream().map(Entry::getKey).collect(Collectors.toList());
List<Integer> counts = entrySet.stream().map(Entry::getValue).collect(Collectors.toList());

// Chart data
String countriesArray = "['" + String.join("', '", countries) + "']";
String countsArray = "[" + counts.stream().map(Object::toString).collect(Collectors.joining(", ")) + "]";
%>

<%
Calendar calendar = Calendar.getInstance();
calendar.setTime(new Date());
int currentYear = calendar.get(Calendar.YEAR);
%>


<%
// Instantiate the UserManagerImpl or get it from your application context
/*    UserManagerImpl userManager = new UserManagerImpl(); */
Map<String, List<Integer>> monthlyCountsMap = userManager.getMonthlyUserRegistrationCounts();
List<Integer> userCounts = monthlyCountsMap.get("userCounts");
List<Integer> consultantCounts = monthlyCountsMap.get("consultantCounts");

int totalClientsCounts = userCounts.stream().mapToInt(Integer::intValue).sum();
int totalConsultantCounts = consultantCounts.stream().mapToInt(Integer::intValue).sum();

// Get the monthly user registration counts
%>

<%
// Instantiate the AppointmentManagerImpl or get it from your application context
AppointmentManagerImpl appointmentManager = new AppointmentManagerImpl();

// Get the monthly appointment counts for the current year
List<Integer> monthlyCounts = appointmentManager.getMonthlyAppointmentCounts();
%>
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
    <title>User Summary Report</title>

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
            <div class="page-title d-flex align-items-center align-self-center">User Summary Report</div>
        </div>
        <!-- Card 1  numbers -->
        
               
<!--    accessright -->

        <div class=" card-container">
            <div class="col">
                <div class=" common-border">
                    <div class="card-title common-border"> Breakdown of users by access rights </div>
                </div>
                
                <div class=" common-border">
                    <div class="card-comment common-border">Description
                    </div>
                </div>
            
                <div class="row common-border m-0">
                    <div class="col-sm col-12 common-border pb-2 ">
                 <canvas id="accessRightsPieChart" width="400" height="200"></canvas>

                  
                      
                    </div>
                </div>
            </div>
        </div>

   <!--      /////////// -->
   <%


try {
    Map<String, Integer> accessRightsData = userManager.getAccessRightsData();

    // Convert the data into JavaScript arrays
/*  List<String> labelsList = accessRightsData.keySet().stream().map(String::valueOf).collect(Collectors.toList()); */

    String[] customLabels = {"Client", "Consultant", "Admin"};
    List<String> dataValuesList = accessRightsData.values().stream().map(String::valueOf).collect(Collectors.toList());

    String labelsArray = "['" + String.join("', '", customLabels) + "']";
    String dataValuesArray = "[" + String.join(", ", dataValuesList) + "]";
%>
   <script>
    var accessRightsData = {
        labels: <%= labelsArray %>,
        datasets: [{
            data: <%= dataValuesArray %>,
            backgroundColor: [
                'rgba(255, 99, 132, 0.8)', // Client color
                'rgba(54, 162, 235, 0.8)', // Consultant color
                'rgba(75, 192, 192, 0.8)'  // Admin color
            ],
            borderWidth: 1
        }]
    };

    var ctx3 = document.getElementById('accessRightsPieChart').getContext('2d');
    var accessRightsPieChart = new Chart(ctx3, {
        type: 'pie',
        data: accessRightsData,
        options: {
            responsive: true,
            maintainAspectRatio: false,
            title: {
                display: true,
                text: 'User Access Rights'
            }
        }
    });
</script>

<%
} catch (ClassNotFoundException | SQLException e) {
    e.printStackTrace(); // Handle the exception appropriately in your application
}
%>
        
<!-- 
    <script>
        // Sample data (replace this with your actual data)
        var accessRightsData = {
            labels: ['Client', 'Consultant', 'Admin'],
            datasets: [{
                data: [40, 30, 30], // replace with your actual access rights data
                backgroundColor: [
                    'rgba(255, 99, 132, 0.8)', // Client color
                    'rgba(54, 162, 235, 0.8)', // Consultant color
                    'rgba(75, 192, 192, 0.8)'  // Admin color
                ],
                borderWidth: 1
            }]
        };

        // Get the canvas element
        var ctx3 = document.getElementById('accessRightsPieChart').getContext('2d');

        // Create the pie chart
        var accessRightsPieChart = new Chart(ctx3, {
            type: 'pie',
            data: accessRightsData,
            options: {
                responsive: true,
                maintainAspectRatio: false,
                title: {
                    display: true,
                    text: 'User Access Rights'
                }
            }
        });
    </script> -->
        <!-- /////////////////////////////// -->
        
        
        <div class=" card-container">
            <div class="col">
                <div class=" common-border">
                    <div class="card-title common-border">Comparison between user and appointment growth </div>
                </div>
                
                <div class=" common-border">
                    <div class="card-comment common-border">Chart represent the growth of users, consultants and number of scheduled appointments, within the current year.
                    </div>
                </div>
            
                <div class="row common-border m-0">
                    <div class="col-sm col-12 common-border pb-2 ">
               	
							<canvas id="myLineChart"></canvas>
					
                      
                    </div>
                </div>
            </div>
        </div>

    
        
						<script>
    const data1 = {
        labels: ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'],
        datasets: [{
            label: 'Monthly Appointments',
            data: [<%=monthlyCounts.get(0)%>, <%=monthlyCounts.get(1)%>, <%=monthlyCounts.get(2)%>, <%=monthlyCounts.get(3)%>, <%=monthlyCounts.get(4)%>, <%=monthlyCounts.get(5)%>, <%=monthlyCounts.get(6)%>, <%=monthlyCounts.get(7)%>, <%=monthlyCounts.get(8)%>, <%=monthlyCounts.get(9)%>, <%=monthlyCounts.get(10)%>, <%=monthlyCounts.get(11)%>],
            borderColor: 'rgb(91,74,107)',
            borderWidth: 2,
            fill: false,
        },
        {
            label: 'Client Registrations',
            data: [<%=userCounts.get(0)%>, <%=userCounts.get(1)%>, <%=userCounts.get(2)%>, <%=userCounts.get(3)%>, <%=userCounts.get(4)%>, <%=userCounts.get(5)%>, <%=userCounts.get(6)%>, <%=userCounts.get(7)%>, <%=userCounts.get(8)%>, <%=userCounts.get(9)%>, <%=userCounts.get(10)%>, <%=userCounts.get(11)%>],
            borderColor: 'rgb(255, 99, 132)',
            borderWidth: 2,
            fill: false,
        },
        {
            label: 'Consultant Registrations',
            data: [<%=consultantCounts.get(0)%>, <%=consultantCounts.get(1)%>, <%=consultantCounts.get(2)%>, <%=consultantCounts.get(3)%>, <%=consultantCounts.get(4)%>, <%=consultantCounts.get(5)%>, <%=consultantCounts.get(6)%>, <%=consultantCounts.get(7)%>, <%=consultantCounts.get(8)%>, <%=consultantCounts.get(9)%>, <%=consultantCounts.get(10)%>, <%=consultantCounts.get(11)%>],
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

<!--    accessright -->

        <div class=" card-container">
            <div class="col">
                <div class=" common-border">
                    <div class="card-title common-border"> Breakdown of users by job type </div>
                </div>
                
                <div class=" common-border">
                    <div class="card-comment common-border">Description
                    </div>
                </div>
            
                <div class="row common-border m-0">
                    <div class="col-sm col-12 common-border pb-2 ">
                 <canvas id="jobTypeDistributionChart" width="400" height="300"></canvas>

                  
                      
                    </div>
                </div>
            </div>
        </div>

   <!--      /////////// -->
     <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>  
     
     
     
<%
 
    Map<String, Map<String, Object>> jobTypeDistributionData = userManager.getJobTypeDistributionData();

    // Convert Java Map to JSON string
    String jsonData = new ObjectMapper().writeValueAsString(jobTypeDistributionData);

    // You can use jsonData in your JavaScript code
%>
<script>
    console.log('<%= jsonData %>');
</script>
  <script>
        // Parse JSON data in JavaScript
        var jobTypeDistributionData = JSON.parse('<%= jsonData %>');

        // Extract labels, data, and colors from the JSON data
        var labels = Object.keys(jobTypeDistributionData);
        var data = labels.map(function (label) {
            return jobTypeDistributionData[label].count;
        });

        // Extract dynamic colors from the JSON data
        var colors = labels.map(function (label) {
            return jobTypeDistributionData[label].color;
        });

        // Create a bar chart using Chart.js
        var ctx = document.getElementById('jobTypeDistributionChart').getContext('2d');
        var jobTypeDistributionChart = new Chart(ctx, {
            type: 'bar',
            data: {
                labels: labels,
                datasets: [{
                    data: data,
                    backgroundColor: colors
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                title: {
                    display: true,
                    text: 'Job Type Distribution'
                },
                scales: {
                    x: {
                        beginAtZero: true
                    },
                    y: {
                        beginAtZero: true
                    }
                }
            }
        });
    </script>
 <%-- <script>
        // Parse JSON data in JavaScript
        var jobTypeDistributionData = JSON.parse('<%= jsonData %>');

        // Extract labels, data, and colors from the JSON data
        var labels = Object.keys(jobTypeDistributionData);
        var data = labels.map(function (label) {
            return jobTypeDistributionData[label].count;
        });
        var colors = labels.map(function (label) {
            return jobTypeDistributionData[label].color;
        });

        // Create a pie chart using Chart.js
        var ctx = document.getElementById('jobTypeDistributionChart').getContext('2d');
        var jobTypeDistributionChart = new Chart(ctx, {
            type: 'pie',
            data: {
                labels: labels,
                datasets: [{
                    data: data,
                    backgroundColor: colors
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                title: {
                    display: true,
                    text: 'Job Type Distribution'
                }
            }
        });
    </script> --%>


  <!-- <script>
    var jobTypeDistributionData = [15, 25, 20, 10, 5];
    var jobTypeDistributionChart = new Chart(document.getElementById('jobTypeDistributionChart'), {
        type: 'pie', // Change the chart type to doughnut
        data: {
            labels: ['Design', 'Development', 'Marketing', 'Consulting', 'Other'],
            datasets: [{
                data: jobTypeDistributionData,
                backgroundColor: [
                    'rgba(173, 216, 230, 0.8)', // Light Blue
                    'rgba(144, 238, 144, 0.8)', // Light Green
                    'rgba(255, 182, 193, 0.8)', // Light Pink
                    'rgba(240, 230, 140, 0.8)', // Light Gold
                    'rgba(192, 192, 192, 0.8)'  // Light Gray
                ]
            }]
        },
        options: {
            responsive: true,
            maintainAspectRatio: false,
            title: {
                display: true,
                text: 'Client Job Type Distribution'
            }
        }
    });
</script>
 -->

                
         <!--    //////////////////////// -->

        <div class=" card-container">
            <div class="col">
                <div class=" common-border">
                    <div class="card-title common-border">Users age distribution      </div>
                </div>
                
                <div class=" common-border">
                    <div class="card-comment common-border">Description
                    </div>
                </div>
            
                <div class="row common-border m-0">
                    <div class="col-sm col-12 common-border pb-2 " >
                      <canvas id="ageDistributionPieChart" width="400" height="200"></canvas>

                
                    </div>
                </div>
            </div>
        </div>
        
<%
   
    Map<String, Integer> ageDistributionData = userManager.getAgeDistributionData();

    // Convert Java Map to JSON string
    String jsonData2 = new ObjectMapper().writeValueAsString(ageDistributionData);
    
    

    // You can use jsonData in your JavaScript code
%>
    <script>
        // Parse JSON data in JavaScript
        var ageDistributionData = JSON.parse('<%= jsonData2 %>');

        // Extract labels, data, and colors from the JSON data
        var labels = Object.keys(ageDistributionData);
        var data = labels.map(function (label) {
            return ageDistributionData[label];
        });

      

        // Create a pie chart using Chart.js
        var ctx = document.getElementById('ageDistributionPieChart').getContext('2d');
        var ageDistributionPieChart = new Chart(ctx, {
            type: 'pie',
            data: {
                labels: labels,
                datasets: [{
                    data: data,
                    backgroundColor: [
                    	 'rgba(255, 99, 132, 0.8)', // Client color
                         'rgba(54, 162, 235, 0.8)', // Consultant color
                         'rgba(75, 192, 192, 0.8)', // Additional color 1
                         'rgba(255, 205, 86, 0.8)', // Additional color 2
                         'rgba(255, 159, 64, 0.8)', // Additional color 3
                         'rgba(153, 102, 255, 0.8)', // Additional color 4
                         'rgba(192, 192, 192, 0.8)' 
                    ],
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                title: {
                    display: true,
                    text: 'User Age Distribution'
                }
            }
        });
    </script>
<!--         /////////// -->
        
        
        
                       
        <!--     //////////////////////// -->

        <div class=" card-container">
            <div class="col">
                <div class=" common-border">
                    <div class="card-title common-border"> Distribution of users by gender and country     </div>
                </div>
                
                <div class=" common-border">
                    <div class="card-comment common-border">Description
                    </div>
                </div>
            
                <div class="row common-border m-0">
                    <div class="col-sm col-12 common-border pb-2 " style="height:250px">
<!--               <canvas id="geographicalDistributionChart" width="40" height="40"></canvas>

 -->              
      <canvas id="userDemographicsChart"></canvas>
                   
                    </div>
                </div>
            </div>
        </div>
      <%
    Map<String, Map<String, Integer>> userDemographicsData = userManager.getUserDemographicsData();

    // Convert Java Map to JSON string
    String jsonData3 = new ObjectMapper().writeValueAsString(userDemographicsData);

    // You can use jsonData in your JavaScript code
%>
<script>
    // Parse JSON data in JavaScript
    var userDemographicsData = JSON.parse('<%= jsonData3 %>');

    // Extract labels, data, and colors from the JSON data
    var countries = Object.keys(userDemographicsData);

    // Create datasets for Male and Female
    var maleDataset = {
        label: 'Male',
        data: countries.map(function (country) {
            return userDemographicsData[country] ? userDemographicsData[country].Male : 0;
        }),
        backgroundColor: 'rgba(75, 192, 192, 0.7)',
        borderWidth: 1
    };

    var femaleDataset = {
        label: 'Female',
        data: countries.map(function (country) {
            return userDemographicsData[country] ? userDemographicsData[country].Female : 0;
        }),
        backgroundColor: 'rgba(255, 99, 132, 0.7)',
        borderWidth: 1
    };

    // Create a bar chart using Chart.js
    var ctx14 = document.getElementById('userDemographicsChart').getContext('2d');
    var userDemographicsChart = new Chart(ctx14, {
        type: 'bar',
        data: {
            labels: countries,
            datasets: [maleDataset, femaleDataset]
        },
        options: {
            scales: {
                x: {
                    stacked: true,
                    beginAtZero: true
                },
                y: {
                    stacked: true,
                    beginAtZero: true
                }
            },
            plugins: {
                legend: {
                    position: 'top',
                    labels: {
                        boxWidth: 15
                    }
                }
            }
        }
    });
</script>




   <!--      /////////// -->
          <!--  <div class=" card-container">
            <div class="col">
                <div class=" common-border">
                    <div class="card-title common-border">Distribution of cogyyugy by jobs      </div>
                </div>
                
                <div class=" common-border">
                    <div class="card-comment common-border">Description
                    </div>
                </div>
            
                <div class="row common-border m-0">
                    <div class="col-sm col-12 common-border pb-2 " style="height:250px">
              <canvas id="genderDistributionC88hart" width="40" height="40"></canvas>
                      
                    </div>
                </div>
            </div>
        </div> -->
        
        
         <!--      /////////// -->
      <!--   <div class="">
            <div class="page-title d-flex align-items-center align-self-center">User Registration Report</div>
        </div> -->
        <!-- Card 1  numbers -->
        
        
<!--             //////////////////////// -->

        <div class=" card-container">
            <div class="col">
                <div class=" common-border">
                    <div class="card-title common-border">Number of users with pending, approved, and rejected registration status      </div>
                </div>
                
                <div class=" common-border">
                    <div class="card-comment common-border">Description
                    </div>
                </div>
            
                <div class="row common-border m-0">
                    <div class="col-sm col-12 common-border pb-2 " style="height:250px">
            <canvas id="registrationStatusDoughnutChart" width="400" height="200"></canvas>
  
                    </div>
                </div>
            </div>
        </div>

   <!--      /////////// -->
        
     <script>
        // Sample data (replace this with your actual data)
        var registrationStatusData = {
            labels: ['Pending', 'Approved', 'Rejected'],
            datasets: [{
                data: [10, 20, 5], // replace with your actual data
                backgroundColor: [
                    'rgba(255, 206, 86, 0.8)', // Pending color
                    'rgba(75, 192, 192, 0.8)', // Approved color
                    'rgba(255, 99, 132, 0.8)'  // Rejected color
                ],
                borderWidth: 1
            }]
        };

        // Get the canvas element
        var ctx6 = document.getElementById('registrationStatusDoughnutChart').getContext('2d');

        // Create the doughnut chart
        var registrationStatusDoughnutChart = new Chart(ctx6, {
            type: 'doughnut',
            data: registrationStatusData,
            options: {
                responsive: true,
                maintainAspectRatio: false,
                plugins: {
                    legend: {
                        position: 'bottom'
                    }
                },
                title: {
                    display: true,
                    text: 'Consultant Registration Status'
                }
            }
        });
    </script>   
    
     <!--    
            //////////////////////// -->
  <div class="">
            <div class="page-title d-flex align-items-center align-self-center">Consultant availability Report</div>
        </div>
        
        
        <div class=" card-container">
            <div class="col">
                <div class=" common-border">
                    <div class="card-title common-border">Distribution of consultants by specialized countries and jobs      </div>
                </div>
                
               
            
                <div class="row common-border m-0 p-0">
                    <div class="col-sm col-6 common-border pb-2 m-0 p-0 " style="height:250px">
                <div class=" common-border m-0 p-0">
                    <div class="card-comment common-border m-0 p-0">Description
                    </div>
                </div>
              <canvas id="consultantJobTypeChart" width="200" height="200"></canvas>
     
                    </div>
                <div class="col-sm col-6 common-border pb-2 m-0 p-0" style="height:250px">
                   <div class=" common-border m-0 p-0">
                    <div class="card-comment common-border m-0 p-0">Description
                    </div>
                </div>
              <canvas id="countryJobDistributionChart" width="200" height="200"></canvas>
     
                    </div>
                </div>
            </div>
        </div>
<script>
    var consultantJobTypeData = [10, 15, 5, 50, 20]; // Adjusted data for consultant specialized job types
    var consultantJobTypeChart = new Chart(document.getElementById('consultantJobTypeChart'), {
        type: 'pie',
        data: {
            labels: ['Design', 'Development', 'Marketing', 'Consulting', 'Other'], // Updated labels
            datasets: [{
                data: consultantJobTypeData,
                backgroundColor: [
                    'rgba(173, 216, 230, 0.8)',
                    'rgba(144, 238, 144, 0.8)',
                    'rgba(255, 182, 193, 0.8)',
                    'rgba(240, 230, 140, 0.8)',
                    'rgba(192, 192, 192, 0.8)'
                ]
            }]
        },
        options: {
            responsive: true,
            maintainAspectRatio: false,
            title: {
                display: true,
                text: 'Consultant Specialized Job Type Distribution' // Updated chart title
            }
        }
    });
</script>

<script>
    var countryJobDistributionData = [20, 15, 10, 5, 50]; // Adjusted data for job distribution by countries
    var countryJobDistributionChart = new Chart(document.getElementById('countryJobDistributionChart'), {
        type: 'pie',
        data: {
            labels: ['USA', 'UK', 'Canada', 'Australia', 'Other'], // Updated labels with countries
            datasets: [{
                data: countryJobDistributionData,
                backgroundColor: [
                    'rgba(173, 216, 230, 0.8)',
                    'rgba(144, 238, 144, 0.8)',
                    'rgba(255, 182, 193, 0.8)',
                    'rgba(240, 230, 140, 0.8)',
                    'rgba(192, 192, 192, 0.8)'
                ]
            }]
        },
        options: {
            responsive: true,
            maintainAspectRatio: false,
            title: {
                display: true,
                text: 'Job Distribution by Countries' // Updated chart title
            }
        }
    });
</script>


    <!--     /////////// -->
        
       <!--    <script>
        // Sample data (replace this with your actual data)
        var consultantDistributionData = {
            labels: [
                'Country 1', 'Country 2', 'Country 3', 'Country 4', 'Country 5',
                'Country 6', 'Country 7', 'Country 8', 'Country 9', 'Country 10'
            ],
            datasets: [
                {
                    label: 'Job Type 1',
                    data: [5, 8, 10, 15, 12, 18, 7, 14, 9, 20],
                    backgroundColor: 'rgba(75, 192, 192, 0.5)',
                    borderWidth: 2
                },
                {
                    label: 'Job Type 2',
                    data: [10, 15, 8, 12, 6, 14, 20, 9, 18, 7],
                    backgroundColor: 'rgba(255, 99, 132, 0.5)',
                    borderWidth: 2
                },
                {
                    label: 'Job Type 3',
                    data: [10, 15, 8, 12, 6, 4, 20, 9, 18, 7],
                    backgroundColor: 'rgba(55, 99, 172, 0.5)',
                    borderWidth: 2
                },
                {
                    label: 'Job Type 4',
                    data: [10, 15, 8, 12, 60, 14, 20, 9, 18, 7],
                    backgroundColor: 'rgba(205, 99, 192, 0.5)',
                    borderWidth: 2
                },
                {
                    label: 'Job Type 5',
                    data: [10, 15, 8, 1, 6, 14, 2, 9, 18, 7],
                    backgroundColor: 'rgba(25, 99, 132, 0.5)',
                    borderWidth: 2
                },
                // Continue with datasets for Job Type 3 to Job Type 10
            ]
        };

        // Get the canvas element
        var ctx = document.getElementById('consultantDistributionChart').getContext('2d');

        // Create the radar chart
        var consultantDistributionChart = new Chart(ctx, {
            type: 'radar',
            data: consultantDistributionData,
            options: {
                responsive: true,
                maintainAspectRatio: false,
                scales: {
                    r: {
                        angleLines: {
                            display: true
                        },
                        suggestedMin: 0,
                        suggestedMax: 25, // Adjust based on your data range
                        title: {
                            display: true,
                            text: 'Number of Consultants'
                        }
                    }
                },
                plugins: {
                    legend: {
                        display: true,
                        position: 'top'
                    }
                }
            }
        });
    </script> -->
           <!--  //////////////////////// -->

        <div class=" card-container">
            <div class="col">
                <div class=" common-border">
                    <div class="card-title common-border">Available days and time      </div>
                </div>
                
                <div class=" common-border">
                    <div class="card-comment common-border">Description
                    </div>
                </div>
            
                <div class="row common-border m-0">
                    <div class="col-sm col-12 common-border pb-2 " style="height:450px">
              <canvas id="availabilityRadarChart" width="40" height="40"></canvas>

                      
                    </div>
                </div>
            </div>
        </div>

      <!--   /////////// -->
        
          <script>
        // Sample data (replace this with your actual data)
        var consultantAvailabilityData = {
            labels: [
            	'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday' ],
            datasets: [
                {
                    label: '09:00 AM',
                    data: [5, 8, 10, 15, 12, 18, 7],
                    backgroundColor: 'rgba(75, 192, 192, 0.5)',
                    borderWidth: 2
                },
                {
                    label: '10:00 AM',
                    data: [10, 15, 8, 12, 6, 14, 20],
                    backgroundColor: 'rgba(255, 99, 132, 0.5)',
                    borderWidth: 2
                },
                {
                    label: '11:00 AM',
                    data: [10, 15, 8, 12, 6, 4, 20],
                    backgroundColor: 'rgba(55, 99, 172, 0.5)',
                    borderWidth: 2
                },
                {
                    label: '01:00 PM',
                    data: [10, 15, 8, 12, 60, 14, 5],
                    backgroundColor: 'rgba(205, 99, 192, 0.5)',
                    borderWidth: 2
                },
                {
                    label: '02:00 PM',
                    data: [10, 15, 8, 1, 6, 14, 2],
                    backgroundColor: 'rgba(25, 99, 132, 0.5)',
                    borderWidth: 2
                },
                
                {
                    label: '03:00 PM',
                    data: [10, 15, 8, 1, 6, 14, 2],
                    backgroundColor: 'rgba(25, 99, 132, 0.5)',
                    borderWidth: 2
                },
                
                {
                    label: '04:00 PM',
                    data: [10, 15, 8, 1, 6, 14, 2],
                    backgroundColor: 'rgba(115, 99, 132, 0.5)',
                    borderWidth: 2
                },
                
                {
                    label: '05:00 PM',
                    data: [10, 15, 8, 1, 6, 14, 2],
                    backgroundColor: 'rgba(215, 9, 132, 0.5)',
                    borderWidth: 2
                },
                // Continue with datasets for Job Type 3 to Job Type 10
            ]
        };

        // Get the canvas element
        var ctx9 = document.getElementById('availabilityRadarChart').getContext('2d');

        // Create the radar chart
        var consultantAvailabilityChart = new Chart(ctx9, {
            type: 'radar',
            data: consultantAvailabilityData,
            options: {
                responsive: true,
                maintainAspectRatio: false,
                scales: {
                    r: {
                        angleLines: {
                            display: true
                        },
                        suggestedMin: 0,
                        suggestedMax: 25, // Adjust based on your data range
                        title: {
                            display: true,
                            text: 'Number of Consultants'
                        }
                    }
                },
                plugins: {
                    legend: {
                        display: true,
                        position: 'top'
                    }
                }
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