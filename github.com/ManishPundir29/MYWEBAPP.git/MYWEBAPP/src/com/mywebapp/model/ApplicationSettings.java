package com.mywebapp.model;

public class ApplicationSettings { // Application Settings domain class;
			
		/**
		 * Variables declared of application_settings entity
		 * Followed case is camelCasing  
		 */
		private Integer passwordExpiryDays;
		private Integer sessionTimeOut;
		private Integer settingId;
		private Integer invalidPasswordCount;
		private String enteredBy;
		private String enteredOn;
		private String clientIp;
		private String activeStatus;
		
		public Integer getPasswordExpiryDays() {
			return passwordExpiryDays;
		}
		public void setPasswordExpiryDays(Integer passwordExpiryDays) {
			this.passwordExpiryDays = passwordExpiryDays;
		}
		public Integer getSessionTimeOut() {
			return sessionTimeOut;
		}
		public void setSessionTimeOut(Integer sessionTimeOut) {
			this.sessionTimeOut = sessionTimeOut;
		}
		public Integer getSettingId() {
			return settingId;
		}
		public void setSettingId(Integer settingId) {
			this.settingId = settingId;
		}
		public Integer getInvalidPasswordCount() {
			return invalidPasswordCount;
		}
		public void setInvalidPasswordCount(Integer invalidPasswordCount) {
			this.invalidPasswordCount = invalidPasswordCount;
		}
		public String getEnteredBy() {
			return enteredBy;
		}
		public void setEnteredBy(String enteredBy) {
			this.enteredBy = enteredBy;
		}
		public String getEnteredOn() {
			return enteredOn;
		}
		public void setEnteredOn(String enteredOn) {
			this.enteredOn = enteredOn;
		}
		public String getClientIp() {
			return clientIp;
		}
		public void setClientIp(String clientIp) {
			this.clientIp = clientIp;
		}
		public String getActiveStatus() {
			return activeStatus;
		}
		public void setActiveStatus(String activeStatus) {
			this.activeStatus = activeStatus;
		}
}
