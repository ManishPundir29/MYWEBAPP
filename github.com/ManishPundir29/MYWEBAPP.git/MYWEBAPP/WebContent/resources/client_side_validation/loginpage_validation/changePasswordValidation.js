$(document).ready(
			function() {
				
				$("#changepassform1")
				.validate(
						{
						rules : {
							userPwd : {
								required : true,
								minlength : 6,
								maxlength : 200,
								alpanumericspecialch : true
							},
							newPassword : {
								required : true,
								minlength : 6,
								maxlength : 200,
								alpanumericspecialch : true
							},
							confirmPassword : {
								required : true,
								minlength : 6,
								maxlength : 200,
								equalTo :  "#newPassword",
								alpanumericspecialch : true
							}
						},
							messages : {
								userPwd : {
									required : "Please enter Current Password",
									minlength : "Current Password should not be less than 6 character",
									maxlength : "Current Password should be less than 200 characters",
									alpanumericspecialch : "Current Password must be at least 8 characters and must include at least one upper case letter,at least one special Character, one lower case letter, and one numeric digit"
								},
								newPassword : {
									required : "Please enter New Password",
									minlength : "New Password should not be less than 6 character",
									maxlength : "New Password should be less than 200 characters",
								    alpanumericspecialch : "New Password must be at least 8 characters and must include at least one upper case letter,at least one special Character, one lower case letter, and one numeric digit"
								},
								confirmPassword : {
									required : "Please enter Confiem Password",
									minlength : "Confirm Password should not be less than 6 character",
									maxlength : "Confiem Password should be less than 200 character",
									equalTo : "Confiem Password should be same as New Password",
									alpanumericspecialch : "Confirm Password must be at least 8 characters and must include at least one upper case letter,at least one special Character, one lower case letter, and one numeric digit"
								},
							},
							errorPlacement : function(error,
									element) {
								error.addClass("help-block");
								$(element).next('.FeRror').html(
										error.text()).css(
										'display', 'block');

							},
							highlight : function(element,
									errorClass, validClass) {
								$(element).parent().addClass(
										"has-error").removeClass(
										"has-success");
							},
							unhighlight : function(element,
									errorClass, validClass) {
								if($(element).parent().hasClass('has-error')){
								$(element).parent().addClass(
										"has-success").removeClass(
										"has-error");
								$(element).next('.FeRror').css(
										'display', 'none');
								}
							},

							submitHandler : function(form) {
								alert("d");
								var token=GetNewToken();
								  $("#secureToken").val(token);
								  if($('#userPwd').val()=='')
							       {
							    	   alert("Current Password must not be blank");
							    	   $('#userPwd').focus();
							    	   return false;    	  
							    	}
								 else if($('#newPassword').val()=='')
							       {
							    	   alert("New Password must not be blank");
							    	   $('#newPassword').focus();
							    	   return false;    	  
							    	}
								 
								 var passregex=/^(?=.*\d)(?=.*[a-z])(?=.*[!@#$%^&*()_])(?=.*[A-Z]).{8,20}$/;
							      
							        if(!passregex.test($('#newPassword').val()))
							       {
							    	  
							    	   alert("New Password must be at least 8 characters and must include at least one upper case letter,at least one special Character, one lower case letter, and one numeric digit");
							    	   $('#newPassword').focus();
							    	   return false; 
							       }
							        else if($('#confirmPassword').val()=='')
								       {
								    	   alert("Confirm Password must not be blank");
								    	   $('#confirmPassword').focus();
								    	   return false;    	  
								    	}
									 
									 var passregex=/^(?=.*\d)(?=.*[a-z])(?=.*[!@#$%^&*()_])(?=.*[A-Z]).{8,20}$/;
								      
								        if(!passregex.test($('#confirmPassword').val()))
								       {
								    	  
								    	   alert(" New Password must be at least 8 characters and must include at least one upper case letter,at least one special Character, one lower case letter, and one numeric digit");
								    	   $('#confirmPassword').focus();
								    	   return false; 
								       }
								
								var curpass = $("#userPwd").val();
								var newpass = $("#newPassword").val();
								var confirmpass = $("#confirmPassword").val();
								alert(curpass);
								alert(newpass);
								alert(confirmpass);
								var SHA256cur = new Hashes.SHA256()
										.hex(new Hashes.SHA256().hex(curpass)
												+ $("#randSalt").val());
								var SHA256new = new Hashes.SHA256().hex(newpass);
								var SHA256confirm = new Hashes.SHA256()
										.hex(confirmpass);
								$("#userPwd").val(SHA256cur);
								//alert("1"+$("#currentPassword").val());
								$("#newPassword").val(SHA256new);
								//alert("2"+$("#newPassword").val());
								$("#confirmPassword").val(SHA256confirm);
								//alert("3"+$("#confirmPassword").val());
								
								$('#changepassform1').attr('method',
								"POST");
						$('#changepassform1').attr('action',
								"changePass");
						form.submit();
								
							
						}	
	          });

				/*$("#submit").click(
						function() {
							 if($('#currentPassword').val()=='')
						       {
						    	   alert("Current Password must not be blank");
						    	   $('#currentPassword').focus();
						    	   return false;    	  
						    	}
							 else if($('#newPassword').val()=='')
						       {
						    	   alert("New Password must not be blank");
						    	   $('#newPassword').focus();
						    	   return false;    	  
						    	}
							 
							 var passregex=/^(?=.*\d)(?=.*[a-z])(?=.*[!@#$%^&*()_])(?=.*[A-Z]).{8,20}$/;
						      
						        if(!passregex.test($('#newPassword').val()))
						       {
						    	  
						    	   alert("New Password must be at least 8 characters and must include at least one upper case letter,at least one special Character, one lower case letter, and one numeric digit");
						    	   $('#newPassword').focus();
						    	   return false; 
						       }
						        else if($('#confirmPassword').val()=='')
							       {
							    	   alert("Confirm Password must not be blank");
							    	   $('#confirmPassword').focus();
							    	   return false;    	  
							    	}
								 
								 var passregex=/^(?=.*\d)(?=.*[a-z])(?=.*[!@#$%^&*()_])(?=.*[A-Z]).{8,20}$/;
							      
							        if(!passregex.test($('#confirmPassword').val()))
							       {
							    	  
							    	   alert(" New Password must be at least 8 characters and must include at least one upper case letter,at least one special Character, one lower case letter, and one numeric digit");
							    	   $('#confirmPassword').focus();
							    	   return false; 
							       }
							
							var curpass = $("#currentPassword").val();
							var newpass = $("#newPassword").val();
							var confirmpass = $("#confirmPassword").val();
							var SHA256cur = new Hashes.SHA256()
									.hex(new Hashes.SHA256().hex(curpass)
											+ $("#randSalt").val());
							var SHA256new = new Hashes.SHA256().hex(newpass);
							var SHA256confirm = new Hashes.SHA256()
									.hex(confirmpass);
							$("#currentPassword").val(SHA256cur);
							//alert("1"+$("#currentPassword").val());
							$("#newPassword").val(SHA256new);
							//alert("2"+$("#newPassword").val());
							$("#confirmPassword").val(SHA256confirm);
							//alert("3"+$("#confirmPassword").val());

						});*/

			});