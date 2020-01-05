

	 function GetNewToken()
	 {
	 	
	 		
	 		var token;
	 	   
	 	   
	 	    $.ajax({
	 			type : 'GET', // define the type of HTTP verb we want to use (POST for our form)
	 			url : 'GenerateNewToken', // the url where we want to POST
	 			// data: search,
	 			//dataType : 'json', // what type of data do we expect back from the server
	 			encode : true,
	 			 async: false,
	 			beforeSend : function(xhr) {
	 				//xhr.setRequestHeader("Accept", "application/json");
	 				//xhr.setRequestHeader("Content-Type", "application/json");
	 				//xhr.setRequestHeader('X-CSRF-Token', $('#secureToken').val());
	 				
	 			},
	 			success : function(data, textStatus, jqXHR) 
	 			{
	 				
	 				token=data;
	 				//alert("token Method "+token);
	 				
	 			
	 				
	 					},
	 			error : function(jqXHR, textStatus, errorThrown) {
	 				alert(textStatus);
	 			}
	 			
	 		});
	 		
	 		return token;
	 		

	 }
	
var table1;
var table2;
var table3;
function getAll(pillarValue)	
{	
	
	   var urlValue="pendinguserlist";
	   var userobject ={
	          		"pillarId":pillarValue,
	              	}
	   
	   
		$.ajax({
			type : 'POST', // define the type of HTTP verb we want to use (POST for our form)
			url : urlValue,
			async:false,// the url where we want to POST
		     data : JSON.stringify(userobject), // our data object
			beforeSend : function(xhr) {
				xhr.setRequestHeader("Accept", "application/json");
				xhr.setRequestHeader("Content-Type", "application/json");
				xhr.setRequestHeader('X-CSRF-Token', $('#secureToken').val());
			},
			dataType : 'json', // what type of data do we expect back from the server
			encode : true,
			success : function(data, textStatus, jqXHR) {
                 
                  table1 =$('#myTable1').DataTable( {
                	    "data": data[0],
                		"destroy": true,
                		"columns" : [ {
                		"data" : "loginId"
                		},
                		{
                			"data" : "userName"
                		},
                		{
                			"data" : "officeDesc"
                		},
                		
                		{
                			"data" : "userEmailId"
                		},{
                			"data" : "userMobileNo"
                		},
                		{
                			"data" : "enteredOn"
                		},
                		{
                			"data" : "enteredBy"
                		},
                		] ,
                		
                		"columnDefs" : [

                						{
                							"render" : function(data, type, row) {
                								return data+'<button type="button" class="btn btn-warning pull-right pendingView" ><i class="fa fa-pencil-square-o" aria-hidden="true"></i></button>'
                							//	return data+'<a class="edit btn btn-warning pull-right" ><i class="fa fa-pencil-square-o" aria-hidden="true"></i></a>';
                							},
                							"targets" : 6
                						} ]
                		,
                  scrollY:        200,
                  scrollCollapse: true,
                  paging:         false
                } );  
                 

                 table2 =$('#myTable2').DataTable( {
                	    "data": data[1],
                 		 "destroy": true,
                 		"columns" : [ {
                 			"data" : "loginId"
                 		}, {
                 			"data" : "userName"
                 		},
                 		{
                 			"data" : "officeDesc"
                 		},
                 		{
                 			"data" : "userEmailId"
                 		},{
                 			"data" : "userMobileNo"
                 		},
                 		{
                 			"data" : "activatedOn"
                 		},
                 		] ,
                 		
                 		"columnDefs" : [

                 						{
                 							"render" : function(data, type, row) {
                								return data+'<button type="button" class="btn btn-warning pull-right approveView" ><i class="fa fa-pencil-square-o" aria-hidden="true"></i></button>'
                 							},
                 							"targets" : 5
                 						} ]
                 		,
                 scrollY:        200,
                 scrollCollapse: true,
                 paging:         false
                 } );

                 table3 =$('#myTable3').DataTable( {
                	      "data": data[2],
                		 "destroy": true,
                		"columns" : [ {
                			"data" : "loginId"
                		}, {
                			"data" : "userName"
                		},
                		{
                			"data" : "officeDesc"
                		},
                		
                		{
                			"data" : "userEmailId"
                		},{
                			"data" : "userMobileNo"
                		},
                		{
                			"data" : "deactivatedOn"
                		},
                		] ,
                		
                		"columnDefs" : [

                						{
                							"render" : function(data, type, row) {
                								return data+'<button type="button" class="btn btn-warning pull-right deactiveView" ><i class="fa fa-pencil-square-o" aria-hidden="true"></i></button>'
                							},
                							"targets" : 5
                						} ]
                		,
                scrollY:        200,
                scrollCollapse: true,
                paging:         false
                } );
                 var token=GetNewToken();
				  $("#secureToken").val(token);
  
			},
			error : function(jqXHR, textStatus, errorThrown) {
				alert(textStatus, errorThrown);
			}
		
		});
	 
}      

              $(document).ready(function()
           {
            	  
            	  

            	  
            	  
            	  $(function() {
          			$(".select2").select2({
          				  dropdownAutoWidth : true,
          				    width:"300px",
          				 
          			}); 
          			
          			$(".selectrole").select2({
          				
          				  placeholder: "Select Roles",
          				  dropdownAutoWidth : true,
          				  width:"300px",
          				  multiple: true,
          				 
          				  }); 
          			/*if ($('.selectrole').data('select2')) {
          				
          				   $('.selectrole').select2('destroy');
          				   
          				 }*/
          		 
          			$('a[data-toggle="tab"]').on( 'shown.bs.tab', function (e) {
          		    
          				$.fn.dataTable.tables( {visible: true, api: true} ).columns.adjust();  
          		         
          			} );
          	 } );
                          $('#pillaridform').change(function(event) 
              			  {
              			   var pillarValue=document.getElementById("pillaridform").value;
              		       getAll(pillarValue);	
              		       });
                          
              		    	       $('#myTable1').on('click',".pendingView", function() {  
                    	         	
                    	         	 var urlValue="getroleByPillarforApprovel";
                    	      	   var userobject ={
                    	      	          		"pillarId":$('#pillaridform').val(),
                    	      	              	}
                    	      	   
                    	      	 
                    				$.ajax({
                  		  				type : 'POST', // define the type of HTTP verb we want to use (POST for our form)
                  		  				url : urlValue, // the url where we want to POST  url call after edit
                  		  				data : JSON.stringify(userobject), // our data object
                  		  				beforeSend : function(xhr) {
                  		  					xhr.setRequestHeader("Accept", "application/json");
                  		  					xhr.setRequestHeader("Content-Type", "application/json");
                  		  				xhr.setRequestHeader('X-CSRF-Token', $('#secureToken').val());
                  		  				},
                  		  				dataType : 'json', 
                  		  				encode : true,
                  		  				success : function(data, textStatus, jqXHR) 
                  		  				{
                  		  			
                  		  				var html = '<option value="-1">---Select  Role---</option>';
      									var len = data[0].length;
      								
      								  $.each(data[0], function(Key, Value) {
      									html += '<option value="' + Value.roleId + '">'
											+ Value.roleDesc
											+ '</option>';
      								  });
      								
      									html += '</option>';

      									$('#roleid').html(html); 
                  		  				},
                  		  				error : function(jqXHR, textStatus, errorThrown) {
                  		  					alert(textStatus, errorThrown);
                  		  				}
                  		  			});
                    				
                                
                    	          	var data = table1.row($(this).parent().parent()).data();
                         	         	
                         	            $("#userid").val(data.userId);
                         	         	$("#loginid").val(data.loginId);
                         	         	$("#officeDesc").val(data.officeDesc);
                         	         	$("#username").val(data.userName);
                         	         	$("#userdesignation").val(data.userDesignation);
                         	         	$("#emailid").val(data.userEmailId);
                         	         	$("#mobileno").val(data.userMobileNo);
                         	         	$("#enteredOn").val(data.enteredOn);
                         	         	$("#enteredBy").val(data.enteredBy);
                         	       	    $("#active").val("-1");
                         	      	    $("#roleid").val("-1");
                         	         	$("#pendingusermodal").modal("show");
                              });
                   
              		    	 
              		    	  $('#myTable2').on('click', '.approveView', function() {
              		    	  
              		    	  var data = table2.row($(this).parent().parent()).data();
              		    		$("#loginId").val(data.loginId);
              		    		$("#userName").val(data.userName);
              		    		$("#officeDesc1").val(data.officeDesc);
              		    		$("#activatedOn").val(data.activatedOn);
              		    		$("#activatedBy").val(data.activatedBy);
              		    		$("#active").val(data.activeStatus);
              		    		
              		    		if(data.activeStatus == 'Y'){
              		    			$("#deactivatedReson2").hide();	
              		    			$("#deactivatedReson1").hide();
              		    			$("#deactivatedReson").val(data.deactivatedReson);
              		    			$("#del").hide();
              		    			
              		    			}
              		    		$("#actived").change(function(){
              		    		 
              		    			if($("#actived").val()=='Y')
              		    			{
              		    				
              		    				$("#deactivatedReson1").hide();
              		    				$("#deactivatedReson2").hide();
              		    				$("#del").hide();
              		    			/*$("#deactivatedReson1").addClass("hidden");
              		    			$("#deactiveReason2").removeClass("hidden");*/
              		    			}
              		    		else if($("#actived").val()=='N')
              		    		{
              		    			
              		    			/*$("#deactiveReason2").addClass("hidden");
              		    			$("#deactivatedReson1").removeClass("hidden");*/
              		    			$("#deactivatedReson2").show();
              		    			$("#deactivatedReson1").hide();
              		    			$("#del").show();
              		    		}
              		    		 
              		    		});	
              		    		
              		    		$("#approvedusermodal").modal("show");
              		    		
              		    					
              		    	});

              		    	$('#myTable3').on('click', '.deactiveView', function() {
              		    	    var data = table3.row($(this).parent().parent()).data();
              		    		$("#userid").val(data.userId);
              		    		$("#loginIdr").val(data.loginId);
              		    		$("#userNamer").val(data.userName);
              		    		$("#officeDesc2").val(data.officeDesc);
              		    	//	$("#activatedByR").val( data.deactivatedBy);
              		    		$("#activatedByR").val(data.userName);
              		    		$("#activatedOnR").val(data.deactivatedOn);
              		    		$("#deactivatedResondr").val(data.deactivatedReson);
              		    		$("#activatedBy").val(data.activatedBy);
              		    		$("#activedr").val(data.activeStatusf);
              		    		if(data.activeStatusf == 'Y'){
              		    		$("#deactivatedReson2").hide();	
              		    		$("#deactivatedReson").val(data.deactivatedReson);
              		    		}
              		    		$("#reapprovedusermodal").modal("show");
              		    		
              		    					
              		    	});

              		    	$("#pendingSave").click(function() {

              		    	
              		      
                                	var pillarValueGlobal=$('#pillaridform').val();
                    		          var userobject ={
                    		          		"pillarId":$('#pillaridform').val(),
                    		                "loginId" :$('#loginid').val(),
                    		                "activeStatus" :$('#active').val(),
                    		  		        "assignRoleList" : $('#roleid').val()
                    		  				}
              		  			$.ajax({
              		  				type : 'POST', // define the type of HTTP verb we want to use (POST for our form)
              		  				url : 'pendinguserapproval', // the url where we want to POST  url call after edit
              		  				data : JSON.stringify(userobject), // our data object
              		  				beforeSend : function(xhr) {
              		  					xhr.setRequestHeader("Accept", "application/json");
              		  					xhr.setRequestHeader("Content-Type", "application/json");
              		  				xhr.setRequestHeader('X-CSRF-Token', $('#secureToken').val());
              		  				},
              		  				dataType : 'json', 
              		  				encode : true,
              		  				success : function(data, textStatus, jqXHR) {
              		  					
              		  					if(data==1)
              		  					{
              		  				       alert("User aprroved successfully");
              		  				       getAll(pillarValueGlobal);
              		  				       $("#pendingusermodal").modal("hide");
              		  					
              		  					}
              		  					else{					
              		  						alert("User not aprroved");	                			
              		  				}
              		  				},
              		  				error : function(jqXHR, textStatus, errorThrown) {
              		  					alert(textStatus, errorThrown);
              		  				}
              		  			});
                           
              		  			});
              		    	
              		       
              		    	 $("#del").click(function() { 
               		    		var pillarValueGlobal=$('#pillaridform').val();

              		    	     var userobject ={
              		    	    		"pillarId":$('#pillaridform').val(),
                  		                  "loginId" :$('#loginId').val(),
              		    	          "activeStatusf":$('#actived').val(),
              		    	          "deactivatedResonf" :$('#deactivatedResondd').val(),
              		    	          
              		    	          
              		    				}
              		    	     
              		    			$.ajax({
              		    				type : 'POST', // define the type of HTTP verb we want to use (POST for our form)
              		    				url : 'aproveduserdeactivation', // the url where we want to POST  url call after edit
              		    				data : JSON.stringify(userobject), // our data object
              		    				beforeSend : function(xhr) {
              		    					xhr.setRequestHeader("Accept", "application/json");
              		    					xhr.setRequestHeader("Content-Type", "application/json");
              		    					xhr.setRequestHeader('X-CSRF-Token', $('#secureToken').val());
              		    				},
              		    				dataType : 'json', 
              		    				encode : true,
              		    				success : function(data, textStatus, jqXHR) {
              		    					
              		    				
              		    					if(data==1){
              		    				       alert("User Deactivated successfully");
              		    				       getAll(pillarValueGlobal);
              		    				       $("#approvedusermodal").modal("hide");
              		    					}
              		    					else{					
              		    						alert("User not Deactivated");	                			
              		    				}
              		    				},
              		    				error : function(jqXHR, textStatus, errorThrown) {
              		    					//alert(textStatus, errorThrown);
              		    					alert("Can not be saved !@!!!!!!")
              		    				}
              		    			});
              		    			});
	
           
           });
              
              
                           


























