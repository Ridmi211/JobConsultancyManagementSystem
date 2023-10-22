<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="tag" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ page import="com.jobConsultancyScheduler.model.User" %>
    <%@ page import="com.jobConsultancyScheduler.model.AccessRight" %><!DOCTYPE html>
<html>
<head>
    <title>Add Appointment</title>
</head>
<body>
    <h1>Add Appointment ${user.userId}</h1>
    <form action="AddAppointmentServlet" method="post">
        <label for="date">Date:</label>
        <input type="date" id="date" name="date" required>
        <br>
        
        <label for="time">Time:</label>
        <select id="time" name="time" required>
            <option value="10:00 AM">10:00 AM</option>
            <option value="1:00 PM">1:00 PM</option>
            <!-- Add more time slots here based on consultant availability -->
        </select>
        <br>
        
        <!-- Hidden input for consultant ID (You can pass this from your previous UI) -->
        <input type="hidden" name="consultantId" value="123">
        
        <!-- Hidden input for seeker ID (You can pass this based on the logged-in user) -->
        <input type="hidden" name="seekerId" value="456">
        
        <input type="submit" value="Add Appointment">
    </form>

    <script>
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
    </script>
</body>
</html>
