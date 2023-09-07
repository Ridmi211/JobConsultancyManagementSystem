package com.jobConsultancyScheduler.model;
import java.util.Date;

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

	    // Constructors
	    public User() {
	        // Default constructor
	    }

	    public User(int userId, String name, String phoneNumber, String email, String password,
	                String birthdate, String gender, String occupation, String country,
	                AccessRight accessRight) {
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
	}
