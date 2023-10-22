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
import com.jobConsultancyScheduler.model.RegistrationStatus;
import com.jobConsultancyScheduler.model.User;
import com.jobConsultancyScheduler.service.UserService;

/**
 * Servlet implementation class UserController
 */
public class AppointmentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	String message = "";

	private UserService getUserService() {
		return UserService.getUserService();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String appointactiontype = request.getParameter("appointactiontype");

	    if (appointactiontype.equals("single")) {
	        fetchSingleUser(request, response);
	    } else if (appointactiontype.equals("view")) {
//	    	viewAppointment(request, response);
//	    } else if (appointactiontype.equals("consultants")) {
//	        fetchConsultantUsers(request, response); 
//	    }  else if (appointactiontype.equals("pending")) {
//	        fetchPendingUsers(request, response); 
//	    }else {
	        fetchAllUsers(request, response);
	    }
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
 System.out.println( "Useraction"+request.getParameter("appointactiontype") );
		String appointactiontype = request.getParameter("appointactiontype");

		 if (appointactiontype.equals("add")) {
			addUser(request, response);
		} else if (appointactiontype.equals("edit")) {
			editUser(request, response);
//		}else if (appointactiontype.equals("viewAppointment")) {
//			viewAppointment(request, response); 
		} else if (appointactiontype.equals("delete")) {
			deleteUser(request, response);
//		}else if (appointactiontype.equals("approve")) {
//		    approveUser(request, response);
//		} else if (appointactiontype.equals("reject")) {
//		    rejectUser(request, response);
		}

	}

