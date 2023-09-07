package com.jobConsultancyScheduler.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import com.jobConsultancyScheduler.dao.dbUtils.DbDriverManager;
import com.jobConsultancyScheduler.dao.dbUtils.DbDriverManagerFactory;
import com.jobConsultancyScheduler.model.User;

public class UserManagerImpl implements UserManager {

	public UserManagerImpl() {
		// TODO Auto-generated constructor stub
	}
	
	private Connection getConnection() throws ClassNotFoundException, SQLException {
		
		DbDriverManagerFactory driverFactory = new DbDriverManagerFactory();
		DbDriverManager driverManager = driverFactory.getDbDriver("MySQL");
		
		return driverManager.getConnection(); 
	}

	@Override
	public boolean addUser(User user) throws SQLException, ClassNotFoundException {
	Connection connection = getConnection();
		
		//String query = "INSERT INTO product (name, price) VALUES ("+ product.getName() + "," + product.getPrice() + ")";
		//Statement st = connection.createStatement();
		
		/*if(st.executeUpdate(query) > 0)
			result = true;*/
		
//		String query = "INSERT INTO product (name, price) VALUES (?,?)";
		
		String query = "INSERT INTO user(`name`,`phoneNumber`,`email`, `password`,`birthdate`,`gender`,`occupation`,`country`,`accessRight`)	VALUES	(?,?,?,?,?,?,?,?,?)";

		PreparedStatement ps = connection.prepareStatement(query);
		ps.setString(1, user.getName());
		ps.setString(2, user.getPhoneNumber());
		ps.setString(3, user.getEmail());
		ps.setString(4, user.getPassword());
		ps.setString(5, user.getBirthdate());
		ps.setString(6, user.getGender());
		ps.setString(7, user.getOccupation());
		ps.setString(8, user.getCountry());
		 ps.setString(9, user.getAccessRight().toString()); 

		boolean result = false;
		
		if(ps.executeUpdate() > 0)
			result = true;		
		
		ps.close();
		connection.close();		
		return result;
	}

	@Override
	public boolean editUser(User user) throws SQLException, ClassNotFoundException {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean deleteUser(int userId) throws SQLException, ClassNotFoundException {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public User fetchSingleUser(int userId) throws SQLException, ClassNotFoundException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<User> fetchAllUsers() throws SQLException, ClassNotFoundException {
		// TODO Auto-generated method stub
		return null;
	}

}
