<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<spring:htmlEscape defaultHtmlEscape="true" />


<script>
	$(document)
			.ready(
					function() {
						
						document.getElementById("confirmPassword").addEventListener("keydown", function(event) {
					    if(event.key=="Enter" && event.code=="Enter" && event.isTrusted){
					    	 event.preventDefault();
					    	 $("#submit").click();
					    }
					});
					
					$("#submit").click(function() {

											var letterNumber = /^[0-9a-zA-Z\\_\\.\\-]+$/;
											
											 if ($('#loginId').val() == '') {
												$("#error")
														.html(
																"Login Id  Must Not Be Blank");
												$('#loginId').focus();
												return false;
											} else if ($('#loginId').length > 20) {
												$("#error")
														.html(
																"Login Id  Should Be Less Than Or Equal To 20 Characters");

												$('#loginId').focus();
												return false;
											}

										/* 	else if (!($('#loginId').val()
													.match(letterNumber))) {
												$("#error")
														.html(
																" Login Id  Is Not Valid");

												$('#loginId').focus();
												return false;
											} */ else if ($('#userPwd').val() == '') {
												$("#error")
														.html(
																" Password Must Not Be Blank");

												$('#userPwd').focus();
												return false;
											} else if ($('#userPwd').length > 200) {
												$("#error")
														.html(
																"Password Should Be Less Than Or Equal To 200 Characters");

												$('#userPwd').focus();
												return false;
											} else if ($('#confirmPassword')
													.val() == '') {
												$("#error").html(
														"Retype New Password.");

												$('#confirmPassword').focus();
												return false;
											} else if ($('#confirmPassword')
													.val() != $('#userPwd')
													.val()) {
												$("#error")
														.html(
																"Kindly Retype Password Correctly.");

												$('#confirmPassword').focus();
												return false;
											} 

											var pass = $("#userPwd").val();
											var confirmpass = $(
													"#confirmPassword").val();
											var loginId = '${user.loginId}';
											var randInt = '${randInt}';
											var fixedSalt = "a583fe9821";
											if (pass === "") {
											} else {
												for (var i = 0; i < randInt; i++) {
													var SHA256 = new Hashes.SHA256()
															.hex(pass + loginId);
													pass = SHA256 + fixedSalt;
												}
												$("#userPwd").val(pass);

											}
											if (confirmpass === "") {

											} else {
												for (var i = 0; i < randInt; i++) {
													var SHA256 = new Hashes.SHA256()
															.hex(confirmpass
																	+ loginId);
													confirmpass = SHA256
															+ fixedSalt;
												}
												$("#confirmPassword").val(
														confirmpass);

											}
											$("#passwordresetform").attr(
													"action",
													"updateExpiredPassword");
										});

						$("#cancel").click(function() {
							$("#passwordresetform").attr("action", "logout");
							$("#passwordresetform").submit()
						});
					});

	function refresh_captcha() {
		$('#loginId').val("");
		$("#userPwd").val("");
		$('#captcha').val("");
		$('#irs_captcha_id').attr('src', 'captchaimg?' + Math.random());
	}
</script>
<style>
.panel-heading {
	padding: 10px;
	text-align: center;
	font-size: 16px;
	background: #044073 !important;
	
}

 .panel-heading{background:#337ab7; color:#fff;}
.form-horizontal .form-group {
	margin: 0px 0 15px 0;
}

.login-box-body, .register-box-body {
	border-top: 1px solid #337ab7;
	padding: 0px;
	width: 400px;
}

.login-box-body .panel-haeding {
	background: #337ab7;
	color: #fff;
	font-size: 16px;
	padding: 15px 0 0 0;
}

.btn-primary {
	background: #044073;
}
</style>
<form:form modelAttribute="expiredpasswordformobj"
	action="updatePassword" role="form" id="passwordresetform"
	autocomplete="off" method="post">

	<div class="login-box">
		<div class="login-logo"></div>
		<!-- /.login-logo -->
		<div class="login-box-body panel panel-primary">
			<div class="panel-heading">Password Expired. Update Password to
				Continue.</div>
			<div class="panel-body">
				<div class="form-group has-feedback">
					<form:input path="loginId" class="form-control" value="${loginId}"
						maxlength="20" id="loginId" readonly="true" />
					<span class="glyphicon glyphicon-user form-control-feedback"></span>
				</div>
				<div class="form-group">
					<form:password path="userPwd" cssClass="form-control strength"
						data-toggle-mask="false" placeholder="New Password" id="userPwd"
						htmlEscape="true" maxlength="200" />

				</div>
				<div class="form-group has-feedback">
					<form:password path="confirmPassword" cssClass="form-control"
						placeholder="Retype Password" id="confirmPassword"
						htmlEscape="true" maxlength="200" />
					<span class="glyphicon glyphicon-lock form-control-feedback"></span>
				</div>

				<div class="row">

					<!-- /.col -->
					<div class="col-xs-4">
						<form:button class="btn btn-primary btn-block btn-flat"
							id="cancel">Cancel</form:button>
					</div>
					<div class="col-xs-4 pull-right">
						<form:button class="btn btn-primary btn-block btn-flat"
							id="submit" >Update</form:button>
					</div>
					<!-- /.col -->
				</div>
				<input type="hidden" name="secureToken"
					value="${csrf_security_token}" id="secureToken" />



				<!-- /.social-auth-links -->

				<!-- <a href="#">I forgot my password</a><br> -->
			</div>
		</div>
		<!-- /.login-box-body -->
		<div class="center"
			style="padding: 5px; color: red; text-align: center;" id="error">
			<div>
				<form:errors path="userPwd" />
			</div>
			<div>
				<form:errors path="confirmPassword" />
			</div>
			${error}

		</div>
	</div>
</form:form>