package com.mywebapp.service;

import com.mywebapp.model.ApplicationSettings;
import com.mywebapp.model.User;

public interface LoginService {

	public ApplicationSettings getApplicationSettings();

	public boolean validlogout(String userName, String ipAddress);

	public boolean validPassword(String userPwd, String userId, String currentPassword, String randSalt);

	public byte[] userImage(String userId);

	public String getLastLoginTime(String userId);

	public User ValidateUser(String loginId, String userPwd, String ipaddress, String salt, Integer passwordExpiryDays);

	
	
}
