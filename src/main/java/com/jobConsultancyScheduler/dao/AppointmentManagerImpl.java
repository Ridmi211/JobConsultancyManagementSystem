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
		Connection connection = getConnection();
		String query = "UPDATE appointments SET consultantId=?,seekerId=?,scheduledDate=?,startTime=?,status=?,job=?,country=?,notes=? WHERE appointmentId=?";
		
		 PreparedStatement ps = connection.prepareStatement(query);
		    ps.setInt(1, appointment.getConsultantId());
		    ps.setInt(2, appointment.getSeekerId());
		    ps.setString(3, appointment.getScheduledDate());
		    ps.setString(4, appointment.getStartTime());
		    ps.setString(5, appointment.getStatus().name());
		    ps.setString(6, appointment.getJob());
		    ps.setString(7, appointment.getCountry());
		    ps.setString(8, appointment.getNotes());
		    ps.setInt(9, appointment.getAppointmentId());
		boolean result = false;
		
		if(ps.executeUpdate()>0)
			result = true;
		ps.close();
		connection.close();
		
		return result;
	}

	@Override
	public boolean deleteAppointment(int appointmentId) throws SQLException, ClassNotFoundException {
		Connection connection = getConnection();
		String query= "DELETE FROM appointments WHERE appointmentId=?";
		
		PreparedStatement ps = connection.prepareStatement(query);
		
		ps.setInt(1, appointmentId);
		boolean result =false;
		
		if(ps.executeUpdate()>0) {
			result = true;
			}			
		ps.close();
		connection.close();
		
		return result;
	}

//	@Override
//	public Appointment fetchSingleAppointment(int appointmentId) throws SQLException, ClassNotFoundException {
//	    Connection connection = getConnection();
//	    String query = "SELECT * FROM appointments WHERE appointmentId = ?";
//	    
//	    PreparedStatement ps = connection.prepareStatement(query);
//	    ps.setInt(1, appointmentId);
//	    
//	    ResultSet rs = ps.executeQuery();
//	    
//	    Appointment appointment =new Appointment();
//	    
//	    while (rs.next()) {
//	        appointment = new Appointment();
//	        appointment.setAppointmentId(rs.getInt("appointmentId"));
//	        appointment.setConsultantId(rs.getInt("consultantId"));
//	        appointment.setSeekerId(rs.getInt("seekerId"));
////	        appointment.setConsultantName(rs.getString("consultantName"));
////	        appointment.setSeekerName(rs.getString("seekerName"));
//	        appointment.setScheduledDate(rs.getString("scheduledDate"));
//	        appointment.setStartTime(rs.getString("startTime"));
//	        appointment.setStatus(Status.valueOf(rs.getString("status")));
//	        appointment.setNotes(rs.getString("notes"));
//	        appointment.setJob(rs.getString("job"));
//	        appointment.setCountry(rs.getString("country"));
//	        
//	        // If there are notes in the database, add this line.
//	        // Set other appointment attributes if necessary
//	    }
//	    
//	    ps.close();
//	    connection.close();
//	    
//	    return appointment;
//	}

	
//	
	@Override
	public Appointment fetchSingleAppointment(int appointmentId) throws SQLException, ClassNotFoundException {
	    Connection connection = getConnection();
	    String query = "SELECT a.*, c.name AS consultantName, s.name AS seekerName, s.email AS seekerEmail, s.phoneNumber AS seekerPhoneNumber, s.occupation AS seekerJob, s.country AS seekerCountry " +
                "FROM appointments a " +
                "INNER JOIN user c ON a.consultantId = c.userId " +
                "INNER JOIN user s ON a.seekerId = s.userId " +
                "WHERE a.appointmentId = ?";
	    
	    PreparedStatement ps = connection.prepareStatement(query);
	    ps.setInt(1, appointmentId);
	    
	    ResultSet rs = ps.executeQuery();
	    
	    Appointment appointment =new Appointment();
	    
	    while (rs.next()) {
	        appointment = new Appointment();
	        appointment.setAppointmentId(rs.getInt("appointmentId"));
	        appointment.setConsultantId(rs.getInt("consultantId"));
	        appointment.setSeekerId(rs.getInt("seekerId"));
//	        appointment.setConsultantName(rs.getString("consultantName"));
//	        appointment.setSeekerName(rs.getString("seekerName"));
	        appointment.setScheduledDate(rs.getString("scheduledDate"));
	        appointment.setStartTime(rs.getString("startTime"));
	        appointment.setStatus(Status.valueOf(rs.getString("status")));
	        appointment.setNotes(rs.getString("notes"));
	        appointment.setJob(rs.getString("job"));
	        appointment.setCountry(rs.getString("country"));
	        appointment.setConsultantName(rs.getString("consultantName"));
	        appointment.setSeekerName(rs.getString("seekerName"));
	        appointment.setSeekerEmail(rs.getString("seekerEmail"));

	        appointment.setSeekerPhoneNumber(rs.getString("seekerPhoneNumber"));
	        appointment.setSeekerJob(rs.getString("seekerJob"));
	        appointment.setSeekerCountry(rs.getString("seekerCountry"));
	        
	        // If there are notes in the database, add this line.
	        // Set other appointment attributes if necessary
	    }
	    
	    ps.close();
	    connection.close();
	    
	    return appointment;
	}
	
	
	
	
