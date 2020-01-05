<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

 <style>
.content{min-height: 390px;}  
.content-wrapper{ min-height: 450px;}
.content-wrapper .container{float: left;}
.btn-default{margin-bottom:5px;}
</style> 
<div class="content-wrapper">
<c:set var="token" value="${csrf_security_token}"/>

<div class="col-md-12 mart10" id="MainuV" > 
	<div class="col-md-6 no_padding"> 
		<div class="panel panel-default">
		  <div class="panel-heading">One Time checks of Monitoring Servers</div>
		  <div class="panel-body">
		  	<div class="col-md-12" >
		  		  <ul>
											  <li>
										    <a href="cctnswebservices?secureToken=${token}" class="btn btn-default" role="button">
										      <i class="fa fa-hand-o-right "></i>
										      <span>CCTNS Connectivity Status</span>
										  	</a>
										  	  </li>
											 <li>
										     <a href="allServerTime?secureToken=${token}" class="btn btn-default" role="button">
										      <i class="fa fa-hand-o-right "></i>
										      <span>Server Time</span>
										  	  </a>
										  	  </li>
											  <%-- <li>
										     <a href="networkStatus?secureToken=${token}" class="btn btn-default" role="button">
										      <i class="fa fa-hand-o-right "></i>
										      <span>Network Status</span>
										  	  </a>
										  	  </li> --%>
											  <li>
										      <a href="ntpCronStatus?secureToken=${token}" class="btn btn-default" role="button">
										      <i class="fa fa-hand-o-right "></i>
										      <span>NTP & CRON Status</span>
										  	  </a>
										  	  </li>
											  <li>
										       <a href="ntptimeDelayStatus?secureToken=${token}" class="btn btn-default" role="button">
										      <i class="fa fa-hand-o-right "></i>
										      <span>NTP Time Delay</span>
										  	  </a>
										  	  </li>
				</ul>
		  		 
		  	</div>
		  </div>
		</div>
	</div>
	<div class="col-md-6 no_padding"> 
		<div class="panel panel-default">
		  <div class="panel-heading">Hourly checks of Monitoring Servers</div>
		  <div class="panel-body">
		  	<div class="col-md-12">
		 <!-- <button type="button" class="btn btn-default">NTP offset Value</a> -->
											  <ul>
											  <li>
										       <a href="#"  class="btn btn-default" role="button">
										      <i class="fa fa-hand-o-right "></i>
										      <span>Inode Space Status</span>
										  	  </a>
										  	  </li>
											 <li>
										       <a href="diskSpaceStatus?secureToken=${token}" class="btn btn-default" role="button">
										      <i class="fa fa-hand-o-right "></i>
										      <span>Disk Space Status</span>
										  	  </a>
										  	  </li>
											  <li>
										       <a href="memoryStatus?secureToken=${token}" class="btn btn-default" role="button">
										      <i class="fa fa-hand-o-right "></i>
										      <span>Current Memory Status</span>
										  	  </a>
										  	  </li>
											  <li>
										       <a href="cpuStatus?secureToken=${token}" class="btn btn-default" role="button">
										      <i class="fa fa-hand-o-right "></i>
										      <span>Current CPU Utilization</span>
										  	  </a>
										  	  </li>
											  <li>
										       <a href="offsetvalue?secureToken=${token}" class="btn btn-default" role="button">
										      <i class="fa fa-hand-o-right "></i>
										      <span>Offset status and Up Time Status</span>
										  	  </a>
										  	  </li>
											<!--  <li>
										       <a href="#" class="btn btn-default" role="button">
										      <i class="fa fa-hand-o-right "></i>
										      <span>Current Maximum CPU Utilization</span>
										  	  </a>
										  	  </li> -->
											 <li>
										        <a href="appThreadStatus?secureToken=${token}" class="btn btn-default" role="button"><i class="fa fa-hand-o-right "></i>
										      <span>Application Threads</span></a>
											</li>
											<li>
										        <a href="dbThreadStatus?secureToken=${token}" class="btn btn-default" role="button"><i class="fa fa-hand-o-right "></i>
										      <span>Database Threads</span></a>
											</li>
										   	</ul>
		  		 </div></div>
		</div>
	</div>
</div>
	
  </div>
  <!-- /.content-wrapper -->
  
  
  
  
