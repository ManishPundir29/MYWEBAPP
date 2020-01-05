<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<spring:htmlEscape defaultHtmlEscape="true" />

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Monitoring Tools</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

<script src="<c:url value='/resources/jquery-validation-1.15.1/dist/jquery.validate.js'/>" type="text/javascript"></script>
<script src="<c:url value='/resources/jquery-validation-1.15.1/dist/additional-methods.js'/>" type="text/javascript"></script>

<script src="<c:url value='/resources/client_side_validation/loginpage_validation/loginPageValidation.js?resource=${resourceCsrf}'/>" type="text/javascript"></script>
<script src="<c:url value='/resources/pwdhash/hashes.min.js'/>" type="text/javascript"></script>

<script type="text/javascript">
	var randomsalt = '${randSalt}';	
</script>

<section>
<header id="main-header">
    <div class="container"> 
        <div class="col-sm-12 login_header"> 
        	 
        	 <h3><a style="color:white" href="#"> MYWEBAPP</a></h3>
       
    </div>
 </div>
 
</header>
</section>
<section class="main_content">
     
    <div class="col-md-12">
      <div class="col-md-2">
        <div class="monitoringLogin">
		
          <div class="login-wrap">
      
				<div class="panel panel-info login_wr">
					<div class="panel-heading">
						<div class="panel-title">Login</div>
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
							
							<div style="margin-top: 20px" class="form-group">
								<!-- Button -->
								<div class="col-sm-12 " style="text-align: left;">
									<div class="form-group">
                  						<div class="col-sm-4  col-sm-offset-3" style="margin-bottom:15px;">
                   							 <button type="submit" class="btn btn-primary" id="submit_form"><i class="glyphicon glyphicon-log-in" style="margin-right:8px;"></i> Log in</button>
               						  	 </div>
                  			  			<!-- <div class="col-sm-5 controls pull-right" style="text-align:right;"> 
											<a href="passRecovery"  class="btn btn-info"><i class="fa fa-key" style="margin-right:8px;" aria-hidden="true"></i> Forgot password? </a>
										 </div> -->
                					</div>
                 			 </div>
							</div>   
							
							<input type="hidden" name="secureToken"
								value="${csrf_security_token}" id="secureToken" />
						</form:form>
							<c:choose>
										<c:when test="${success_y=='success'}">
											
											<div class="col-xs-12 no_padding" style="color: green">${msg}</div>
										</c:when>
									</c:choose>
						<div class="center" style="padding: 5px; color: red; text-align: center;margin-top: 69px;" id="error" >
							${error}
						</div>
						<div class="center" style="padding: 5px; color: green; text-align: center;" id="msgonfirstlogin">
							${msgonfirstlogin}
						</div>
					</div>
				</div>
              </div>
        </div>
      </div>
    </div>
</section>
<section>
 <footer class="main-footer"	>
<div  class="marb10">
 </div>
</footer> 
</section>


