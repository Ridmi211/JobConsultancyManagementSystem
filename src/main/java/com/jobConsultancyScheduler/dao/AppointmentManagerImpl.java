package com.jobConsultancyScheduler.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import com.jobConsultancyScheduler.dao.dbUtils.DbDriverManager;
import com.jobConsultancyScheduler.dao.dbUtils.DbDriverManagerFactory;
import com.jobConsultancyScheduler.model.Appointment;

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
		// TODO Auto-generated method stub
		return null;
	}

}
