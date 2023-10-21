package com.jobConsultancyScheduler.model;
import java.sql.Time;
import java.util.Date;

public class Appointment {
	
	    private int appointmentId;
	   // Reference to the Consultant model for the consultant
	    private Date scheduledDateAndTime;
	    private Time startTime; 
	    private Status status;
	    private String location;
	    private String notes;
	    private String updatedCvFilePath;

	    // Constructors
	    public Appointment() {
	        // Default constructor
	    }

	    public Appointment(int appointmentId, JobSeeker jobSeeker, Consultant consultant, Date scheduledDateAndTime,
	                       Time startTime, Status status, String location, String notes, String updatedCvFilePath) {
	        this.appointmentId = appointmentId;
//	        this.jobSeeker = jobSeeker;
//	        this.consultant = consultant;
	        this.scheduledDateAndTime = scheduledDateAndTime;
	        this.startTime = startTime;
	        this.status = status;
	        this.location = location;
	        this.notes = notes;
	        this.updatedCvFilePath = updatedCvFilePath; 
	    }

	    // Getter and Setter methods for attributes
	    public int getAppointmentId() {
	        return appointmentId;
	    }

	    public void setAppointmentId(int appointmentId) {
	        this.appointmentId = appointmentId;
	    }

//	    public JobSeeker getJobSeeker() {
//	        return jobSeeker;
//	    }
//
//	    public void setJobSeeker(JobSeeker jobSeeker) {
//	        this.jobSeeker = jobSeeker;
//	    }
//
//	    public Consultant getConsultant() {
//	        return consultant;
//	    }
//
//	    public void setConsultant(Consultant consultant) {
//	        this.consultant = consultant;
//	    }

	    public Date getScheduledDateAndTime() {
	        return scheduledDateAndTime;
	    }

	    public void setScheduledDateAndTime(Date scheduledDateAndTime) {
	        this.scheduledDateAndTime = scheduledDateAndTime;
	    }

	    public Time getStartTime() {
	        return startTime;
	    }

	    public void setStartTime(Time startTime) {
	        this.startTime = startTime;
	    }

	    public Status getStatus() {
	        return status;
	    }

	    public void setStatus(Status status) {
	        this.status = status;
	    }

	    public String getLocation() {
	        return location;
	    }

	    public void setLocation(String location) {
	        this.location = location;
	    }

	    public String getNotes() {
	        return notes;
	    }

	    public void setNotes(String notes) {
	        this.notes = notes;
	    }
	    
	    public String getUpdatedCvFilePath() {
	        return updatedCvFilePath;
	    }

	    public void setUpdatedCvFilePath(String updatedCvFilePath) {
	        this.updatedCvFilePath = updatedCvFilePath;
	    }
	    
	    public enum Status {
	        REQUESTED("Requested"),
	        CONFIRMED("Confirmed"),
	        COMPLETED("Completed"),
	        CANCELLED("Cancelled");

	        private final String displayName;

	        Status(String displayName) {
	            this.displayName = displayName;
	        }

	        public String getDisplayName() {
	            return displayName;
	        }
	    }
	}



