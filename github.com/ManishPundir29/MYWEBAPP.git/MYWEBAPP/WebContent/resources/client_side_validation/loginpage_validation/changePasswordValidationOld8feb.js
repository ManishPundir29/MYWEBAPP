$(document).ready(
			function() {

				$("#submit").click(
						function() {
							 if($('#currentPassword').val()=='')
						       {
						    	   alert("Current Password must not be blank");
						    	   $('#currentPassword').focus();
						    	   return false;    	  
						    	}
							 else if($('#newPassword').val()=='')
						       {
						    	   alert("New Password must not be blank");
						    	   $('#newPassword').focus();
						    	   return false;    	  
						    	}
							 
							 var passregex=/^(?=.*\d)(?=.*[a-z])(?=.*[!@#$%^&*()_])(?=.*[A-Z]).{8,20}$/;
						      
						        if(!passregex.test($('#newPassword').val()))
						       {
						    	  
						    	   alert("New Password must be at least 8 characters and must include at least one upper case letter,at least one special Character, one lower case letter, and one numeric digit");
						    	   $('#newPassword').focus();
						    	   return false; 
						       }
						        else if($('#confirmPassword').val()=='')
							       {
							    	   alert("Confirm Password must not be blank");
							    	   $('#confirmPassword').focus();
							    	   return false;    	  
							    	}
								 
								 var passregex=/^(?=.*\d)(?=.*[a-z])(?=.*[!@#$%^&*()_])(?=.*[A-Z]).{8,20}$/;
							      
							        if(!passregex.test($('#confirmPassword').val()))
							       {
							    	  
							    	   alert(" New Password must be at least 8 characters and must include at least one upper case letter,at least one special Character, one lower case letter, and one numeric digit");
							    	   $('#confirmPassword').focus();
							    	   return false; 
							       }
							
							var curpass = $("#currentPassword").val();
							var newpass = $("#newPassword").val();
							var confirmpass = $("#confirmPassword").val();
							var SHA256cur = new Hashes.SHA256()
									.hex(new Hashes.SHA256().hex(curpass)
											+ $("#randSalt").val());
							var SHA256new = new Hashes.SHA256().hex(newpass);
							var SHA256confirm = new Hashes.SHA256()
									.hex(confirmpass);
							$("#currentPassword").val(SHA256cur);
							//alert("1"+$("#currentPassword").val());
							$("#newPassword").val(SHA256new);
							//alert("2"+$("#newPassword").val());
							$("#confirmPassword").val(SHA256confirm);
							//alert("3"+$("#confirmPassword").val());

						});

			});