//	
//	
//	
//	@Override
//	public Appointment fetchSingleAppointment(int appointmentId) throws SQLException, ClassNotFoundException {
//	    Connection connection = getConnection();
//	    String query = "SELECT a.*, c.name AS consultantName," +
//	            "s.email AS seekerEmail, s.name AS seekerName, s.phoneNumber AS seekerPhoneNumber, s.job AS seekerJob, s.country AS seekerCountry " +
//	            "FROM appointments a " +
//	            "INNER JOIN user c ON a.consultantId = c.userId " +
//	            "INNER JOIN user s ON a.seekerId = s.userId " +
//	            "WHERE a.appointmentId = ?";
//	    
//	    PreparedStatement ps = connection.prepareStatement(query);
//	    ps.setInt(1, appointmentId);
//	    
//	    ResultSet rs = ps.executeQuery();
//	    
//	    Appointment appointment =new Appointment();
//	    
//	    while (rs.next()) {
//	        appointment = new Appointment();
//	        appointment.setAppointmentId(rs.getInt("appointmentId"));
//	        appointment.setConsultantId(rs.getInt("consultantId"));
//	        appointment.setSeekerId(rs.getInt("seekerId"));
////	        appointment.setConsultantName(rs.getString("consultantName"));
////	        appointment.setSeekerName(rs.getString("seekerName"));
//	        appointment.setScheduledDate(rs.getString("scheduledDate"));
//	        appointment.setStartTime(rs.getString("startTime"));
//	        appointment.setStatus(Status.valueOf(rs.getString("status")));
//	        appointment.setNotes(rs.getString("notes"));
//	        appointment.setJob(rs.getString("job"));
//	        appointment.setCountry(rs.getString("country"));
//	        appointment.setConsultantName(rs.getString("consultantName"));
//	        appointment.setSeekerName(rs.getString("seekerName"));
//	        appointment.setSeekerEmail(rs.getString("seekerEmail"));
//	        appointment.setSeekerPhoneNumber(rs.getString("seekerPhoneNumber"));
//	        appointment.setSeekerJob(rs.getString("seekerJob"));
//	        appointment.setSeekerCountry(rs.getString("seekerCountry"));
//	        
//	        
//	        // If there are notes in the database, add this line.
//	        // Set other appointment attributes if necessary
//	    }
//	    
//	    ps.close();
//	    connection.close();
//	    
//	    return appointment;
//	}
//	
	
	
	
	
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
	    
//	    String query = "SELECT a.*, c.name AS consultantName, c.email AS consultantEmail, c.phoneNumber AS consultantContact, " +
//	               "s.name AS seekerName, s.email AS seekerEmail, s.phoneNumber AS seekerContact " +
//	               "FROM appointments a  " +
//	               "INNER JOIN user c ON a.consultantId = c.userId " +
//	               "INNER JOIN user s ON a.seekerId = s.userId " +
//	               "WHERE a.status = 'REQUESTED'";
	    
	    String query = "SELECT a.*, c.name AS consultantName, c.email AS consultantEmail, c.phoneNumber AS consultantContact, " +
	               "s.name AS seekerName, s.email AS seekerEmail, s.phoneNumber AS seekerContact " +
	               "FROM appointments a  " +
	               "INNER JOIN user c ON a.consultantId = c.userId " +
	               "INNER JOIN user s ON a.seekerId = s.userId " +
	               "WHERE a.status = 'REQUESTED' OR a.status = 'CON_REJECTED'";


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
	                   "WHERE a.status = 'ADMIN_CONFIRMED' AND a.consultantId = ?";

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
	
	
	
	public List<Appointment> fetchAppointmentsBySeekerId(int loggedInUserId) throws SQLException, ClassNotFoundException {
	    Connection connection = getConnection();
	    
	    String query = "SELECT a.*, c.name AS consultantName, c.email AS consultantEmail, c.phoneNumber AS consultantContact, " +
	                   "s.name AS seekerName, s.email AS seekerEmail, s.phoneNumber AS seekerContact " +
	                   "FROM appointments a " +
	                   "INNER JOIN user c ON a.consultantId = c.userId " +
	                   "INNER JOIN user s ON a.seekerId = s.userId " +
	                   "WHERE a.seekerId = ?";
//	                   "WHERE a.seekerId = ?";

	    PreparedStatement preparedStatement = connection.prepareStatement(query);
	    preparedStatement.setInt(1, loggedInUserId);

	    List<Appointment> requestedAppointments = new ArrayList<>();

	    ResultSet rs = preparedStatement.executeQuery();
	    while (rs.next()) {
	        Appointment appointment = new Appointment();
	        appointment.setAppointmentId(rs.getInt("appointmentId"));
	        appointment.setConsultantId(rs.getInt("consultantId"));
//	        appointment.setSeekerId(rs.getInt("seekerId"));
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

	
	
	  public boolean updateAppointmentStatus(int appointmentId, Status status) throws SQLException, ClassNotFoundException {
	        Connection connection = getConnection();

	        String query = "UPDATE appointments SET Status = ? WHERE appointmentId = ?";

	        PreparedStatement ps = connection.prepareStatement(query);
	        ps.setString(1, status.toString());
	        ps.setInt(2, appointmentId);

	        boolean result = false;

	        if (ps.executeUpdate() > 0)
	            result = true;

	        ps.close();
	        connection.close();
	        return result;
	    }


}
