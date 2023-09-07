package com.jobConsultancyScheduler.model;
import java.util.List;

public class Consultant extends User {

	    private int consultantId;
	    private User user; // Reference to the User model
//	    private int age;
	    private String educationalQualifications;
//	    private String gender;
	    private List<String> specializedCountries;
	    private List<String> specializedJobs;
	    private String profilePicture;
//	    private AccessRight accessRight; // Use the AccessRight enumeration

	    // Constructors
	    public Consultant() {
	        // Default constructor
	    }

	    public Consultant(int consultantId, User user, int age, String educationalQualifications,
	                      String gender, List<String> specializedCountries, List<String> specializedJobs,String profilePicture,
	                      AccessRight accessRight) {
	        this.consultantId = consultantId;
	        this.user = user;
//	        this.age = age;
	        this.educationalQualifications = educationalQualifications;
//	        this.gender = gender;
	        this.specializedCountries = specializedCountries;
	        this.specializedJobs = specializedJobs;
	        this.profilePicture = profilePicture;
//	        this.accessRight = accessRight;
	    }

	    // Getter and Setter methods for attributes
	    public int getConsultantId() {
	        return consultantId;
	    }

	    public void setConsultantId(int consultantId) {
	        this.consultantId = consultantId;
	    }

	    public User getUser() {
	        return user;
	    }

	    public void setUser(User user) {
	        this.user = user;
	    }

//	    public int getAge() {
//	        return age;
//	    }
//
//	    public void setAge(int age) {
//	        this.age = age;
//	    }

	    public String getEducationalQualifications() {
	        return educationalQualifications;
	    }

	    public void setEducationalQualifications(String educationalQualifications) {
	        this.educationalQualifications = educationalQualifications;
	    }

//	    public String getGender() {
//	        return gender;
//	    }

//	    public void setGender(String gender) {
//	        this.gender = gender;
//	    }

	    public List<String> getSpecializedCountries() {
	        return specializedCountries;
	    }

	    public void setSpecializedCountries(List<String> specializedCountries) {
	        this.specializedCountries = specializedCountries;
	    }

	    public List<String> getSpecializedJobs() {
	        return specializedJobs;
	    }

	    public void setSpecializedJobs(List<String> specializedJobs) {
	        this.specializedJobs = specializedJobs;
	    }
	    
	    public String getProfilePicture() {
	        return profilePicture;
	    }

	    public void setProfilePicture(String profilePicture) {
	        this.profilePicture = profilePicture;
	    }

//	    public AccessRight getAccessRight() {
//	        return accessRight;
//	    }

//	    public void setAccessRight(AccessRight accessRight) {
//	        this.accessRight = accessRight;
//	    }
	}


