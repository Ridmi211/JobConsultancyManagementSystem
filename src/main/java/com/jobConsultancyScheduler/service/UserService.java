package com.jobConsultancyScheduler.service;

import java.sql.SQLException;
import java.util.List;
import com.jobConsultancyScheduler.dao.UserManager;
import com.jobConsultancyScheduler.dao.UserManagerImpl;
import com.jobConsultancyScheduler.model.User;

public class UserService implements UserManager {
	
	
	private static UserService appointmentServiceObj;

	private UserService() {
		
	}
	
	public synchronized static UserService getUserService() {
		
		if(appointmentServiceObj == null) {
			appointmentServiceObj = new UserService();
		}
		
		return appointmentServiceObj;
	}
	
	private UserManager getUserManager() {
		return new UserManagerImpl();
	}
	
	public boolean addUser(User user) throws ClassNotFoundException, SQLException {
		return getUserManager().addUser(user);
	}
	
	public boolean editUser(User user) throws ClassNotFoundException, SQLException {
		return getUserManager().editUser(user);
	}
	
	public boolean deleteUser(int userId) throws ClassNotFoundException, SQLException {
		return getUserManager().deleteUser(userId);
	}
	
	public User fetchSingleUser(int userId) throws ClassNotFoundException, SQLException {
		return getUserManager().fetchSingleUser(userId);
	}
	
	public List<User> fetchAllUsers() throws ClassNotFoundException, SQLException {
		return getUserManager().fetchAllUsers();
	}

}
