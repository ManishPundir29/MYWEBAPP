package com.mywebapp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.mywebapp.dao.LoginDao;
import com.mywebapp.model.ApplicationSettings;
import com.mywebapp.model.User;

@Service
public class LoginServiceImpl implements LoginService {
	@Autowired
	LoginDao loginDao;


	@Override
	public boolean validlogout(String userName, String ipAddress) {
		if (loginDao.logoutSuccess(userName, ipAddress) == 1) {
			return true;
		} else
			return false;
	}

	@Override
	public ApplicationSettings getApplicationSettings() {
		return loginDao.getSettingsObject();
	}

	@Override
	public byte[] userImage(String userId) {
		byte[] imageOutput = loginDao.getUserImage(userId);
		return imageOutput;
	}

	@Override
	public boolean validPassword(String userPwd, String userId, String currentPassword, String randSalt) {
		if (loginDao.checkValidPassword(userPwd, userId) == 0
				&& !currentPassword.equals(userPwd )) {
			return true;
		} else {
			return false;
		}
	}

	public String getLastLoginTime(String userId) {
		return loginDao.getLastLoginTime(userId);
	}


	@Override
	public User ValidateUser(String loginId, String userPwd, String ipAddress, String salt,
			Integer passwordExpiryDays) {
		try {
			User usr = loginDao.getPasswordByLoginId(loginId);
				if (usr != null && userPwd.equals(usr.getUserPwd())) {
				
				if (usr.getFirstLoginFlag().equals("1")) {
					if (loginDao.successLogin(loginId, ipAddress/* , usr.getPillarId() */) > 0) {
						User user = loginDao.getUserDetails(usr.getUserId());
						return user;
					} else {
						loginDao.failedLogin(loginId, ipAddress);
						return null;
					}
				} else {
					if (loginDao.isPasswordExpired(usr.getUserId(), passwordExpiryDays)) {
						if (loginDao.successLogin(loginId, ipAddress) > 0) {
							User user = loginDao.getUserDetails(usr.getUserId());
							user.setPasswordExpire(true);
							return user;
						} else {
							loginDao.failedLogin(loginId, ipAddress);
							return null;
						}
					} else {
						usr.setPasswordExpire(false);
						return usr;
					}
				}
			} else {
				loginDao.failedLogin(loginId, ipAddress);
				return null;
			}
		} catch (Exception e) {
			loginDao.failedLogin(loginId, ipAddress);
			return null;
		}
	}



}
