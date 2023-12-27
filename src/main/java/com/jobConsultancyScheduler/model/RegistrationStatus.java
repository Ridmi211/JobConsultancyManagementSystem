package com.jobConsultancyScheduler.model;

public enum RegistrationStatus {
	PENDING("Pending"), 
	APPROVED("Approved"),
	REJECTED("Rejected");

	private final String displayName;

	RegistrationStatus(String displayName) {
		this.displayName = displayName;
	}

	public String getDisplayName() {
		return displayName;
	}
}
