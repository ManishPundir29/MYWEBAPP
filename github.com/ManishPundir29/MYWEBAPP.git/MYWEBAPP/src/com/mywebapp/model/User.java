package com.mywebapp.model;

import java.io.Serializable;
import java.util.Arrays;
import java.util.List;

import javax.validation.constraints.Digits;
import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.web.multipart.MultipartFile;

import com.mywebapp.validations.ApplicationProcessValidationGroups.FormValidation;



public class User implements Serializable { // User details domain class;

	/**
	 * Variables declared of user details Followed case is camelCasing
	 */
	private static final long serialVersionUID = 1L;

	private String loginId;
	@Length(max = 40, message = "User Id Should Be less than 40 characters", groups = { FormValidation.class })
	@NotEmpty(message = "User Id Can Not Be Empty", groups = { FormValidation.class })
	@Pattern(regexp = "^[a-zA-Z0-9\\s]*$", message = "Please Enter Letter And Digit Only", groups = {
			FormValidation.class })
	private String userId;
	@NotEmpty(message = "User Name Can Not Be Empty", groups = { FormValidation.class })
	@Pattern(regexp = "^[0-9A-Za-z\\-\\.\\@\\,\\(\\)\\_\\s]*$", message = "Please Enter Letter And Digit Only", groups = {
			FormValidation.class })
	private String userName;
	private String userGender;
	private String genderDesc;

	private String userPwd;
	@NotEmpty(message = "Please Enter User Designation", groups = { FormValidation.class })
	@Pattern(regexp = "^[0-9A-Za-z\\-\\.\\,\\(\\)\\s]*$", message = "Please Enter Letter And Digit Only", groups = {
			FormValidation.class })
	private String userDesignation;
	@NotEmpty(message = "Please enter email id", groups = { FormValidation.class })
	@Length(max = 100, message = "Email Id Should Be Less Than 100 Characters", groups = { FormValidation.class })
	@Email(message = "Email Id Not Valid", groups = { FormValidation.class })
	private String userEmailId;
	@NotEmpty(message = "Please Enter Mobile", groups = { FormValidation.class })
	@Digits(integer = 13, fraction = 0, message = "Mobile Number Should Not Be More Than 13 Digits", groups = {
			FormValidation.class })
	private String userMobileNo;
	private String userCreatedOn;
	private String activeStatus;
	private String firstLoginFlag;
	private Integer roleId;
	private String roleDesc;
	private String roleStatus;

	
	private Integer officeId;

	@NotEmpty(message = "Please Enter Office Address", groups = { FormValidation.class })
	@Pattern(regexp = "^[0-9A-Za-z\\-\\.\\,\\(\\)\\s]*$", message = "Office Name Not Valid", groups = {
			FormValidation.class })
	@Length(max = 200, message = "Office Name Should Not Be More Then 200", groups = { FormValidation.class })
	private String officeDesc;
	private String activatedBy;
	private String activatedOn;
	private String deactivatedOn;
	private String deactivatedBy;
	private String deactivatedReson;
	private String deactivatedResonf;
	private String randSalt;
	private boolean passwordExpire;
	private MultipartFile profilePhoto;
	private byte[] profilePic;
	private String enteredBy;
	private String enteredOn;
	private String activeStatusf;
	private Integer userType;
	private String clientIp;
	private String accesstype;
	private boolean loginHistoryfag;
	private String otp;
	private String captcha;
	
	
	public String getCaptcha() {
		return captcha;
	}

	public void setCaptcha(String captcha) {
		this.captcha = captcha;
	}

	public String getOtp() {
		return otp;
	}

	public void setOtp(String otp) {
		this.otp = otp;
	}

	// @NotEmpty(message="Please enter Landline number",groups =
	// {FormValidation.class})
	// @Digits(integer=11,fraction=0,message="landline number number should not be
	// more than 11 digits",groups = { FormValidation.class })
	private String landLineNumber;
	private Integer stcode;
	private Integer dstcode;
	private String lastloginDate;

