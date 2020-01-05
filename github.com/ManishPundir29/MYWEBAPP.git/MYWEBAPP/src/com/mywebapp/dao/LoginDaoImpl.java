package com.mywebapp.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.support.lob.DefaultLobHandler;
import org.springframework.jdbc.support.lob.LobHandler;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.mywebapp.model.ApplicationSettings;
import com.mywebapp.model.LoginForm;
import com.mywebapp.model.User;

@Repository
@SessionAttributes({ "capStr", "randSalt", "user", "ipAddress", "settings", "usermenu" }) // defining session attributes
public class LoginDaoImpl implements LoginDao {

	private final static Logger logger = Logger.getLogger(LoginDaoImpl.class);

	@Autowired
	private DataSource postgresDS;
	private JdbcTemplate jdbcTemplate; // implementing datasource and jdbctemplate
	private NamedParameterJdbcTemplate namedParameterJdbcTemplate;

	@Autowired
	public void setDataSource(DataSource postgresDS) {
		this.postgresDS = postgresDS;
		this.jdbcTemplate = new JdbcTemplate(postgresDS);
		this.namedParameterJdbcTemplate = new NamedParameterJdbcTemplate(postgresDS);
	}


	public static final class UserPicMapper implements RowMapper<User> {
		@Override
		public User mapRow(ResultSet rs, int rownum) throws SQLException {
			User userobj = new User();
			if (rs.getBytes("profile_photo") != null) {

				LobHandler lobHandler = new DefaultLobHandler();
				byte[] myFile = lobHandler.getBlobAsBytes(rs, "profile_photo");

				userobj.setProfilePic(myFile);

			}
			return userobj;
		}
	}

	@Override
	public ApplicationSettings getSettingsObject() { // method to fetch application settings
		String sql = "Select * from application_settings";
		try {
			return jdbcTemplate.queryForObject(sql, new ApplicationSettingsMapper());
		} catch (EmptyResultDataAccessException e) {
			return null;
		}
	}

	@Override
	public User getPasswordByLoginId(String loginId) {

		String sql = "select * from USERS where loginid=?";
		try { // System.out.println("1--DAO--validUserIdandPassword");
			User usr = jdbcTemplate.queryForObject(sql, new Object[] { loginId }, new UserLoginMapper());
			return usr;
		} catch (Exception e) {
			logger.info(e);
			return null;
		}
	}


	@Override
	public User getUserDetails(String userId) {
	
		String sql ="select mu.loginid,mu.user_id,user_name,mu.active_status,user_mobile_no,user_email_id,first_login_flag from USERS mu\n" + 
				"where mu.user_id= ? and mu.active_status=?  "; 
		
		try {
			// System.out.println("Sql query" + sql);
			User user = jdbcTemplate.queryForObject(sql, new Object[] { userId, "Y" }, new UserMapper());
			return user;
		} catch (EmptyResultDataAccessException e) {
				e.printStackTrace();
			return null;
		} catch (DataAccessException e) {
			e.printStackTrace();
			logger.info(e);
			return null;
		}
	}

	
	@Override
	public String checkUseridOrEmailId(LoginForm obj) {
		String result = "";
		try {
			String sql = "select user_email_id from users where loginid=? ";
			result = jdbcTemplate.queryForObject(sql, new Object[] { obj.getUserId() }, String.class);
		} catch (EmptyResultDataAccessException e) {
			return null;
		}
		return result;
	}

	@Override
	public int setUserIdandPasswordReset(String userName, String userPwd) {
		String updateSql = "update USERS set user_pwd=?,first_login_flag=?, password_updated_on=now(),entered_by=? where loginid=? ";
		//entered_on replaced with password_updated_on if forget password utility is used by term end user.
		int total_rows_updated =0;
		try {	
			total_rows_updated =  jdbcTemplate.update(updateSql, new Object[] { userPwd, "1", userName, userName });
		}catch (Exception e) {
			e.printStackTrace();
		}
		return total_rows_updated;
	}

	

	@Override
	public void updatePassword(User user, String pass) {
		String sql = "Insert Into user_audit (user_id,old_password,new_password,entered_by, entered_on) values(?,"
				+ "(select user_pwd from users where user_id=?)" + ",?,?,now())";
		jdbcTemplate.update(sql, new Object[] { user.getUserId(), user.getUserId(), pass, user.getUserId() });
		sql = "Update users set user_pwd=?,password_updated_on='now()' where user_id=?";
		jdbcTemplate.update(sql, new Object[] { pass, user.getUserId() });

	}

	@Override
	public int successLogin(String userId, String ipAddress) {
		// System.out.println("1 --DAO login_history insert abt to start-- ");
		String sql = "INSERT INTO login_history(login_by, login_date, client_ip) VALUES (?,now(),?)";
		return jdbcTemplate.update(sql, new Object[] { userId, ipAddress });
	}

	@Override
	public int failedLogin(String userId, String ipAddress) {
		// System.out.println("1 --DAO login_failed_history insert abt to start-- ");
		String sql = "INSERT INTO login_failed_history(login_by,login_date,client_ip) VALUES (?, now(), ?)";
		return jdbcTemplate.update(sql, new Object[] { userId, ipAddress });
	}

	

