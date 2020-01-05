<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<spring:htmlEscape defaultHtmlEscape="true" />

  <input type="text" name="secureToken" value="${csrf_security_token}" id="secureToken" />
<c:set var="token" value="${csrf_security_token}" />

<aside class="main-sidebar">


	<section class="sidebar">


		<!-- Sidebar Menu -->
		<ul class="sidebar-menu">
				<li class=" treeview">
								    <a href="#"> 
								       <i class="fa fa-bars"></i> 
								        <span>One Time Basis</span> 
								        <span class="pull-right-container"> 
								          <i class="fa fa-angle-left pull-right" style="white-space: normal;"></i>
									    </span>
								     </a>

									<ul class="treeview-menu">
										
										<li id="cctnswebservices">
										    <a href="cctnswebservices?secureToken=${token}">
										      <i class="fa fa-hand-o-right "></i>
										      <span>CCTNS Connectivity Status</span>
										     
										    </a>
										</li>
										
										<li id="allservertime">
										    <a href="allServerTime?secureToken=${token}">
										      <i class="fa fa-hand-o-right "></i>
										      <span>All Server Time</span>
										     
										    </a>
										</li>
										
										<%-- <li id="networkstatus">
										    <a href="networkStatus?secureToken=${token}">
										      <i class="fa fa-hand-o-right "></i>
										      <span>Network Status</span>
										     
										    </a>
										</li> --%>
										
										
										<li id="ntpCronStatus">
										    <a href="ntpCronStatus?secureToken=${token}">
										      <i class="fa fa-hand-o-right "></i>
										      <span>NTP & Cron Status</span>
										     
										    </a>
										</li>
										
										<li id="ntptimeDelayStatus">
										    <a href="ntptimeDelayStatus?secureToken=${token}">
										      <i class="fa fa-hand-o-right "></i>
										      <span>NTP Time Delay Status</span>
										     
										    </a>
										</li>
						
								
 <li>
 </ul></li></ul>
 
 <ul class="sidebar-menu">
				<li class=" treeview">
 
 							<a href="#"> 
								         <i class="fa fa-bars"></i> 
								        <span>Hourly Basis</span> 
								        <span class="pull-right-container"> 
								          <i class="fa fa-angle-left pull-right" style="white-space: normal;"></i>
									    </span>
								     </a>
								     
								     	<ul class="treeview-menu">
								     	
								     	<li id="diskSpaceStatus">
										    <a href="diskSpaceStatus?secureToken=${token}">
										      <i class="fa fa-hand-o-right "></i>
										      <span>Disk Space Status</span>
										     
										    </a>
										</li>
								     	
								     	<li id="memoryStatus">
										    <a href="memoryStatus?secureToken=${token}">
										      <i class="fa fa-hand-o-right "></i>
										      <span>Memory Status</span>
										     
										    </a>
										</li>
										
										<li id="cpuStatus">
										    <a href="cpuStatus?secureToken=${token}">
										      <i class="fa fa-hand-o-right "></i>
										      <span>CPU Status</span>
										     
										    </a>
										</li>
										
										<li id="offsetvalue">
										    <a href="offsetvalue?secureToken=${token}">
										      <i class="fa fa-hand-o-right "></i>
										      <span> Offset Status & UP Time Status</span>
										     
										    </a>
										</li>
										
										
										<li id="appThreadStatus">
										    <a href="appThreadStatus?secureToken=${token}">
										      <i class="fa fa-hand-o-right "></i>
										      <span>App Thread Status</span>
										     
										    </a>
										</li>
										
										<li id="dbThreadStatus">
										    <a href="dbThreadStatus?secureToken=${token}">
										      <i class="fa fa-hand-o-right "></i>
										      <span>DB Thread Status</span>
										     
										    </a>
										</li>
									
						
								
 <li></ul>
 
 
  									<button onclick=myFunction()>Click here to execute script</button>
  										 <a href="appThreadStatus?secureToken=${token}">
										      <i class="fa fa-hand-o-right "></i>
										      <span>check status</span>
										    </a>
		</li></ul>
<!-- /.sidebar-menu -->
	</section>
</aside>

<script>
function myFunction(){
	
	alert($('#secureToken').val());
	$.ajax({
		url : "testCon",
		type : "GET",
		beforeSend : function(xhr) {
			xhr.setRequestHeader("Accept","application/json");
			xhr.setRequestHeader("Content-Type","application/json");
			xhr.setRequestHeader('X-CSRF-Token',$('#secureToken').val());
		},
		success : function(data) {
			alert(data);
		}
		
	});
	
}

	/* DinamicMenu()
	 * dinamic activate menu
	 */$(document).ready(function() {

		var url = window.location;

		// Will only work if string in href matches with location

		// Will also work for relative and absolute hrefs

		$('.treeview-menu li a').filter(function() {
			return this.href == url;
		}).parent().addClass('active');

		$('.treeview-menu li a').filter(function() {
			return this.href == url;
		}).parent().parent().parent().addClass('active');
	});
	
	
</script>