/*
var pillarValueGlobal="";
 function getAll123(pillarValue)
 {
	 pillarValueGlobal=pillarValue
	 $(function() {
			$(".select2").select2({
				  dropdownAutoWidth : true,
				    width:"300px",
				 
			}); 
			
			$(".selectrole").select2({
				
				  placeholder: "Select Roles",
				  dropdownAutoWidth : true,
				  width:"300px",
				  multiple: true,
				 
				  }); 
			if ($('.selectrole').data('select2')) {
				
				   $('.selectrole').select2('destroy');
				   
				 }
		 
			$('a[data-toggle="tab"]').on( 'shown.bs.tab', function (e) {
		    
				$.fn.dataTable.tables( {visible: true, api: true} ).columns.adjust();  
		         
			} );
	 } );
	 
	
var urlValue="pendinguserlist/"+pillarValue+"";
var table1 =$('#myTable1').DataTable( {
	

	 "ajax" : {
			"url":urlValue,		
			
		},
		"destroy": true,
		"columns" : [ {
		"data" : "loginId"
		},
		{
			"data" : "userName"
		},
		{
			"data" : "officeDesc"
		},
		
		{
			"data" : "userEmailId"
		},{
			"data" : "userMobileNo"
		},
		{
			"data" : "enteredOn"
		},
		{
			"data" : "enteredBy"
		},
		] ,
		
		"columnDefs" : [

						{
							"render" : function(data, type, row) {
								return data+'<a class="edit btn btn-warning pull-right" ><i class="fa fa-pencil-square-o" aria-hidden="true"></i></a>';
							},
							"targets" : 6
						} ]
		,
  scrollY:        200,
  scrollCollapse: true,
  paging:         false
} );
   $('#myTable1 tbody').on('click', '.edit', function() {
    var data = table1.row($(this).parent().parent()).data();
    userid = data.userId;
	var loginid = data.loginId;
	var officeid = data.officeId;
	var officeDesc = data.officeDesc;
	var username = data.userName; 
	var userdesignation = data.userDesignation; 
	var emailid = data.userEmailId; 
	var mobileno = data.userMobileNo; 
	var enteredOn = data.enteredOn; 
	var activestatus = data.activeStatus; 	
	var enteredBy= data.enteredBy;
	
	console.log(data);
	
	$("#userid").val(userid);
	$("#loginid").val(loginid);
	$("#officeDesc").val(officeDesc);
	$("#username").val(username);
	$("#userdesignation").val(userdesignation);
	$("#emailid").val(emailid);
	$("#mobileno").val(mobileno);
	$("#enteredOn").val(enteredOn);
	$("#enteredBy").val(enteredBy);
	$("#active").val(activestatus);
	$("#pendingusermodal").modal("show");
	
				
});
$("#sav").click(function() { 
	
        var userobject ={
        		"pillarId":pillarValueGlobal,
        
        		"userId" :userid,
              "loginId" :$('#loginid').val(),
              "activeStatus" :$('#active').val(),
		      "assignRoleList" : $('.selectrole').val()
				}
			$.ajax({
				type : 'POST', // define the type of HTTP verb we want to use (POST for our form)
				url : 'pendinguserapproval', // the url where we want to POST  url call after edit
				data : JSON.stringify(userobject), // our data object
				beforeSend : function(xhr) {
					xhr.setRequestHeader("Accept", "application/json");
					xhr.setRequestHeader("Content-Type", "application/json");
					
				},
				dataType : 'json', 
				encode : true,
				success : function(data, textStatus, jqXHR) {
					
					if(data.activeStatus == "Y"){
				       alert("User aprroved successfully");
				       getAll(pillarValueGlobal);
				       $("#pendingusermodal").modal("hide");
					
					}
					else{					
						alert("User not aprroved");	                			
				}
				},
				error : function(jqXHR, textStatus, errorThrown) {
					alert(textStatus, errorThrown);
				}
			});
			});

var urlValue="approveduserlist/"+pillarValue+"";

var table2 =$('#myTable2').DataTable( {
	 "ajax" : {
			"url":	urlValue,					
		}
		,
		 "destroy": true,
		"columns" : [ {
			"data" : "loginId"
		}, {
			"data" : "userName"
		},
		{
			"data" : "officeDesc"
		},
		{
			"data" : "userEmailId"
		},{
			"data" : "userMobileNo"
		},
		{
			"data" : "activatedOn"
		},
		] ,
		
		"columnDefs" : [

						{
							"render" : function(data, type, row) {
								return data+'<a class="edit btn btn-warning pull-right" ><i class="fa fa-pencil-square-o" aria-hidden="true"></i></a>';
							},
							"targets" : 5
						} ]
		,
scrollY:        200,
scrollCollapse: true,
paging:         false
} );



$('#myTable2 tbody').on('click', '.edit', function() {
    var data = table2.row($(this).parent().parent()).data();
    
    var loginId = data.loginId;
    var userName= data.userName;
	var officeDesc = data.officeDesc;
	var activatedOn = data.activatedOn; 
	var activatedBy= data.activatedBy;
	var activestatus = data.activeStatus; 
	var deactivatedReson= data.deactivatedReson;
	
	console.log(data);
	$("#loginId").val(loginId);
	$("#userName").val(userName);
	$("#officeDesc1").val(officeDesc);
	$("#activatedOn").val(activatedOn);
	$("#activatedBy").val(activatedBy);
	$("#active").val(activestatus);
	
	if(activestatus == 'Y'){
		$("#deactivatedReson2").hide();	
		$("#deactivatedReson1").hide();
		$("#deactivatedReson").val(deactivatedReson);
		$("#del").hide();
		
		}
	$("#actived").change(function(){
	 
		if($("#actived").val()=='Y')
		{
			
			$("#deactivatedReson1").hide();
			$("#deactivatedReson2").hide();
			$("#del").hide();
		$("#deactivatedReson1").addClass("hidden");
		$("#deactiveReason2").removeClass("hidden");
		}
	else if($("#actived").val()=='N')
	{
		
		$("#deactiveReason2").addClass("hidden");
		$("#deactivatedReson1").removeClass("hidden");
		$("#deactivatedReson2").show();
		$("#deactivatedReson1").hide();
		$("#del").show();
	}
	 
	});	
	
	$("#approvedusermodal").modal("show");
	
				
});


	
  $("#del").click(function() { 
	
     var userobject ={
    		 
    	  "pillarId":pillarValueGlobal,
    
          "userId" :$('#userid').val(),
          "loginId" :$('#loginId').val(),
          "activeStatusf":$('#actived').val(),
          "deactivatedResonf" :$('#deactivatedResondd').val(),
          
          
			}
     
		$.ajax({
			type : 'POST', // define the type of HTTP verb we want to use (POST for our form)
			url : 'aproveduserdeactivation', // the url where we want to POST  url call after edit
			data : JSON.stringify(userobject), // our data object
			beforeSend : function(xhr) {
				xhr.setRequestHeader("Accept", "application/json");
				xhr.setRequestHeader("Content-Type", "application/json");
				
			},
			dataType : 'json', 
			encode : true,
			success : function(data, textStatus, jqXHR) {
				
				 
				if($('#actived').val() == "N"){
			       alert("User Deactivated successfully");
			       				
			       getAll(pillarValueGlobal);
			       $("#approvedusermodal").modal("hide");
				}
				else{					
					alert("User not Deactivated");	                			
			}
			},
			error : function(jqXHR, textStatus, errorThrown) {
				//alert(textStatus, errorThrown);
				alert("Can not be saved !@!!!!!!")
			}
		});
		});

var table3 =$('#myTable3').DataTable( {
	 "ajax" : {
			"url":	"deactivateduserlist/"+pillarValue+"",					
		}
		,
		 "destroy": true,
		"columns" : [ {
			"data" : "loginId"
		}, {
			"data" : "userName"
		},
		{
			"data" : "officeDesc"
		},
		
		{
			"data" : "userEmailId"
		},{
			"data" : "userMobileNo"
		},
		{
			"data" : "deactivatedOn"
		},
		] ,
		
		"columnDefs" : [

						{
							"render" : function(data, type, row) {
								return data+'<a class="edit btn btn-warning pull-right" ><i class="fa fa-pencil-square-o" aria-hidden="true"></i></a>';
							},
							"targets" : 5
						} ]
		,
scrollY:        200,
scrollCollapse: true,
paging:         false
} );



$('#myTable3 tbody').on('click', '.edit', function() {
    var data = table3.row($(this).parent().parent()).data();
    
    var  userid = data.userId;
    var loginId = data.loginId;
    var userName= data.userName;
	var officeDesc = data.officeDesc;
	var activatedByR = data.deactivatedBy; 
	var activatedOnR = data.deactivatedOn;
	var activatedBy= data.activatedBy;
	var activestatus = data.activeStatusf; 
	var deactivatedResondr= data.deactivatedReson;
	
	console.log(data);
	 
	
	$("#userid").val(userid);
	$("#loginIdr").val(loginId);
	$("#userNamer").val(userName);
	 
	$("#officeDesc2").val(officeDesc);
	$("#activatedByR").val(activatedByR);
	$("#activatedOnR").val(activatedOnR);
	$("#deactivatedResondr").val(deactivatedResondr);
	 
	$("#activatedBy").val(activatedBy);
	
	$("#activedr").val(activestatus);
	
	if(activestatus == 'Y'){
	$("#deactivatedReson2").hide();	
	$("#deactivatedReson").val(deactivatedReson);
	
	}
	$("#reapprovedusermodal").modal("show");
});


 }















//process the form
$(function() {
	$(".select2").select2({
		  dropdownAutoWidth : true,
		    width:"300px",
		     multiple: true,
		    placeholder: "Select a S", 
	}); 
	
	$(".selectrole").select2({
		
		placeholder: "Select Roles",
		 dropdownAutoWidth : true,
		  width:"300px",
		     multiple: true,
		    
	}); 
 
	$('a[data-toggle="tab"]').on( 'shown.bs.tab', function (e) {
        $.fn.dataTable.tables( {visible: true, api: true} ).columns.adjust();  
    } );
 
var table1 =$('#myTable1').DataTable( {
	 "ajax" : {
			"url":	"pendinguserlist",					
		}
		,
		"columns" : [ {
			"data" : "loginId"
		}, {
			"data" : "userName"
		},
		{
			"data" : "officeDesc"
		},
		
		{
			"data" : "userEmailId"
		},{
			"data" : "userMobileNo"
		},
		{
			"data" : "activatedOn"
		},
		] ,
		
		"columnDefs" : [

						{
							"render" : function(data, type, row) {
								return data+'<a class="edit btn btn-warning pull-right" ><i class="fa fa-pencil-square-o" aria-hidden="true"></i></a>';
							},
							"targets" : 5
						} ]
		,
  scrollY:        200,
  scrollCollapse: true,
  paging:         false
} );
$('#myTable1 tbody').on('click', '.edit', function() {
    var data = table1.row($(this).parent().parent()).data();
    var userid = data.userId;
	var loginid = data.loginId;
	var officeid = data.officeId;
	var username = data.userName; 
	var userdesignation = data.userDesignation; 
	var emailid = data.userEmailId; 
	var mobileno = data.userMobileNo; 
	var activatedon = data.activatedOn; 
	var activestatus = data.activeStatus; 	
	console.log(data);
	$("#userid").val(userid);
	$("#loginid").val(loginid);
	$("#officeid").val(officeid);
	$("#username").val(username);
	$("#userdesignation").val(userdesignation);
	$("#emailid").val(emailid);
	$("#mobileno").val(mobileno);
	$("#activatedon").val(activatedon);
	$("#active").val(activestatus);
	$("#pendingusermodal").modal("show");
	//alert( 'value='+$(this).parent().parent().find('td.sorting_1').html() );			
});
$("#sav").click(function() { 
	alert("Hi"+$('.selectrole').val());
	//var rolelist=($('assignRoleList').val()).spsplit(',');
        var userobject ={
              "loginId" :$('#loginid').val(),
              "activeStatus" :$('#active').val(),
		      "assignRoleList" : $('.selectrole').val()
				}
			$.ajax({
				type : 'POST', // define the type of HTTP verb we want to use (POST for our form)
				url : 'pendinguserapproval', // the url where we want to POST
				data : JSON.stringify(userobject), // our data object
				beforeSend : function(xhr) {
					xhr.setRequestHeader("Accept", "application/json");
					xhr.setRequestHeader("Content-Type", "application/json");
					//xhr.setRequestHeader('X-CSRF-Token', $('#secureToken').val());
				},
				dataType : 'json', // what type of data do we expect back from the server
				encode : true,
				success : function(data, textStatus, jqXHR) {
					
					if(data.status == "SUCCESS"){
				       alert("State added successfully");
					//onceagain();
					//$("#statmodal").modal("hide");
					}
					else{					
				alert("Hi");			                			
				}
				},
				error : function(jqXHR, textStatus, errorThrown) {
					alert(textStatus, errorThrown);
				}
			});
			});

var table2 =$('#myTable2').DataTable( {
	 "ajax" : {
			"url":	"approveduserlist",					
		}
		,
		"columns" : [ {
			"data" : "loginId"
		}, {
			"data" : "userName"
		},
		{
			"data" : "officeDesc"
		},
		
		{
			"data" : "userEmailId"
		},{
			"data" : "userMobileNo"
		},
		{
			"data" : "activatedOn"
		},
		] ,
		
		"columnDefs" : [

						{
							"render" : function(data, type, row) {
								return data+'<a class="edit btn btn-warning pull-right" ><i class="fa fa-pencil-square-o" aria-hidden="true"></i></a>';
							},
							"targets" : 5
						} ]
		,
scrollY:        200,
scrollCollapse: true,
paging:         false
} );



var table3 =$('#myTable3').DataTable( {
	 "ajax" : {
			"url":	"deactivateduserlist",					
		}
		,
		"columns" : [ {
			"data" : "loginId"
		}, {
			"data" : "userName"
		},
		{
			"data" : "officeDesc"
		},
		
		{
			"data" : "userEmailId"
		},{
			"data" : "userMobileNo"
		},
		{
			"data" : "deactivatedOn"
		},
		] ,
		
		"columnDefs" : [

						{
							"render" : function(data, type, row) {
								return data+'<a class="edit btn btn-warning pull-right" ><i class="fa fa-pencil-square-o" aria-hidden="true"></i></a>';
							},
							"targets" : 5
						} ]
		,
scrollY:        200,
scrollCollapse: true,
paging:         false
} );




});


 




*/