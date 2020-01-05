<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Cache-Control"
	content="no-cache, no-store, must-revalidate" />
<link rel="shortcut icon"
	href="<c:url value='/resources/dist/img/emblem.ico'/>" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Expires" content="0" />
<title><tiles:insertAttribute name="title" ignore="true" /></title>
<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">


<!--                                       C   S   S                                         -->

<!-- Bootstrap 3.3.5 -->
<link rel="stylesheet"
	href="<c:url value='/resources/bootstrap/css/bootstrap-3.3.7.min.css'/>">
<!-- Font Awesome Icons -->
<link
	href="<c:url value='/resources/font-awesome-4.4.0/css/font-awesome.min.css'/>"
	rel="stylesheet" type="text/css" />

<link rel="stylesheet"
	href="<c:url value='/resources/dist/css/AdminLTE.css'/>">
	
<!-- Select2 -->
     <link href="<c:url value='/resources/plugins/select2/select2.min.css'/>" rel="stylesheet" type="text/css" />

<!-- AdminLTE Skins. Choose a skin from the css/skins
         folder instead of downloading all of them to reduce the load. -->
<link rel="stylesheet"
	href="<c:url value='/resources/dist/css/skins/_all-skins.css'/>">
	
<!-- DATA TABLES -->
     <link href="<c:url value='/resources/plugins/datatables/dataTables.bootstrap.css'/>" rel="stylesheet" type="text/css" />

    
 <!-- Select2 -->
      <link href="<c:url value='/resources/plugins/select2/select2.min.css'/>" rel="stylesheet" type="text/css" />
      
 <!-- Pace -->
      <link href="<c:url value='/resources/plugins/pace/pace.min.css'/>" rel="stylesheet" type="text/css" />
      
 <!-- iCheck -->
      <link href="<c:url value='/resources/plugins/iCheck/all.css'/>" rel="stylesheet" type="text/css" />

<%-- <!-- jQuery 2.2.3 -->
<script src="<c:url value='/resources/plugins/jQuery/jquery-2.2.3.min.js'/>"></script> --%>

<!-- jQuery 3.3.1 -->
<script src="<c:url value='/resources/plugins/jQuery/jquery-3.3.1.min.js'/>"></script>

</head>

<!-- Date Picker -->
<link href="<c:url value='/resources/plugins/datepicker/latestDPicker/datepicker3.css'/>" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="<c:url value='/resources/dist/css/icjs-theme-default.css'/>">
<link href="<c:url value='/resources/plugins/landingpage/screen.css'/>" rel="stylesheet" type="text/css" />


<!--      								J   S      FILES    									 -->
<!-- Bootstrap 3.3.5 -->
<script src="<c:url value='/resources/bootstrap/js/bootstrap-3.3.7.min.js'/>"></script>

<!-- AdminLTE Skins. Choose a skin from the css/skins
         folder instead of downloading all of them to reduce the load. -->
<script src="<c:url value='/resources/dist/js/app.js'/>"></script>

<!-- Select2 -->
     <script src="<c:url value='/resources/plugins/select2/select2.full.min.js'/>" type="text/javascript"></script>

<!-- DATA TABES SCRIPT -->
    <script src="<c:url value='/resources/plugins/datatables/jquery.dataTables.min.js'/>" type="text/javascript"></script>
    <script src="<c:url value='/resources/plugins/datatables/dataTables.bootstrap.min.js'/>" type="text/javascript"></script>

<!-- Date Picker -->
<script src="<c:url value='/resources/plugins/datepicker/latestDPicker/bootstrap-datepicker.js'/>" type="text/javascript"></script>



<script type="text/javascript">
	window.history.forward();
	function preventBack() {
		window.history.forward(1);
	}

</script>
</head>
<div class="hold-transition">
<body onload="preventBack();" onpageshow="if (event.persisted) preventBack();" onunload="" class="skin-blue sidebar-mini hold-transition " id="body">
	 <tiles:insertAttribute name="banner" />
     <div class="wrapper" id="wrapper">
     <tiles:insertAttribute name="header" />
     <tiles:insertAttribute name="leftsidebar" />
     <tiles:insertAttribute name="content" />
     <tiles:insertAttribute name="footer" /> 
     </div>
</body>
</html>