package com.jobConsultancyScheduler.dao;
import java.sql.SQLException;
import java.util.List;
import com.jobConsultancyScheduler.model.Appointment;
import com.jobConsultancyScheduler.model.Appointment.Status;


public interface AppointmentManager {
	
	public boolean addAppointment(Appointment appointment) throws SQLException, ClassNotFoundException;
	
	public boolean editAppointment(Appointment appointment) throws SQLException, ClassNotFoundException;
	
	public boolean deleteAppointment(int appointmentId) throws SQLException, ClassNotFoundException;
	
	public Appointment fetchSingleAppointment(int appointmentId) throws SQLException, ClassNotFoundException;
		
	public List<Appointment> fetchAppointmentsBySeekerId(int loggedInUserId) throws SQLException, ClassNotFoundException;
	
	
	boolean updateAppointmentStatus(int appointmentId,Status status) throws SQLException, ClassNotFoundException;
	
	public List<Appointment> fetchAllAppointments() throws SQLException, ClassNotFoundException;

	 public List<Appointment> fetchRequestedAppointments() throws SQLException, ClassNotFoundException;

	 public List<Appointment> fetchAdminRequestedAllAppointments() throws SQLException, ClassNotFoundException;

	 public List<Appointment> fetchAllCompletedAppointments() throws SQLException, ClassNotFoundException;

	 public List<Appointment> fetchConsultantRejectedAppointments() throws SQLException, ClassNotFoundException;

	 public List<Appointment> fetchSeekerCancelledAppointments() throws SQLException, ClassNotFoundException;

	 public List<Appointment> fetchConsultantConfiremedAppointments() throws SQLException, ClassNotFoundException;
	 
	 public List<Appointment> fetchAppointmentsByConsultantId(int loggedInUserId) throws SQLException, ClassNotFoundException;

	 public List<Appointment> fetchCompletedAppointmentsByConId(int loggedInUserId) throws SQLException, ClassNotFoundException;

	 public List<Appointment> fetchCancelledAppointmentsByConId(int loggedInUserId) throws SQLException, ClassNotFoundException;

	 public List<Appointment> fetchUpcomingAppointmentsByConId(int loggedInUserId) throws SQLException, ClassNotFoundException;
	
	 public List<Appointment> fetchAdminRequestedAppointments(int loggedInUserId) throws SQLException, ClassNotFoundException;
		
	
//	public User fetchUserByEmail(String email) throws SQLException, ClassNotFoundException;
//	
//    public boolean isEmailAlreadyExists(String email) throws SQLException, ClassNotFoundException;
//
//    public List<User> fetchAllConsultantUsers() throws SQLException, ClassNotFoundException;
//    
//    // Add methods related to registration status
//    boolean updateRegistrationStatus(int userId, RegistrationStatus status) throws SQLException, ClassNotFoundException;
//
//
//	 public List<User> fetchPendingUsers() throws SQLException, ClassNotFoundException;

}
