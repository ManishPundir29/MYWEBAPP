$(document)
		.ready(
				function() {
					$("#buttonOfEcourtDataForEpolice").click(function() {
					$("#epoliceForm")
							.validate(
									{
										rules : {
											cnrno : {
												required : true,
												maxlength : 20,
												lettersNnumber : true,
											},
										},
										messages : {
											cnrno : {
												required : "Please specify CNR Number",
												maxlength : "CNR Number should be less than 200 characters",
												lettersNnumber : "CNR Number not valid"
											},
											stateCode : {
												number : "State not valid",
											},
											pidno : {
												maxlength : "Prisoner ID should be less than 20 character",
												lettersNnumber : "Prisoner ID not valid"
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
											if ($(element).parent().hasClass(
													'has-error')) {
												$(element).parent().addClass(
														"has-success")
														.removeClass(
																"has-error");
												$(element).next('.FeRror').css(
														'display', 'none');
											}
										},

										submitHandler : function(form) {
											//event.preventDefault(); // interrupt default hyperlink behavior
											$("#epoliceForm").attr("action", "interoperationForPolice");
											$("#epoliceForm").submit();
										}
									});
					});
					$("#buttonOfPrisonDataForEpolice").click(function() {
						$("#epoliceForm")
						.validate(
								{
									rules : {
										stateCode : {
												number : true,
												required : true,
											},
											pidno : {
												maxlength : 20,
												lettersNnumber : true,
												required : true,
											}
									},
									messages : {
										stateCode : {
											number : "State not valid",
											required : "Please specify State",
										},
										pidno : {
											required : "Please specify Prisoner ID",
											maxlength : "Prisoner ID should be less than 20 character",
											lettersNnumber : "Prisoner ID not valid"
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
										if ($(element).parent().hasClass(
												'has-error')) {
											$(element).parent().addClass(
											"has-success")
											.removeClass(
											"has-error");
											$(element).next('.FeRror').css(
													'display', 'none');
										}
									},
									
									submitHandler : function(form) {
										$("#epoliceForm").attr("action", "interoperationForPolice");
										$("#epoliceForm").submit();
									}
								});
					});
					$("#buttonOfEcourtRowDataForEpolice").click(function() {
						$("#epoliceForm").validate(
								{
									rules : {
										cnrno : {
											required : true,
											maxlength : 20,
											lettersNnumber : true,
										}
									},
									messages : {
										cnrno : {
											required : "Please specify CNR Number",
											maxlength : "CNR Number should be less than 200 characters",
											lettersNnumber : "CNR Number not valid"
										}
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
										if ($(element).parent().hasClass(
												'has-error')) {
											$(element).parent().addClass(
											"has-success")
											.removeClass(
											"has-error");
											$(element).next('.FeRror').css(
													'display', 'none');
										}
									},
									
									submitHandler : function(form) {
										$("#epoliceForm").attr("action", "exportJSONdataForPolice");
										$("#epoliceForm").submit();
									}
								});
					});
					$("#buttonOfPrisonRowDataForEpolice").click(function() {
						$("#epoliceForm")
						.validate(
								{
									rules : {
										stateCode : {
											number : true,
											required : true,
										},
										pidno : {
											maxlength : 20,
											lettersNnumber : true,
											required : true,
										}
									},
									messages : {
										stateCode : {
											number : "State not valid",
											required : "Please specify State"
										},
										pidno : {
											maxlength : "Prisoner ID should be less than 20 character",
											lettersNnumber : "Prisoner ID not valid",
											required : "Please specify Prisoner ID"
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
										if ($(element).parent().hasClass(
										'has-error')) {
											$(element).parent().addClass(
											"has-success")
											.removeClass(
											"has-error");
											$(element).next('.FeRror').css(
													'display', 'none');
										}
									},
									
									submitHandler : function(form) {
										$("#epoliceForm").attr("action", "exportJSONdataForPolice");
										$("#epoliceForm").submit();
									}
								});
					});
				
					/*$("#buttonOfCCTNSdataForEcourt").click(function() {
						$("#ecourtForm")
						.validate(
								{
									rules : {
										firRegNum : {
											required : true,
											maxlength : 20,
											lettersNnumber : true,
										}
									},
									messages : {
										firRegNum : {
											required : "Please specify FIR Number",
											maxlength : "FIR Number should be less than 200 characters",
											lettersNnumber : "FIR Number not valid"
										}
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
										if ($(element).parent().hasClass(
										'has-error')) {
											$(element).parent().addClass(
											"has-success")
											.removeClass(
											"has-error");
											$(element).next('.FeRror').css(
													'display', 'none');
										}
									},
									
									submitHandler : function(form) {
										$("#ecourtForm").attr("action", "interoperationForCourt");
										$("#ecourtForm").submit();
									}
								});
						$("#buttonOfPrisonDataForEcourt").click(function() {
							$("#ecourtForm")
							.validate(
									{
										rules : {
											stateCode : {
												number : true,
												required : true,
											},
											pidno : {
												maxlength : 20,
												lettersNnumber : true,
												required : true,
											}
										},
										messages : {
											stateCode : {
												number : "State not valid",
												required : "Please specify State"
											},
											pidno : {
												maxlength : "Prisoner ID should be less than 20 character",
												lettersNnumber : "Prisoner ID not valid",
												required : "Please specify Prisoner ID"
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
											if ($(element).parent().hasClass(
											'has-error')) {
												$(element).parent().addClass(
												"has-success")
												.removeClass(
												"has-error");
												$(element).next('.FeRror').css(
														'display', 'none');
											}
										},
										
										submitHandler : function(form) {
											$("#ecourtForm").attr("action", "interoperationForCourt");
											$("#ecourtForm").submit();
										}
									});
						});
					});
					$("#buttonOfCCTNSrowDataForEcourt").click(function() {
						alert("hello");
						$("#ecourtForm")
						.validate(
								{
									rules : {
										firRegNum : {
											required : true,
											maxlength : 20,
											lettersNnumber : true,
										}
									},
									messages : {
										firRegNum : {
											required : "Please specify FIR Number",
											maxlength : "FIR Number should be less than 200 characters",
											lettersNnumber : "FIR Number not valid"
										}
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
										if ($(element).parent().hasClass(
										'has-error')) {
											$(element).parent().addClass(
											"has-success")
											.removeClass(
											"has-error");
											$(element).next('.FeRror').css(
													'display', 'none');
										}
									},
									
									submitHandler : function(form) {
										$("#ecourtForm").attr("action", "exportJSONdataForCourt");
										$("#ecourtForm").submit();
									}
								});
						$("#buttonOfPrisonRowDataForEcourt").click(function() {
							$("#ecourtForm")
							.validate(
									{
										rules : {
											stateCode : {
												number : true,
												required : true,
											},
											pidno : {
												maxlength : 20,
												lettersNnumber : true,
												required : true,
											}
										},
										messages : {
											stateCode : {
												number : "State not valid",
												required : "Please specify State"
											},
											pidno : {
												maxlength : "Prisoner ID should be less than 20 character",
												lettersNnumber : "Prisoner ID not valid",
												required : "Please specify Prisoner ID"
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
											if ($(element).parent().hasClass(
											'has-error')) {
												$(element).parent().addClass(
												"has-success")
												.removeClass(
												"has-error");
												$(element).next('.FeRror').css(
														'display', 'none');
											}
										},
										
										submitHandler : function(form) {
											$("#ecourtForm").attr("action", "exportJSONdataForCourt");
											$("#ecourtForm").submit();
										}
									});
						});*/
					/*});*/
					
				});

function validateForm(obj) {
	var e = $(obj);
	var flag = true;
	if ($(e).closest('fieldset').find('input:eq(0)').val() == '') {
		flag = false;
		$(e).closest('fieldset').addClass("has-error");
		alert(flag);
		return flag;
	} else {
		$(e).closest('fieldset').removeClass("has-error").addClass(
				"has-success");
	}

}

