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
public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	String message = "";

	private UserService getUserService() {
		return UserService.getUserService();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String useractiontype = request.getParameter("useractiontype");

	    if (useractiontype.equals("single")) {
	        fetchSingleUser(request, response);
	    } else if (useractiontype.equals("view")) {
	        viewUser(request, response);
	    } else if (useractiontype.equals("consultants")) {
	        fetchConsultantUsers(request, response); 
	    }  else if (useractiontype.equals("pending")) {
	        fetchPendingUsers(request, response); 
	    }else {
	        fetchAllUsers(request, response);
	    }
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
 System.out.println( "Useraction"+request.getParameter("useractiontype") );
		String useractiontype = request.getParameter("useractiontype");

		if (useractiontype.equals("login")) {
			loginUser(request, response);
		} else if (useractiontype.equals("add")) {
			addUser(request, response);
		} else if (useractiontype.equals("edit")) {
			editUser(request, response);
		}else if (useractiontype.equals("view")) {
			viewUser(request, response); 
		} else if (useractiontype.equals("delete")) {
			deleteUser(request, response);
		}else if (useractiontype.equals("approve")) {
		    approveUser(request, response);
		} else if (useractiontype.equals("reject")) {
		    rejectUser(request, response);
		}

	}

	private void viewUser(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {
	    int userId = Integer.parseInt(request.getParameter("userId"));
	    System.out.println("Reached the 'viewUser' method.");

	    try {
	        User user = getUserService().fetchSingleUser(userId);
	        if (user.getUserId() > 0) {
	            request.setAttribute("user", user);
	            RequestDispatcher rd = request.getRequestDispatcher("update-profile.jsp");
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

	/*
	 * private void loginUser(HttpServletRequest request, HttpServletResponse
	 * response) throws ServletException, IOException { String email =
	 * request.getParameter("email"); String password =
	 * request.getParameter("password");
	 * 
	 * try { User user = getUserService().fetchUserByEmail(email);
	 * 
	 * if (user != null) { // Retrieve the hashed password from the database String
	 * storedHashedPassword = user.getPassword();
	 * 
	 * // Hash the entered password using the same salt and algorithm String
	 * enteredHashedPassword = hashPassword(password);
	 * 
	 * if (enteredHashedPassword != null &&
	 * enteredHashedPassword.equals(storedHashedPassword)) { HttpSession session =
	 * request.getSession(); session.setAttribute("user", user);
	 * response.sendRedirect("home.jsp"); } else {
	 * request.setAttribute("loginError", "Invalid email or password");
	 * RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
	 * rd.forward(request, response); } } else { request.setAttribute("loginError",
	 * "Invalid email or password"); RequestDispatcher rd =
	 * request.getRequestDispatcher("login.jsp"); rd.forward(request, response); } }
	 * catch (ClassNotFoundException | SQLException e) { e.printStackTrace(); } }
	 */
	private void loginUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    String email = request.getParameter("email");
	    String password = request.getParameter("password");

	    try {
	        User user = getUserService().fetchUserByEmail(email);

	        if (user != null) {
	            if (AccessRight.ROLE_CONSULTANT.getDisplayName().equals(user.getAccessRight().getDisplayName())) {
	                if (RegistrationStatus.PENDING.equals(user.getRegistrationStatus())) {
	                    request.setAttribute("loginError", "Consultant registration is pending approval.");
	                    RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
	                    rd.forward(request, response);
	                    return; // Exit the method to prevent forwarding to the home page
	                } else if (RegistrationStatus.REJECTED.equals(user.getRegistrationStatus())) {
	                    request.setAttribute("loginError", "Consultant registration has been rejected.");
	                    RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
	                    rd.forward(request, response);
	                    return; // Exit the method to prevent forwarding to the home page
	                }
	            }

	            // Hash the entered password using the same salt and algorithm
	            String enteredHashedPassword = hashPassword(password);

	            if (enteredHashedPassword != null && enteredHashedPassword.equals(user.getPassword())) {
	                HttpSession session = request.getSession();
	                session.setAttribute("user", user);
	                response.sendRedirect("home.jsp");
	            } else {
	                request.setAttribute("loginError", "Invalid email or password");
	                RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
	                rd.forward(request, response);
	            }
	        } else {
	            request.setAttribute("loginError", "Invalid email or password");
	            RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
	            rd.forward(request, response);
	        }
	    } catch (ClassNotFoundException | SQLException e) {
	        e.printStackTrace();
	    }
	}

	
	
	
	
	/*
	 * private void addUser(HttpServletRequest request, HttpServletResponse
	 * response) throws ServletException, IOException {
	 * 
	 * clearMessage();
	 * 
	 * User user = new User();
	 * 
	 * user.setName(request.getParameter("name"));
	 * user.setPhoneNumber(request.getParameter("telephone"));
	 * user.setEmail(request.getParameter("email"));
	 * 
	 * String plainPassword = request.getParameter("password");
	 * 
	 * if (plainPassword == null || plainPassword.isEmpty()) { // Password is null
	 * or empty, return an error message message =
	 * "Password cannot be null or empty."; request.setAttribute("feebackMessage",
	 * message); RequestDispatcher rd =
	 * request.getRequestDispatcher("add-user.jsp"); rd.forward(request, response);
	 * return; // Exit the method, do not proceed with adding the user }
	 * 
	 * String hashedPassword = hashPassword(plainPassword);
	 * user.setPassword(hashedPassword);
	 * 
	 * user.setBirthdate(request.getParameter("birthdate"));
	 * user.setGender(request.getParameter("gender"));
	 * user.setOccupation(request.getParameter("jobtype"));
	 * user.setCountry(request.getParameter("country"));
	 * user.setAccessRight(AccessRight.valueOf(request.getParameter("usertype")));
	 * user.setEducationalQualifications(request.getParameter(
	 * "educationalQualifications"));
	 * user.setSpecializedCountries(request.getParameter("specializedCountries"));
	 * user.setSpecializedJobs(request.getParameter("specializedJobs"));
	 * 
	 * 
	 * 
	 * 
	 * String[] selectedAvailableDays = request.getParameterValues("availableDays");
	 * String[] selectedAvailableTimeSlots =
	 * request.getParameterValues("availableTimeSlots");
	 * 
	 * 
	 * if (selectedAvailableDays != null && selectedAvailableTimeSlots != null) {
	 * 
	 * String availableDays = String.join(",", selectedAvailableDays); String
	 * availableTimeSlots = String.join(",", selectedAvailableTimeSlots);
	 * 
	 * 
	 * user.setAvailableDays(availableDays);
	 * user.setAvailableTimeSlots(availableTimeSlots); } else {
	 * 
	 * user.setAvailableDays(""); user.setAvailableTimeSlots(""); }
	 * 
	 * 
	 * 
	 * try {
	 * 
	 * if (getUserService().isEmailAlreadyExists(user.getEmail())) { message =
	 * "User with the same email already exists!"; } else { boolean savedUser =
	 * getUserService().addUser(user); if (savedUser) { message =
	 * "The user has been successfully added!"; } else { message =
	 * "Failed to add the user!"; } } } catch (ClassNotFoundException | SQLException
	 * e) { message = "Operation failed! " + e.getMessage(); }
	 * 
	 * request.setAttribute("feebackMessage", message); RequestDispatcher rd =
	 * request.getRequestDispatcher("add-user.jsp"); rd.forward(request, response);
	 * }
	 */

	private void addUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    clearMessage();

	    User user = new User();

	    user.setName(request.getParameter("name"));
	    user.setPhoneNumber(request.getParameter("telephone"));
	    user.setEmail(request.getParameter("email"));
	    String plainPassword = request.getParameter("password");

	    if (plainPassword == null || plainPassword.isEmpty()) {
	        // Password is null or empty, return an error message
	        message = "Password cannot be null or empty.";
	        request.setAttribute("feebackMessage", message);
	        RequestDispatcher rd = request.getRequestDispatcher("add-user.jsp");
	        rd.forward(request, response);
	        return; // Exit the method, do not proceed with adding the user
	    }

	    String hashedPassword = hashPassword(plainPassword);
	    user.setPassword(hashedPassword);

	    user.setBirthdate(request.getParameter("birthdate"));
	    user.setGender(request.getParameter("gender"));
	    user.setOccupation(request.getParameter("jobtype"));
	    user.setCountry(request.getParameter("country"));
	    
	    // Check if the user is a consultant (usertype "CONSULTANT") and set registrationStatus accordingly
//	    if (AccessRight.ROLE_CONSULTANT.equals(AccessRight.valueOf(request.getParameter("usertype")))) {
//	        user.setAccessRight(AccessRight.ROLE_CONSULTANT);
//	        user.setRegistrationStatus(RegistrationStatus.PENDING);
//	    } else {
//	        user.setAccessRight(AccessRight.ROLE_USER);
//	        user.setRegistrationStatus(RegistrationStatus.APPROVED); // Other users are approved by default
//	    }
	    
	    if (AccessRight.ROLE_ADMIN.equals(AccessRight.valueOf(request.getParameter("usertype")))) {
	    	System.out.println("User type from request: " + request.getParameter("usertype"));

	        user.setAccessRight(AccessRight.ROLE_ADMIN);
	        user.setRegistrationStatus(RegistrationStatus.APPROVED); // Administrators are approved by default
	    } else if (AccessRight.ROLE_CONSULTANT.equals(AccessRight.valueOf(request.getParameter("usertype")))) {
	    	System.out.println("User type from request: " + request.getParameter("usertype"));

	    	  user.setAccessRight(AccessRight.ROLE_CONSULTANT);
	        user.setRegistrationStatus(RegistrationStatus.PENDING);
	    } else {
	    	System.out.println("User type from request: " + request.getParameter("usertype"));

	        user.setAccessRight(AccessRight.ROLE_USER);
	        user.setRegistrationStatus(RegistrationStatus.APPROVED); // Other users are approved by default
	    }

//	    if ("ROLE_ADMIN".equals(request.getParameter("usertype"))) {
//	        user.setAccessRight(AccessRight.ROLE_ADMIN);
//	        user.setRegistrationStatus(RegistrationStatus.APPROVED);
//	    } else if ("ROLE_CONSULTANT".equals(request.getParameter("usertype"))) {
//	        user.setAccessRight(AccessRight.ROLE_CONSULTANT);
//	        user.setRegistrationStatus(RegistrationStatus.PENDING);
//	    } else {
//	        user.setAccessRight(AccessRight.ROLE_USER);
//	        user.setRegistrationStatus(RegistrationStatus.APPROVED);
//	    }



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


	private String hashPassword(String plainPassword) {
		byte[] salt = generateSalt(); 
		int iterations = 10000; 
								
		int keyLength = 256; 

		// Hash the password using PBKDF2
		char[] passwordChars = plainPassword.toCharArray();
		PBEKeySpec spec = new PBEKeySpec(passwordChars, salt, iterations, keyLength);
		try {
			SecretKeyFactory skf = SecretKeyFactory.getInstance("PBKDF2WithHmacSHA256");
			byte[] hash = skf.generateSecret(spec).getEncoded();

			// Combine the salt and hash and encode as Base64
			byte[] combined = new byte[salt.length + hash.length];
			System.arraycopy(salt, 0, combined, 0, salt.length);
			System.arraycopy(hash, 0, combined, salt.length, hash.length);

			return Base64.getEncoder().encodeToString(combined);
		} catch (NoSuchAlgorithmException | InvalidKeySpecException e) {
			e.printStackTrace(); 
			return null;
		}
	}

	private byte[] generateSalt() {
	
		byte[] salt = new byte[16]; 
		
		return salt;
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
	
	
	private void fetchConsultantUsers(HttpServletRequest request, HttpServletResponse response)
		    throws ServletException, IOException {

		    clearMessage();

		    List<User> consultantUsers = new ArrayList<User>();
		    try {
		        consultantUsers = getUserService().fetchAllConsultantUsers(); // Use the new method to fetch consultant users

		        if (!(consultantUsers.size() > 0)) {
		            message = "No consultant users found!";
		        }
		    } catch (ClassNotFoundException | SQLException e) {
		        message = e.getMessage();
		    }

		    request.setAttribute("consultantUsers", consultantUsers); // Use a different attribute name for consultant users
		    request.setAttribute("feebackMessage", message);

		    RequestDispatcher rd = request.getRequestDispatcher("view-consultants.jsp"); // Use a different JSP page
		    rd.forward(request, response);
		}

	
	private void fetchPendingUsers(HttpServletRequest request, HttpServletResponse response)
		    throws ServletException, IOException {

		    clearMessage();

		    List<User> pendingUsers = new ArrayList<User>();
		    try {
		    	pendingUsers = getUserService().fetchPendingUsers(); // Use the new method to fetch consultant users

		        if (!(pendingUsers.size() > 0)) {
		            message = "No consultant users found!";
		        }
		    } catch (ClassNotFoundException | SQLException e) {
		        message = e.getMessage();
		    }

		    request.setAttribute("pendingUsers", pendingUsers); // Use a different attribute name for consultant users
		    request.setAttribute("feebackMessage", message);

		    RequestDispatcher rd = request.getRequestDispatcher("view-pending-users.jsp"); // Use a different JSP page
		    rd.forward(request, response);
		}

	
	private void approveUser(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {
	    int userId = Integer.parseInt(request.getParameter("userId"));
	    try {
	        if (getUserService().approveUser(userId)) {
	            message = "User has been approved!";
	        } else {
	            message = "Failed to approve the user!";
	        }
	    } catch (ClassNotFoundException | SQLException e) {
	        message = "Operation failed! " + e.getMessage();
	    }
	    request.setAttribute("feebackMessage", message);
	    RequestDispatcher rd = request.getRequestDispatcher("view-pending-users.jsp");
	    rd.forward(request, response);
	}

	private void rejectUser(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {
	    int userId = Integer.parseInt(request.getParameter("userId"));
	    try {
	        if (getUserService().rejectUser(userId)) {
	            message = "User has been rejected!";
	        } else {
	            message = "Failed to reject the user!";
	        }
	    } catch (ClassNotFoundException | SQLException e) {
	        message = "Operation failed! " + e.getMessage();
	    }
	    request.setAttribute("feebackMessage", message);
	    RequestDispatcher rd = request.getRequestDispatcher("view-pending-users.jsp");
	    rd.forward(request, response);
	}

	private void clearMessage() {
		message = "";
	}
}
