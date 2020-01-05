<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<spring:htmlEscape defaultHtmlEscape="true" />
<style>
/* #main-header{ background-image: url(${pageContext.request.contextPath}/resources/images/govt_of_ind_logo2.png);} */
/*------------------------------Main Header css Starts----------------------------------------------------  */
#main-header {position: relative; width: 100%; top: 0; z-index: 1; margin: 0; padding: 0; background-color: #044073 ; background-image: url(resources/images/govt_of_ind_logo2.png); background-repeat: no-repeat; background-size: 3% 95%; background-position: 10% 73%;}
#header-wrap{position: relative; width: 100%; top: 0; z-index: 1;  margin: 0; padding: 0; background-color:   rgb(61, 132, 193); background-repeat: no-repeat; background-size: 6% 90%; background-position:10% 73%;}
.login_header{ padding:20px 0; margin: 0; background-image:url(resources/images/digital_india.png); background-repeat: no-repeat; background-position: right 10px; background-size: 10% 80%;}
.login_logo{ padding:0; margin:0;}
.login_logo img{ padding:0; margin:0;}
.login_header h3{margin: 0; font-family: sans-serif; font-size: 26px; font-weight: 600; padding: 0; color: #f8f7f1; text-align: center;}
.login_header p{margin: 0; font-size: 16px; font-family: sans-serif; padding: 3px 0 0; color: #f8f7f1; text-align: center;}
/*------------------------------Main Header css Ends----------------------------------------------------  */   
</style>
<script src="<c:url value='/resources/bootstrap/js/disableBackk.js'/>"></script>
<script type = "text/javascript" >
 function burstCache() {
 if (!navigator.onLine) 
 {
 document.body.innerHTML = 'Loading...';
 window.location = 'ErrorPage.html';
 }
 } 
 
 burstCache();
 
 
 </script>


<header id="main-header">
    <%-- <div class="container"> 
        <div class="col-sm-12 login_header"> 
        	 
        	 <h3><a style="color:white" href="${pageContext.request.contextPath}"> Monitoring Tools For ICJS System</a></h3>
        	 <p>( Ministry of Home Affairs, Government of India )</p>
       
    </div>
 </div> --%>
 <div class="container"> 
        <div class="col-sm-12 login_header"> 
        	 
        	 <h3><a style="color:white" href="#"> Monitoring Tools</a></h3>
       
    </div>
 </div>
 
</header>