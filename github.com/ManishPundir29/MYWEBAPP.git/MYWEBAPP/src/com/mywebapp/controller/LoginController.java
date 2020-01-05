package com.mywebapp.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mywebapp.dao.LoginDao;
import com.mywebapp.model.ApplicationSettings;
import com.mywebapp.model.ApplicationUser;
import com.mywebapp.model.LoginForm;
import com.mywebapp.model.StatusList;
import com.mywebapp.model.User;
import com.mywebapp.service.LoginService;
import com.mywebapp.utils.RandomSaltGenerator;
import com.mywebapp.validations.LoginModuleValidationGroups.LoginValidationGroup;
import com.mywebapp.validations.LoginModuleValidationGroups.LoginValidationGroup1;
import com.mywebapp.validations.LoginModuleValidationGroups.LoginValidationGroup2;

@Controller // telling control that this class is a controller class.
@SessionAttributes({ "resourceCsrf", "capStr", "randSalt", "settings", "user", "ipAddress", "userMenu", "themeClass",
		"loginValid", "usersession", "userLevel"}) // defining session attributes
public class LoginController {

	
	
	@Autowired
	LoginService loginService;


	@Autowired
	LoginDao loginDao;


	String userIdForImage = "";
	

	/*
	 * Landing Page | Login Page | Redirected Page URL
	 */
	
	@RequestMapping(value = { "", "/","login" }, method = RequestMethod.GET)
	public String showHomePage(	Model model, HttpSession session, HttpServletRequest request,
			HttpServletResponse response) throws NoSuchAlgorithmException {
		// logger.info("<<<<<<<<<<<<<<<<<<<Login Page call start >>>>>>>>>>>>>>>>>");
				ApplicationSettings settings = loginService.getApplicationSettings(); // fetching application settings like
																						// session timeout.
				model.addAttribute("settings", settings); // setting settings object;
				String randSalt = RandomSaltGenerator.generateSalt();
				model.addAttribute("randSalt", randSalt); // random integer to generate random password client side
				LoginForm loginForm = new LoginForm();
				model.addAttribute("loginForm", loginForm); // login form object to bind login form
				String resourceCsrf = RandomSaltGenerator.generatesecureRandomSalt();
				model.addAttribute("resourceCsrf", resourceCsrf);
				// logger.info("<<<<<<<<<<<<<<<<<<<Login Page call method End
				// >>>>>>>>>>>>>>>>>");
		return "showWelcomePage";

	         }
	

	@ModelAttribute("statusList")
	public List<StatusList> getDefaultStatus() {
		List<StatusList> status = new ArrayList<StatusList>();
		status.add(new StatusList("Y", "Active"));
		status.add(new StatusList("N", "Inactive"));
		return status;
	}

	

