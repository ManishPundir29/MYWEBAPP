<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<spring:htmlEscape defaultHtmlEscape="true" />
<spring:url value="login" var="url" htmlEscape="true" />

<script
	src="<c:url value='/resources/jquery-validation-1.15.1/dist/jquery.validate.js'/>"
	type="text/javascript"></script>
<script
	src="<c:url value='/resources/jquery-validation-1.15.1/dist/additional-methods.js'/>"
	type="text/javascript"></script>
<script
	src="<c:url value='/resources/client_side_validation/loginpage_validation/recoveryPasswordLogin.js?resource=${resourceCsrf}'/>"
	type="text/javascript"></script>


<style>
html, body
{ 
 background:url('resources/images/seamless_paper_texture.png');
}

#loginnow {
 float: left;
}
</style>

<style>
.login_error {
	color: #A94442;
	font-weight: 1.2em;
}

.panel-info {
	border-color: #044073;
}

.panel-info>.panel-heading {
	color: #ffffff;
	background-color: #044073;
	border-color: #044073;
}

.form-horizontal .form-group {
	margin-right: 0px;
	margin-left: 0px;
}
</style>


<script>

</script>

<div class="content-wrapper"
	style="background: url('resources/images/seamless_paper_texture.png'); margin-left: 0px;">
	<section class="content">
		<div class="container">
			<div class="login-box">

				<div class="panel panel-info">
					<div class="panel-heading">
						<h4 class="panel-title">Recover Password</h4>
					</div>
					<div class="panel-body panel_box_shadow">
						<form:form action="passRecoveryUserVarify" class="form-horizontal"
							role="form" id="forgotpwd" method="post"
							modelAttribute="passrecoveryobj" autocomplete="off">
							<div class="form-group has-feedback marb20">
								<form:input path="loginId" cssClass="form-control"
									placeholder="Enter Your Login Id" id="loginId" maxlength="20"
									htmlEscape="true" />
								<div style="color: red;">
									<form:errors path="loginId"></form:errors>
								</div>
								<span class="glyphicon glyphicon-user form-control-feedback"></span>
							</div>
							<div class="form-group has-feedback marb20">
								<form:input path="emailId" cssClass="form-control"
									placeholder="Enter Your Registered Email Id " id="emailId"
									maxlength="100" htmlEscape="true" />
								<div style="color: red;">
									<form:errors path="emailId"></form:errors>
								</div>
								<span class="glyphicon glyphicon-envelope form-control-feedback"></span>
							</div>
							<div class="form-group text-center ">
								<img src="captchaimg" alt="captcha" id="irs_captcha_id" /> <i
									class="fa fa-lg fa-refresh" onclick='refresh_captcha()'
									style='cursor: pointer; vertical-align: middle;'></i>
							</div>
							<div class="form-group marb20">
								<form:input path="captcha" cssClass="form-control"
									placeholder="Enter Text In Image Above" maxlength="6"
									htmlEscape="true" />
								<div style="color: red;">
									<form:errors path="captcha"></form:errors>
								</div>
							</div>
							<div class="row">
								<div class="col-xs-12">
									<%-- <form:button class="btn btn-primary btn-block btn-flat" type="submit">Submit</form:button> --%>
									<c:choose>
										<c:when test="${success_y=='S'}">
											<script>
												 $(document).ready(function() {
													 $("#submit_form").hide();
													 $("#loginnow").text('Login Now');
													 
												 });
											</script>
											<div class="col-xs-12 no_padding" style="color: green">${msg}</div>
											
										</c:when>
										<c:otherwise>
											<div class="col-xs-12 no_padding" style="color: red;">${msg}</div>
										</c:otherwise>
									</c:choose>

									<button type="submit"
										class="btn btn-primary btn-block btn-flat marb10"
										id="submit_form">Submit</button>

									<a href="${url}" class="btn btn-primary btn-block btn-flat" id="loginnow"><i
										class="fa fa-arrow-left" style="margin-right: 5px;"></i>BACK</a>
								</div>
							</div>
							<input type="hidden" name="secureToken"
								value="${csrf_security_token}" id="secureToken" />
							<div class="row"></div>
						</form:form>
						<div class="center"
							style="padding: 5px; color: red; text-align: center;" id="error">
						<%-- 	<div>
								<form:errors path="loginId" />
							</div>
							<div>
								<form:errors path="emailId" />
							</div>
							<div>
								<form:errors path="captcha" />
							</div> --%>
						</div>
					</div>
				</div>
				<!-- /.login-box-body -->
			</div>
			<!-- /.login-box -->
			<div></div>
		</div>
	</section>
	<%--    <span id="error">
    ${msg}
    </span> --%>
</div>