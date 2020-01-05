<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<spring:htmlEscape defaultHtmlEscape="true" />


<script
	src="<c:url value='/resources/jquery-validation-1.15.1/dist/jquery.validate.js'/>"
	type="text/javascript"></script>
<script
	src="<c:url value='/resources/jquery-validation-1.15.1/dist/additional-methods.js'/>"
	type="text/javascript"></script>
 <%--  <script src="<c:url value='/resources/client_side_validation/loginpage_validation/changePasswordValidation.js?resource=${resourceCsrf}'/>" type="text/javascript"></script>  --%>
  <script src="<c:url value='/resources/pwdhash/hashes.min.js'/>"
	type="text/javascript"></script>
<style>
.FeRror{float: left; width: 100%;}
</style>

<div class="content-wrapper">
	<!-- Content Header (Page header) -->

        <nav aria-label="breadcrumb">
          <ol class="breadcrumb">
            <li class="breadcrumb-item active" aria-current="page">User Profile</li>
            <li class="breadcrumb-item active" aria-current="page">Change Password</li>
          </ol>
        </nav>

	<section class="content ChangePassword">
		<div class="row">
			<div class="col-md-6 col-md-offset-3 col-sm-10 col-sm-offset-1 pnone">
				<div class="box box-solid box-primary">
					<div class="box-header">
						<h3 class="box-title">Provide following details to change Password.</h3>
					</div>
					<!-- /.box-header -->
					<div class="box-body">
						<form:form modelAttribute="changepassobj" class="form-horizontal"
							role="form" id="changepassform1" method="post" action="changePass"
							autocomplete="off" htmlEscape="true">
							<div class="box-body">
								<div class="form-group">
									<label for="userid" class="col-sm-4 control-label">User
										Id</label>
									<div class="col-sm-8">
										<div class="input-group">
											<span class="input-group-addon"><i
												class="fa fa-archive" aria-hidden="true"></i></span>
											<form:input id="userid" path="userId" cssClass="form-control"
												placeholder="User Id" readonly="true"
												value="${user.loginId}" htmlEscape="true" />
											<div class="FeRror"><form:errors path="userId" class="FeRror" /></div>
											
										</div>
									</div>
								</div>
								<div class="form-group">
									<label for="currentPassword" class="col-sm-4 control-label">Current
										Password<span style="color:#f00;">*</span></label>
									<div class="col-sm-8">
										<div class="input-group">
											<span class="input-group-addon"><i class="fa fa-lock"
												aria-hidden="true"></i></span>
											<form:password path="userPwd" cssClass="form-control"
												placeholder="Please Enter Current Password" id="currentPassword"
												htmlEscape="true" />
											<div class="FeRror"><form:errors path="userPwd" class="FeRror" /></div>
											
										</div>

									</div>
								</div>
								<div class="form-group">
									<label for="newPassword" class="col-sm-4 control-label">New
										Password<span style="color:#f00;">*</span></label>
									<div class="col-sm-8">
										<div class="input-group">
											<span class="input-group-addon"><i class="fa fa-lock"
												aria-hidden="true"></i></span>
											<form:password path="newPassword" id="newPassword"
												cssClass="form-control strength" data-toggle-mask="false"
												placeholder="Please Enter New Password" htmlEscape="true" />
											<div class="FeRror"><form:errors path="newPassword" /></div>
											
										</div>
									</div>
								</div>
								<div class="form-group">
									<label for="confirmPassword" class="col-sm-4 control-label">Confirm
										Password<span style="color:#f00;">*</span></label>
									<div class="col-sm-8">
										<div class="input-group">
											<span class="input-group-addon"><i class="fa fa-lock"
												aria-hidden="true"></i></span>
											<form:password path="confirmPassword" id="confirmPassword"
												cssClass="form-control" placeholder="Please Enter Confirm Password"
												htmlEscape="true" />
											<div class="FeRror"><form:errors path="confirmPassword" /></div>
											
										</div>
									</div>
								</div>

								<div class="form-group">
									<div class="col-sm-4 control label"></div>
									<div class="col-sm-4 col-sm-offset-4 pnone">
										<%-- <form:button class="btn btn-default" id="submit">Change Password</form:button> --%>
										<input type="submit" id="Submit" value="Change Password"
											class="btn btn-default form-control">
									</div>
								</div>

							</div>
							<!-- /.box-body -->

							<form:hidden path="loginId" id="loginId" value="${user.loginId}"
								htmlEscape="true" />
							<form:hidden path="randSalt" id="randSalt" value="${randSalt}"
								htmlEscape="true" />
							<input type="hidden" name="secureToken"
								value="${csrf_security_token}" id="secureToken" />
						</form:form>
						<span id="error" class="FeRror" style="text-align: center;">${error}</span>
						<div
							style="float: left; width:100%; text-align:center; color: green">
							<span id="success"> ${success} </span>
						</div>
						<!-- /.box-body -->

					</div>
					<!-- /.box -->

				</div>


			</div>
			<!-- /.col -->
		</div>
		<!-- /.row -->
	</section>
	<!-- /.content -->
</div>
<!-- /.content-wrapper -->


<script>
	$(document)
			.ready(
					function() {

						$("#changepassform1")
								.validate(
										{
											rules : {
												userPwd : {
													required : true,
													minlength : 8,
													maxlength : 40,
													alpanumericspecialchpass : true
												},
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
												userPwd : {
													required : "Please Enter Current Password",
													minlength : "Current Password should not be less than 8 character",
													maxlength : "Current Password should be less than 40 characters",
													alpanumericspecialchpass : "Current Password must include at least one upper case letter, one special Character, one lower case letter and one numeric digit"
												},
												newPassword : {
													required : "Please Enter New Password",
													minlength : "New Password should not be less than 8 character",
													maxlength : "New Password should be less than 40 characters",
													alpanumericspecialchpass : "New Password must include at least one upper case letter, one special Character, one lower case letter and one numeric digit"
												},
												confirmPassword : {
													required : "Please Enter Confirm Password",
													minlength : "Confirm Password should not be less than 8 character",
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

											submitHandler : function(form) {

												/* var token=GetNewToken();
												  $("#secureToken").val(token); */

												var curpass = $(
														"#currentPassword")
														.val();
												var newpass = $("#newPassword")
														.val();
												var confirmpass = $(
														"#confirmPassword")
														.val();

												var SHA256cur = new Hashes.SHA256()
														.hex(new Hashes.SHA256()
																.hex(curpass)
																+ $("#randSalt")
																		.val());
												var SHA256new = new Hashes.SHA256()
														.hex(newpass);
												var SHA256confirm = new Hashes.SHA256()
														.hex(confirmpass);
												$("#currentPassword").val(
														SHA256cur);
												//alert("1"+$("#currentPassword").val());
												$("#newPassword")
														.val(SHA256new);
												//	alert("2"+$("#newPassword").val());
												$("#confirmPassword").val(
														SHA256confirm);
												//	alert("3"+$("#confirmPassword").val());

												form.submit();
											}
										}); // closing validate
					});
</script>