	@RequestMapping(value = "/passRecovery", method = RequestMethod.GET)
	public String passwordrecoverydisplay(Model model) {
		LoginForm passrecoveryobj = new LoginForm();
		model.addAttribute("passrecoveryobj", passrecoveryobj);
		return "passwordrecovery";
	}


	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String getUserHome(HttpSession session, Model model, HttpServletRequest request, RedirectAttributes redirectAttributes, User user)
			throws NoSuchAlgorithmException {
		if (session == null) {

			return "redirect:/loginPage";
		} else {

			if (session.getAttribute("user") != null && session.getAttribute("loginValid") != null) {

				if ((session.getAttribute("user")) instanceof User && (boolean) session.getAttribute("loginValid")) {

					return "showHomePage";
				}
			} else {

			}
		}
		return "redirect:/sessionTimeOut";
	}


	
	@RequestMapping(value = "/otpvarification11", method = RequestMethod.POST) // very first function directed to home page
	public String showUserHome(
			@Validated({ LoginValidationGroup.class,
					LoginValidationGroup1.class }) @ModelAttribute("loginForm") LoginForm loginForm,
			BindingResult result, @ModelAttribute("settings") ApplicationSettings settings, HttpSession session,
			Model model, HttpServletRequest request, @ModelAttribute("randSalt") String salt,
			RedirectAttributes redirectAttributes)
			throws MethodArgumentNotValidException, NoSuchAlgorithmException, Exception {
		// logger.info("----------- Login Method is start --------------- ");
     
		// @Validated({LoginValidationGroup.class})
		String csrf_security2 = session.getAttribute("csrf_security_token").toString();
		
		if (!result.hasErrors()) {
			 
				 if (true) { 
				/*****************
				 * Checking request.getRequestHeader Whether "X-FORWARDED" Or Not
				 ***********/
				String ipaddress = getRemoteAddress(request);
				
				User user = loginService.ValidateUser(loginForm.getLoginId(), loginForm.getUserPwd(), ipaddress, salt,
						settings.getPasswordExpiryDays());
				if (user == null) {
					session.invalidate();
					model.asMap().clear();
					redirectAttributes.addFlashAttribute("error", "Invalid User Credential");
					return "redirect:/login"; // redirecting to password reset shashank
				} else {

					model.asMap().clear();
					session.invalidate();
					HttpSession session1 = request.getSession();
					session1.setAttribute("user", user);
					session1.setAttribute("ipAddress", ipaddress);
					session1.setAttribute("settings", settings);
					model.addAttribute("settings", settings);
					if (user.getFirstLoginFlag().equals("0") && user.isPasswordExpire() == false) {
						String loginId = user.getLoginId();
						model.addAttribute("loginId", loginId);

						session1.setAttribute("prisession", csrf_security2);
						session1.setAttribute("serachUrl", (String) request.getRequestURI());
						return "redirect:/passExpired?secureToken=" + csrf_security2 + "";
					}
					if (user.getFirstLoginFlag().equals("1")) {
						String randSalt = RandomSaltGenerator.generateSalt();
						model.addAttribute("randSalt", randSalt);
						session1.setAttribute("randSalt", randSalt);
						LoginForm changepassobj = new LoginForm();
						model.addAttribute("changepassobj", changepassobj);
						return "Firstlogin";
					} else {
						session1.setAttribute("loginValid", true);
						ApplicationUser appUser = new ApplicationUser();
						appUser.setFullname(user.getUserName());
						appUser.setUsername(user.getUserId());
						session1.setAttribute("usersession", appUser);
						String lastLoginTime = loginService.getLastLoginTime(user.getLoginId());
						session1.setAttribute("lastlogintime", lastLoginTime);
					
						session1.setAttribute("userid", user.getLoginId());
			
						
					}
					userIdForImage = user.getUserId();
					String resourceCsrf = RandomSaltGenerator.generatesecureRandomSalt();
					model.addAttribute("resourceCsrf", resourceCsrf);
					return "otpverficationPage";
				}
			} else {
				String randSalt = RandomSaltGenerator.generateSalt();
				loginForm = new LoginForm();
				model.addAttribute("error", "Wrong Captcha entered , re-enter captcha");
				model.addAttribute("loginForm", loginForm);
				model.addAttribute("randSalt", randSalt);
				session.setAttribute("error", "Wrong Captcha entered , re-enter captcha");
				session.setAttribute("loginForm", loginForm);
				session.setAttribute("randSalt", randSalt);
				return "showWelcomePage";

			}

		} else {
			List<FieldError> errors = result.getFieldErrors();
			if (null != errors)
				for (FieldError error : errors) {
				}
		}
		return "showWelcomePage";
	}

