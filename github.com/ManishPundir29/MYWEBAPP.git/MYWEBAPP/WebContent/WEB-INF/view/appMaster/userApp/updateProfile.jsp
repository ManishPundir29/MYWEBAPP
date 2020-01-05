<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>


<spring:htmlEscape defaultHtmlEscape="true" />

<script src="<c:url value='/resources/jquery-validation-1.15.1/dist/jquery.validate.js'/>" type="text/javascript"></script>
 <script	src="<c:url value='/resources/jquery-validation-1.15.1/dist/additional-methods.js'/>" type="text/javascript"></script>
 


<script type="text/javascript">

$(document).ready(
		function() {
			
			$("#updateUserForm")
			.validate(
					{
					rules : {
						userName : {
								required : true,
								minlength : 2,
								maxlength : 100,
								lettersnNumberwithbasicpunc : true
							},
							officeDesc : {
								required : true,
								minlength : 2,
								maxlength : 200,
								lettersnNumberwithbasicpunc :true
								
							},
							userDesignation : {
								required : true,
								minlength : 2,
								maxlength : 100,
								letterswithbasicpunc :  true
							},
							userEmailId : {
								required : true,
								maxlength : 100,
								email : true
							},
							userMobileNo : {
								required : true,
								minlength : 10,
								maxlength : 13,
								MobileNo : true
							},
							landLineNumber : {
								number : true,
								minlength : 10,
								maxlength : 11
							}
					},
						messages : {
							userName : {
									required : "Please enter user name",
									minlength : "User name should not be less than 2 character",
									maxlength : "User name Should be less than or equal to 100 characters",
								    lettersnNumberwithbasicpunc : "`Please enter valid username"
									
								},
								officeDesc : {
									required : "Please enter Office Address",
									minlength : "Office Address should not be less than 2 character",
									maxlength : "Office Address Should be less than or equal to 200 characters",
									lettersnNumberwithbasicpunc : "Please enter valid Office Address"
								},
								userDesignation : {
									required : "Please enter user designation",
									minlength : "Please enter valid user designation atleast 2 characters",
									maxlength : "User designation Should be less than or equal to 100 characters",
									lettersnNumberwithbasicpunc : "Please enter valid user designation"
								},
								userEmailId : {
									required : "Email ID  must not be blank",
									maxlength : "Email ID Should be less than or equal to 100 characters",
									email : "Please enter a valid email address"
								},
								userMobileNo : {
									required : "Mobile number  must not be blank",
									minlength : "Mobile number  Should not be less than or equal to 10 digits",
									maxlength : "Please specify a valid mobile number atleast 13 digits",
									MobileNo : "Please specify a valid mobile number"
								},
								landLineNumber :{
									number : "Please enter valid landline number",
									minlength : "landline number  Should not be less than or equal to 10 digits",
									maxlength : "Please specify a valid land line; number atleast 11 digits",
								}
						},
						errorPlacement : function(error,
								element) {
							//error.addClass("help-block");
							$(element).parent().next('.FeRror').html(
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
							$(element).parent().next('.FeRror').css(
									'display', 'none');
							}
						},

						submitHandler : function(form) {
							var token=GetNewToken();
							  $("#secureToken").val(token);
							form.submit();
							
						}
					});

		});
		
		
/* checking for Already Available Email Id In database */

function checkingAlreadyAvailableEmailId(emailId) {
/* alert("EmailId:"+emailId); */
	var emailId = document.getElementById('userEmailId').value;
	
	$.ajax({
		type : "POST",
		url : 'getAvailableEmailIdForValidation',
		data : {
			'emailId' : emailId
		},
		beforeSend : function(xhr) {

			xhr.setRequestHeader('X-CSRF-Token', $('#secureToken').val());

		},
		success : function(data, status) {
			console.log("Available/Not Available:"+data)
			$(".availableEmailIdMessage").hide();
			$(".availableEmailIdMessage").empty();

			if (data == "EmailIdAvailable") {
				var availableEmailIdMessage = '* Email Id  "' + emailId
						+ '" Already Exists!';
				$(".availableEmailIdMessage").show();
				$(".availableEmailIdMessage").append(
						availableEmailIdMessage);
				/* document.getElementById("userEmailId").value = ''; */
			/* 	document.getElementById("userEmailId").focus(); */
			}
			if (data == "EmailIdNotAvailable") {
				$(".availableEmailIdMessage").hide();
				$(".availableEmailIdMessage").empty();
			}

		},
		error : function(e) {
			alert('Error: ' + e);
		}
	});

	var tokens = GetNewToken();
	$("#secureToken").val(tokens);

}
		
		
			