	public String getLastloginDate() {
		return lastloginDate;
	}

	public void setLastloginDate(String lastloginDate) {
		this.lastloginDate = lastloginDate;
	}

	public Integer getStcode() {
		return stcode;
	}

	public void setStcode(Integer stcode) {
		this.stcode = stcode;
	}
	
	
	public Integer getDstcode() {
		return dstcode;
	}

	public void setDstcode(Integer dstcode) {
		this.dstcode = dstcode;
	}

	public String getLandLineNumber() {
		return landLineNumber;
	}

	public void setLandLineNumber(String landLineNumber) {
		this.landLineNumber = landLineNumber;
	}

	public String getClientIp() {
		return clientIp;
	}

	public void setClientIp(String clientIp) {
		this.clientIp = clientIp;
	}

	private String assignRoleList;

	public String getAssignRoleList() {
		return assignRoleList;
	}

	public void setAssignRoleList(String assignRoleList) {
		this.assignRoleList = assignRoleList;
	}

	public String getDeactivatedResonf() {
		return deactivatedResonf;
	}

	public void setDeactivatedResonf(String deactivatedResonf) {
		this.deactivatedResonf = deactivatedResonf;
	}

	public String getActiveStatusf() {
		return activeStatusf;
	}

	public void setActiveStatusf(String activeStatusf) {
		this.activeStatusf = activeStatusf;
	}

	public String getEnteredOn() {
		return enteredOn;
	}

	public void setEnteredOn(String enteredOn) {
		this.enteredOn = enteredOn;
	}

	public boolean isPasswordExpire() {
		return passwordExpire;
	}

	public void setPasswordExpire(boolean passwordExpire) {
		this.passwordExpire = passwordExpire;
	}


	// Getters and Setters of all the variables declared above sequentially
	public String getLoginId() {
		return loginId;
	}

	public void setLoginId(String loginId) {
		this.loginId = loginId;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserGender() {
		return userGender;
	}

	public void setUserGender(String userGender) {
		this.userGender = userGender;
	}

	public String getGenderDesc() {
		return genderDesc;
	}

	public void setGenderDesc(String genderDesc) {
		this.genderDesc = genderDesc;
	}

	public String getUserPwd() {
		return userPwd;
	}

	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}

	public String getUserDesignation() {
		return userDesignation;
	}

	public void setUserDesignation(String userDesignation) {
		this.userDesignation = userDesignation;
	}

	public String getUserEmailId() {
		return userEmailId;
	}

	public void setUserEmailId(String userEmailId) {
		this.userEmailId = userEmailId;
	}

	public String getUserMobileNo() {
		return userMobileNo;
	}

	public void setUserMobileNo(String userMobileNo) {
		this.userMobileNo = userMobileNo;
	}

	public String getUserCreatedOn() {
		return userCreatedOn;
	}

	public void setUserCreatedOn(String userCreatedOn) {
		this.userCreatedOn = userCreatedOn;
	}

	public String getActiveStatus() {
		return activeStatus;
	}

	public void setActiveStatus(String activeStatus) {
		this.activeStatus = activeStatus;
	}

	public String getFirstLoginFlag() {
		return firstLoginFlag;
	}

	public void setFirstLoginFlag(String firstLoginFlag) {
		this.firstLoginFlag = firstLoginFlag;
	}

