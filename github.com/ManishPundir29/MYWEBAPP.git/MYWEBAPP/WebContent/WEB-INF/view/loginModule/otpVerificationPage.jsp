<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<title>OTP Verification</title>

<link rel="stylesheet" type="text/css" href="<c:url value='/resources/plugins/landingpage/screen.css'/> " /> 
 
<script
	src="<c:url value='/resources/jquery-validation-1.15.1/dist/jquery.validate.js'/>"
	type="text/javascript"></script>
<script
	src="<c:url value='/resources/jquery-validation-1.15.1/dist/additional-methods.js'/>"
	type="text/javascript"></script>
<script
	src="<c:url value='/resources/client_side_validation/loginpage_validation/loginPageValidation.js?resource=${resourceCsrf}'/>"
	type="text/javascript"></script> 
 
<style type="text/css">
.inpt
{
height:35px !important;
}
.login_box{width: 500px;
margin: 0 auto;}
.main-footer{position:fixed; left:0px; bottom:0px; width:100%;}
.panel-info>.panel-heading {
    color: #fff;
    background-color: #044073;
    border-color: #044073;
}
.panel{box-shadow: none; border: 0px;     box-shadow: 14px 10px 29px -12px;
    -webkit-box-shadow: 14px 10px 29px -12px;
    -moz-box-shadow: 14px 10px 29px -12px;
    -o-box-shadow: 14px 10px 29px -12px;
    -ms-box-shadow: 14px 10px 29px -12px;
    -moz-box-shadow: 14px 10px 29px -12px; border: 1px solid #044073;}
</style>

<script type="text/javascript">


/* function resendOtp(){
   var counter=0;
	    $.ajax({
	        type: 'POST', 
	        url: 'getotp',  
	        encode: true,
	        async: false,
	        beforeSend: function(xhr) {
	            
	        },
	        success: function(data, textStatus, jqXHR) {
	        	 counter=counter+1;
	     	    if(counter == 1){
	     	    $('#lnkresend').hide();
	     	    }
	        	
	        },
	        error: function(jqXHR, textStatus, errorThrown) {
	            alert(textStatus);
	        }

	    });
	   
	    
	    $("#tshow").timer('remove');
	    
	    $("#tshow").timer({ 
	    	action: 'start',
	    	 duration: '2m',
		     countdown: true,
		     format: '%M:%S Seconds Remaining',
		     callback: function() {
		     window.location = "http://10.25.214.73:8080/digitalpolice/";
		   
		      //  window.location.assign("https://digitalpolice.gov.in")
		     
		     // window.location = "https://digitalpolice.gov.in/";
		     }
	    });
	    
	    
	    var token = GetNewToken();
        $("#secureToken").val(token);
 }  */
</script>



<script type="text/javascript">
function startTimer(duration, display) {
    var timer = duration, minutes, seconds;
    setInterval(function () {
        minutes = parseInt(timer / 60, 10)
        seconds = parseInt(timer % 60, 10);

        minutes = minutes < 10 ? "0" + minutes : minutes;
        seconds = seconds < 10 ? "0" + seconds : seconds;

 //       display.textContent = minutes + ":" + seconds;

        if (--timer < 0) {
        	/* alert('time over'); */
  
           /*  timer = duration; */
        }
    }, 1000);
}

window.onload = function () {
    var fiveMinutes = 60 * 2,
        display = document.querySelector('#time');
    startTimer(fiveMinutes, display);
};


var xmlHttp;
function srvTime(){
    try {
        //FF, Opera, Safari, Chrome
        xmlHttp = new XMLHttpRequest();
    }
    catch (err1) {
        //IE
        try {
            xmlHttp = new ActiveXObject('Msxml2.XMLHTTP');
        }
        catch (err2) {
            try {
                xmlHttp = new ActiveXObject('Microsoft.XMLHTTP');
            }
            catch (eerr3) {
                //AJAX not supported, use CPU time.
                alert("AJAX not supported");
            }
        }
    }
    xmlHttp.open('HEAD',window.location.href.toString(),false);
    xmlHttp.setRequestHeader("Content-Type", "text/html");
    xmlHttp.send('');
    return xmlHttp.getResponseHeader("Date");
}

var st = srvTime();
var date = new Date(st);

var minutes = date.getMinutes(); //returns 0-59
var seconds = date.getSeconds();
/* alert(minutes);
alert(seconds); */

</script> 
<!--   <script>
  document.write("Server time is: " + date);
  </script> -->


<div class="container-fluid"> 
 	<div class="container"> 
 	 <div id="banner" style="margin:0px !important; padding:0px !important;">
		<div id="inner-banner">
			<div class="container">
				<div id="st1_dvhome" style="float:left !important; vertical-align:middle; padding-left:20px;"><a href="http://digitalpolice.gov.in" style="text-decoration:none;"><i class="fa fa-home fa-2x" style="color:#fff;display:block;line-height: inherit;"></i></a></div>
				<div class="row-fluid" style="text-align:center !important;">
					<!-- <h1 style="text-align:center !important;"><span id="st1_lblheading">Online Crime Reporting</span></h1> -->
					
				</div>
			</div>
		
		</div>
	</div>

</div>
 </div>

<form:form modelAttribute="otpvar" id="otpvarify" method="post" action="home">
 

<div class="container-fluid">
  <div class="container">
    
    
    <div class="login_page">
      <div class="login_box mart40">
          <div class="panel panel-info">
              <div class="panel-heading">
				<div class="panel-title text-center">OTP Verification</div>
			  </div>
			  <div class="panel-body">
			   <div class="center" style="padding: 5px; color: green; text-align: center;" id="msg">
							${msg}
						</div>
            <div id="sectionA" class="tab-pane">
                <label class="text-center" style="float: left; width: 100%;">Enter OTP</label>
                <div class="form-group">
                  <form:input id="txtotp" path="otp" type="password"   class="form-control inpt" placeholder="XXXXXX" maxlength="6" autofocus="autofocus"/>
                  <form:errors path="otp" class="FeRror"></form:errors>   
                   <div class="FeRror"></div>
                </div>
                  
                  <div class="form-group text-center">
                  <input type="hidden" name="secureToken" value="${csrf_security_token}" id="secureToken" />
                
                  <button type="submit" name="btnok" id="submit11" class="btn btn-info">Submit </button>
                  
                  <a id="lnkresend" onclick="resendOtp();">Resend OTP</a>
								<!-- <div>Registration closes in <span id="time">02:00</span> minutes!</div> -->
				  </div>				
							</div>
            </div>
          	
          <div class="center" style="color: red; text-align: center;" id="error">
							${error}
						</div>
						</div>
        </div>  
      </div>  
    </div>
  </div>    
 
 

<!-- <uc2:sitefooter ID="sf1" runat="server" /> -->
</form:form>
 
 
 
 