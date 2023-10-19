package com.jobConsultancyScheduler.model;

    
    public enum RegistrationStatus {
        PENDING("Pending"),    // Registration is pending admin review
        APPROVED("Approved"),   // Registration has been approved
        REJECTED("Rejected");   // Registration has been rejected

        private final String displayName;

        RegistrationStatus(String displayName) {
            this.displayName = displayName;
        }

        public String getDisplayName() {
            return displayName;
        }
    }


