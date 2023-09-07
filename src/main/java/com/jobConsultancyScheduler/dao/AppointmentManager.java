package com.jobConsultancyScheduler.dao;
import java.sql.SQLException;
import java.util.List;
import com.jobConsultancyScheduler.model.Appointment;

public interface AppointmentManager {
	
	public boolean addAppointment(Appointment appointment) throws SQLException, ClassNotFoundException;
	
	public boolean editAppointment(Appointment appointment) throws SQLException, ClassNotFoundException;
	
	public boolean deleteAppointment(int appointmentId) throws SQLException, ClassNotFoundException;
	
	public Appointment fetchSingleAppointment(int appointmentId) throws SQLException, ClassNotFoundException;
	
	public List<Appointment> fetchAllAppointments() throws SQLException, ClassNotFoundException;

}
