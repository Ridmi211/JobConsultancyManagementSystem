package com.jobConsultancyScheduler.service;

import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;
import java.sql.SQLException;
import java.util.Base64;
import java.util.List;

import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.PBEKeySpec;

import com.jobConsultancyScheduler.dao.UserManager;
import com.jobConsultancyScheduler.dao.UserManagerImpl;
import com.jobConsultancyScheduler.model.RegistrationStatus;
import com.jobConsultancyScheduler.model.User;

public class UserService implements UserManager {
	
	
	private static UserService appointmentServiceObj;

	private UserService() {
		
	}
	
	public synchronized static UserService getUserService() {
		
		if(appointmentServiceObj == null) {
			appointmentServiceObj = new UserService();
		}
		
		return appointmentServiceObj;
	}
	
	private UserManager getUserManager() {
		return new UserManagerImpl();
	}
	
	public boolean addUser(User user) throws ClassNotFoundException, SQLException {
		return getUserManager().addUser(user);
	}
	
	public boolean editUser(User user) throws ClassNotFoundException, SQLException {
		return getUserManager().editUser(user);
	}
	
	public boolean deleteUser(int userId) throws ClassNotFoundException, SQLException {
		return getUserManager().deleteUser(userId);
	}
	
	public User fetchSingleUser(int userId) throws ClassNotFoundException, SQLException {
		return getUserManager().fetchSingleUser(userId);
	}
	
	public List<User> fetchAllUsers() throws ClassNotFoundException, SQLException {
		return getUserManager().fetchAllUsers();
	}
	
	public User fetchUserByEmail(String email) throws ClassNotFoundException, SQLException {
	    return getUserManager().fetchUserByEmail(email);
	}
	
	public boolean isEmailAlreadyExists(String email) throws ClassNotFoundException, SQLException {
	    return getUserManager().isEmailAlreadyExists(email);
	}

	public List<User> fetchAllConsultantUsers() throws SQLException, ClassNotFoundException {
	    return getUserManager().fetchAllConsultantUsers();
	}
	 // Add methods related to registration status
    public boolean updateRegistrationStatus(int userId, RegistrationStatus status) throws SQLException, ClassNotFoundException {
        return getUserManager().updateRegistrationStatus(userId, status);
    }

    public boolean approveUser(int userId) throws ClassNotFoundException, SQLException {
        return getUserManager().updateRegistrationStatus(userId, RegistrationStatus.APPROVED);
    }

    public boolean rejectUser(int userId) throws ClassNotFoundException, SQLException {
        return getUserManager().updateRegistrationStatus(userId, RegistrationStatus.REJECTED);
    }

	public List<User> fetchPendingUsers() throws SQLException, ClassNotFoundException {
	    return getUserManager().fetchPendingUsers();
	}	
	
	public static boolean isValidEmail(String email) {
	    String emailRegex = "^[A-Za-z0-9+_.-]+@(.+)$";
	    return email.matches(emailRegex);
	}

