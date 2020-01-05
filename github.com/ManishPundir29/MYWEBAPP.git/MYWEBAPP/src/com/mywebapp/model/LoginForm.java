package com.mywebapp.model;

import java.io.Serializable;

import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotBlank;

import com.mywebapp.validations.LoginModuleValidationGroups.LoginValidationGroup;
import com.mywebapp.validations.LoginModuleValidationGroups.LoginValidationGroup1;
import com.mywebapp.validations.LoginModuleValidationGroups.LoginValidationGroup2;
	

public class LoginForm implements Serializable{
	private static final long serialVersionUID = 1L;

// Login form attributes. Needed for server side validations.
	
	
	@NotBlank(message="Please Enter Login Id",groups = { LoginValidationGroup.class })
	@Size(max = 40,message="Login Id can't be more than 40 characters",groups = { LoginValidationGroup.class })
	@Pattern(regexp = "^[a-zA-Z0-9\\-_@.,]*$", message = "Please Enter Letter And Digit Only", groups = { LoginValidationGroup.class })
	String loginId;
	
	String userId;
	
	@NotBlank(message="Please Enter Password",groups = { LoginValidationGroup1.class })	
	String userPwd;

	@NotBlank(message="Please Enter Email Id",groups = { LoginValidationGroup2.class})
	@Size(max = 100,message="Email Id can't be more than 100 characters", groups = { LoginValidationGroup2.class})
	@Pattern(regexp="^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$",message="Please Enter valid Email Id",groups = { LoginValidationGroup2.class})
	String emailId;
	
	String randSalt;

	public String getRandSalt() {
		return randSalt;
	}

	public void setRandSalt(String randSalt) {
		this.randSalt = randSalt;
	}

	
	
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

	public String getUserPwd() {
		return userPwd;
	}

	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}

	public String getEmailId() {
		return emailId;
	}

	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}
	
	
	
	
}
