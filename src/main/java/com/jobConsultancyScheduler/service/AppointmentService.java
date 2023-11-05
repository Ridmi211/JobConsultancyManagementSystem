package com.jobConsultancyScheduler.service;
import java.sql.SQLException;
import java.util.List;
import com.jobConsultancyScheduler.dao.AppointmentManager;
import com.jobConsultancyScheduler.dao.AppointmentManagerImpl;
import com.jobConsultancyScheduler.model.Appointment;
import com.jobConsultancyScheduler.model.Appointment.Status;
import com.jobConsultancyScheduler.model.RegistrationStatus;
import com.jobConsultancyScheduler.model.User;

public class AppointmentService {	
		
		private static AppointmentService appointmentServiceObj;

		private AppointmentService() {
			
		}
		
		public synchronized static AppointmentService getAppointmentService() {
			
			if(appointmentServiceObj == null) {
				appointmentServiceObj = new AppointmentService();
			}
			
			return appointmentServiceObj;
		}
		
		private AppointmentManager getAppointmentManager() {
			return new AppointmentManagerImpl();
		}
		
		public boolean addAppointment(Appointment appointment) throws ClassNotFoundException, SQLException {
			return getAppointmentManager().addAppointment(appointment);
		}
		
		public boolean editAppointment(Appointment appointment) throws ClassNotFoundException, SQLException {
			return getAppointmentManager().editAppointment(appointment);
		}
		
		public boolean deleteAppointment(int appointmentCode) throws ClassNotFoundException, SQLException {
			return getAppointmentManager().deleteAppointment(appointmentCode);
		}
		
		public Appointment fetchSingleAppointment(int appointmentId) throws ClassNotFoundException, SQLException {
			return getAppointmentManager().fetchSingleAppointment(appointmentId);
		}
		
		public List<Appointment> fetchAllAppointments() throws ClassNotFoundException, SQLException {
			return getAppointmentManager().fetchAllAppointments();
		}

//		public Appointment getAppointmentById(int appointmentId) {
//			// TODO Auto-generated method stub
//			return null;
//		}

		public List<Appointment> fetchRequestedAppointments() throws ClassNotFoundException, SQLException {
			// TODO Auto-generated method stub
			return getAppointmentManager().fetchRequestedAppointments();
		}


		public List<Appointment> fetchAdminRequestedAppointments(int loggedInUserId)  throws ClassNotFoundException, SQLException{
			// TODO Auto-generated method stub
			return getAppointmentManager().fetchAdminRequestedAppointments(loggedInUserId);
		}
		
		
		public List<Appointment> fetchAppointmentsBySeekerId(int loggedInUserId)  throws ClassNotFoundException, SQLException{
			// TODO Auto-generated method stub
			return getAppointmentManager().fetchAppointmentsBySeekerId(loggedInUserId);
		}
		 public boolean updateAppointmentStatus(int appointmentId, Status status) throws SQLException, ClassNotFoundException {
		        return getAppointmentManager().updateAppointmentStatus(appointmentId, status);
		    }

		    public boolean acceptAppointmentAdmin(int appointmentId) throws ClassNotFoundException, SQLException {
		        return getAppointmentManager().updateAppointmentStatus(appointmentId, Status.ADMIN_CONFIRMED);
		    }

		    public boolean cancelAppointmentAdmin(int appointmentId) throws ClassNotFoundException, SQLException {
		        return getAppointmentManager().updateAppointmentStatus(appointmentId, Status.ADMIN_CANCELLED);
		    }
		    public boolean acceptAppointmentCon(int appointmentId) throws ClassNotFoundException, SQLException {
		        return getAppointmentManager().updateAppointmentStatus(appointmentId, Status.CON_CONFIRMED);
		    }

		    public boolean rejectAppointmentCon(int appointmentId) throws ClassNotFoundException, SQLException {
		        return getAppointmentManager().updateAppointmentStatus(appointmentId, Status.CON_REJECTED);
		    }
		    public boolean completedAppointment(int appointmentId) throws ClassNotFoundException, SQLException {
		        return getAppointmentManager().updateAppointmentStatus(appointmentId, Status.COMPLETED);
		    }
		    public boolean cancelAppointmentSeeker(int appointmentId) throws ClassNotFoundException, SQLException {
		        return getAppointmentManager().updateAppointmentStatus(appointmentId, Status.SEEKER_CANCELLED);
		    }
		  
