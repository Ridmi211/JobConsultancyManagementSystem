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
import com.jobConsultancyScheduler.model.Appointment.Status;
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
	    
	    protected void doGet(HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException {
	    	 System.out.println( "Action :" +request.getParameter("appactiontype") );
			String appactiontype = request.getParameter("appactiontype");
			  if (appactiontype.equals("singleAppointment")) {
			        fetchSingleAppointment(request, response);
			    } else if (appactiontype.equals("view")) {
			        viewAppointment(request, response);		   
		    }else if (appactiontype.equals("requested")) {
		    	fetchRequestedAppointments(request, response); 
		    }else if (appactiontype.equals("adminRequested")) {
		    	try {
					fetchAdminRequestedAppointments(request, response);
				} catch (ClassNotFoundException | ServletException | IOException | SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} 
		    }else {
		        fetchAllAppointments(request, response);
		    }
		}

	    protected void doPost(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
	        String appactiontype = request.getParameter("appactiontype");

	        if (appactiontype.equals("addAppointment")) {
	            addAppointment(request, response);
	        } else if (appactiontype.equals("editAppointment")) {
	            editAppointment(request, response);
	        } else if (appactiontype.equals("deleteAppointment")) {
	            deleteAppointment(request, response);
	        }else if (appactiontype.equals("approve")) {
	        	acceptAppointmentAdmin(request, response);
			} else if (appactiontype.equals("acceptCon")) {
				acceptAppointmentCon(request, response);
			} else if (appactiontype.equals("rejectCon")) {
				rejectAppointmentCon(request, response);
		    } else if (appactiontype.equals("view")) {
		        viewAppointment(request, response);
			} else if (appactiontype.equals("completed")) {
				completedAppointment(request, response);
			} else if (appactiontype.equals("cancel")) {
				cancelAppointmentAdmin(request, response);
			}
	    }

	    
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

	    
	    private void fetchAllAppointments(HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException {

			clearMessage();

			List<Appointment> appointmentList = new ArrayList<Appointment>();
			try {
				appointmentList = getAppointmentService().fetchAllAppointments();

				if (!(appointmentList.size() > 0)) {
					message = "No record found!";
				}
			} catch (ClassNotFoundException | SQLException e) {
				message = e.getMessage();
			}

			request.setAttribute("appointmentList", appointmentList);
			request.setAttribute("feebackMessage", message);

			RequestDispatcher rd = request.getRequestDispatcher("view-appointment-list.jsp");
			rd.forward(request, response);

		}	
	    
	    
	    private void fetchRequestedAppointments(HttpServletRequest request, HttpServletResponse response)
			    throws ServletException, IOException {

			    clearMessage();

			    List<Appointment> requestedAppointments = new ArrayList<Appointment>();
			    try {
			    	requestedAppointments = getAppointmentService().fetchRequestedAppointments(); 

			        if (!(requestedAppointments.size() > 0)) {
			            message = "No consultant users found!";
			        }
			    } catch (ClassNotFoundException | SQLException e) {
			        message = e.getMessage();
			    }

			    request.setAttribute("requestedAppointments", requestedAppointments); 
			    request.setAttribute("feebackMessage", message);

			    RequestDispatcher rd = request.getRequestDispatcher("view-requested-appointments.jsp"); 
			    rd.forward(request, response);
			}
//		
		private void acceptAppointmentAdmin(HttpServletRequest request, HttpServletResponse response)
		        throws ServletException, IOException {
		    int appointmentId = Integer.parseInt(request.getParameter("appointmentId"));
		    try {
		        if (getAppointmentService().acceptAppointmentAdmin(appointmentId)) {
		            message = "User has been approved!";
		        } else {
		            message = "Failed to approve the user!";
		        }
		    } catch (ClassNotFoundException | SQLException e) {
		        message = "Operation failed! " + e.getMessage();
		    }
			HttpSession session = request.getSession();
			session.setAttribute("message", message);

			response.sendRedirect("getAppointment?appactiontype=requested");
		}
//
		private void cancelAppointmentAdmin(HttpServletRequest request, HttpServletResponse response)
		        throws ServletException, IOException {
			 int appointmentId = Integer.parseInt(request.getParameter("appointmentId"));
		    try {
		        if (getAppointmentService().cancelAppointmentAdmin(appointmentId)) {
		            message = "User has been rejected!";
		        } else {
		            message = "Failed to reject the user!";
		        }
		    } catch (ClassNotFoundException | SQLException e) {
		        message = "Operation failed! " + e.getMessage();
		    }
			HttpSession session = request.getSession();
			session.setAttribute("message", message);

			response.sendRedirect("getAppointment?appactiontype=requested");
		}
//	    
	    
		private void acceptAppointmentCon(HttpServletRequest request, HttpServletResponse response)
		        throws ServletException, IOException {
			 int appointmentId = Integer.parseInt(request.getParameter("appointmentId"));
		    try {
		        if (getAppointmentService().acceptAppointmentCon(appointmentId)) {
		            message = "User has been rejected!";
		        } else {
		            message = "Failed to reject the user!";
		        }
		    } catch (ClassNotFoundException | SQLException e) {
		        message = "Operation failed! " + e.getMessage();
		    }
			HttpSession session = request.getSession();
			session.setAttribute("message", message);

			response.sendRedirect("getAppointment?appactiontype=adminRequested");
		}
		private void rejectAppointmentCon(HttpServletRequest request, HttpServletResponse response)
		        throws ServletException, IOException {
			 int appointmentId = Integer.parseInt(request.getParameter("appointmentId"));
		    try {
		        if (getAppointmentService().rejectAppointmentCon(appointmentId)) {
		            message = "User has been rejected!";
		        } else {
		            message = "Failed to reject the user!";
		        }
		    } catch (ClassNotFoundException | SQLException e) {
		        message = "Operation failed! " + e.getMessage();
		    }
			HttpSession session = request.getSession();
			session.setAttribute("message", message);

			response.sendRedirect("getAppointment?appactiontype=adminRequested");
		}
		private void completedAppointment(HttpServletRequest request, HttpServletResponse response)
		        throws ServletException, IOException {
			 int appointmentId = Integer.parseInt(request.getParameter("appointmentId"));
		    try {
		        if (getAppointmentService().completedAppointment(appointmentId)) {
		            message = "User has been rejected!";
		        } else {
		            message = "Failed to reject the user!";
		        }
		    } catch (ClassNotFoundException | SQLException e) {
		        message = "Operation failed! " + e.getMessage();
		    }
			HttpSession session = request.getSession();
			session.setAttribute("message", message);

			response.sendRedirect("getAppointment?appactiontype=adminRequested");
		}
	    private void fetchAdminRequestedAppointments(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException, ClassNotFoundException, SQLException {

	        clearMessage();

	        HttpSession session = request.getSession();
	        User user = (User) session.getAttribute("user"); // Assuming you store the logged-in user object in the session
	        System.out.println("User from session: " + user);
	        if (user == null) {
	            message = "You are not logged in!";
	            request.setAttribute("feebackMessage", message);
	            RequestDispatcher rd = request.getRequestDispatcher("view-admin-requested-appointments.jsp");
	            rd.forward(request, response);
	            return;
	        }

	        int loggedInUserId = user.getUserId(); // Assuming userId is a property of the User class

	        List<Appointment> requestedAppointments = new ArrayList<Appointment>();
	        try {
				requestedAppointments = getAppointmentService().fetchAdminRequestedAppointments(loggedInUserId);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			if (!(requestedAppointments.size() > 0)) {
			    message = "No requested appointments found for the logged-in user!";
			}

	        request.setAttribute("requestedAppointments", requestedAppointments);
	        request.setAttribute("feebackMessage", message);
	        System.out.println( "Action :" +request.getParameter("message") );
	        RequestDispatcher rd = request.getRequestDispatcher("view-admin-requested-appointments.jsp");
	        rd.forward(request, response);
	    }

	    private void viewAppointment(HttpServletRequest request, HttpServletResponse response)
		        throws ServletException, IOException {
		    int appointmentId = Integer.parseInt(request.getParameter("appointmentId"));
		    System.out.println("Reached the 'appointmentId' method.");

		    try {
		        Appointment appointment = getAppointmentService().fetchSingleAppointment(appointmentId);
		        if (appointment.getAppointmentId() > 0) {
		            request.setAttribute("appointment", appointment);
		            RequestDispatcher rd = request.getRequestDispatcher("view-and-update-appointment.jsp");
		            rd.forward(request, response);
		        } else {
		            request.setAttribute("message", "No user found!");
		            RequestDispatcher rd = request.getRequestDispatcher("user-list.jsp");
		            rd.forward(request, response);
		        }
		    } catch (ClassNotFoundException | SQLException e) {
		        e.printStackTrace();
		    }
		}
	    private void fetchSingleAppointment(HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException {

			clearMessage();

			int appointmentId = Integer.parseInt(request.getParameter("appointmentId"));

			try {
				Appointment appointment = getAppointmentService().fetchSingleAppointment(appointmentId);
				if (appointment.getAppointmentId() > 0) {
					request.setAttribute("appointment", appointment);
				} else {
					message = "No record found!";
				}
			} catch (ClassNotFoundException | SQLException e) {
				message = e.getMessage();
			}
			request.setAttribute("feebackMessage", message);
			RequestDispatcher rd = request.getRequestDispatcher("search-and-update-user.jsp");
			rd.forward(request, response);
		}
	    
	    private void editAppointment(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
	    	  clearMessage();

		        Appointment appointment = new Appointment();

		        // Get the logged-in user's ID for the seeker
 // Replace with your actual code to get the logged-in user's ID
		        appointment.setAppointmentId(Integer.parseInt(request.getParameter("appointmentId")));
		        appointment.setSeekerId(Integer.parseInt(request.getParameter("seekerId")));

		        // Get the consultant's ID from the previous page or request parameter
		      
		        appointment.setConsultantId( Integer.parseInt(request.getParameter("consultantId")));

		        appointment.setScheduledDate(request.getParameter("scheduledDate"));
		        appointment.setStartTime(request.getParameter("startTime"));
		        appointment.setStatus(Status.valueOf(request.getParameter("enum-status")));  // Set the initial status as REQUESTED
		        appointment.setCountry(request.getParameter("country"));
		        appointment.setJob(request.getParameter("job"));
		        appointment.setNotes(request.getParameter("notes"));
	  	    try {
	  	        if (getAppointmentService().editAppointment(appointment)) {
	  	            message = "The user has been successfully updated! User ID: " + appointment.getAppointmentId();
	  	        } else {
	  	            message = "Failed to update the user! User ID: " + appointment.getAppointmentId();
	  	        }
	  	    } catch (ClassNotFoundException | SQLException e) {
	  	        message = e.getMessage();
	  	    }

	  	    request.setAttribute("feebackMessage", message);
	  	    RequestDispatcher rd = request.getRequestDispatcher("feedback-message.jsp");
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
	    	HttpSession session = request.getSession();
			session.setAttribute("message", message);

			response.sendRedirect("getAppointment?appactiontype=all");
	    }
	


	private void clearMessage() {
		message = "";
	}
}
