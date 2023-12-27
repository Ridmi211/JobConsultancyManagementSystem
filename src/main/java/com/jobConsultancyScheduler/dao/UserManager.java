package com.jobConsultancyScheduler.dao;

import java.sql.SQLException;
import java.util.List;

import com.jobConsultancyScheduler.model.RegistrationStatus;
import com.jobConsultancyScheduler.model.User;

public interface UserManager {
	
	public boolean addUser(User user) throws SQLException, ClassNotFoundException;
	
	public boolean editUser(User user) throws SQLException, ClassNotFoundException;
	
	public boolean deleteUser(int userId) throws SQLException, ClassNotFoundException;
	
	public User fetchSingleUser(int userId) throws SQLException, ClassNotFoundException;
	
	public List<User> fetchAllUsers() throws SQLException, ClassNotFoundException;
	
	public User fetchUserByEmail(String email) throws SQLException, ClassNotFoundException;
	
    public boolean isEmailAlreadyExists(String email) throws SQLException, ClassNotFoundException;

    public List<User> fetchAllConsultantUsers() throws SQLException, ClassNotFoundException;
    
    // Add methods related to registration status
    boolean updateRegistrationStatus(int userId, RegistrationStatus status) throws SQLException, ClassNotFoundException;


	 public List<User> fetchPendingUsers() throws SQLException, ClassNotFoundException;
//    RegistrationStatus getRegistrationStatus(int userId) throws SQLException, ClassNotFoundException;

//    public int countUsers() throws SQLException, ClassNotFoundException;
//    public List<User> searchUsers(String searchTerm) throws SQLException, ClassNotFoundException;
//    public boolean changePassword(int userId, String newPassword) throws SQLException, ClassNotFoundException;



}