	public boolean isValidPassword(String userId, String userPwd, int invalidPassCount) {
		String sql = "select count(*) from users where loginid=? and user_pwd=?";

		int current = jdbcTemplate.queryForObject(sql, new Object[] { userId, userPwd }, Integer.class);
		sql = "Select count(*) from (select old_password from (Select * From user_audit where user_id=? order by entered_on DESC) As old_password limit ?) foo where old_password=?";

		int old = jdbcTemplate.queryForObject(sql, new Object[] { userId, invalidPassCount, userPwd }, Integer.class);
		if (current + old == 0) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public int logoutSuccess(String userName, String ipAddress) {
	try{
		String sql = "UPDATE login_history A SET logout_date=NOW() WHERE login_by=? AND client_ip=? AND login_date=(SELECT MAX(login_date) FROM login_history WHERE login_by=A.login_by)";
		return jdbcTemplate.update(sql, new Object[] { userName, ipAddress });
	}catch(Exception e){
		e.printStackTrace();
		return 0;
	}
		
	}

	// <<<<<<<<<<<<<<<<<<<<<<<<<<<<All Mappers


	public static final class UserLoginMapper implements RowMapper<User> {
		@Override
		public User mapRow(ResultSet rs, int rownum) throws SQLException {
			User userobj = new User();
			userobj.setLoginId(rs.getString("loginId"));
			userobj.setUserId(rs.getString("user_id"));
			userobj.setUserPwd(rs.getString("user_pwd"));
			userobj.setFirstLoginFlag(rs.getString("first_login_flag"));
			
			return userobj;
		}
	}


	public static final class UserMapper implements RowMapper<User> {
		@Override
		public User mapRow(ResultSet rs, int rownum) throws SQLException {
			User userobj = new User();
			userobj.setOfficeDesc(rs.getString("office_address"));
			userobj.setLoginId(rs.getString("loginid"));
			userobj.setUserId(rs.getString("user_id"));
			userobj.setUserName(rs.getString("user_name"));
			userobj.setActiveStatus(rs.getString("active_status"));
			userobj.setUserDesignation(rs.getString("user_designation"));
			userobj.setUserMobileNo(rs.getString("user_mobile_no"));
			userobj.setUserEmailId(rs.getString("user_email_id"));
			userobj.setFirstLoginFlag(rs.getString("first_login_flag"));
			return userobj;
		}
	}

	public static final class UserMapperForLogin implements RowMapper<User> {
		@Override
		public User mapRow(ResultSet rs, int rownum) throws SQLException {
			User userobj = new User();
			userobj.setUserPwd(rs.getString("user_pwd"));
			// userobj.setLoginId(rs.getString("login_id"));
			return userobj;
		}
	}

	public static final class ApplicationSettingsMapper implements // Mapper class to map object rows.
			RowMapper<ApplicationSettings> {
		@Override
		public ApplicationSettings mapRow(ResultSet rs, int rownum) throws SQLException {
			ApplicationSettings settingsobj = new ApplicationSettings();
			settingsobj.setPasswordExpiryDays(rs.getInt("password_expiry_days"));
			settingsobj.setSessionTimeOut(rs.getInt("session_timeout"));
			settingsobj.setInvalidPasswordCount(rs.getInt("invalid_password_count"));
			return settingsobj;
		}

	}

	@Override
	public int checkValidPassword(String userPwd, String userId) {
		String sql = "SELECT COUNT(*) FROM (select old_password from (Select * From user_audit where user_id=? order by entered_on DESC) As old_password limit 2) as Foo WHERE old_password=?";
		// System.out.println(sql);
		return jdbcTemplate.queryForObject(sql, new Object[] { userId, userPwd }, Integer.class);
	}

	@Override
	public User validUserIdandPassword(String userId) {
		String sql = "select user_pwd from users where loginid = ?";
		try {
			User user = jdbcTemplate.queryForObject(sql, new Object[] { userId }, new UserMapperForLogin());
			return user;
		} catch (EmptyResultDataAccessException e) {
			logger.info(e);
			
			return null;
		} catch (DataAccessException e) {
			
			logger.info(e);
			return null;
		}
	}





	@Override
	public String getLastLoginTime(String loginId) {
		String sqlQuery = "select login_date from login_history  where login_by = ? order by login_date desc limit 2";
		List<User> user = null;
		try {
			user = jdbcTemplate.query(sqlQuery, new Object[] { loginId }, new LastLoginTime());
		} catch (EmptyResultDataAccessException e) {
			logger.info(e);
			return null;
		} catch (DataAccessException e) {
			System.out.println("exception" + e);
			logger.info(e);
			return null;
		}
		return user.get(1).getLastloginDate().substring(0, 19);
	}

	public static final class LastLoginTime implements RowMapper<User> {
		@Override
		public User mapRow(ResultSet rs, int rownum) throws SQLException {
			User userobj = new User();
			userobj.setLastloginDate(rs.getString("login_date"));
			// userobj.setLoginId(rs.getString("login_id"));
			return userobj;
		}
	}

	@Override
	public int setUserIdandPassword(String loginId, String userPwd, String activatedBy) {

		String userAuditSql = "INSERT INTO user_audit(user_id, old_password, new_password,entered_by, entered_on) VALUES (?, ("
				+ "Select user_pwd from users where loginid=? " + "), ?, ?, now())";
		String updateSql = "update users set user_pwd=?, first_login_flag=?,password_updated_on=now() where loginid=? ";
		int auditStatus = jdbcTemplate.update(userAuditSql, new Object[] { loginId, loginId, userPwd, activatedBy });
		if (auditStatus != -1) {
			return jdbcTemplate.update(updateSql, new Object[] { userPwd, "0", loginId });
		} else {
			return -1;
		}
	}

	@Override
	public byte[] getUserImage(String userId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String checkLoginIdOrEmailId(LoginForm obj) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean verifyOtp(String otp, String otpid) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public void takingUserDetails(String ipaddress, User user, String firorcnrnumber) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public User getUserDetailsByEmailId(String emailid) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean isPasswordExpired(String userid, int passExpiryDays) {
		// TODO Auto-generated method stub
		return false;
	}

}