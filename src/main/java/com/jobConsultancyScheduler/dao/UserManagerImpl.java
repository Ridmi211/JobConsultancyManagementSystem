package com.jobConsultancyScheduler.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
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
		Connection connection = getConnection();
		String query = "UPDATE user SET name =?,phoneNumber=?,email=?, password=?,birthdate=?,gender=?,occupation=?,country=? WHERE userId=?";
		
		PreparedStatement ps = connection.prepareStatement(query);
		ps.setString(1, user.getName());
		ps.setString(2, user.getPhoneNumber());
		ps.setString(3, user.getEmail());
		ps.setString(4, user.getPassword());
		ps.setString(5, user.getBirthdate());
		ps.setString(6, user.getGender());
		ps.setString(7, user.getOccupation());
		ps.setString(8, user.getCountry());
		ps.setInt(9, user.getUserId());
		
		boolean result = false;
		
		if(ps.executeUpdate()>0)
			result = true;
		ps.close();
		connection.close();
		
		return result;
	}

	@Override
 	public boolean deleteUser(int userId) throws SQLException, ClassNotFoundException {
		Connection connection = getConnection();
		String query= "DELETE FROM user WHERE userId=?";
		
		PreparedStatement ps = connection.prepareStatement(query);
		
		ps.setInt(1, userId);
		boolean result =false;
		
		if(ps.executeUpdate()>0) {
			result = true;
			}			
		ps.close();
		connection.close();
		
		return result;
		
		}

	@Override
	public User fetchSingleUser(int userId) throws SQLException, ClassNotFoundException {
		// TODO Auto-generated method stub
		Connection connection = getConnection();
		String query = "SELECT * FROM user WHERE userId=?";
		
		PreparedStatement ps = connection.prepareStatement(query);
		ps.setInt(1, userId);
		
		ResultSet rs = ps.executeQuery();
		
		User user = new User();
		
		while(rs.next()) {
			user.setUserId(rs.getInt("userId"));
			user.setName(rs.getString("name"));
			user.setPhoneNumber(rs.getString("phoneNumber"));
			user.setEmail(rs.getString("email"));
			user.setBirthdate(rs.getString("birthdate"));
			user.setGender(rs.getString("gender"));
			user.setOccupation(rs.getString("occupation"));
			user.setCountry(rs.getString("country"));
		}
		
		ps.close();
		connection.close();		
		return user;
	}

	@Override
	public List<User> fetchAllUsers() throws SQLException, ClassNotFoundException {

		Connection connection = getConnection();
		
		String query = "SELECT * FROM user";
		Statement st = connection.createStatement();
		
		List<User> userList = new ArrayList<User>();
		
		ResultSet rs = st.executeQuery(query);
		while(rs.next()) {
				
			User user = new User();
			user.setUserId(rs.getInt("userId"));
			user.setName(rs.getString("name"));
//			user.setPhoneNumber(rs.getString("phoneNumber"));
			user.setEmail(rs.getString("email"));
//			user.setBirthdate(rs.getString(" birthdate"));
//			user.setGender(rs.getString("gender"));
//			user.setOccupation(rs.getString("occupation"));
//			user.setCountry(rs.getString("country"));
//			user.setAccessRight(rs.getAccessRight("name"));		
			
			userList.add(user);
		}
		
		st.close();
		connection.close();
		
		return userList;
	}
	
	// In UserManagerImpl.java
	@Override
	public User fetchUserByEmail(String email) throws SQLException, ClassNotFoundException {
	    Connection connection = getConnection(); // Implement the getConnection() method.

	    String query = "SELECT * FROM user WHERE email=?";
	    PreparedStatement preparedStatement = connection.prepareStatement(query);
	    preparedStatement.setString(1, email);

	    ResultSet resultSet = preparedStatement.executeQuery();

	    User user = null;

	    if (resultSet.next()) {
	        user = new User();
	        user.setUserId(resultSet.getInt("userId"));
	        user.setName(resultSet.getString("name"));
	        user.setPhoneNumber(resultSet.getString("phoneNumber"));
	        user.setEmail(resultSet.getString("email"));
	        user.setPassword(resultSet.getString("password"));
	        user.setBirthdate(resultSet.getString("birthdate"));
	        user.setGender(resultSet.getString("gender"));
	        user.setOccupation(resultSet.getString("occupation"));
	        user.setCountry(resultSet.getString("country"));
//	        user.setAccessRight(AccessRight.valueOf(resultSet.getString("accessRight")));
	    }

	    preparedStatement.close();
	    connection.close();

	    return user;
	}
	
	@Override
	public boolean isEmailAlreadyExists(String email) throws SQLException, ClassNotFoundException {
	    Connection connection = getConnection();
	    String query = "SELECT COUNT(*) FROM user WHERE email=?";
	    PreparedStatement preparedStatement = connection.prepareStatement(query);
	    preparedStatement.setString(1, email);

	    ResultSet resultSet = preparedStatement.executeQuery();

	    boolean emailExists = false;

	    if (resultSet.next()) {
	        int count = resultSet.getInt(1);
	        emailExists = count > 0;
	    }

	    preparedStatement.close();
	    connection.close();

	    return emailExists;
	}



}
