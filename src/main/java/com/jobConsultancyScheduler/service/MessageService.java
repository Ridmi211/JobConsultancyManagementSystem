package com.jobConsultancyScheduler.service;

import java.sql.SQLException;
import java.util.List;

import com.jobConsultancyScheduler.dao.AppointmentManager;
import com.jobConsultancyScheduler.dao.AppointmentManagerImpl;
import com.jobConsultancyScheduler.dao.MessageManager;
import com.jobConsultancyScheduler.dao.MessageManagerImpl;
import com.jobConsultancyScheduler.model.Appointment;
import com.jobConsultancyScheduler.model.Appointment.Status;
import com.jobConsultancyScheduler.model.Message;



public class MessageService {
	
	private static MessageService MessageServiceObj;

	private MessageService() {
		
	}
	
	public synchronized static MessageService getMessageService() {
		

	if(MessageServiceObj == null) {
		MessageServiceObj = new MessageService();
	}
	
	return MessageServiceObj;
}

private MessageManager getMessageManager() {
	return new MessageManagerImpl();
}

public boolean addMessage(Message contact) throws ClassNotFoundException, SQLException {
	return getMessageManager().addMessage(contact);
}


public boolean deleteMessage(int MessageId) throws ClassNotFoundException, SQLException {
	return getMessageManager().deleteMessage(MessageId);
}

public List<Message> fetchAllMessages() throws ClassNotFoundException, SQLException {
	return getMessageManager().fetchAllMessages();
}


 
   
    
    
    
    
}