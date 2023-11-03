package com.jobConsultancyScheduler.service;
import java.sql.SQLException;
import java.util.List;
import com.jobConsultancyScheduler.dao.AppointmentManager;
import com.jobConsultancyScheduler.dao.AppointmentManagerImpl;
import com.jobConsultancyScheduler.model.Appointment;
import com.jobConsultancyScheduler.model.Appointment.Status;
import com.jobConsultancyScheduler.model.RegistrationStatus;

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

		public Appointment getAppointmentById(int appointmentId) {
			// TODO Auto-generated method stub
			return null;
		}

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
		  
		   
		    
		    
		    
		    
	}



