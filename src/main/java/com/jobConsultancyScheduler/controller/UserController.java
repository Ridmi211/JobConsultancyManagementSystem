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
		}else if (useractiontype.equals("view")) {
			viewUser(request, response); 
		}else
			fetchAllUsers(request, response);
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

	
	private void loginUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    String email = request.getParameter("email");
	    String password = request.getParameter("password");

	    try {
	        User user = getUserService().fetchUserByEmail(email);

	        if (user != null) {
	            // Retrieve the hashed password from the database
	            String storedHashedPassword = user.getPassword();

	            // Hash the entered password using the same salt and algorithm
	            String enteredHashedPassword = hashPassword(password);

	            if (enteredHashedPassword != null && enteredHashedPassword.equals(storedHashedPassword)) {
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

	private void addUser(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {

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
	    user.setAccessRight(AccessRight.valueOf(request.getParameter("usertype")));
	    user.setEducationalQualifications(request.getParameter("educationalQualifications"));
	    user.setSpecializedCountries(request.getParameter("specializedCountries"));
	    user.setSpecializedJobs(request.getParameter("specializedJobs"));
	    
		/*
		 * // In your addUser and editUser methods, retrieve the values of available
		 * days and time slots String[] selectedAvailableDays =
		 * request.getParameterValues("availableDays"); String[]
		 * selectedAvailableTimeSlots =
		 * request.getParameterValues("availableTimeSlots");
		 * 
		 * // Convert the selected values to a comma-separated string String
		 * availableDays = String.join(",", selectedAvailableDays); String
		 * availableTimeSlots = String.join(",", selectedAvailableTimeSlots);
		 * 
		 * // Set the values in the User object user.setAvailableDays(availableDays);
		 * user.setAvailableTimeSlots(availableTimeSlots);
		 */
	    
	    
	 // In your addUser and editUser methods, retrieve the values of available days and time slots
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

	    // Now you can proceed with setting the remaining data
	    // ...

	    try {
	        // Check if the email already exists in the database
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
		byte[] salt = generateSalt(); // Generate a random salt
		int iterations = 10000; // You can adjust the number of iterations according to your security
								// requirements
		int keyLength = 256; // Key length in bits

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
			e.printStackTrace(); // Handle the exception properly in your application
			return null;
		}
	}

	private byte[] generateSalt() {
		// Generate a random salt for password hashing
		byte[] salt = new byte[16]; // You can adjust the salt length as needed
		// Generate the salt using a secure random number generator
		// Example: SecureRandom.getInstanceStrong().nextBytes(salt);
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
//		user.setPassword(request.getParameter("password"));
		user.setBirthdate(request.getParameter("birthdate"));
		user.setGender(request.getParameter("gender"));
		user.setOccupation(request.getParameter("occupation"));
		user.setCountry(request.getParameter("country"));
		
		/////only for consultant		
		user.setEducationalQualifications(request.getParameter("educationalQualifications"));
		user.setSpecializedCountries(request.getParameter("specializedCountries"));
		user.setSpecializedJobs(request.getParameter("specializedJobs"));
		 user.setAccessRight(AccessRight.valueOf(request.getParameter("accessRight")));
//		user.setAccessRight(AccessRight.valueOf(request.getParameter("accessRight")));
		try {
			if (getUserService().editUser(user)) {
				message = "The user has been successfully updated! User ID: " + user.getUserId();
			} else {
				message = "Failed to update the product! Product Code: " + user.getUserId();
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

	private void clearMessage() {
		message = "";
	}
}

//	/**
//	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
//	 */
//	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
//	}
//
//	/**
//	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
//	 */
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		doGet(request, response);
//	}
//
//}
