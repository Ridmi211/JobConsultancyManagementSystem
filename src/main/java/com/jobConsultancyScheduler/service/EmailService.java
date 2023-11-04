package com.jobConsultancyScheduler.service;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class EmailService {

	
	
	private static EmailService emailServiceObj;
	
	private EmailService() {
		
	}
	
	
	public synchronized static EmailService getEmailService() {
		
		if(emailServiceObj == null) {
			emailServiceObj = new EmailService();
		}
		
		return emailServiceObj;
	}
	
	public static void sendEmail(String recipient, String subject, String messageBody) {
	    final String username = "ridmiyatigammana@gmail.com"; // Your email address
	    final String password = "ynxv mydc aeqg nyfe"; // Your email password

	    
//	    ynxv mydc aeqg nyfe
//	       final String username = "ryasunthara11@gmail.com"; // Your email address
//	    final String password = "Exoyas211#"; // Your email password
	    
	    Properties props = new Properties();
	    props.put("mail.smtp.auth", "true");
	    props.put("mail.smtp.starttls.enable", "true");
	    props.put("mail.smtp.host", "smtp.gmail.com"); // SMTP server
	    props.put("mail.smtp.port", "587"); // SMTP port

	    Session session = Session.getInstance(props, new javax.mail.Authenticator() {
	        protected PasswordAuthentication getPasswordAuthentication() {
	            return new PasswordAuthentication(username, password);
	        }
	    });

	    try {
	        Message message = new MimeMessage(session);
	        message.setFrom(new InternetAddress(username));
	        message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(recipient));
	        message.setSubject(subject);
	        message.setText(messageBody);

	        Transport.send(message);

	        System.out.println("Email sent successfully to " + recipient);
	    } catch (MessagingException e) {
	        e.printStackTrace();
	        System.out.println("Failed to send email to " + recipient);
	    }
	}


}