//	private void viewAppointment(HttpServletRequest request, HttpServletResponse response)
//	        throws ServletException, IOException {
//	    int userId = Integer.parseInt(request.getParameter("userId"));
//	    System.out.println("Reached the 'viewUser' method.");
//
//	    try {
//	        User user = getUserService().fetchSingleUser(userId);
//	        if (user.getUserId() > 0) {
//	            request.setAttribute("user", user);
//	            RequestDispatcher rd = request.getRequestDispatcher("update-profile.jsp");
//	            rd.forward(request, response);
//	        } else {
//	            request.setAttribute("message", "No user found!");
//	            RequestDispatcher rd = request.getRequestDispatcher("user-list.jsp");
//	            rd.forward(request, response);
//	        }
//	    } catch (ClassNotFoundException | SQLException e) {
//	        e.printStackTrace();
//	    }
//	}



	private void addUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    clearMessage();

	    User user = new User();

	    user.setName(request.getParameter("name"));
	    user.setPhoneNumber(request.getParameter("telephone"));
	    user.setEmail(request.getParameter("email"));
	 

	    user.setBirthdate(request.getParameter("birthdate"));
	    user.setGender(request.getParameter("gender"));
	    user.setOccupation(request.getParameter("jobtype"));
	    user.setCountry(request.getParameter("country"));

	 
	        user.setAccessRight(AccessRight.ROLE_USER);
	        user.setRegistrationStatus(RegistrationStatus.APPROVED); // Other users are approved by default
	 


	    user.setEducationalQualifications(request.getParameter("educationalQualifications"));
	    user.setSpecializedCountries(request.getParameter("specializedCountries"));
	    user.setSpecializedJobs(request.getParameter("specializedJobs"));
	    
	    // Other user attributes...
	    
		  String[] selectedAvailableDays = request.getParameterValues("availableDays");
		  String[] selectedAvailableTimeSlots =
		  request.getParameterValues("availableTimeSlots");
		  
		 
		  if (selectedAvailableDays != null && selectedAvailableTimeSlots != null) {
		  
		  String availableDays = String.join(",", selectedAvailableDays); String
		  availableTimeSlots = String.join(",", selectedAvailableTimeSlots);
		  
		  
		  user.setAvailableDays(availableDays);
		  user.setAvailableTimeSlots(availableTimeSlots); } else {
		  
		  user.setAvailableDays(""); user.setAvailableTimeSlots(""); }
		  
	    try {
	        if (getUserService().isEmailAlreadyExists(user.getEmail())) {
	            message = "User with the same email already exists!";
	        } else {
	            boolean savedUser = getUserService().addUser(user);
	            if (savedUser) {
	                message = "The user has been successfully added!";
	            } else {
	                message = "Failed to add the user!";
	            }
	        }
	    } catch (ClassNotFoundException | SQLException e) {
	        message = "Operation failed! " + e.getMessage();
	    }

	    request.setAttribute("feebackMessage", message);
	    RequestDispatcher rd = request.getRequestDispatcher("add-user.jsp");
	    rd.forward(request, response);
	}




	private void editUser(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {

	    clearMessage();

	    User user = new User();
	    user.setUserId(Integer.parseInt(request.getParameter("userId")));
	    user.setName(request.getParameter("name"));
	    user.setPhoneNumber(request.getParameter("phoneNumber"));
	    user.setEmail(request.getParameter("email"));
	    // user.setPassword(request.getParameter("password"));
	    user.setBirthdate(request.getParameter("birthdate"));
	    user.setGender(request.getParameter("gender"));
	    user.setOccupation(request.getParameter("occupation"));
	    user.setCountry(request.getParameter("country"));


	    user.setEducationalQualifications(request.getParameter("educationalQualifications"));
	    user.setSpecializedCountries(request.getParameter("specializedCountries"));
	    user.setSpecializedJobs(request.getParameter("specializedJobs"));
	    user.setAccessRight(AccessRight.valueOf(request.getParameter("accessRight")));


	    String[] selectedAvailableDays = request.getParameterValues("availableDays");
	    String[] selectedAvailableTimeSlots = request.getParameterValues("availableTimeSlots");

	    // Check for null before processing
	    if (selectedAvailableDays != null && selectedAvailableTimeSlots != null) {
	        // Convert the selected values to a comma-separated string
	        String availableDays = String.join(",", selectedAvailableDays);
	        String availableTimeSlots = String.join(",", selectedAvailableTimeSlots);

	        // Set the values in the User object
	        user.setAvailableDays(availableDays);
	        user.setAvailableTimeSlots(availableTimeSlots);
	    } else {
	        // Handle the case when no checkboxes were selected
	        user.setAvailableDays("");
	        user.setAvailableTimeSlots("");
	    }

	    try {
	        if (getUserService().editUser(user)) {
	            message = "The user has been successfully updated! User ID: " + user.getUserId();
	        } else {
	            message = "Failed to update the user! User ID: " + user.getUserId();
	        }
	    } catch (ClassNotFoundException | SQLException e) {
	        message = e.getMessage();
	    }

	    request.setAttribute("feebackMessage", message);
	    RequestDispatcher rd = request.getRequestDispatcher("feedback-message.jsp");
	    rd.forward(request, response);
	}


	private void deleteUser(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		clearMessage();
		int userId = Integer.parseInt(request.getParameter("userId"));

		try {
			if (getUserService().deleteUser(userId)) {
				message = "The product has been successfully deleted. Product Code: " + userId;
			} else {
				message = "Failed to delete the product! Product Code: " + userId;
			}
		} catch (ClassNotFoundException | SQLException e) {
			message = e.getMessage();
		}

		HttpSession session = request.getSession();
		session.setAttribute("message", message);

		response.sendRedirect("getuser?useractiontype=all");
	}

	private void fetchSingleUser(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		clearMessage();

		int userId = Integer.parseInt(request.getParameter("userId"));

		try {
			User user = getUserService().fetchSingleUser(userId);
			if (user.getUserId() > 0) {
				request.setAttribute("user", user);
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

	private void fetchAllUsers(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		clearMessage();

		List<User> userList = new ArrayList<User>();
		try {
			userList = getUserService().fetchAllUsers();

			if (!(userList.size() > 0)) {
				message = "No record found!";
			}
		} catch (ClassNotFoundException | SQLException e) {
			message = e.getMessage();
		}

		request.setAttribute("userList", userList);
		request.setAttribute("feebackMessage", message);

		RequestDispatcher rd = request.getRequestDispatcher("view-job-seekers.jsp");
		rd.forward(request, response);

	}
	
	
//	private void fetchConsultantUsers(HttpServletRequest request, HttpServletResponse response)
//		    throws ServletException, IOException {
//
//		    clearMessage();
//
//		    List<User> consultantUsers = new ArrayList<User>();
//		    try {
//		        consultantUsers = getUserService().fetchAllConsultantUsers(); // Use the new method to fetch consultant users
//
//		        if (!(consultantUsers.size() > 0)) {
//		            message = "No consultant users found!";
//		        }
//		    } catch (ClassNotFoundException | SQLException e) {
//		        message = e.getMessage();
//		    }
//
//		    request.setAttribute("consultantUsers", consultantUsers); // Use a different attribute name for consultant users
//		    request.setAttribute("feebackMessage", message);
//
//		    RequestDispatcher rd = request.getRequestDispatcher("view-consultants.jsp"); // Use a different JSP page
//		    rd.forward(request, response);
//		}

//	
//	private void fetchPendingUsers(HttpServletRequest request, HttpServletResponse response)
//		    throws ServletException, IOException {
//
//		    clearMessage();
//
//		    List<User> pendingUsers = new ArrayList<User>();
//		    try {
//		    	pendingUsers = getUserService().fetchPendingUsers(); // Use the new method to fetch consultant users
//
//		        if (!(pendingUsers.size() > 0)) {
//		            message = "No consultant users found!";
//		        }
//		    } catch (ClassNotFoundException | SQLException e) {
//		        message = e.getMessage();
//		    }
//
//		    request.setAttribute("pendingUsers", pendingUsers); // Use a different attribute name for consultant users
//		    request.setAttribute("feebackMessage", message);
//
//		    RequestDispatcher rd = request.getRequestDispatcher("view-pending-users.jsp"); // Use a different JSP page
//		    rd.forward(request, response);
//		}
//
//	
//	private void approveUser(HttpServletRequest request, HttpServletResponse response)
//	        throws ServletException, IOException {
//	    int userId = Integer.parseInt(request.getParameter("userId"));
//	    try {
//	        if (getUserService().approveUser(userId)) {
//	            message = "User has been approved!";
//	        } else {
//	            message = "Failed to approve the user!";
//	        }
//	    } catch (ClassNotFoundException | SQLException e) {
//	        message = "Operation failed! " + e.getMessage();
//	    }
//	    request.setAttribute("feebackMessage", message);
//	    RequestDispatcher rd = request.getRequestDispatcher("view-pending-users.jsp");
//	    rd.forward(request, response);
//	}
//
//	private void rejectUser(HttpServletRequest request, HttpServletResponse response)
//	        throws ServletException, IOException {
//	    int userId = Integer.parseInt(request.getParameter("userId"));
//	    try {
//	        if (getUserService().rejectUser(userId)) {
//	            message = "User has been rejected!";
//	        } else {
//	            message = "Failed to reject the user!";
//	        }
//	    } catch (ClassNotFoundException | SQLException e) {
//	        message = "Operation failed! " + e.getMessage();
//	    }
//	    request.setAttribute("feebackMessage", message);
//	    RequestDispatcher rd = request.getRequestDispatcher("view-pending-users.jsp");
//	    rd.forward(request, response);
//	}

	private void clearMessage() {
		message = "";
	}
}
