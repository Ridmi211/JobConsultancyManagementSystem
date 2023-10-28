package com.jobConsultancyScheduler.service;
import java.sql.SQLException;
import java.util.List;
import com.jobConsultancyScheduler.dao.AppointmentManager;
import com.jobConsultancyScheduler.dao.AppointmentManagerImpl;
import com.jobConsultancyScheduler.model.Appointment;

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
		
		public Appointment fetchSingleAppointment(int appointmentCode) throws ClassNotFoundException, SQLException {
			return getAppointmentManager().fetchSingleAppointment(appointmentCode);
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
	}



