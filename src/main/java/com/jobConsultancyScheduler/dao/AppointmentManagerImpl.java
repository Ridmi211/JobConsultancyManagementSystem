package com.jobConsultancyScheduler.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.jobConsultancyScheduler.dao.dbUtils.DbDriverManager;
import com.jobConsultancyScheduler.dao.dbUtils.DbDriverManagerFactory;
import com.jobConsultancyScheduler.model.AccessRight;
import com.jobConsultancyScheduler.model.Appointment;
import com.jobConsultancyScheduler.model.Appointment.Status;
import com.jobConsultancyScheduler.model.RegistrationStatus;
import com.jobConsultancyScheduler.model.User;

public class AppointmentManagerImpl implements AppointmentManager {

	public AppointmentManagerImpl() {
		// TODO Auto-generated constructor stub
	}
	
private Connection getConnection() throws ClassNotFoundException, SQLException {
		
		DbDriverManagerFactory driverFactory = new DbDriverManagerFactory();	
		DbDriverManager driverManager = driverFactory.getDbDriver("MySQL");
		
		return driverManager.getConnection(); 
	}
	@Override
	
	public boolean addAppointment(Appointment appointment) throws SQLException, ClassNotFoundException {
	    Connection connection = getConnection();
	    String query = "INSERT INTO appointments(`consultantId`, `seekerId`, `scheduledDate`, `startTime`, `status`,`job`,`country`, `notes`) VALUES (?,?,?,?,?,?,?,?)";

	    PreparedStatement ps = connection.prepareStatement(query);
	    ps.setInt(1, appointment.getConsultantId());
	    ps.setInt(2, appointment.getSeekerId());
	    ps.setString(3, appointment.getScheduledDate());
	    ps.setString(4, appointment.getStartTime());
	    ps.setString(5, appointment.getStatus().name());
	    ps.setString(6, appointment.getJob());
	    ps.setString(7, appointment.getCountry());
	    ps.setString(8, appointment.getNotes());

	    boolean result = false;

	    if (ps.executeUpdate() > 0) {
	        result = true;
	    }

	    ps.close();
	    connection.close();
	    return result;
	}


	@Override
	public boolean editAppointment(Appointment appointment) throws SQLException, ClassNotFoundException {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean deleteAppointment(int appointmentId) throws SQLException, ClassNotFoundException {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public Appointment fetchSingleAppointment(int appointmentId) throws SQLException, ClassNotFoundException {
		// TODO Auto-generated method stub
		return null;
	}

	
	
	@Override
	public List<Appointment> fetchAllAppointments() throws SQLException, ClassNotFoundException {
	    Connection connection = getConnection();
//	    String query = "SELECT a.appointmentId, a.consultantId, c.name AS consultantName, a.seekerId, s.name AS seekerName " +
//	                   "FROM appointments a " +
//	                   "INNER JOIN user c ON a.consultantId = c.userId " +
//	                   "INNER JOIN user s ON a.seekerId = s.userId";
	    String query = "SELECT a.*, c.name AS consultantName, c.email AS consultantEmail, c.phoneNumber AS consultantContact, " +
	               "s.name AS seekerName, s.email AS seekerEmail, s.phoneNumber AS seekerContact " +
	               "FROM appointments a  " +
	               "INNER JOIN user c ON a.consultantId = c.userId " +
	               "INNER JOIN user s ON a.seekerId = s.userId";

//	    String query = "SELECT * FROM appointments";
	    Statement st = connection.createStatement();
	    List<Appointment> appointmentList = new ArrayList<Appointment>();

	    ResultSet rs = st.executeQuery(query);
	    while (rs.next()) {
	        Appointment appointment = new Appointment();
	        appointment.setAppointmentId(rs.getInt("appointmentId"));
	        appointment.setConsultantId(rs.getInt("consultantId"));
	        appointment.setConsultantName(rs.getString("consultantName"));
	        appointment.setSeekerName(rs.getString("seekerName"));
	        appointment.setScheduledDate(rs.getString("scheduledDate"));
	        appointment.setStartTime(rs.getString("startTime")); 
	        appointment.setStatus(Status.valueOf(rs.getString("status")));	

			appointmentList.add(appointment);
		}
		
		st.close();
		connection.close();
		
		return appointmentList;
	}

	@Override
	public List<Appointment> fetchRequestedAppointments() throws SQLException, ClassNotFoundException {
	    Connection connection = getConnection();
//	    String query = "SELECT * FROM appointments WHERE status = 'REQUESTED'";
	    
	    String query = "SELECT a.*, c.name AS consultantName, c.email AS consultantEmail, c.phoneNumber AS consultantContact, " +
	               "s.name AS seekerName, s.email AS seekerEmail, s.phoneNumber AS seekerContact " +
	               "FROM appointments a  " +
	               "INNER JOIN user c ON a.consultantId = c.userId " +
	               "INNER JOIN user s ON a.seekerId = s.userId " +
	               "WHERE a.status = 'REQUESTED'";

	    Statement st = connection.createStatement();
	    
	    List<Appointment> requestedAppointments = new ArrayList<>();
	    
	    ResultSet rs = st.executeQuery(query);
	    while (rs.next()) {
	    	Appointment appointment = new Appointment();
	    	 appointment.setAppointmentId(rs.getInt("appointmentId"));
		        appointment.setConsultantId(rs.getInt("consultantId"));
		        appointment.setConsultantName(rs.getString("consultantName"));
		        appointment.setSeekerName(rs.getString("seekerName"));
		        appointment.setScheduledDate(rs.getString("scheduledDate"));
		        appointment.setStartTime(rs.getString("startTime")); 
		        appointment.setStatus(Status.valueOf(rs.getString("status")));	
			 requestedAppointments.add(appointment);
	    }
	    
	    st.close();
	    connection.close();
	    
	    return requestedAppointments;
	}
	
	
//	admin requested appointments 
	
	
	@Override
	
	public List<Appointment> fetchAdminRequestedAppointments(int loggedInUserId) throws SQLException, ClassNotFoundException {
	    Connection connection = getConnection();
	    
	    String query = "SELECT a.*, c.name AS consultantName, c.email AS consultantEmail, c.phoneNumber AS consultantContact, " +
	                   "s.name AS seekerName, s.email AS seekerEmail, s.phoneNumber AS seekerContact " +
	                   "FROM appointments a " +
	                   "INNER JOIN user c ON a.consultantId = c.userId " +
	                   "INNER JOIN user s ON a.seekerId = s.userId " +
	                   "WHERE a.status = 'REQUESTED' AND a.consultantId = ?";

	    PreparedStatement preparedStatement = connection.prepareStatement(query);
	    preparedStatement.setInt(1, loggedInUserId);

	    List<Appointment> requestedAppointments = new ArrayList<>();

	    ResultSet rs = preparedStatement.executeQuery();
	    while (rs.next()) {
	        Appointment appointment = new Appointment();
	        appointment.setAppointmentId(rs.getInt("appointmentId"));
	        appointment.setConsultantId(rs.getInt("consultantId"));
	        appointment.setConsultantName(rs.getString("consultantName"));
	        appointment.setSeekerName(rs.getString("seekerName"));
	        appointment.setScheduledDate(rs.getString("scheduledDate"));
	        appointment.setStartTime(rs.getString("startTime"));
	        appointment.setStatus(Status.valueOf(rs.getString("status")));
	        requestedAppointments.add(appointment);
	    }

	    preparedStatement.close();
	    connection.close();

	    return requestedAppointments;
	}

	


}