	public static String hashPassword(String plainPassword) {
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

	public static byte[] generateSalt() {
	
		byte[] salt = new byte[16]; 
		
		return salt;
	}


	
//	  public void sendRegistrationEmail(User user) {
//	        String subject = "Registration Confirmation";
//	        String messageBody = "Dear " + user.getName() + ",\n\nYour registration was successful!";
//	        EmailService.sendEmail(user.getEmail(), subject, messageBody);
//	    }

	    // Example of sending an email when updating a user
	  public void sendUpdateEmail(User user) {
	        String subject = "Profile Update";
	        String messageBody = "Dear " + user.getName() + ",\n\nYour profile has been updated!";
	        EmailService.sendEmail(user.getEmail(), subject, messageBody);
	    }

	    // Example of sending an email when deleting a user
	  public void sendDeleteEmail(User user) {
	        String subject = "Account Deletion";
	        String messageBody = "Dear " + user.getName() + ",\n\nYour account has been deleted!";
	        EmailService.sendEmail(user.getEmail(), subject, messageBody);
	    }
	
//	  public boolean sendConsultantRegistrationEmail(User user) {
//		    String subject = "Consultant Registration Confirmation";
//		    String messageBody = "Dear " + user.getName() + ",\n\nYour consultant registration is requested. You will recieve an email once your registration is accepted!";
//		    EmailService.sendEmail(user.getEmail(), subject, messageBody);
//		}
	  
//	  public static boolean sendConsultantRegistrationEmail(User user) {
//		    String recipient = user.getEmail();
//		    String subject = "Consultant Registration Successful";
//		    String messageBody = "Dear " + user.getName() + ",\n\nYour consultant registration is requested. You will recieve an email once your registration is accepted!";
//		    
//		    try {
//		        EmailService.sendEmail(recipient, subject, messageBody);
//		        return true; // Email sent successfully
//		    } catch (Exception e) {
//		        e.printStackTrace();
//		        return false; // Email sending failed
//		    }
//		}
	  
//	  public static boolean sendRegistrationEmail(User user) {
//		    String recipient = user.getEmail();
//		    String subject = "Registration Successful";
//		    String messageBody = "Dear " + user.getName() + ",\n\nYour registration was successful!";
//		    
//		    try {
//		        EmailService.sendEmail(recipient, subject, messageBody);
//		        return true; // Email sent successfully
//		    } catch (Exception e) {
//		        e.printStackTrace();
//		        return false; // Email sending failed
//		    }
//		}
	  
	  public static boolean sendRegistrationEmail(User user) {
		    String subject = "Welcome to Our Job Consultancy Service";
		    String body = "Dear " + user.getName() + ",\n\n" +
		        "Thank you for choosing [Your Job Consultancy Service] to explore job opportunities abroad. We are excited to have you on board as a valued member of our community.\n\n" +
		        "Your account registration has been successfully completed.\n\n" +
		        "Account Details:\n" +
		        "Name: " + user.getName() + "\n" +
		        "Email: " + user.getEmail() + "\n" +
		        "User Type: " + user.getAccessRight() + "\n\n" +
		        "Please keep your login credentials secure. You can start exploring and scheduling job consultancy sessions right away!\n\n" +
		        "If you have any questions or need assistance, please don't hesitate to contact our support team at [Support Email Address].\n\n" +
		        "Best regards,\n" +
		        "The Job Consultancy Service Team";

		    try {
		        EmailService.sendEmail(user.getEmail(), subject, body);
		    } catch (Exception e) {
		        e.printStackTrace();
		    }
			return false;
		}

		public static boolean sendConsultantRegistrationEmail(User consultant) {
		    String subject = "Welcome to Our Job Consultancy Service - Consultant Registration Confirmation";
		    String body = "Dear " + consultant.getName() + ",\n\n" +
		        "Congratulations on successfully registering as a consultant with [Your Job Consultancy Service]. We are thrilled to have you join our team of experts in helping job seekers secure positions abroad.\n\n" +
		        "Your registration status is currently pending approval. Our team will review your profile and qualifications to ensure the highest level of service to our clients.\n\n" +
		        "Consultant Details:\n" +
		        "Name: " + consultant.getName() + "\n" +
		        "Email: " + consultant.getEmail() + "\n" +
		        "Specializations: " + consultant.getSpecializedJobs() + "\n" + // Modify with actual consultant details
		        "Available Time Slots: " + consultant.getAvailableTimeSlots() + "\n\n" + // Modify with actual consultant details
		        "We will notify you as soon as your registration is approved, and you can start assisting job seekers on their journey to work abroad.\n\n" +
		        "If you have any questions or need further information, please feel free to contact our support team at [Support Email Address].\n\n" +
		        "Thank you for choosing to be a part of our global network.\n\n" +
		        "Best regards,\n" +
		        "The Job Consultancy Service Team";

		    try {
		        EmailService.sendEmail(consultant.getEmail(), subject, body);
		    } catch (Exception e) {
		        e.printStackTrace();
		    }
			return false;
		}
		
		public static void sendApprovalEmail(User consultant) {
			 String subject = "Congratulations! Your Consultant Registration Has Been Approved";
		    String messageBody = "Dear " + consultant.getName() + ",\n\n" +
		            "We are delighted to inform you that your consultant registration with [Your Job Consultancy Service] has been approved!\n\n" +
		            "You are now an official member of our team and can begin assisting job seekers in their journey to work abroad.\n\n" +
		            "Consultant Details:\n" +
		            "Name: " + consultant.getName() + "\n" +
		            "Email: " + consultant.getEmail() + "\n" +
		            "Specializations: " + consultant.getSpecializedJobs() + "\n" + // Modify with actual consultant details
		            "Available Time Slots: " + consultant.getAvailableTimeSlots() + "\n\n" + // Modify with actual consultant details
		            "If you have any questions or need assistance, please feel free to contact our support team at [Support Email Address].\n\n" +
		            "Thank you for choosing to be a part of our global network.\n\n" +
		            "Best regards,\n" +
		            "The Job Consultancy Service Team";

		    EmailService.sendEmail(consultant.getEmail(), subject, messageBody);
		}




}
