package com.jobConsultancyScheduler.dao;

import java.sql.SQLException;
import java.util.List;
import com.jobConsultancyScheduler.model.Message;

public interface MessageManager {
	
	
	public boolean addMessage(Message contact) throws SQLException, ClassNotFoundException;
	
//	public boolean editAppointment(Appointment appointment) throws SQLException, ClassNotFoundException;
	
	public boolean deleteMessage(int messageId) throws SQLException, ClassNotFoundException;
	
//	public Appointment fetchSingleAppointment(int appointmentId) throws SQLException, ClassNotFoundException;
	
	public List<Message> fetchAllMessages() throws SQLException, ClassNotFoundException;

	 
	

}
