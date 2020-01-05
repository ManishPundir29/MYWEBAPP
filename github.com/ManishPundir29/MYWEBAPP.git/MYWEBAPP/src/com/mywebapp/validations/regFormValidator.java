package com.mywebapp.validations;



import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;




public class regFormValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public void validate(Object target, Errors errors) {
		// TODO Auto-generated method stub
		
	}
	/*
	
	@Override
	public boolean supports(Class<?> paramClass) {
	return RegUserOld.class.equals(paramClass);
	}
	
	@Override
	public void validate(Object obj, Errors errors) {
	ValidationUtils.rejectIfEmptyOrWhitespace(errors, "username", "username.required");
	ValidationUtils.rejectIfEmptyOrWhitespace(errors, "userDesignation", "userDesignation.required");
	ValidationUtils.rejectIfEmptyOrWhitespace(errors, "emailid", "emailid.required");
	
	RegUserOld reguser =  (RegUserOld)obj;
	
	
	ValidationUtils.rejectIfEmptyOrWhitespace(errors, "username", "username.required");
	ValidationUtils.rejectIfEmptyOrWhitespace(errors, "userDesignation", "userDesignation.required");
	ValidationUtils.rejectIfEmptyOrWhitespace(errors, "emailid", "emailid.required");
	
	}
	
	*/}

	
	
	
	
	
	
	
	


