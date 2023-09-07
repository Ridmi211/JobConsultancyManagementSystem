package com.jobConsultancyScheduler.controller;

import java.io.IOException;
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

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String useractiontype= request.getParameter("useractiontype");
		
		if(useractiontype.equals("single")) {
			fetchSingleUser(request, response);
		}
		else {
			fetchAllUsers(request, response);
		}
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
String useractiontype = request.getParameter("useractiontype");
		
		if(useractiontype.equals("add")) {
			addUser(request, response);
		}
		else if(useractiontype.equals("edit")){
			editUser(request, response);
		}
		else if(useractiontype.equals("delete")) {
			deleteUser(request, response);
		}
	}
	private void addUser(HttpServletRequest request , HttpServletResponse response) throws ServletException, IOException{
		
		clearMessage();
		
		User user = new User();
		
		
		user.setName(request.getParameter("name"));
//		System.out.println("name" + request.getParameter("name")	);
		user.setPhoneNumber(request.getParameter("telephone"));
		user.setEmail(request.getParameter("email"));
		user.setPassword(request.getParameter("pwd"));
		user.setBirthdate(request.getParameter("birthdate"));
		user.setGender(request.getParameter("gender"));
		user.setOccupation(request.getParameter("jobtype"));
		user.setCountry(request.getParameter("country"));		
		user.setAccessRight(AccessRight.valueOf(request.getParameter("usertype")));	
//		 MyEnum myEnum = MyEnum.valueOf(enumString);
		
		

		try {
			boolean savedUser = getUserService().addUser(user);
			if(savedUser)
			{
				message = "The user has been successfully added!";
			}
			else {
				message = "Failed to add the usert!";
			}
		} 
		catch (ClassNotFoundException | SQLException e) {
			message = "operation failed! " + e.getMessage();
		}
		
		request.setAttribute("feebackMessage", message);
		RequestDispatcher rd = request.getRequestDispatcher("add-user.jsp");
		rd.forward(request, response);
	}
	
	private void editUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		clearMessage();
		
		User user = new User();
		user.setGender(request.getParameter("name"));
		user.setOccupation(request.getParameter("name"));
		user.setCountry(request.getParameter("name"));
		
		try {
			if(getUserService().editUser(user)) {
				message = "The product has been successfully updated! Product Code: " + user.getUserId();
			}
			else {
				message = "Failed to update the product! Product Code: " + user.getUserId();
			}
		} 
		catch (ClassNotFoundException | SQLException e) {
			message = e.getMessage();
		}
		
		request.setAttribute("feebackMessage", message);
		RequestDispatcher rd = request.getRequestDispatcher("search-and-update.jsp");
		rd.forward(request, response);
		
	}
	
	private void deleteUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		clearMessage();
		int productCode = Integer.parseInt(request.getParameter("productCode"));
		
		try {
			if(getUserService().deleteUser(productCode)) {
				message = "The product has been successfully deleted. Product Code: " + productCode;
			}
			else {
				message = "Failed to delet the product! Product Code: " + productCode;
			}
		} 
		catch (ClassNotFoundException | SQLException e) {
			message =e.getMessage();
		}
		
	
		
		HttpSession session = request.getSession();
		session.setAttribute("message", message);
		
		response.sendRedirect("getproduct?actiontype=all");
	}
	
	private void fetchSingleUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		clearMessage();
		
		int userId = Integer.parseInt(request.getParameter("userId"));
		
		try {
			User user = getUserService().fetchSingleUser(userId);
			if(user.getUserId() > 0) {
				request.setAttribute("user", user);
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
	
	private void fetchAllUsers(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		clearMessage();
		
		List<User> userList = new ArrayList<User>();
		try {
			userList = getUserService().fetchAllUsers();
			
			if(!(userList.size() > 0)) {
				message = "No record found!";
			}
		} 
		catch (ClassNotFoundException | SQLException e) {
			message = e.getMessage();
		}
		
		request.setAttribute("userList", userList);
		request.setAttribute("feebackMessage", message);
		
		RequestDispatcher rd = request.getRequestDispatcher("view-all-and-delete-specific.jsp");
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
