
$().ready(function() {
	   
                $("#changepassform").validate({
                    errorClass: "login_error",
                    debug:true,
        			ignore: ".ignore,*:not([name])",
                    rules: {
                    	newPassword : {
							required : true,
							minlength : 8,
							maxlength : 200,
							alpanumericspecialchpass : true
						},
						confirmPassword : {
							required : true,
							minlength : 8,
							maxlength : 200,
							equalTo : "#newPassword",
							alpanumericspecialchpass : true
						}
					},
					messages : {
						newPassword : {
							required : "Please enter New Password",
							minlength : "New Password should not be less than 8 character",
							maxlength : "New Password should be less than 200 characters",
							alpanumericspecialchpass : "New Password must include at least one upper case letter, one special Character, one lower case letter and one numeric digit"
						},
						confirmPassword : {
							required : "Please enter Confirm Password",
							minlength : "Confirm Password should not be less than 8 character",
							maxlength : "Confirm Password should be less than 200 character",
							equalTo : "Confirm Password should be same as New Password",
							alpanumericspecialchpass : "Confirm Password must include at least one upper case letter, one special Character, one lower case letter and one numeric digit"
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
        				  submitHandler: function(form) {
        		            	
        					var newpass = $("#newPassword").val();
  							var confirmpass = $("#confirmPassword").val();
  							
  							var SHA256new = new Hashes.SHA256().hex(newpass);
  							var SHA256confirm = new Hashes.SHA256()
  									.hex(confirmpass);
  							
  							$("#newPassword").val(SHA256new);
  							//alert("2"+$("#newPassword").val());
  							$("#confirmPassword").val(SHA256confirm);
  							//alert("3"+$("#confirmPassword").val());
        					  
  							$('#changepassform').attr('method', "POST");
			        		$('#changepassform').attr('action', "changePassFirstLogin");
			        	
			        
			        		form.submit();
        			              }

                });
            });

