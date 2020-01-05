package com.mywebapp.dao;

import java.util.List;

import com.mywebapp.model.ApplicationSettings;
import com.mywebapp.model.LoginForm;
import com.mywebapp.model.User;


public interface LoginDao {


	public User getUserDetails(String userId);
	
	public User getPasswordByLoginId(String loginId);
	
	
	public boolean isPasswordExpired(String userid, int passExpiryDays); //method to find if password has expired.
	
	public ApplicationSettings getSettingsObject(); // method to set Application Settings.
	
	
	public String checkUseridOrEmailId(LoginForm obj);
	
	public int setUserIdandPasswordReset(String userName, String userPwd);

	public int logoutSuccess(String userName, String ipAddress);
	 

	public void updatePassword(User user, String pass);
	
	
	public int successLogin(String userId, String ipAddress);
	
	public int failedLogin(String userId, String ipAddress);

	public boolean isValidPassword(String userId, String userPwd,int invalidPassCount);
	
	public byte[] getUserImage(String userId);

	public int checkValidPassword(String userPwd, String userId);	
	public User validUserIdandPassword(String userId);
	public int setUserIdandPassword(String userId, String userPwd, String activatedBy);
	public String getLastLoginTime(String roleId);

	public String checkLoginIdOrEmailId(LoginForm obj);

	public boolean verifyOtp(String otp,String otpid);

	public void takingUserDetails(String ipaddress, User user, String firorcnrnumber);

	public User getUserDetailsByEmailId(String emailid);

}
