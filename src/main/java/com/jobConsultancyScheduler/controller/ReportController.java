package com.jobConsultancyScheduler.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jobConsultancyScheduler.model.User;
import com.jobConsultancyScheduler.service.EmailService;
import com.jobConsultancyScheduler.service.UserService;

/**
 * Servlet implementation class ReportController
 */
public class ReportController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	String message = "";

	private UserService getUserService() {
		return UserService.getUserService();
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String useractiontype = request.getParameter("reportAction");

	    if (useractiontype.equals("userSummary")) {
	        generateUserSummaryReport(request, response);	  
			/*
			 * } else if (useractiontype.equals("appointmentSummary")) {
			 * generateAppointmentSummaryReport(request, response); }else {
			 * generateCommonSummaryReport(request, response);
			 */
	    }
	}

	/*
	 * protected void doPost(HttpServletRequest request, HttpServletResponse
	 * response) throws ServletException, IOException { System.out.println(
	 * "Useraction"+request.getParameter("useractiontype") ); String useractiontype
	 * = request.getParameter("useractiontype");
	 * 
	 * if (useractiontype.equals("login")) { loginUser(request, response); } else if
	 * (useractiontype.equals("reject")) { rejectUser(request, response); }
	 * 
	 * }
	 */	
	
	private void generateUserSummaryReport(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {
	    int userId = Integer.parseInt(request.getParameter("userId"));
	    try {
	        User consultant = getUserService().fetchSingleUser(userId);
	        if (consultant.getUserId() > 0) {
	            request.setAttribute("consultant", consultant);
	            RequestDispatcher rd = request.getRequestDispatcher("book-consultant-new.jsp");
	            rd.forward(request, response);
	        } else {
	            request.setAttribute("message", "No consultant found!");
	            RequestDispatcher rd = request.getRequestDispatcher("consultants-list.jsp");
	            rd.forward(request, response);
	        }
	    } catch (ClassNotFoundException | SQLException e) {
	        e.printStackTrace();
	    }
	}

}
