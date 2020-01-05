function checkId(value)
{
	var min_chars = 3;
	if($('#loginid').val().length < min_chars){  
        //if it's bellow the minimum show characters_error text '  
        $('#loginId_availability_result').html("Minimum 3 characters required for login id");  
    }else{
    	
    	$.ajax({
            type: "GET",
            url: "registerUser/userAvailable",
           data: {'loginId' : value},
           contentType : "application/json", 
          
   		   dataType : 'json',
            success: function(object){
            	
            if(object.status=="ok"){
        	$('#loginId_availability_result').removeClass("error");
            	$('#loginId_availability_result').addClass("success");
         	   $('#loginId_availability_result').html(object.msg); 
         
         	  
            }else{
            
            	$('#loginId_availability_result').removeClass("success");
          	  $('#loginId_availability_result').addClass("error");
            	  $('#loginId_availability_result').html(object.msg); 
            }
            }
         });
    }
}

function hideText(){
	$('#loginId_availability_result').html(""); 
}

/*function validateRegForm(){
	if($('#username').val() == ""){
		$('#username_availability_result').html("UserName is required");
	}
	 
}*/

/*$(document).ready(function() {  
  
        //the min chars for username  
        var min_chars = 3;  
  
        //result texts  
        var characters_error = 'Minimum amount of chars is 3';  
        var checking_html = 'Checking...';  
  
        //when button is clicked  
        $('#check_username_availability').click(function(){  
            //run the character number check  
            if($('#loginid').val().length < min_chars){  
                //if it's bellow the minimum show characters_error text '  
                $('#username_availability_result').html(characters_error);  
            }else{  
                //else show the cheking_text and run the function to check  
                $('#username_availability_result').html(checking_html);  
                check_availability();  
            }  
        });  
  
  });  
  
//function to check username availability  
function check_availability(){  
  
        //get the username  
        var username = $('#loginid').val();  
  
        //use ajax to run the check  
        $.post("check_username.php", { username: username },  
            function(result){  
                //if the result is 1  
                if(result == 1){  
                    //show that the username is available  
                    $('#username_availability_result').html(username + ' is Available');  
                }else{  
                    //show that the username is NOT available  
                    $('#username_availability_result').html(username + ' is not Available');  
                }  
        });  
  
}  */