/********Validating Mobile Number  Start***************/
	function checkingAlreadyAvailableMobileNoNew(mobileNo) {
	/* alert("Mobbbb" + mobileNo); */
		var mobileNo = document.getElementById('userMobileNo').value;

		$.ajax({
			type : "POST",
			url : 'getAvailableMobileNoForValidationNew',
			data : {
				'mobileno' : mobileNo
			},
			beforeSend : function(xhr) {

				xhr.setRequestHeader('X-CSRF-Token', $('#secureToken').val());

			},
			success : function(data, status) {
				$(".availableMobileNoMessage").hide();
				$(".availableMobileNoMessage").empty();

				if (data == "MobileNoNotAvailable") {

					var availableMobileNoMessage = '* Mobile No  "' + mobileNo
							+ '" Already Exists!';
					$(".availableMobileNoMessage").show();
					$(".availableMobileNoMessage").append(
							availableMobileNoMessage);
					/* document.getElementById("userMobileNo").value = '';
					document.getElementById("userMobileNo").focus(); */
				}
				if (data == "MobileNoAvailable") {
					$(".availableMobileNoMessage").empty();
					$(".availableMobileNoMessage").hide();
				}

			},
			error : function(e) {
				alert('Error: ' + e);
			}
		});
		var tokens = GetNewToken();
		$("#secureToken").val(tokens);
	}
	/********Validating Mobile Number  End***************/

</script>


<style type="text/css">

.success
{
color:green;
}

.error
{
color:red;
}

.select2-container--default .select2-selection--multiple .select2-selection__choice
  {
  color: black;
}

            .form-horizontal .form-group {
                        margin-right: 5px;
                        margin-left: 0px;
                    }

table {
  border-collapse: separate;
  border-spacing: 0px;
  width: 100%
} /* cellspacing="0" */
</style>


<style>
table.dataTable tbody tr.selected {
    background-color: #B0BED9;
}

#filterprisontable tbody tr.selectedprisontable {
    background-color: #CFECF9;
}

#filterpolicetable tbody tr.selectedpolicetable {
    background-color: #F2E3DC;
}
</style>

