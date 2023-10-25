package com.jobConsultancyScheduler.model;
import java.sql.Time;
import java.util.Date;

public class Appointment {
	
	    private int appointmentId;	  
		private int consultantId;
		private int seekerId;
		private String country;
		private String job;		
	    private String scheduledDate;
	    private String startTime; 
	    private Status status;
	    private String location;
	    private String notes;
	  

	    // Constructors
	    public Appointment() {
	        // Default constructor
	    }

	    public Appointment(int appointmentId, JobSeeker jobSeeker, Consultant consultant,
	                       String startTime, Status status, String location, String notes, String updatedCvFilePath) {
	        this.appointmentId = appointmentId;
	        this.startTime = startTime;
	        this.status = status;
	        this.location = location;
	        this.notes = notes;
	    }

	    // Getter and Setter methods for attributes
	    public int getAppointmentId() {
	        return appointmentId;
	    }


	    public String getStartTime() {
	        return startTime;
	    }

	    public void setStartTime(String startTime) {
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
	    
	  
	    
	    public int getConsultantId() {
			return consultantId;
		}

		public void setConsultantId(int consultantId) {
			this.consultantId = consultantId;
		}



		public int getSeekerId() {
			return seekerId;
		}

		public void setSeekerId(int seekerId) {
			this.seekerId = seekerId;
		}




		public String getScheduledDate() {
			return scheduledDate;
		}

		public void setScheduledDate(String scheduledDate) {
			this.scheduledDate = scheduledDate;
		}



		public String getCountry() {
			return country;
		}

		public void setCountry(String country) {
			this.country = country;
		}



		public String getJob() {
			return job;
		}

		public void setJob(String job) {
			this.job = job;
		}



		public enum Status {
	        REQUESTED("Requested"),
	        ADMIN_CONFIRMED("Admin Confirmed"),
	        CON_CONFIRMED("Consultant Confirmed"),
	        CON_REJECTED("Rejected"),
	        COMPLETED("Completed"),
	        SEEKER_CANCELLED("Seeker Cancelled"),
	    	ADMIN_CANCELLED(" Admin Cancelled");

	        private final String displayName;

	        Status(String displayName) {
	            this.displayName = displayName;
	        }

	        public String getDisplayName() {
	            return displayName;
	        }
	    }
	}