	//otpvarification11 replace with home
	@RequestMapping(value = "/home", method = { RequestMethod.POST })
	public String otpVarification(@ModelAttribute("otp") User user, BindingResult bindingResult,
			HttpServletResponse response, Model model, HttpServletRequest request, HttpSession session, RedirectAttributes redirectAttributes)
			throws IOException, NoSuchAlgorithmException {
		List<FieldError> errors = null;
		if (bindingResult.hasErrors()) {
			errors = bindingResult.getFieldErrors();
			System.out.println("has eerorr  eerorr e erorr");
			return "redirect:/otpvarification";
		} else {
			HttpSession session1 = request.getSession();
             User  user2 = (User) session1.getAttribute("user");
             model.addAttribute("loginuser", user2);
			if(user2.getLoginId().equals("DemoUser11")) {
				return "showHomePage";
			}
		/*if (loginService.verifyOtp(user.getOtp(), session.getAttribute("userid").toString())) {*/
				 if(true) { 
				return "showHomePage";
			} else {
				String randSalt = RandomSaltGenerator.generateSalt();
				model.addAttribute("resourceCsrf", randSalt);
				model.addAttribute("otpvar", user);
				model.addAttribute("error", "Wrong OTP entered , re-enter Valid OTP");
				return "otpvarification";
			}
		}
	}


	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(Model model, @ModelAttribute("user") User user, @ModelAttribute("ipAddress") String ipAddress,@ModelAttribute("error") String error,
			HttpSession session, HttpServletRequest request, HttpServletResponse response,RedirectAttributes redirectAttributes) {
		
		System.out.println("call Comes Here");
		
		if (loginService.validlogout(user.getUserId(), ipAddress)) {
			
			/**********Clear Cookies Start ********/
			
			Cookie[] cookies = request.getCookies();
			for (Cookie cookie : cookies) {

			cookie.setMaxAge(0);
			cookie.setValue(null);
			response.addCookie(cookie);
			}
			
			/***********Clear Cookes End **********/
			
			model.asMap().clear();
			session.invalidate();
		}else {
			model.asMap().clear();
			session.invalidate();
			redirectAttributes.addFlashAttribute("error", error);

		}
		
		return "redirect:/login";
	}

	@RequestMapping(value = "/urlfailure", method = RequestMethod.GET)
	public String ValidUrl(Model model, @ModelAttribute("user") User user,
			@ModelAttribute("ipAddress") String ipAddress, HttpSession session) {
		if (loginService.validlogout(user.getUserId(), ipAddress)) {

			model.asMap().clear();
			session.invalidate();
		}

		return "invalidurl";
	}

	@RequestMapping(value = "/sessionTimeOut", method = RequestMethod.GET)
	public String sessioTimeOut(HttpSession session) {

		if (session != null) {
			session.invalidate();
		}

		return "sessionTimeOut";
	}

	@RequestMapping(value = "/logoutException", method = RequestMethod.GET)
	public String logoutException(Model model, HttpSession session) {
		model.asMap().clear();
		session.invalidate();
		return "redirect:/login";
	}

	@RequestMapping(value = "/imageAction")
	public ResponseEntity<byte[]> userPic(Model model, HttpSession sesssion, HttpServletRequest request)
			throws IOException {
		byte[] imageOutput = null;
		HttpHeaders headers = null;
		try {
			imageOutput = loginService.userImage(userIdForImage);
			if (imageOutput != null) {
				headers = new HttpHeaders();
				headers.setContentType(MediaType.IMAGE_JPEG);
			} else {
				String realPath = request.getSession().getServletContext().getRealPath("/resources/dist/img/user.jpg");
				InputStream is = new FileInputStream(realPath);
				imageOutput = IOUtils.toByteArray(is);
			}
		} catch (Exception e) {
			String realPath = request.getSession().getServletContext().getRealPath("/resources/dist/img/user.jpg");
			InputStream is = new FileInputStream(realPath);
			imageOutput = IOUtils.toByteArray(is);
		}
		return new ResponseEntity<byte[]>(imageOutput, headers, HttpStatus.CREATED);
	}
	
	
	//Home Page Invocation for Parichay Start
	
	//otpvarification11 replace with home
	@RequestMapping(value = "/Home", method = { RequestMethod.GET })
	public String homePageLandingFromParichay(HttpServletResponse response, Model model, HttpServletRequest request, HttpSession session, RedirectAttributes redirectAttributes) 
			throws IOException, NoSuchAlgorithmException {
		  String referrer = request.getHeader("referer");
		  System.out.println("referrer" + referrer);
			HttpSession session1 = request.getSession();
             User  user2 = (User) session1.getAttribute("user");
             System.out.println(user2);
			 if(user2.getLoginId().equals("DemoUser11")) {
			   return "showHomePage";
			}
			return "showHomePage";			 	
	}
	
	//Home Page Invocation For Parichay End

	/*********** Checking request.getHeader is X-Forwarded-For Or Not Common Method************/
	public static String getRemoteAddress(HttpServletRequest request) {
		if (request.getHeader("X-Forwarded-For") != null) {

			return request.getHeader("X-Forwarded-For");
		} else {
			return request.getRemoteAddr();
		}
	}

}
