<%-- <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<spring:htmlEscape defaultHtmlEscape="true" />
<script
	src="<c:url value='/resources/jquery-validation-1.15.1/dist/jquery.validate.js'/>"
	type="text/javascript"></script>
<script
	src="<c:url value='/resources/jquery-validation-1.15.1/dist/additional-methods.js'/>"
	type="text/javascript"></script>
<script src="<c:url value='/resources/jquery-validation-1.15.0/dist/jquery.validate.js'/>" type="text/javascript"></script>
<script
	src="<c:url value='/resources/client_side_validation/loginpage_validation/loginPageValidation.js?resource=${resourceCsrf}'/>"
	type="text/javascript"></script>
<script src="<c:url value='/resources/pwdhash/hashes.min.js'/>"
	type="text/javascript"></script>

<script type="text/javascript">
	var randomsalt = '${randSalt}';	
</script>

<style>
html, body
{
 background:url('resources/images/seamless_paper_texture.png');
}
</style>


<style>
.login_error {
	color: #f00;
	font-weight: 1.2em;
}

.panel-info {
	border-color: #044073;
	box-shadow: 14px 20px 29px -12px;
	-webkit-box-shadow: 14px 20px 29px -12px;
	-moz-box-shadow: 14px 20px 29px -12px;
	-o-box-shadow: 14px 20px 29px -12px;
	-ms-box-shadow: 14px 20px 29px -12px;
	-moz-box-shadow: 14px 20px 29px -12px;
}

.panel-info>.panel-heading {
	color: #fff;
	background-color: #044073;
	border-color: #044073;
}

.input-group-addon {
	color: #044073;
}

#loginbox .panel-info {
	position: relative;
}
</style>


<div class="content-wrapper"
	style="margin-left: 0px; background-color: rgba(230, 227, 205, 0.278431); min-height: 622px;">
	<section class="content">
		<div class="container">

			<div id="loginbox" style="margin-top: 60px;"
				class="col-md-4 col-md-offset-4 col-sm-8 col-sm-offset-2 pnone">
				<div class="panel panel-info">
					<div class="panel-heading">
						<div class="panel-title">Log In</div>
						<div
							style="float: right; font-size: 90%; position: relative; top: -20px;">
							 <a href="passRecovery" style="color: #fff;">Forgot password?</a>
						</div>
					</div>
					<div style="padding-top: 30px" class="panel-body">
						<div style="display: none" id="login-alert"
							class="alert alert-danger col-sm-12"></div>
						<form:form modelAttribute="loginForm" role="form" id="loginform"
							autocomplete="off" method="post" action="otpvarification11">
							<div class="input-group" style="margin-bottom: 5px">
								<span class="input-group-addon"><i
									class="glyphicon glyphicon-user"></i></span>
								<form:input path="loginId" cssClass="form-control"
									placeholder="Your Login Id" htmlEscape="true"
									maxlength="40" id="loginId" />
								<div class="FeRror"></div>
									<form:errors path="loginId" cssClass="FeRror" />
							</div>
							<div class="input-group" style="margin-top: 5px">
								<span class="input-group-addon"><i
									class="glyphicon glyphicon-lock"></i></span>
								<form:password path="userPwd" cssClass="form-control"
									placeholder="Your Password" id="userPwd"
									htmlEscape="true" maxlength="40" />
								<div class="FeRror"></div>
								<form:errors path="userPwd" cssClass="FeRror" />
							</div>
							<div class="form-group text-center">
								<img src="captchaimg" alt="captcha" id="irs_captcha_id" /> <i
									class="fa fa-lg fa-refresh" onclick='refresh_captcha()'
									style='cursor: pointer; padding-top: 10px; vertical-align: middle;'
									style="vertical-align: middle;"></i>
							</div>
							<div class="form-group" style="margin-bottom: 0px">
								<form:input path="captcha" cssClass="form-control"
									placeholder="Enter Text Shown Above" htmlEscape="true"
									maxlength="6" id="captcha" />
									<div class="FeRror"></div>
								<form:errors path="captcha" cssClass="FeRror" />
							</div>
							<div style="margin-top: 20px" class="form-group">
								<!-- Button -->
								
								<div class="col-sm-4"> 
									<a style="color: #044073; font-weight:bold;"class="" href="${pageContext.request.contextPath}"> 
										<i class="fa fa-arrow-circle-left" aria-hidden="true" style=" color: #044073;"></i> Back </a>
									</div>
									
								<div class="col-sm-8 controls" style="text-align: left;">
									<!-- <a id="btn-login" href="#" class="btn btn-md btn-info" id="submit" onclick="login();">Login  </a> -->
									 
									<!--  <a style="color:white" class="btn btn-primary" href="/ICJS/"> <i class="fa fa-arrow-left" aria-hidden="true"></i> Back </a> -->
									<button type="submit" class="btn btn-primary" id="submit_form">Login</button>
									<button type="reset" class="btn btn-primary" id="reset_form">Reset</button>
                                    
                                     
								</div>
							</div>   
							
							<input type="hidden" name="secureToken"
								value="${csrf_security_token}" id="secureToken" />
						</form:form>
							<c:choose>
										<c:when test="${success_y=='success'}">
											<script>
												/*var show = '${msg}';
												$('#msg').text(show);
												 alert(show); */
											</script>
											<div class="col-xs-12 no_padding" style="color: green">${msg}</div>
										</c:when>
									</c:choose>
						<div class="center" style="padding: 5px; color: red; text-align: center;" id="error">
							${error}
						</div>
						<div class="center" style="padding: 5px; color: green; text-align: center;" id="msgonfirstlogin">
							${msgonfirstlogin}
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</div> --%>