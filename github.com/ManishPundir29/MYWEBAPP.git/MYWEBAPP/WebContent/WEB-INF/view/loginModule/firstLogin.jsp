<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
        <%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
            <spring:htmlEscape defaultHtmlEscape="true" />

            <script	src="<c:url value='/resources/jquery-validation-1.15.1/dist/jquery.validate.js'/>" type="text/javascript"></script>
            <script	src="<c:url value='/resources/jquery-validation-1.15.1/dist/additional-methods.js'/>" type="text/javascript"></script>
       <%--      <script src="<c:url value='/resources/client_side_validation/loginpage_validation/firstLoginPageValidation.js'/>" type="text/javascript"></script>
        --%>      <script src="<c:url value='/resources/pwdhash/hashes.min.js'/>" type="text/javascript"></script>
           
           
            <script>
     $(document).ready(function(){
	  $("#signOut").click(function(){
		$("#logOut").submit();
	});
});
</script> 
            <script>
            $().ready(function() {
                            $("#changepassform").validate({
                                errorClass: "login_error",
                                debug:true,
                    			ignore: ".ignore,*:not([name])",
                                rules: {
                                	newPassword : {
            							required : true,
            							minlength : 8,
            							maxlength : 40,
            							alpanumericspecialchpass : true
            						},
            						confirmPassword : {
            							required : true,
            							minlength : 8,
            							maxlength : 40,
            							equalTo : "#newPassword",
            							alpanumericspecialchpass : true
            						}
            					},
            					messages : {
            						newPassword : {
            							required : "Please enter New Password",
            							minlength : "New Password should not be less than 8 characters",
            							maxlength : "New Password should be less than 40 characters",
            							alpanumericspecialchpass : "New Password must include at least one upper case letter, one special Character, one lower case letter and one numeric digit"
            						},
            						confirmPassword : {
            							required : "Please enter Confirm Password",
            							minlength : "Confirm Password should not be less than 8 characters",
            							maxlength : "Confirm Password should be less than 40 character",
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
            </script>
            <!--    <script type="text/javascript">
            var randomsalt ='${randSalt}';
            </script> -->
            <style>
            html,body,{
            background: url('resources/images/seamless_paper_texture.png');
            }
            </style>
            <style>
                .login_error {
                    color: #A94442;
                    font-weight: 1.2em;
                }
                .login-box-msg{float: left; width:80%;}
                .logOut{float: right; width:18%;}
                .logOut a{text-decoration:none; font-weight:bold;}
                .logOut a:hover{color:#f00;}
                .form-horizontal .form-group{float: left; width:100%; margin:8px auto; position: relative;}
                #loginbox .panel .panel-heading{height: 62px; background: #044073; color: #fff;}
                #loginbox .panel-info{ border: 1px solid #044073;}
            </style>
            <div class="content-wrapper" style="background: url('resources/images/seamless_paper_texture.png');margin-left:0px;">
                <section class="content">
                    <div class="container">
			<div id="loginbox" style="margin-top: 60px;"
				class="col-md-4 col-md-offset-4 col-sm-8 col-sm-offset-2 pnone">
				<div class="panel panel-info">
					<div class="panel-heading">
						<div class="panel-title"><p class="login-box-msg">Seems Its Your First Login. Kindly Change Your Password To Continue.</p>
						<span style="float: right; font-size: 110%; position: relative; top: 10px;">
							 <a href="logout" style="color: #fff; text-decoration: underline;">Log Out</a>
						</span>
						</div>
					</div>
					<div style="padding-top: 30px" class="panel-body">
						<div style="display: none" id="login-alert"
							class="alert alert-danger col-sm-12"></div>
						<form:form modelAttribute="changepassobj" class="form-horizontal" role="form" id="changepassform" method="post" action="changePassFirstLogin"  autocomplete="off" htmlEscape="true" >
							<div class="form-group has-feedback">
				<!-- <input type="text" class="form-control" placeholder="User Id" name="name"> -->
				<form:input id="userId" path="loginId" cssClass="form-control" placeholder="User Id"  readonly ="true" value="${user.loginId}" htmlEscape="true"/>
				<span class="glyphicon glyphicon-user form-control-feedback"></span>
          </div>
          
          <div class="form-group has-feedback">
        
             <form:password path="newPassword" id="newPassword" cssClass="form-control strength" data-toggle-mask="false" placeholder="Please enter New Password" htmlEscape="true"/>
          <div class="FeRror">  <form:errors path="newPassword" /></div>
          </div>
          <div class="form-group has-feedback">
            <form:password path="confirmPassword" id="confirmPassword" cssClass="form-control"  placeholder="Please enter Confirm Password" htmlEscape="true" />
          <div class="FeRror"> <form:errors path="confirmPassword" /></div>
          </div>
		 <div class="row">
            <div class="col-xs-12">
            <form:hidden path="randSalt" id="randSalt" value="${randSalt}" htmlEscape="true"/>
            <form:button class="btn btn-primary btn-block btn-flat" type="submit">Change Password</form:button>
             
            </div><!-- /.col -->
          </div>
              <input type="hidden" name="secureToken" value="${csrf_security_token}" id="secureToken" />
        </form:form>
        <div class="center" style="padding:5px; color:red; text-align: center;" id="error">
                                     ${error}
                                </div>
						<div id="success" style="color: green">${msg}</div>
						<div class="center"
							style="padding: 5px; color: red; text-align: center;" id="error">
							${error}
						</div>
					</div>
				</div>
			</div>                        
          </div>
                </section>
            </div>
      