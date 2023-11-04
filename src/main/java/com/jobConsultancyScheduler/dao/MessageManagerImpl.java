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
import com.jobConsultancyScheduler.model.Appointment;
import com.jobConsultancyScheduler.model.Message;
import com.jobConsultancyScheduler.model.Message.MessageStatus;

public class MessageManagerImpl implements MessageManager {

	public MessageManagerImpl() {
		// TODO Auto-generated constructor stub
	}

	
private Connection getConnection() throws ClassNotFoundException, SQLException {
		
		DbDriverManagerFactory driverFactory = new DbDriverManagerFactory();	
		DbDriverManager driverManager = driverFactory.getDbDriver("MySQL");
		
		return driverManager.getConnection(); 
	}
	
	@Override
//	public boolean addMessage(Message contact) throws SQLException, ClassNotFoundException {
//		// TODO Auto-generated method stub
//		return false;
//	}
	
	
	public boolean addMessage(Message contact) throws SQLException, ClassNotFoundException {
	    Connection connection = getConnection();
	    String query = "INSERT INTO messages(`messageDate`, `messangerName`, `messangerEmail`, `messageBody`, `messageStatus`) VALUES (?, ?, ?, ?, ?)";
        
	    PreparedStatement ps = connection.prepareStatement(query);
	   
//	    ps.setInt(1, contact.getMessageId());
	    ps.setDate(1, new java.sql.Date(contact.getMessageDate().getTime()));
	    ps.setString(2, contact.getMessangerName());
	    ps.setString(3, contact.getMessangerEmail());
	    ps.setString(4, contact.getMessageBody());
	    ps.setString(5, contact.getMessageStatus().name());


	    boolean result = false;

	    if (ps.executeUpdate() > 0) {
	        result = true;
	    }

	    ps.close();
	    connection.close();
	    return result;
	}

	@Override
	public boolean deleteMessage(int messageId) throws SQLException, ClassNotFoundException {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
//	public List<Message> fetchAllMessages() throws SQLException, ClassNotFoundException {
//		// TODO Auto-generated method stub
//		return null;
//	}
	
	
	
	public List<Message> fetchAllMessages() throws SQLException, ClassNotFoundException {
	    Connection connection = getConnection();
	    String query = "SELECT * FROM messages";
	    Statement st = connection.createStatement();
	    List<Message> messageList = new ArrayList<Message>();

	    ResultSet rs = st.executeQuery(query);
	    while (rs.next()) {
	        Message contact = new Message();
	        contact.setMessageId(rs.getInt("messageId"));
	        contact.setMessageDate(rs.getDate("messageDate"));
	        contact.setMessangerName(rs.getString("messangerName"));
	        contact.setMessangerEmail(rs.getString("messangerEmail"));
	        contact.setMessageBody(rs.getString("messageBody"));
	        contact.setMessageStatus(MessageStatus.valueOf(rs.getString("messageStatus")));  // Assuming MessageStatus is an enum

	        messageList.add(contact);
	    }

        st.close();
	    connection.close();

	    return messageList;
	}


}