	public Integer getRoleId() {
		return roleId;
	}

	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}

	public String getRoleDesc() {
		return roleDesc;
	}

	public void setRoleDesc(String roleDesc) {
		this.roleDesc = roleDesc;
	}

	public String getRoleStatus() {
		return roleStatus;
	}

	public void setRoleStatus(String roleStatus) {
		this.roleStatus = roleStatus;
	}


	public Integer getOfficeId() {
		return officeId;
	}

	public void setOfficeId(Integer officeId) {
		this.officeId = officeId;
	}

	public String getOfficeDesc() {
		return officeDesc;
	}

	public void setOfficeDesc(String officeDesc) {
		this.officeDesc = officeDesc;
	}

	public String getActivatedBy() {
		return activatedBy;
	}

	public void setActivatedBy(String activatedBy) {
		this.activatedBy = activatedBy;
	}

	public String getActivatedOn() {
		return activatedOn;
	}

	public void setActivatedOn(String activatedOn) {
		this.activatedOn = activatedOn;
	}

	public String getDeactivatedOn() {
		return deactivatedOn;
	}

	public void setDeactivatedOn(String deactivatedOn) {
		this.deactivatedOn = deactivatedOn;
	}

	public void setDeactivatedBy(String deactivatedBy) {
		this.deactivatedBy = deactivatedBy;
	}

	public String getDeactivatedReson() {
		return deactivatedReson;
	}

	public void setDeactivatedReson(String deactivatedReson) {
		this.deactivatedReson = deactivatedReson;
	}

	public String getRandSalt() {
		return randSalt;
	}

	public void setRandSalt(String randSalt) {
		this.randSalt = randSalt;
	}

	public MultipartFile getProfilePhoto() {
		return profilePhoto;
	}

	public void setProfilePhoto(MultipartFile profilePhoto) {
		this.profilePhoto = profilePhoto;
	}

	public byte[] getProfilePic() {
		return profilePic;
	}

	public void setProfilePic(byte[] profilePic) {
		this.profilePic = profilePic;
	}

	public String getDeactivatedBy() {
		return deactivatedBy;
	}

	public String getEnteredBy() {
		return enteredBy;
	}

	public void setEnteredBy(String enteredBy) {
		this.enteredBy = enteredBy;
	}

	public boolean getLoginHistoryfag() {
		return loginHistoryfag;
	}

	public void setLoginHistoryfag(boolean loginHistoryfag) {
		this.loginHistoryfag = loginHistoryfag;
	}

	public Integer getUserType() {
		return userType;
	}

	public void setUserType(Integer userType) {
		this.userType = userType;
	}

	@Override
	public String toString() {
		return "User [loginId=" + loginId + ", userId=" + userId + ", userName=" + userName + ", userGender="
				+ userGender + ", genderDesc=" + genderDesc + ", userPwd=" + userPwd + ", userDesignation="
				+ userDesignation + ", userEmailId=" + userEmailId + ", userMobileNo=" + userMobileNo
				+ ", userCreatedOn=" + userCreatedOn + ", activeStatus=" + activeStatus + ", firstLoginFlag="
				+ firstLoginFlag + ", roleId=" + roleId + ", roleDesc=" + roleDesc + ", roleStatus=" + roleStatus
				+ ", officeId=" + officeId + ", officeDesc="
				+ officeDesc + ", activatedBy=" + activatedBy + ", activatedOn=" + activatedOn + ", deactivatedOn="
				+ deactivatedOn + ", deactivatedBy=" + deactivatedBy + ", deactivatedReson=" + deactivatedReson
				+ ", deactivatedResonf=" + deactivatedResonf + ", randSalt=" + randSalt + ", passwordExpire="
				+ passwordExpire + ", profilePhoto=" + profilePhoto + ", profilePic=" + Arrays.toString(profilePic)
				+ ", enteredBy=" + enteredBy + ", enteredOn=" + enteredOn + ", activeStatusf=" + activeStatusf
				+ ", userType=" + userType + ", stcode=" + stcode + ", dstcode=" + dstcode + ", clientIp=" + clientIp + ", accesstype="
				+ accesstype + ", loginHistoryfag=" + loginHistoryfag + ", landLineNumber=" + landLineNumber
				+ ", assignRoleList=" + assignRoleList  + "]";
	}

	public String getAccesstype() {
		return accesstype;
	}

	public void setAccesstype(String accesstype) {
		this.accesstype = accesstype;
	}

}
