$().ready(function() {
                $("#forgotpwd").validate({
                   /* errorClass: "login_error",
                    debug:true,
        			ignore: ".ignore,*:not([name])",*/
                    rules: {
                    	loginId:  {
            				required:true,
        			         maxlength: 40,
        			         lettersnNumberwithbasicpunc : true
        				},
        				emailId:  {
             				required:true,
         			         maxlength: 100,
         					email : true
         				},
         				captcha:  {
             				required:true,
         			         maxlength: 6,
         					
         				},
                    },
                    messages:{
                    	loginId:  {
                    		  required:"Enter Your Login Id",
                    		  maxlength: "Login Id Should be less than or equal to 20 characters",
                    		  lettersnNumberwithbasicpunc : "Please Enter Valid Login Id"
                    	  },
                    	  emailId:  {
                    		  required:"Enter Your Registered Email Id",
                    		  maxlength: "New Email Must Be At Least 8 Characters",
                    		  email : "Enter Valid Email Id"  
                    	  },
                          	captcha:  {
                          		required:"Enter Text In Image Above",
              			         maxlength: "Captcha  Should Be Less Than Or Equal To 6 Characters",
                               	  }
                    	  },
                    errorPlacement: function(error,element) {	//decides where error element will be placed	  
        				//$(element).parent().next().next().html(error);
        				$(element).parent().next('.login_error').remove();
                    	$(element).parent().after("<div class='login_error no_padding marb10 ' style='margin-top: -17px;' >"+error.text()+"</div>");
        			  },
        			  highlight: function (element) {  // called when error occurs, css styling for every error event          				  
        				  $(element).parent().addClass('has-error');
        				},
        				unhighlight: function (element) {// called when error is fixed 
        					$(element).parent().removeClass('has-error');
        					$(element).parent().next('.login_error').remove();
        					//$( element ).removeClass( errorClass ).addClass( validClass );
        				},
        				  submitHandler: function(form) {
        					  var formId=document.getElementById("forgotpwd");
    							formId.action="passRecoveryUserVarify";
    							formId.method="POST";
    							formId.submit();
  							/*$('#forgotpwd').attr('method', "POST");
			        		$('#forgotpwd').attr('action', "passRecoveryUserVarify");
			        		form.submit();
        			             */
        				  }
                });
            });
function refresh_captcha() {
//    $('#userId').val("");
//    $("#emailId").val("");
    $('#captcha').val("");
    $('#irs_captcha_id').attr('src', 'captchaimg?' + Math.random());
}

