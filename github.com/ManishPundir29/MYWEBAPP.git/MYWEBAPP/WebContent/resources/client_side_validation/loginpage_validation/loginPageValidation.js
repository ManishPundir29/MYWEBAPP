$(document).ready(
				function() {
					$("#loginform")
							.validate(
									{
										errorClass : "login_error",
										debug : true,
										ignore : ".ignore,*:not([name])",
										rules : {
											loginId : {
												required : true,
												maxlength : 20,
												lettersnNumberwithbasicpunc : true
											},
											userPwd : {
												required : true,
												maxlength : 20,
												
											}
											
										},
										messages : {
											loginId : {
												required : "Enter Your Login ID",
												maxlength : "Login ID Should be less than or equal to 20 characters",
												lettersnNumberwithbasicpunc : "Please enter valid Login id"
											},
											userPwd : {
												required : "Enter Your Password",
												maxlength : "Password Should be less than or equal to 20 characters",
												
											}
										},

										errorPlacement : function(error,
												element) { // decides where
															// error element
															// will be placed

											// $(element).parent().next().next().html(error);

											$(element).parent().next(
													'.login_error').remove();
											$(element).parent().after(
													"<div class='login_error' style='margin-left:62px' >"
															+ error.text()
															+ "</div>");
										},
										highlight : function(element) { // called
																		// when
																		// error
																		// occurs,
																		// css
																		// styling
																		// for
																		// every
																		// error
																		// event
											$(element).parent().addClass(
													'has-error');
										},
										unhighlight : function(element) {// called
																			// when
																			// error
																			// is
																			// fixed
											$(element).parent().removeClass(
													'has-error');
											$(element).parent().next(
													'.login_error').remove();
											// $( element ).removeClass(
											// errorClass ).addClass( validClass
											// );
										},
										submitHandler : function(form) {
											var pass = $("#userPwd").val();
											var random = randomsalt;
											var actualpass = new Hashes.SHA256()
													.hex(pass);
											var SHA256 = new Hashes.SHA256()
													.hex(new Hashes.SHA256()
															.hex(pass)
															+ random);
											$("#userPwd").val(SHA256);

											$('#loginform').attr('method',
													"POST");
											$('#loginform').attr('action',
													"otpvarification11");

											form.submit();
										}
									});
				
				$("#loginform #reset_form").on('click',function(){
					$("#loginform").find('.has-error').each(function(){$(this).removeClass('has-error')});
					$(".login_error").hide();
					
				});
				
				});

function refresh_captcha() {
//	$('#loginId').val("");
//	$("#userPwd").val("");
	$('#captcha').val("");
	$('#irs_captcha_id').attr('src', 'captchaimg?' + Math.random());
}

    /*access for otp verfication*/


$(document)
.ready(
		function() {
			$("#otpvarify")
			.validate({
						 
						debug : true,
						ignore : ".ignore,*:not([name])",
						rules : {
							  otp: {
				            	  required: true,
				            	  maxlength : 6,
				            	  minlength : 6,
				              } ,
							captcha: {
				            	  required: true,
				            	  maxlength : 6,
				            	  minlength : 6,
				              }   
							
						},
						messages : {
							  otp: {
								 required : "Otp must Not be blank",
								 maxlength : "Seems incomplete OTP",
								 minlength : "Seems incomplete OTP",
				              } ,
							captcha: {
								 required : "Captcha  must not be blank",
								 maxlength : "Captcha  Should be  equal to 6 characters",
								 minlength : "Captcha  Should be  equal to 6 characters",  
							}    
						},

						 
						
						errorPlacement : function(error,
								element) {
							error.addClass("help-block");
							$(element)
									.next('.FeRror')
									.html(error.text())
									.css('display', 'block');

						},
						highlight : function(element,
								errorClass, validClass) {
							$(element).parent().addClass(
									"has-error")
									.removeClass(
											"has-success");
						},
						unhighlight : function(element,
								errorClass, validClass) {
							if ($(element).parent()
									.hasClass('has-error')) {
								$(element)
										.parent()
										.addClass(
												"has-success")
										.removeClass(
												"has-error");
								$(element).next('.FeRror')
										.css('display',
												'none');
							}
						},
						submitHandler : function(form) {
							form.submit();
							
							 var token = GetNewToken();
				             $("#secureToken").val(token);
						}
					});
	 
        	  
			
});


function resendOtp(){
	   var counter=0;
	   var tokens = GetNewToken();
		$("#secureToken").val(tokens);
		    $.ajax({
		        type: 'POST', 
		        url: 'getotp',  
		        encode: true,
		        async: false,
		        beforeSend: function(xhr) {
		        	xhr
					.setRequestHeader('X-CSRF-Token',$('#secureToken').val());
		        },
		        success: function(data, textStatus, jqXHR) {
		        	 $('#msg').html(data);
		        	counter=counter+1;
		     	    if(counter == 1){
		     	    $('#lnkresend').hide();
		     	    }
		        	
		        },
		        error: function(jqXHR, textStatus, errorThrown) {
		            alert(textStatus);
		        }

		    });
		   
		
		    var token = GetNewToken();
	        $("#secureToken").val(token);
	 } 



function GetNewToken() {
    var token;

    $.ajax({
        type: 'GET',  
        url: 'GenerateNewToken', 
        encode: true,
        async: false,
        beforeSend: function(xhr) {
        },
        success: function(data, textStatus, jqXHR) {
            token = data;
        },
        error: function(jqXHR, textStatus, errorThrown) {
            alert(textStatus);
        }

    });

    return token;

}
 
 
 

