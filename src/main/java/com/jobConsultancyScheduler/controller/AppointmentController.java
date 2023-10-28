package com.jobConsultancyScheduler.controller;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.PBEKeySpec;
import java.util.Base64;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jobConsultancyScheduler.model.AccessRight;
import com.jobConsultancyScheduler.model.Appointment;
import com.jobConsultancyScheduler.model.RegistrationStatus;
import com.jobConsultancyScheduler.model.User;
import com.jobConsultancyScheduler.service.AppointmentService;
import com.jobConsultancyScheduler.service.UserService;

/**
 * Servlet implementation class UserController
 */
public class AppointmentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	String message = "";


	    private AppointmentService getAppointmentService() {
	        return AppointmentService.getAppointmentService();
	    }

	    protected void doPost(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
	        String useractiontype = request.getParameter("appactiontype");

	        if (useractiontype.equals("addAppointment")) {
	            addAppointment(request, response);
	        } else if (useractiontype.equals("editAppointment")) {
	            editAppointment(request, response);
	        } else if (useractiontype.equals("deleteAppointment")) {
	            deleteAppointment(request, response);
	        }
	    }

//	    private void addAppointment(HttpServletRequest request, HttpServletResponse response)
//	            throws ServletException, IOException {
//	        clearMessage();
//
//	        Appointment appointment = new Appointment();
//	        // Populate appointment properties from the request parameters
//
//	        try {
//	            boolean added = getAppointmentService().addAppointment(appointment);
//	            if (added) {
//	                message = "Appointment added successfully!";
//	            } else {
//	                message = "Failed to add the appointment.";
//	            }
//	        } catch (ClassNotFoundException | SQLException e) {
//	            message = "Operation failed: " + e.getMessage();
//	        }
//
//	        request.setAttribute("feebackMessage", message);
//	        RequestDispatcher rd = request.getRequestDispatcher("add-appointment.jsp"); // Replace with your target page
//	        rd.forward(request, response);
//	    }

	    
	    private void addAppointment(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        clearMessage();

	        Appointment appointment = new Appointment();

	        // Get the logged-in user's ID for the seeker
	        int seekerId = Integer.parseInt(request.getParameter("seekerId")); // Replace with your actual code to get the logged-in user's ID
	        appointment.setSeekerId(seekerId);

	        // Get the consultant's ID from the previous page or request parameter
	        int consultantId = Integer.parseInt(request.getParameter("consultantId"));
	        appointment.setConsultantId(consultantId);

	        appointment.setScheduledDate(request.getParameter("date"));
	        appointment.setStartTime(request.getParameter("time"));
	        appointment.setStatus(Appointment.Status.REQUESTED);  // Set the initial status as REQUESTED
	        appointment.setCountry(request.getParameter("country"));
	        appointment.setJob(request.getParameter("job"));
	        appointment.setNotes(request.getParameter("notes"));

	        try {
	            boolean savedAppointment = getAppointmentService().addAppointment(appointment);
	            if (savedAppointment) {
	                message = "The appointment request has been successfully submitted!";
	            } else {
	                message = "Failed to submit the appointment request!";
	            }
	        } catch (ClassNotFoundException | SQLException e) {
	            message = "Operation failed! " + e.getMessage();
	        }

	        request.setAttribute("feebackMessage", message);
	        RequestDispatcher rd = request.getRequestDispatcher("feedback-message.jsp");
	        rd.forward(request, response);
	    }

	    
	    
	    private void editAppointment(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
	        clearMessage();

	        int appointmentId = Integer.parseInt(request.getParameter("appointmentId"));
	        Appointment appointment = getAppointmentService().getAppointmentById(appointmentId);

	        if (appointment != null) {
	            // Update appointment properties from the request parameters

	            try {
	                boolean updated = getAppointmentService().editAppointment(appointment);
	                if (updated) {
	                    message = "Appointment updated successfully!";
	                } else {
	                    message = "Failed to update the appointment.";
	                }
	            } catch (ClassNotFoundException | SQLException e) {
	                message = "Operation failed: " + e.getMessage();
	            }
	        } else {
	            message = "No appointment found with ID: " + appointmentId;
	        }

	        request.setAttribute("feebackMessage", message);
	        RequestDispatcher rd = request.getRequestDispatcher("edit-apxcxpointment.jsp"); // Replace with your target page
	        rd.forward(request, response);
	    }

	    private void deleteAppointment(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
	        clearMessage();

	        int appointmentId = Integer.parseInt(request.getParameter("appointmentId"));

	        try {
	            boolean deleted = getAppointmentService().deleteAppointment(appointmentId);
	            if (deleted) {
	                message = "Appointment deleted successfully!";
	            } else {
	                message = "Failed to delete the appointment.";
	            }
	        } catch (ClassNotFoundException | SQLException e) {
	            message = "Operation failed: " + e.getMessage();
	        }

	        request.setAttribute("feebackMessage", message);
	        RequestDispatcher rd = request.getRequestDispatcher("delete-appointment.jsp"); // Replace with your target page
	        rd.forward(request, response);
	    }
	


	private void clearMessage() {
		message = "";
	}
}
