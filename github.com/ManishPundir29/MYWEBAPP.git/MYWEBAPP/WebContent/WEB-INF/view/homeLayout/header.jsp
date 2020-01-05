<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<spring:htmlEscape defaultHtmlEscape="true" />


 <script>
$(document).ready(function(){
	$("#signOut").click(function(){
		$("#logOut").submit();
	});
	
	 var name = '<%= session.getAttribute("hideShow") %>';
	 if(name === null || name === "null" || name === ""){
		   }
		   else{
		   }
});
</script> 


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
 
 
 function  hideandshow(){
	// alert('12');
	 var name = '<%= session.getAttribute("hideShow") %>';
	 $('#im').find().each(function(index){
		 $(this).addClass('hide');
	 });
	// alert(name);
 }
 
 
 
 </script>
<style>
#header2 {
    background-color: #e08e0b;
    color: #ffffff;
    border-bottom: 0 solid transparent;
}
.helpManual{background-color: transparent; padding:0px !important; top:50px !important; border: 1px solid rgba(0,0,0,.15);}
.helpManual:before{content: ""; border-bottom: 10px solid #fff; border-right: 10px solid transparent; border-left: 10px solid transparent; position: absolute; top: -10px; right: 55px; z-index: 10;}
.helpManual li{background-color: transparent; text-align: center;}
.helpManual li a{padding:5px 0 !important; color: #333 !important; border-bottom: 1px solid #ddd; background: #fff;}
.helpManual li a:hover{background: #044073 !important; color: #fff !important;}
.arrow-icon {
    width: auto;
    display: inline-block;
    padding: 0px 0px 0px 0px;
    margin: 25px auto 0 0px;
    position: relative;
    cursor: pointer;
    border-radius: 4px; 
}

.left-bar {
  position: absolute;
  background-color: transparent;
  top: 0;
  left: 0;
  width: 20px;
  height: 5px;
  display: block;
  transform: rotate(35deg);
  
  border-radius: 2px;
}
.left-bar:after {
  content: "";
  background-color: white;
  width: 20px;
  height: 5px;
  display: block;
  
  border-radius: 6px 10px 10px 6px;
  transition: all 0.5s cubic-bezier(0.25, 1.7, 0.35, 0.8);
  z-index: -1;
}

.right-bar {
  position: absolute;
  background-color: transparent;
  top: 0px;
  left: 13px;
  width: 20px;
  height: 5px;
  display: block;
  transform: rotate(-35deg);
  border-radius: 2px;
}
.right-bar:after {
  content: "";
  background-color: white;
  width: 20px;
  height: 5px;
  display: block;
  border-radius: 10px 6px 6px 10px;
  transition: all 0.5s cubic-bezier(0.25, 1.7, 0.35, 0.8);
  z-index: -1;
}

#header-collapse{
    width: 20px;
    height: 15px;
    margin-left: 250px;
    margin-top: 10px;
}

.open .left-bar:after {
  transform-origin: center center;
  transform: rotate(-70deg);
}
.open .right-bar:after {
  transform-origin: center center;
  transform: rotate(70deg);
}
.bounce {
  display: inline-block;
  position: relative;
  -moz-animation: bounce 0.5s infinite linear;
  -o-animation: bounce 0.5s infinite linear;
  -webkit-animation: bounce 0.5s infinite linear;
  animation: bounce 0.5s infinite linear;
}
@-webkit-keyframes bounce {
    0% { top: 0; }
    50% { top: -0.2em; }
    70% { top: -0.3em; }
    100% { top: 0; }
}
@-moz-keyframes bounce {
    0% { top: 0; }
    50% { top: -0.2em; }
    70% { top: -0.3em; }
    100% { top: 0; }
}
@-o-keyframes bounce {
    0% { top: 0; }
    50% { top: -0.2em; }
    70% { top: -0.3em; }
    100% { top: 0; }
}
@-ms-keyframes bounce {
    0% { top: 0; }
    50% { top: -0.2em; }
    70% { top: -0.3em; }
    100% { top: 0; }
}
@keyframes bounce {
    0% { top: 0; }
    50% { top: -0.2em; }
    70% { top: -0.3em; }
    100% { top: 0; }
}
</style>
<div class="hold-transition">
<c:set var="hometoken" value="${csrf_security_token}"/> 

<header class="main-header" id="header2">
  <a href="home?secureToken=${hometoken}" class="logo">
      <!-- mini logo for sidebar mini 50x50 pixels -->
      <span class="logo-mini" id="im"><span class="glyphicon glyphicon-home"></span></span>
      <!-- logo for regular state and mobile devices -->
     <!--  <span class="logo-lg" id = "wr">Home</span> -->
      <span class="logo-lg" id="wr"><span class="glyphicon glyphicon-home" style="font-size: 28px; margin-top: 12px;"></span></span>
    </a>
  <!-- Header Navbar: style can be found in header.less -->
  <nav class="navbar navbar-static-top" role="navigation" style="text-align: center;">
  <!-- Sidebar toggle button-->
      <a href="#" class="sidebar-toggle" onclick="hideandshow();" data-toggle="offcanvas" role="button">
        <span class="sr-only">Toggle navigation</span>
        <!-- <button class="btn btn-primary" id="header-collapse" value="button" style="margin:-12px 0 -10px 0;">Close</button> -->
        <!-- <i class="fa fa-arrows-alt"  aria-hidden="true"></i> -->
      </a>
       <a id="header-collapse" class="arrow-icon open" title="Click Here For Hide and Show Header" style="width: 20px; height: 15px;" data-toggle="tooltip">
            <span class="left-bar"></span>
            <span class="right-bar"></span>
        </a>
      
      <span style="font-size: large; font-weight: bold;position:relative; top:10px">${header_heading}</span>
  
<!-- Navbar Right Menu -->
    <div class="navbar-custom-menu">
     
      <ul class="nav navbar-nav" style="float: left;">
        <li>
        </li>
        <li><p style="padding:15px 0; margin:0px;">Last Login Time -  <fmt:parseDate value="${lastlogintime}" pattern="yyyy-MM-dd HH:mm:ss" var="lastLoginTimeFormattedDate" /><fmt:formatDate value="${lastLoginTimeFormattedDate }" pattern="dd-MMM-yyyy HH:mm:ss" /></p></li>
        <li class="dropdown user user-menu">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown">
          <img src="${pageContext.request.contextPath}/imageAction" alt="userimage" class="user-image" id="irs_captcha_id" /> 
            <span class="hidden-xs">${user.userName}</span>
          </a>
          <ul class="dropdown-menu">
            <!-- User image -->
            <li class="user-header">
          <img src="${pageContext.request.contextPath}/imageAction" alt="userimage" class="user-image" id="irs_captcha_id" /> 
              <p>
                ${user.userName} (${user.userDesignation})
                <small>${user.loginId}</small>
              </p>   
            </li>
            
            <li class="user-footer">
              <div class="pull-left">
                <a href="updateprofile?secureToken=${hometoken}" class="btn btn-default btn-flat">Profile</a>
              </div> 
               <div class="pull-right">
                <a href="logout" class="btn btn-default btn-flat" id="signOut">Sign out</a>
              </div> 
            </li>
          </ul>
        </li>
        
        
        
      </ul>
    </div>
    
  </nav>
</header>
</div>
<script> 

 
 /** add active class and stay opened when selected */
 $(window).on('load', function(){
	var addr1 =$(location).attr('href');	
	var  parts = addr1.split("?");
	var url = parts[0].trim(); 
	var  parts1 = url.split("/");
	var url1 = parts1[4].trim();
		console.log(parts1);

	//for sidebar menu treeview
	 $('ul.sidebar-menu li a').each(function() {
	    var mHref = $(this).attr("href");
	    var  mHrefPart = mHref.split("?");
	    var mUrl = mHrefPart[0];	  
	    
	if(mUrl === undefined){
		}
	else{if(mUrl  == url1){
				     $(this).closest("li.treeview").addClass("active").css('border-left-color', '#3c8dbc');
				     $(this).css('color', '#fff');
				     return false;
	}
	}
	    
	 })
	
 
 });
 
 jQuery(document).ready(function($)
		 {
		   
		   $("#header-collapse").click(function()
		   {
		     
		     $("#header-wrap").slideToggle( "slow");
		     
		     $('body').addClass('header-collapsed')
		     
		   });  
		   
		 });
 $( ".arrow-icon" ).click(function() {
	  $(this).toggleClass("open");
	});
</script>