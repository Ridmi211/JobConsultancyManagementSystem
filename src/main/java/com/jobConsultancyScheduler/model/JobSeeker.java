package com.jobConsultancyScheduler.model;

public class JobSeeker extends User {

	    private int jobSeekerId;
	    private User user; // Reference to the User model
	    private String profilePicture; // Path or URL to the profile picture
	    private String cvPath; // Path or URL to the uploaded CV (resume)

	    // Constructors
	    public JobSeeker() {
	        // Default constructor
	    }

	    public JobSeeker(int jobSeekerId, User user, String profilePicture, String cvPath) {
	        this.jobSeekerId = jobSeekerId;
	        this.user = user;
	        this.profilePicture = profilePicture;
	        this.cvPath = cvPath;
	    }

	    // Getter and Setter methods for attributes
	    public int getJobSeekerId() {
	        return jobSeekerId;
	    }

	    public void setJobSeekerId(int jobSeekerId) {
	        this.jobSeekerId = jobSeekerId;
	    }

	    public User getUser() {
	        return user;
	    }

	    public void setUser(User user) {
	        this.user = user;
	    }

	    public String getProfilePicture() {
	        return profilePicture;
	    }

	    public void setProfilePicture(String profilePicture) {
	        this.profilePicture = profilePicture;
	    }

	    public String getCvPath() {
	        return cvPath;
	    }

	    public void setCvPath(String cvPath) {
	        this.cvPath = cvPath;
	    }
	}


