package com.jobConsultancyScheduler.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jobConsultancyScheduler.model.Appointment;
import com.jobConsultancyScheduler.model.Message;
import com.jobConsultancyScheduler.model.Message.MessageStatus;
import com.jobConsultancyScheduler.service.AppointmentService;
import com.jobConsultancyScheduler.service.MessageService;

/**
 * Servlet implementation class ContactController
 */
public class MessageController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	String message = "";
	
	private MessageService getMessageService() {
        return MessageService.getMessageService();
    }
	
	  protected void doGet(HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException {
	    	 System.out.println( "Action :" +request.getParameter("msgactiontype") );
			String msgactiontype = request.getParameter("msgactiontype");
			 if (msgactiontype.equals("newMsg")) {
		            fetchNewMessages(request, response);
		        } else fetchAllMessages(request, response);
		    
		}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	       String msgactiontype = request.getParameter("msgactiontype");

	        if (msgactiontype.equals("addMessage")) {
	            addMessage(request, response);
	        } else if (msgactiontype.equals("deleteMsg")) {
	            deleteMessage(request, response);
	            
//	        }else if (msgactiontype.equals("approve")) {
//	        	replyToMessage(request, response);
			} else if (msgactiontype.equals("reply")) {
			    replyToMessage(request, response);
			}

	}

//	private void addMessage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//	    clearMessage();
//
//	    Message contact = new Message();
//
//	    // Get the message attributes from the request
////	    contact.setMessageId(Integer.parseInt(request.getParameter("messageId")));
//
//	    // Automatically set the current date
//	    Date currentDate = new Date();
//	    contact.setMessageDate(currentDate);
//
//	    contact.setMessangerName(request.getParameter("messangerName"));
//	    contact.setMessangerEmail(request.getParameter("messangerEmail"));
//	    contact.setMessageBody(request.getParameter("messageBody"));
//	    
//	    // Set the initial message status
//	    contact.setMessageStatus(MessageStatus.NEW); // Assuming MessageStatus is an enum
//
//	    try {
//	        boolean savedMessage = getMessageService().addMessage(contact);
//	        if (savedMessage) {
//	            message = "The message has been successfully submitted!";
//	        } else {
//	            message = "Failed to submit the message!";
//	        }
//	    } catch (ClassNotFoundException | SQLException e) {
//	        message = "Operation failed! " + e.getMessage();
//	    }
//
//	    request.setAttribute("feebackMessage", message);
//	    RequestDispatcher rd = request.getRequestDispatcher("home.jsp");
//	    rd.forward(request, response);
//	}

	
	private void replyToMessage(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {
	    clearMessage();

	    int messageId = Integer.parseInt(request.getParameter("messageId"));

	    try {
	        boolean replied = getMessageService().replyToMessage(messageId);
	        if (replied) {
	            message = "Message status set to Replied successfully!";
	        } else {
	            message = "Failed to set message status to Replied.";
	        }
	    } catch (ClassNotFoundException | SQLException e) {
	        message = "Operation failed: " + e.getMessage();
	    }

	    request.setAttribute("feebackMessage", message);
	    fetchAllMessages(request, response); // Refresh the message list after updating the status
	}

	
	private void addMessage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    clearMessage();

	    Message contact = new Message();

	    // Get the message attributes from the request

	    // Automatically set the current date
	    Date currentDate = new Date();
	    contact.setMessageDate(currentDate);

	    contact.setMessangerName(request.getParameter("messangerName"));
	    contact.setMessangerEmail(request.getParameter("messangerEmail"));
	    contact.setMessageBody(request.getParameter("messageBody"));

	    // Set the initial message status
	    contact.setMessageStatus(MessageStatus.NEW); // Assuming MessageStatus is an enum

	    try {
	        boolean savedMessage = getMessageService().addMessage(contact);
	        if (savedMessage) {
	            // Message has been saved, send a receipt confirmation email
	            MessageService.sendMessageReceivedEmail(contact);
	            message = "The message has been successfully submitted!";
	        } else {
	            message = "Failed to submit the message!";
	        }
	    } catch (ClassNotFoundException | SQLException e) {
	        message = "Operation failed! " + e.getMessage();
	    }

	    request.setAttribute("feebackMessage", message);
	    RequestDispatcher rd = request.getRequestDispatcher("home.jsp");
	    rd.forward(request, response);
	}

	    private void fetchNewMessages(HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException {
			clearMessage();
			List<Message> messageList = new ArrayList<Message>();
			try {
				messageList = getMessageService().fetchAllNewMessages();
				if (!(messageList.size() > 0)) {
					message = "No record found!";
				}
			} catch (ClassNotFoundException | SQLException e) {
				message = e.getMessage();
			}
			request.setAttribute("messageList", messageList);
			request.setAttribute("feebackMessage", message);
			RequestDispatcher rd = request.getRequestDispatcher("view-msg-list.jsp");
			rd.forward(request, response);
		}		    
	    
	    private void fetchAllMessages(HttpServletRequest request, HttpServletResponse response)
					throws ServletException, IOException {

				clearMessage();

				List<Message> messageList = new ArrayList<Message>();
				try {
					messageList = getMessageService().fetchAllMessages();

					if (!(messageList.size() > 0)) {
						message = "No record found!";
					}
				} catch (ClassNotFoundException | SQLException e) {
					message = e.getMessage();
				}

				request.setAttribute("messageList", messageList);
				request.setAttribute("feebackMessage", message);

				RequestDispatcher rd = request.getRequestDispatcher("view-msg-list.jsp");
				rd.forward(request, response);

			}	
	    
	
	    private void deleteMessage(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
	        clearMessage();

	        int messageId = Integer.parseInt(request.getParameter("messageId"));

	        try {
	            boolean deleted = getMessageService().deleteMessage(messageId);
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

			response.sendRedirect("getContact?msgactiontype");
	    }
	
	
	    private void clearMessage() {
			message = "";
		}
}
