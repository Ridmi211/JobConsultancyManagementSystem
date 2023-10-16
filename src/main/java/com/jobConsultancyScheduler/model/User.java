package com.jobConsultancyScheduler.model;
import java.util.Date;
import java.util.List;

public class User {

	    private int userId;
	    private String name;
	    private String phoneNumber;
	    private String email;
	    private String password; // Hashed password
	    private String birthdate;
	    private String gender;
	    private String occupation;
	    private String country;
	    private AccessRight accessRight; // Use the AccessRight enumeration
	    
	    
	    private String educationalQualifications;
	    private String specializedCountries;
	    private String specializedJobs;
	    private String availableDays;
	    private String availableTimeSlots;
//	    private String profilePicture;
	    
	    private String cvPath; // Path to the CV file
	    private String profilePicturePath; // Path to the profile picture file


	    // Constructors
	    public User() {
	        // Default constructor
	    }

	    public User(int userId, String name, String phoneNumber, String email, String password,
	                String birthdate, String gender, String occupation, String country,
	                AccessRight accessRight, String educationalQualifications,
	                String specializedCountries, String specializedJobs,String availableDays,String availableTimeSlots, String profilePicturePath, String cvPath) {
	    	
	        this.userId = userId;
	        this.name = name;
	        this.phoneNumber = phoneNumber;
	        this.email = email;
	        this.password = password;
	        this.birthdate = birthdate;
	        this.gender = gender;
	        this.occupation = occupation;
	        this.country = country;
	        this.accessRight = accessRight;
	        
	        this.educationalQualifications = educationalQualifications;
	        this.specializedCountries = specializedCountries;
	        this.specializedJobs = specializedJobs;
	        this.availableDays = availableDays;
	        this.availableTimeSlots = availableTimeSlots;
	        
	        this.profilePicturePath = profilePicturePath;
	        this.cvPath = cvPath;
	    }

	    // Getter and Setter methods for attributes
	    public int getUserId() {
	        return userId;
	    }

	    public void setUserId(int userId) {
	        this.userId = userId;
	    }

	    public String getName() {
	        return name;
	    }

	    public void setName(String name) {
	        this.name = name;
	    }

	    public String getPhoneNumber() {
	        return phoneNumber;
	    }

	    public void setPhoneNumber(String phoneNumber) {
	        this.phoneNumber = phoneNumber;
	    }

	    public String getEmail() {
	        return email;
	    }

	    public void setEmail(String email) {
	        this.email = email;
	    }

	    public String getPassword() {
	        return password;
	    }

	    public void setPassword(String password) {
	        this.password = password;
	    }

	    public String getBirthdate() {
	        return birthdate;
	    }

	    public void setBirthdate(String birthdate) {
	        this.birthdate = birthdate;
	    }

	    public String getGender() {
	        return gender;
	    }

	    public void setGender(String gender) {
	        this.gender = gender;
	    }

	    public String getOccupation() {
	        return occupation;
	    }

	    public void setOccupation(String occupation) {
	        this.occupation = occupation;
	    }

	    public String getCountry() {
	        return country;
	    }

	    public void setCountry(String country) {
	        this.country = country;
	    }

	    public AccessRight getAccessRight() {
	        return accessRight;
	    }

	    public void setAccessRight(AccessRight accessRight) {
	        this.accessRight = accessRight;
	    }
	    
	    public boolean checkPassword(String enteredPassword) {
	        // Compare enteredPassword with this.password (hashed password)
	        return enteredPassword.equals(this.password); // Update this line accordingly
	    }
	    
//	    For consultants
	    
	    public String getEducationalQualifications() {
	        return educationalQualifications;
	    }

	    public void setEducationalQualifications(String educationalQualifications) {
	        this.educationalQualifications = educationalQualifications;
	    }

	    public String getSpecializedCountries() {
	        return specializedCountries;
	    }

	    public void setSpecializedCountries(String specializedCountries) {
	        this.specializedCountries = specializedCountries;
	    }

	    public String getSpecializedJobs() {
	        return specializedJobs;
	    }

	    public void setSpecializedJobs(String specializedJobs) {
	        this.specializedJobs = specializedJobs;
	    }
	    
	    public String getProfilePicturePath() {
	        return profilePicturePath;
	    }

	    public void setProfilePicturePath(String profilePicture) {
	        this.profilePicturePath = profilePicture;
	    }

	    public String getCvPathPath() {
	        return cvPath;
	    }

	    public void setCvPathPath(String cvPath) {
	        this.cvPath = cvPath;
	    }

		public String getAvailableDays() {
			return availableDays;
		}

		public void setAvailableDays(String availableDays) {
			this.availableDays = availableDays;
		}

		public String getAvailableTimeSlots() {
			return availableTimeSlots;
		}

		public void setAvailableTimeSlots(String availableTimeSlots) {
			this.availableTimeSlots = availableTimeSlots;
		}
	    


	}
