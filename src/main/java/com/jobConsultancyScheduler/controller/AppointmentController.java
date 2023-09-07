package com.jobConsultancyScheduler.controller;

import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jobConsultancyScheduler.model.Appointment;
import com.jobConsultancyScheduler.model.JobSeeker;
import com.jobConsultancyScheduler.model.User;
import com.jobConsultancyScheduler.service.AppointmentService;

/**
 * Servlet implementation class AppointmentController
 */
public class AppointmentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
		
		String message = "";
		
		private AppointmentService getAppointmentService() {
			return AppointmentService.getAppointmentService();
		}
		
		protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
			String actionType= request.getParameter("actiontype");
			
			if(actionType.equals("single")) {
				fetchSingleAppointment(request, response);
			}
			else {
				fetchAllAppointments(request, response);
			}
			
		}
		
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
			String actionType = request.getParameter("actiontype");
			
			if(actionType.equals("add")) {
				addAppointment(request, response);
			}
			else if(actionType.equals("edit")){
				editAppointment(request, response);
			}
			else if(actionType.equals("delete")) {
				deleteAppointment(request, response);
			}
		}
		
//		private void addAppointment(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//			
//			clearMessage();
//			
//			Appointment appointment = new Appointment();
//			
//			appointment.setName(request.getParameter("name"));
//			appointment.setPrice(Double.parseDouble(request.getParameter("price")));		
//			
//			try {
//				if(getAppointmentService().addAppointment(appointment))
//				{
//					message = "The product has been successfully added!";
//				}
//				else {
//					message = "Failed to add the product!";
//				}
//			} 
//			catch (ClassNotFoundException | SQLException e) {
//				message = "operation failed! " + e.getMessage();
//			}
//			
//			request.setAttribute("feebackMessage", message);
//			RequestDispatcher rd = request.getRequestDispatcher("add-product.jsp");
//			rd.forward(request, response);
//		}
//		
		
		
		private void addAppointment(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		    clearMessage();

		    // Retrieve the logged-in user from the session
		    User loggedInUser = (User) request.getSession().getAttribute("loggedInUser");

		    // Check if the user is logged in
		    if (loggedInUser == null) {
		        // Handle the case where the user is not logged in
		        // You can redirect them to the login page or show an error message
		        message = "You must be logged in to add an appointment.";
		    } else {
		        // User is logged in, proceed with creating the appointment
		        Appointment appointment = new Appointment();
		        appointment.setJobSeeker(new JobSeeker(0, loggedInUser, null, null)); // Set the job seeker with the logged-in user
		        // Set other properties of the appointment as needed
		        appointment.setScheduledDateAndTime(new Date(0)); // Example: Set the date and time

		        try {
		            if (getAppointmentService().addAppointment(appointment)) {
		                message = "The appointment has been successfully added!";
		            } else {
		                message = "Failed to add the appointment!";
		            }
		        } catch (ClassNotFoundException | SQLException e) {
		            message = "Operation failed! " + e.getMessage();
		        }
		    }

		    request.setAttribute("feedbackMessage", message);
		    RequestDispatcher rd = request.getRequestDispatcher("add-appointment.jsp");
		    rd.forward(request, response);
		}

		private void editAppointment(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
//			clearMessage();
//			
//			Appointment appointment = new Appointment();
//			appointment.setAppointmentId(Integer.parseInt(request.getParameter("productcode")));
//			appointment.setName(request.getParameter("name"));
//			appointment.setPrice(Double.parseDouble(request.getParameter("price")));
//			
//			try {
//				if(getAppointmentService().editAppointment(appointment)) {
//					message = "The product has been successfully updated! Product Code: " + appointment.getAppointmentId();
//				}
//				else {
//					message = "Failed to update the product! Product Code: " + appointment.getAppointmentId();
//				}
//			} 
//			catch (ClassNotFoundException | SQLException e) {
//				message = e.getMessage();
//			}
//			
//			request.setAttribute("feebackMessage", message);
//			RequestDispatcher rd = request.getRequestDispatcher("search-and-update.jsp");
//			rd.forward(request, response);
//			
		}
		
		private void deleteAppointment(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
			clearMessage();
			int appointmentId = Integer.parseInt(request.getParameter("productCode"));
			
			try {
				if(getAppointmentService().deleteAppointment(appointmentId)) {
					message = "The product has been successfully deleted. Product Code: " + appointmentId;
				}
				else {
					message = "Failed to delet the product! Product Code: " + appointmentId;
				}
			} 
			catch (ClassNotFoundException | SQLException e) {
				message =e.getMessage();
			}
			
			request.setAttribute("feebackMessage", message);
			RequestDispatcher rd = request.getRequestDispatcher("view-all-and-delete-specific.jsp");
			rd.forward(request, response);
			
			HttpSession session = request.getSession();
			session.setAttribute("message", message);
			
			response.sendRedirect("getproduct?actiontype=all");
		}
		
		private void fetchSingleAppointment(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
			clearMessage();
			
			int appointmentId = Integer.parseInt(request.getParameter("productcode"));
			
			try {
				Appointment appointment = getAppointmentService().fetchSingleAppointment(appointmentId);
				if(appointment.getAppointmentId() > 0) {
					request.setAttribute("appointment", appointment);
				}
				else {
					message = "No record found!";
				}
			} 
			catch (ClassNotFoundException | SQLException e) {
				message = e.getMessage();
			}
			request.setAttribute("feebackMessage", message);
			RequestDispatcher rd = request.getRequestDispatcher("search-and-update.jsp");
			rd.forward(request, response);
		}
		
		private void fetchAllAppointments(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
			clearMessage();
			
			List<Appointment> productList = new ArrayList<Appointment>();
			try {
				productList = getAppointmentService().fetchAllAppointments();
				
				if(!(productList.size() > 0)) {
					message = "No record found!";
				}
			} 
			catch (ClassNotFoundException | SQLException e) {
				message = e.getMessage();
			}
			
			request.setAttribute("productList", productList);
			request.setAttribute("feebackMessage", message);
			
			RequestDispatcher rd = request.getRequestDispatcher("view-all-and-delete-specific.jsp");
			rd.forward(request, response);
			
		}
//		
		private void clearMessage() {
			message = "";
		}



	
}
