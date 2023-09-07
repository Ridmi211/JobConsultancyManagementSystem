package com.jobConsultancyScheduler.model;

public enum AccessRight {
	
	    ROLE_USER("User"),
	    ROLE_ADMIN("Admin"),
	    ROLE_CONSULTANT("Consultant");

	    private final String displayName;

	    AccessRight(String displayName) {
	        this.displayName = displayName;
	    }

	    public String getDisplayName() {
	        return displayName;
	    }
	}