<!-- Main content -->
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
<!-- Main content -->
	<section class="content ChangePassword" style="padding-top:15px;">
	<div class="row">
			<div class="col-md-6 col-md-offset-3 col-sm-10 col-sm-offset-1 pnone">
    <div class="box box-solid box-primary">
	    <div class="box-header">
		<span class="box-title">Update Profile</span> 
		</div>
    <div class="box-body">
            <!-- DISPLYAING USER PROFILE UPDATE FORM   -->
         <form:form action="${pageContext.request.contextPath}/updatingprofile" method="post" role="form" id="updateUserForm" modelAttribute="updateProfile" enctype="multipart/form-data" class="form-horizontal">
                                  
          <div class="box-body" >
          <form:input type="hidden" path="enteredBy" value="${userDetail.userId}"></form:input>       
           
            <!-- Display State User Creation form:CFCS -->
                        <div class="form-group">    
                        <label for="userId" class="col-sm-4 control-label">User Id:</label>  
                        <div class="col-sm-8"> 
                        <div class="input-group"> 
                        <span class="input-group-addon"><i class="fa fa-archive" aria-hidden="true"></i></span>              
                        <form:input id="userId" path="userId" cssClass="form-control" placeholder="User Id"  readonly ="true" value="${userDetail.loginId}" htmlEscape="true"/>
                       
                        </div>
                         <div class="FeRror"></div>
						<form:errors path="userId" />
                        </div>
                        <!--     <div class=" col-md-3 FeRror FeRrorCUser "> This field is required.</div> -->
                        </div> 
          
                        <div class="form-group">    
                        <label for="userName" class="col-sm-4 control-label">User Name</label>  
                        <div class="col-sm-8"> 
                        <div class="input-group"> 
                        <span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>              
                        <form:input id="userName" path="userName" cssClass="form-control" placeholder="User Name" value="${userDetail.userName}" htmlEscape="true"/>
                       
                        </div>
                         <div class="FeRror"></div>
						<form:errors path="userName" />
                        </div>
                        <!--     <div class=" col-md-3 FeRror FeRrorCUser "> This field is required.</div> -->
                        </div> 
          
                  <div class="form-group">    
                  <label for="officeDesc" class="col-sm-4 control-label">Office Address</label>  
                  <div class="col-sm-8"> 
                  <div class="input-group"> 
                  <span class="input-group-addon"> <i class="fa fa-home" aria-hidden="true"></i></span>              
                  <form:input id="officeDesc" path="officeDesc" cssClass="form-control" placeholder="Office Address" value="${userDetail.officeDesc}" htmlEscape="true"/>
                 
                  </div>
                   <div class="FeRror"></div>
				   <form:errors path="officeDesc" />
                  </div>
                  <!--     <div class=" col-md-3 FeRror FeRrorCUser "> This field is required.</div> -->
                  </div> 

                  <div class="form-group">    
                  <label for="userDesignation" class="col-sm-4 control-label">Designation</label>  
                  <div class="col-sm-8"> 
                  <div class="input-group"> 
                  <span class="input-group-addon"> <i class="fa fa-home" aria-hidden="true"></i></span>             
                  <form:input id="userDesignation" path="userDesignation" cssClass="form-control" placeholder="Designation" value="${userDetail.userDesignation}" htmlEscape="true"/>
                  
                  </div>
                  <div class="FeRror"></div>
				  <form:errors path="userDesignation" />
                  </div>
                  <!--     <div class=" col-md-3 FeRror FeRrorCUser "> This field is required.</div> -->
                  </div> 
           
                 
                  <div class="form-group">    
                  <label for="emailid" class="col-sm-4 control-label">Email</label>  
                  <div class="col-sm-8"> 
                  <div class="input-group"> 
                  <span class="input-group-addon"><i class="fa fa-envelope fa" aria-hidden="true"></i></span>              
                  <form:input id="userEmailId" path="userEmailId" onblur="checkingAlreadyAvailableEmailId(this.value);" cssClass="form-control" placeholder="Enter Email Id" value="${userDetail.userEmailId}" htmlEscape="true"/>
                  
                  </div>
                  <div class="FeRror"></div>
    			  <form:errors path="userEmailId" />
    			  <div class="availableEmailIdMessage" style="font-size: small; color: red;"></div>
                  </div>
                  <!--     <div class=" col-md-3 FeRror FeRrorCUser "> This field is required.</div> -->
                  </div> 
                 
                  <div class="form-group">    
                  <label for="userMobileNo" class="col-sm-4 control-label">Mobile No</label>  
                  <div class="col-sm-8"> 
                  <div class="input-group"> 
                  <span class="input-group-addon"><i class="fa fa-mobile-phone fa" aria-hidden="true"></i></span>              
                  <form:input id="userMobileNo" maxlength="10"  path="userMobileNo" onblur="checkingAlreadyAvailableMobileNoNew(this.value);" cssClass="form-control" placeholder="Enter Mobile No" value="${userDetail.userMobileNo}" htmlEscape="true" />
                 
	            </div>
	            <div class="FeRror"></div>
				<form:errors path="userMobileNo" />
				<div class="availableMobileNoMessage" style="font-size: small; color: red;">
				
                  </div>
                  </div>
                  <!--     <div class=" col-md-3 FeRror FeRrorCUser "> This field is required.</div> -->
                  </div> 
 
 				<div class="form-group">    
                  <label for="landLineNumber" class="col-sm-4 control-label">Land Line No.</label>  
                  <div class="col-sm-8"> 
                  <div class="input-group"> 
                  <span class="input-group-addon"><i class="fa fa-mobile-phone fa" aria-hidden="true"></i></span>              
                  <form:input id="landLineNumber" maxlength="15" path="landLineNumber" cssClass="form-control" placeholder="Enter LandLine No" value="${userDetail.landLineNumber}" htmlEscape="true"/>
                
                 
                  </div>
                  <div class="FeRror"></div>
				<form:errors path="landLineNumber" />
                  </div>
                  <!--     <div class=" col-md-3 FeRror FeRrorCUser "> This field is required.</div> -->
                 </div>  
                  <div class="form-group">
                      <label for="profilePhoto" class="col-sm-4 control-label">Profile Photo :</label>
                        <div class="col-sm-8">
                           <form:input path="profilePhoto" type="file" class=" file" id="profilePhoto"  htmlEscape="true"/> 
                        </div>
                   </div> 
            <div class="form-group">
               <!-- Button -->                                        
               <div class="col-sm-offset-5 col-sm-2">
                  <!--  <input type="submit" id="Submit" value="Create" class="btn btn-info"> -->
                    <button type="submit" id = "Submit" class="btn btn-default">UPDATE</button>
                   <!--  <button id="btn-signup" type="submit" class="btn btn-info"  ><i class="icon-hand-right"></i> Submit</button> --> 
               </div>
            </div>
            </div>
            <input type="hidden" name="secureToken" value="${csrf_security_token}" id="secureToken" />
            </form:form>  
        
         <%--   <span id="error" > ${Error} </span> --%>
	       <div style="float: center; font-size: 100%; position: relative; top: -10px">
		   <span id="success" class="success"  style="text-align: center; width: 100%; float: left;"> ${Message} ${userWelcome} </span>
	       </div>
           </div>
                    </div>
            </div>
         </div>
                   </section>
                   </div>   <!--END OF ICJS_UPDATE_PROFILE-->
         <!-- data table -->
