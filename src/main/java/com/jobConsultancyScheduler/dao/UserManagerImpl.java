package com.jobConsultancyScheduler.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.Year;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.logging.Logger;

import com.jobConsultancyScheduler.dao.dbUtils.DbDriverManager;
import com.jobConsultancyScheduler.dao.dbUtils.DbDriverManagerFactory;
import com.jobConsultancyScheduler.model.AccessRight;
import com.jobConsultancyScheduler.model.RegistrationStatus;
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

        String query = "INSERT INTO user(`name`,`phoneNumber`,`email`, `password`,`birthdate`,`gender`,`occupation`,`country`,`educationalQualifications`,`specializedCountries`,`specializedJobs`,`availableDays`,`availableTimeSlots`,`accessRight`,`registrationStatus`,`registrationDate`) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

        PreparedStatement ps = connection.prepareStatement(query);
        ps.setString(1, user.getName());
        ps.setString(2, user.getPhoneNumber());
        ps.setString(3, user.getEmail());
        ps.setString(4, user.getPassword());
        ps.setString(5, user.getBirthdate());
        ps.setString(6, user.getGender());
        ps.setString(7, user.getOccupation());
        ps.setString(8, user.getCountry());
        ps.setString(9, user.getEducationalQualifications());
        ps.setString(10, user.getSpecializedCountries());
        ps.setString(11, user.getSpecializedJobs());
        ps.setString(12, user.getAvailableDays());
        ps.setString(13, user.getAvailableTimeSlots());
        ps.setString(14, user.getAccessRight().toString());
        ps.setString(15, user.getRegistrationStatus().toString());
        ps.setDate(16, new java.sql.Date(user.getRegistrationDate().getTime()));// Set registration status to PENDING for new registrations

        boolean result = false;

        if (ps.executeUpdate() > 0)
            result = true;

        ps.close();
        connection.close();
        return result;
    }

    // Add a method to update the registration status for a user
    public boolean updateRegistrationStatus(int userId, RegistrationStatus status) throws SQLException, ClassNotFoundException {
        Connection connection = getConnection();

        String query = "UPDATE user SET registrationStatus = ? WHERE userId = ?";

        PreparedStatement ps = connection.prepareStatement(query);
        ps.setString(1, status.toString());
        ps.setInt(2, userId);

        boolean result = false;

        if (ps.executeUpdate() > 0)
            result = true;

        ps.close();
        connection.close();
        return result;
    }
 
    
    public Map<String, List<Integer>> getMonthlyUserRegistrationCounts() throws SQLException, ClassNotFoundException {
        Connection connection = getConnection();
        List<Integer> userCounts = new ArrayList<>();
        List<Integer> consultantCounts = new ArrayList<>();

        // Get the current year
        int currentYear = Year.now().getValue();

        // Loop through each month (January to December) and fetch the counts for users and consultants
        for (int month = 1; month <= 12; month++) {
            // Count for users
            String userQuery = "SELECT COUNT(*) FROM user WHERE YEAR(registrationDate) = ? AND MONTH(registrationDate) = ? AND accessRight = 'ROLE_USER'";

            try (PreparedStatement userPs = connection.prepareStatement(userQuery)) {
                userPs.setInt(1, currentYear);
                userPs.setInt(2, month);

                try (ResultSet userRs = userPs.executeQuery()) {
                    if (userRs.next()) {
                        int userCount = userRs.getInt(1);
                        userCounts.add(userCount);
                    }
                }
            }

            // Count for consultants
            String consultantQuery = "SELECT COUNT(*) FROM user WHERE YEAR(registrationDate) = ? AND MONTH(registrationDate) = ? AND accessRight = 'ROLE_CONSULTANT'";

            try (PreparedStatement consultantPs = connection.prepareStatement(consultantQuery)) {
                consultantPs.setInt(1, currentYear);
                consultantPs.setInt(2, month);

                try (ResultSet consultantRs = consultantPs.executeQuery()) {
                    if (consultantRs.next()) {
                        int consultantCount = consultantRs.getInt(1);
                        consultantCounts.add(consultantCount);
                    }
                }
            }
        }

        connection.close();

        // Create a Map to store both user and consultant counts
        Map<String, List<Integer>> countsMap = new HashMap<>();
        countsMap.put("userCounts", userCounts);
        countsMap.put("consultantCounts", consultantCounts);
        return countsMap;
    }
    
    public Map<String, Map<String, Object>> getJobTypeDistributionData() throws SQLException, ClassNotFoundException {
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        try {
            connection = getConnection(); // Implement your getConnection() method

            String query = "SELECT occupation, COUNT(*) as count FROM user GROUP BY occupation ORDER BY count DESC LIMIT 20";
            statement = connection.prepareStatement(query);
            resultSet = statement.executeQuery();

            Map<String, Map<String, Object>> jobTypeDistributionData = new HashMap<>();

			/*
			 * while (resultSet.next()) { String occupation =
			 * resultSet.getString("occupation"); int count = resultSet.getInt("count");
			 * 
			 * // Generate a random light color String color = generateRandomLightColor();
			 * 
			 * Map<String, Object> jobTypeInfo = new HashMap<>(); jobTypeInfo.put("count",
			 * count); jobTypeInfo.put("color", color);
			 * 
			 * jobTypeDistributionData.put(occupation, jobTypeInfo); }
			 */

            int colorIndex = 0; // Index to keep track of the color to use

            while (resultSet.next()) {
                String occupation = resultSet.getString("occupation");
                int count = resultSet.getInt("count");

                // Get the color from the predefined list
                String color = getPredefinedColor(colorIndex);

                Map<String, Object> jobTypeInfo = new HashMap<>();
                jobTypeInfo.put("count", count);
                jobTypeInfo.put("color", color);

                jobTypeDistributionData.put(occupation, jobTypeInfo);

                // Increment the color index for the next iteration
                colorIndex = (colorIndex + 1) % PREDEFINED_COLORS.size();
            }
            
            return jobTypeDistributionData;
        } finally {
            // Close resources in the reverse order of their creation to avoid leaks
            if (resultSet != null) resultSet.close();
            if (statement != null) statement.close();
            if (connection != null) connection.close();
        }
    }
    
    private static final List<String> PREDEFINED_COLORS = Arrays.asList(
    		 "rgba(255, 99, 132, 0.8)",
    		    "rgba(54, 162, 235, 0.8)",
    		    "rgba(255, 182, 193, 0.8)",
    		    "rgba(240, 230, 140, 0.8)",
    		    "rgba(192, 192, 192, 0.8)",
    		    "rgba(255, 69, 0, 0.8)",
    		    "rgba(0, 128, 0, 0.8)",
    		    "rgba(255, 215, 0, 0.8)",
    		    "rgba(70, 130, 180, 0.8)",
    		    "rgba(128, 0, 128, 0.8)",
    		    "rgba(128, 128, 0, 0.8)",
    		    "rgba(0, 128, 128, 0.8)",
    		    "rgba(165, 42, 42, 0.8)",
    		    "rgba(0, 255, 255, 0.8)",
    		    "rgba(0, 0, 128, 0.8)",
    		    "rgba(255, 20, 147, 0.8)",
    		    "rgba(0, 250, 154, 0.8)",
    		    "rgba(255, 165, 0, 0.8)",
    		    "rgba(255, 0, 255, 0.8)",
    		    "rgba(128, 0, 0, 0.8)"
            
            // Add more colors as needed
    );

    private String getPredefinedColor(int index) {
        // Ensure index is within bounds
        index = index % PREDEFINED_COLORS.size();
        return PREDEFINED_COLORS.get(index);
    }
    
   
	/*
	 * private String generateRandomLightColor() { Random random = new Random(); int
	 * red = random.nextInt(256); int green = random.nextInt(256); int blue =
	 * random.nextInt(256);
	 * 
	 * return String.format("rgba(%d, %d, %d, 0.8)", red, green, blue); }
	 */

    public Map<String, Map<String, Integer>> getUserDemographicsData() throws SQLException, ClassNotFoundException {
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        try {
            connection = getConnection(); // Implement your getConnection() method

            String query = "SELECT country, gender, COUNT(*) as count FROM user GROUP BY country, gender";
            statement = connection.prepareStatement(query);
            resultSet = statement.executeQuery();

            Map<String, Map<String, Integer>> userDemographicsData = new HashMap<>();

            while (resultSet.next()) {
                String country = resultSet.getString("country");
                String gender = resultSet.getString("gender");
                int count = resultSet.getInt("count");

                // Create a map for the country if it doesn't exist
                userDemographicsData.putIfAbsent(country, new HashMap<>());

                // Update the count in the user demographics map
                userDemographicsData.get(country).put(gender, count);
            }

            return userDemographicsData;
        } finally {
            // Close resources in the reverse order of their creation to avoid leaks
            if (resultSet != null) resultSet.close();
            if (statement != null) statement.close();
            if (connection != null) connection.close();
        }
    }
    
 // Implement this method in your service or DAO class
    public Map<RegistrationStatus, Integer> getRegistrationStatusData() throws SQLException, ClassNotFoundException {
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        try {
            connection = getConnection(); // Implement your getConnection() method

            String query = "SELECT registrationStatus, COUNT(*) as count FROM user GROUP BY registrationStatus";
           
            statement = connection.prepareStatement(query);
            resultSet = statement.executeQuery();

            Map<RegistrationStatus, Integer> registrationStatusData = new HashMap<>();

            while (resultSet.next()) {
                String statusString = resultSet.getString("registrationStatus");
                RegistrationStatus status = RegistrationStatus.valueOf(statusString.toUpperCase());
                int count = resultSet.getInt("count");

                registrationStatusData.put(status, count);
            }

            return registrationStatusData;
        } finally {
            // Close resources in the reverse order of their creation to avoid leaks
            if (resultSet != null) resultSet.close();
            if (statement != null) statement.close();
            if (connection != null) connection.close();
        }
    }


    	
    public Map<String, Integer> getAgeDistributionData() throws SQLException, ClassNotFoundException {
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        try {
            connection = getConnection(); // Implement your getConnection() method

            String query = "SELECT COUNT(*) as count, FLOOR(DATEDIFF(CURRENT_DATE, birthdate) / 365.25 / 10) * 10 as ageRange FROM user GROUP BY ageRange ORDER BY ageRange";
            statement = connection.prepareStatement(query);
            resultSet = statement.executeQuery();

            Map<String, Integer> ageDistributionData = new LinkedHashMap<>();
            ageDistributionData.put("0-9", 0);
            ageDistributionData.put("10-19", 0);
            ageDistributionData.put("20-29", 0);
            ageDistributionData.put("30-39", 0);
            ageDistributionData.put("40-49", 0);
            ageDistributionData.put("50-59", 0);
            ageDistributionData.put("60+", 0);

            while (resultSet.next()) {
                int count = resultSet.getInt("count");
                int ageRange = resultSet.getInt("ageRange");

                // Map the age range to the corresponding label
                String label = mapAgeRangeToLabel(ageRange);

                // Update the count in the age distribution map
                ageDistributionData.put(label, count);
            }

            return ageDistributionData;
        } finally {
            // Close resources in the reverse order of their creation to avoid leaks
            if (resultSet != null) resultSet.close();
            if (statement != null) statement.close();
            if (connection != null) connection.close();
        }
    }

    private String mapAgeRangeToLabel(int ageRange) {
        switch (ageRange) {
            case 0:
                return "0-9";
            case 10:
                return "10-19";
            case 20:
                return "20-29";
            case 30:
                return "30-39";
            case 40:
                return "40-49";
            case 50:
                return "50-59";
            default:
                return "60+";
        }
    }
    
    public Map<String, Integer> getAccessRightsData() throws SQLException, ClassNotFoundException {
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        try {
            connection = getConnection(); // Implement your getConnection() method

            String query = "SELECT accessRight, COUNT(*) as count FROM user GROUP BY accessRight";
            statement = connection.prepareStatement(query);
            resultSet = statement.executeQuery();

            Map<String, Integer> accessRightsData = new HashMap<>();

            while (resultSet.next()) {
                String accessRight = resultSet.getString("accessRight");
                int count = resultSet.getInt("count");

                accessRightsData.put(accessRight, count);
            }

            return accessRightsData;
        } finally {
            // Close resources in the reverse order of their creation to avoid leaks
            if (resultSet != null) resultSet.close();
            if (statement != null) statement.close();
            if (connection != null) connection.close();
        }
    }
    
    public Map<String, Integer> getConsultantCountByCountry() throws SQLException, ClassNotFoundException {
        Connection connection = getConnection();
        Map<String, Integer> consultantCountByCountry = new HashMap<>();

        // Fetch the countries for consultants
        String consultantCountriesQuery = "SELECT specializedCountries FROM user WHERE accessRight = 'ROLE_CONSULTANT'";
        try (PreparedStatement countriesPs = connection.prepareStatement(consultantCountriesQuery)) {
            try (ResultSet countriesRs = countriesPs.executeQuery()) {
                while (countriesRs.next()) {
                    String countriesString = countriesRs.getString("specializedCountries");
                    // Split the countries string based on the delimiter (assuming ',' is used)
//                    String[] countries = countriesString.split(", ");
                    String[] countries = countriesString.split(",\\s*");
                    // Count the occurrences of each country
                    for (String country : countries) {
                        consultantCountByCountry.put(country, consultantCountByCountry.getOrDefault(country, 0) + 1);
                    }
                }
            }
        }

        connection.close();
        return consultantCountByCountry;
    }
    private static final Logger LOGGER = Logger.getLogger(UserManagerImpl.class.getName());

    public Map<String, Map<String, Integer>> getConsultantAvailabilityData() throws SQLException, ClassNotFoundException {
        Connection connection = getConnection();
        Map<String, Map<String, Integer>> consultantAvailabilityData = new HashMap<>();

        // Fetch the availability data for consultants
        String consultantAvailabilityQuery = "SELECT availableDays, availableTimeSlots FROM user WHERE accessRight = 'ROLE_CONSULTANT'";
        try (PreparedStatement availabilityPs = connection.prepareStatement(consultantAvailabilityQuery)) {
            try (ResultSet availabilityRs = availabilityPs.executeQuery()) {
                while (availabilityRs.next()) {
                    String daysString = availabilityRs.getString("availableDays");
                    String timeSlotsString = availabilityRs.getString("availableTimeSlots");
                    LOGGER.info("Days String: " + daysString);
                    LOGGER.info("Time Slots String: " + timeSlotsString);

                    // Null check for days and time slots
                    if (daysString != null && timeSlotsString != null) {
                        // Split the days and time slots strings based on the delimiter
                        String[] days = daysString.split(",\\s*");
                        String[] timeSlots = timeSlotsString.split(",\\s*");

                        // Count the occurrences of each day and time slot
                        for (String day : days) {
                            consultantAvailabilityData.computeIfAbsent(day, k -> new HashMap<>());
                            for (String timeSlot : timeSlots) {
                                consultantAvailabilityData.get(day).put(timeSlot, consultantAvailabilityData.get(day).getOrDefault(timeSlot, 0) + 1);
                            }
                        }
                    }
                }
            }
        } finally {
            connection.close();
        }
        LOGGER.info("Consultant Availability Data: " + consultantAvailabilityData);

        return consultantAvailabilityData;
        
       
    }


    public Map<String, Integer> getConsultantJobTypeDistribution() throws SQLException, ClassNotFoundException {
        Connection connection = getConnection();
        Map<String, Integer> jobTypeDistribution = new HashMap<>();

        // Fetch the specialized job types for consultants
        String consultantJobTypesQuery = "SELECT specializedJobs FROM user WHERE accessRight = 'ROLE_CONSULTANT'";
        try (PreparedStatement jobTypesPs = connection.prepareStatement(consultantJobTypesQuery)) {
            try (ResultSet jobTypesRs = jobTypesPs.executeQuery()) {
                while (jobTypesRs.next()) {
                    String jobTypesString = jobTypesRs.getString("specializedJobs");
                    // Split the job types string based on the delimiter (assuming ',' is used)
                    String[] jobTypes = jobTypesString.split(",\\s*");
                    // Count the occurrences of each job type
                    for (String jobType : jobTypes) {
                        jobTypeDistribution.put(jobType, jobTypeDistribution.getOrDefault(jobType, 0) + 1);
                    }
                }
            }
        }

        connection.close();
        return jobTypeDistribution;
    }



  
    
	@Override
	public boolean editUser(User user) throws SQLException, ClassNotFoundException {
		Connection connection = getConnection();
		String query = "UPDATE user SET name =?,phoneNumber=?,email=?,birthdate=?,gender=?,occupation=?,country=?,educationalQualifications=?,specializedCountries=?,specializedJobs=?,accessRight=?,availableDays=?,availableTimeSlots=? WHERE userId=?";
		
		PreparedStatement ps = connection.prepareStatement(query);
		ps.setString(1, user.getName());
		ps.setString(2, user.getPhoneNumber());
		ps.setString(3, user.getEmail());
//		ps.setString(4, user.getPassword());
		ps.setString(4, user.getBirthdate());
		ps.setString(5, user.getGender());
		ps.setString(6, user.getOccupation());
		ps.setString(7, user.getCountry());
		
		
		ps.setString(8, user.getEducationalQualifications());
		ps.setString(9, user.getSpecializedCountries());
		ps.setString(10, user.getSpecializedJobs());
		 ps.setString(11, user.getAccessRight().toString()); 
		 ps.setString(12, user.getAvailableDays());
			ps.setString(13, user.getAvailableTimeSlots());
		ps.setInt(14, user.getUserId());
		
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
			  user.setAccessRight(AccessRight.valueOf(rs.getString("accessRight")));
			   user.setEducationalQualifications(rs.getString("educationalQualifications"));
		        user.setSpecializedCountries(rs.getString("specializedCountries"));
		        user.setSpecializedJobs(rs.getString("specializedJobs"));
		        user.setAvailableDays(rs.getString("availableDays"));
		        user.setAvailableTimeSlots(rs.getString("availableTimeSlots"));
		      
		        
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
			 user.setAccessRight(AccessRight.valueOf(rs.getString("accessRight")));
			 user.setRegistrationStatus(RegistrationStatus.valueOf(rs.getString("registrationStatus")));
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
	
	public List<User> fetchAllConsultantUsers() throws SQLException, ClassNotFoundException {
	    Connection connection = getConnection();
	    String query = "SELECT * FROM user WHERE accessRight = 'ROLE_CONSULTANT'AND registrationStatus = 'APPROVED'";


	    Statement st = connection.createStatement();
	    
	    List<User> consultantUsers = new ArrayList<>();
	    
	    ResultSet rs = st.executeQuery(query);
	    while (rs.next()) {
	        User user = new User();
	        user.setUserId(rs.getInt("userId"));
			user.setName(rs.getString("name"));
			user.setPhoneNumber(rs.getString("phoneNumber"));
			user.setEmail(rs.getString("email"));
			user.setBirthdate(rs.getString("birthdate"));
			user.setGender(rs.getString("gender"));
			user.setOccupation(rs.getString("occupation"));
			user.setCountry(rs.getString("country"));
			  user.setAccessRight(AccessRight.valueOf(rs.getString("accessRight")));
			   user.setEducationalQualifications(rs.getString("educationalQualifications"));
		        user.setSpecializedCountries(rs.getString("specializedCountries"));
		        user.setSpecializedJobs(rs.getString("specializedJobs"));
		        user.setAvailableDays(rs.getString("availableDays"));
		        user.setAvailableTimeSlots(rs.getString("availableTimeSlots"));

	        consultantUsers.add(user);
	    }
	    
	    st.close();
	    connection.close();
	    
	    return consultantUsers;
	}

	public List<User> fetchPendingUsers() throws SQLException, ClassNotFoundException {
	    Connection connection = getConnection();
	    String query = "SELECT * FROM user WHERE registrationStatus = 'PENDING'";
	    Statement st = connection.createStatement();
	    
	    List<User> consultantUsers = new ArrayList<>();
	    
	    ResultSet rs = st.executeQuery(query);
	    while (rs.next()) {
	        User user = new User();
			user.setUserId(rs.getInt("userId"));
			user.setName(rs.getString("name"));
			user.setEmail(rs.getString("email"));
			 user.setAccessRight(AccessRight.valueOf(rs.getString("accessRight")));
			 user.setRegistrationStatus(RegistrationStatus.valueOf(rs.getString("registrationStatus")));

	        consultantUsers.add(user);
	    }
	    
	    st.close();
	    connection.close();
	    
	    return consultantUsers;
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
	        user.setEducationalQualifications(resultSet.getString("educationalQualifications"));
	        user.setSpecializedCountries(resultSet.getString("specializedCountries"));
	        user.setSpecializedJobs(resultSet.getString("specializedJobs"));
	        user.setAccessRight(AccessRight.valueOf(resultSet.getString("accessRight")));
	        user.setAvailableDays(resultSet.getString("availableDays"));
	        user.setAvailableTimeSlots(resultSet.getString("availableTimeSlots"));
	        user.setRegistrationStatus(RegistrationStatus.valueOf(resultSet.getString("registrationStatus")));
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
