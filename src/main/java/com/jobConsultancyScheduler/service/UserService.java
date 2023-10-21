package com.jobConsultancyScheduler.service;

import java.sql.SQLException;
import java.util.List;
import com.jobConsultancyScheduler.dao.UserManager;
import com.jobConsultancyScheduler.dao.UserManagerImpl;
import com.jobConsultancyScheduler.model.RegistrationStatus;
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
	
	public User fetchUserByEmail(String email) throws ClassNotFoundException, SQLException {
	    return getUserManager().fetchUserByEmail(email);
	}
	
	public boolean isEmailAlreadyExists(String email) throws ClassNotFoundException, SQLException {
	    return getUserManager().isEmailAlreadyExists(email);
	}

	public List<User> fetchAllConsultantUsers() throws SQLException, ClassNotFoundException {
	    return getUserManager().fetchAllConsultantUsers();
	}
	 // Add methods related to registration status
    public boolean updateRegistrationStatus(int userId, RegistrationStatus status) throws SQLException, ClassNotFoundException {
        return getUserManager().updateRegistrationStatus(userId, status);
    }

    public boolean approveUser(int userId) throws ClassNotFoundException, SQLException {
        return getUserManager().updateRegistrationStatus(userId, RegistrationStatus.APPROVED);
    }

    public boolean rejectUser(int userId) throws ClassNotFoundException, SQLException {
        return getUserManager().updateRegistrationStatus(userId, RegistrationStatus.REJECTED);
    }

//	public List<User> fetchAllPendingUsers() {
//		// TODO Auto-generated method stub
//		return null;
//	}
	public List<User> fetchPendingUsers() throws SQLException, ClassNotFoundException {
	    return getUserManager().fetchPendingUsers();
	}
	/*
	 * public RegistrationStatus getRegistrationStatus(int userId) throws
	 * SQLException, ClassNotFoundException { return
	 * getUserManager().getRegistrationStatus(userId); }
	 */

	
}