		    public static void sendAppointmentConfirmationEmail(Appointment appointment, User consultant, User seeker) {
		        String subject = "Appointment Request Received";
		        StringBuilder messageBody = new StringBuilder("Dear " + seeker.getName() + ",\n\n" +
		            "We want to thank you for submitting your appointment request. Your interest in our services is greatly appreciated.\n\n" +
		            "Appointment Details:\n" +
		            "Consultant: " + consultant.getName() + "\n" +
		            "Date: " + appointment.getScheduledDate() + "\n" +
		            "Time: " + appointment.getStartTime() + "\n" +
		            "Country: " + appointment.getCountry() + "\n" +
		            "Job: " + appointment.getJob() + "\n" +
		            "Notes: " + appointment.getNotes() + "\n" +
		            "\n" +
		            "We have received your request and our team is currently reviewing it. We will notify you as soon as your appointment is scheduled. Your convenience is our priority, and we will do our best to accommodate your preferred date and time.\n\n" +
		            "If you have any specific preferences or questions, please feel free to contact our support team at [Support Email Address].\n\n" +
		            "Thank you for considering our services. We look forward to assisting you on your journey to work abroad.\n\n" +
		            "Best regards,\n" +
		            "The Job Consultancy Service Team");

		        EmailService.sendEmail(seeker.getEmail(), subject, messageBody.toString());
		    }
		    
		    public static void sendNewAppointmentNotificationEmail(Appointment appointment, User consultant, User seeker) {
		        String subject = "New Appointment Request";
		        String messageBody = "Dear " + consultant.getName() + ",\n\n" +
		            "You have a new appointment request from " + seeker.getName() + ".\n\n" +
		            "Appointment Details:\n" +
		            "Date: " + appointment.getScheduledDate() + "\n" +
		            "Time: " + appointment.getStartTime() + "\n" +
		            "Country: " + appointment.getCountry() + "\n" +
		            "Job: " + appointment.getJob() + "\n" +
		            "Notes: " + appointment.getNotes() + "\n" +
		            "\n" +
		            "Please review the details and confirm or reschedule the appointment accordingly. If you have any questions or need further assistance, please feel free to contact our support team at [Support Email Address].\n\n" +
		            "Best regards,\n" +
		            "The Job Consultancy Service Team";

		        EmailService.sendEmail(consultant.getEmail(), subject, messageBody);
		    }


		    public static void sendAppointmentAcceptedEmail(Appointment appointment, User consultant, User seeker) {
		        String subject = "Appointment Scheduled";
		        String messageBody = "Dear " + seeker.getName() + ",\n\n" +
		            "We are pleased to inform you that your appointment request has been accepted by " + consultant.getName() + ".\n\n" +
		            "Appointment Details:\n" +
		            "Consultant: " + consultant.getName() + "\n" +
		            "Date: " + appointment.getScheduledDate() + "\n" +
		            "Time: " + appointment.getStartTime() + "\n" +
		            "Country: " + appointment.getCountry() + "\n" +
		            "Job: " + appointment.getJob() + "\n" +
		            "Notes: " + appointment.getNotes() + "\n" +
		            "\n" +
		            "Your appointment is scheduled and confirmed. Please make sure to attend the appointment at the specified date and time. If you have any questions or need further assistance, please feel free to contact our support team at [Support Email Address].\n\n" +
		            "Best regards,\n" +
		            "The Job Consultancy Service Team";

		        EmailService.sendEmail(seeker.getEmail(), subject, messageBody);
		    }

		    
		    
		    
		    	public static void sendAppointmentCompletedEmail(Appointment appointment, User consultant, User seeker) {
		        String subject = "Appointment Completed";
		        String messageBody = "Dear " + seeker.getName() + ",\n\n" +
		            "We want to express our sincere thanks for choosing our services and for completing your recent appointment with " + consultant.getName() + ".\n\n" +
		            "Appointment Details:\n" +
		            "Consultant: " + consultant.getName() + "\n" +
		            "Date: " + appointment.getScheduledDate() + "\n" +
		            "Time: " + appointment.getStartTime() + "\n" +
		            "Country: " + appointment.getCountry() + "\n" +
		            "Job: " + appointment.getJob() + "\n" +
		            "Notes: " + appointment.getNotes() + "\n" +
		            "\n" +
		            "Your feedback is valuable to us. If you have any comments or suggestions regarding your experience, please share them with us by filling out our feedback form: [Google Form Link]\n\n" +
		            "If you have any further questions or need additional assistance, please feel free to contact our support team at [Support Email Address].\n\n" +
		            "Best regards,\n" +
		            "The Job Consultancy Service Team";

		        // Replace [Google Form Link] with the actual link to your Google Form
		        String googleFormLink = "https://forms.gle/6ubUZQAmgTvQ4xBu7";
		        messageBody = messageBody.replace("[Google Form Link]", googleFormLink);

		        EmailService.sendEmail(seeker.getEmail(), subject, messageBody);
		    }

	}



