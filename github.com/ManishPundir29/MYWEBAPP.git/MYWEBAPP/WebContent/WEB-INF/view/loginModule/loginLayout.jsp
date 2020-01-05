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
	href="<c:url value='/resources/bootstrap/css/bootstrap.css'/>">
<!-- Font Awesome Icons -->
<link
	href="<c:url value='/resources/font-awesome-4.4.0/css/font-awesome.min.css'/>"
	rel="stylesheet" type="text/css" />
<!-- Ionicons -->
<link
	href="<c:url value='/resources/ionicons-2.0.1/css/ionicons.min.css'/>"
	rel="stylesheet" type="text/css" />
<!-- Theme style -->
<link rel="stylesheet"
	href="<c:url value='/resources/dist/css/AdminLTE.css'/>">
<!-- AdminLTE Skins. Choose a skin from the css/skins
         folder instead of downloading all of them to reduce the load. -->
<link rel="stylesheet"
	href="<c:url value='/resources/dist/css/skins/_all-skins.css'/>">
<!-- Strength Meter -->
<link
	href="<c:url value='/resources/plugins/strength-meter/css/strength-meter.css'/>"
	rel="stylesheet" type="text/css" />

<link
	href="<c:url value='/resources/plugins/fileinput/css/fileinput.min.css'/>"
	rel="stylesheet" type="text/css" />


<!-- Select2 -->
<link href="<c:url value='/resources/plugins/select2/select2.min.css'/>"
	rel="stylesheet" type="text/css" />
<!-- datepicker -->
<link
	href="<c:url value='/resources/plugins/datepicker/datepicker3.css'/>"
	rel="stylesheet" type="text/css" />
<link rel="stylesheet"
	href="<c:url value='/resources/dist/css/icjs-theme-default.css'/>">
<link href="<c:url value='/resources/plugins/landingpage/screen.css'/>" rel="stylesheet" type="text/css" />	


<!--      								J   S      FILES    									 -->


<!-- jQuery 2.1.4 -->
<script
	src="<c:url value='/resources/plugins/jQuery/jQuery-2.1.4.min.js'/>"></script>
<!-- Bootstrap 3.3.5 -->
<script src="<c:url value='/resources/bootstrap/js/bootstrap.js'/>"></script>
<!-- SlimScroll -->
<script
	src="<c:url value='/resources/plugins/slimScroll/jquery.slimscroll.js'/>"></script>
<!-- FastClick -->
<script src="<c:url value='/resources/plugins/fastclick/fastclick.js'/>"></script>
<!-- Hashes -->
<script
	src="<c:url value='/resources/plugins/hashes/js/hashes.min.js'/>"></script>
<!-- AdminLTE App -->
<script src="<c:url value='/resources/dist/js/app.js'/>"></script>
<!-- AdminLTE for demo purposes -->
<script src="<c:url value='/resources/dist/js/demo.js'/>"></script>
<!-- Strength Meter -->
<script
	src="<c:url value='/resources/plugins/strength-meter/js/strength-meter.js'/>"
	type="text/javascript"></script>
<script
	src="<c:url value='/resources/plugins/fileinput/js/fileinput.js'/>"
	type="text/javascript"></script>

<script src="<c:url value='/resources/plugins/select2/select2.min.js'/>"
	type="text/javascript"></script>

<!-- datepicker -->
<script
	src="<c:url value='/resources/plugins/datepicker/bootstrap-datepicker.js'/>"
	type="text/javascript"></script>
<!-- input mask -->
<script
	src="<c:url value='/resources/plugins/input-mask/jquery.inputmask.js'/>"
	type="text/javascript"></script>
<script
	src="<c:url value='/resources/plugins/input-mask/jquery.inputmask.date.extensions.js'/>"
	type="text/javascript"></script>
<script
	src="<c:url value='/resources/plugins/input-mask/jquery.inputmask.extensions.js'/>"
	type="text/javascript"></script>
<script
	src="<c:url value='/resources/plugins/input-mask/jquery.inputmask.extensions.js'/>"
	type="text/javascript"></script>

<script type="text/javascript">
	window.history.forward();
	function preventBack() {
		window.history.forward(1);
	}
</script>

<script src="<c:url value='/resources/bootstrap/js/disableBackk.js'/>"></script>


<script type="text/javascript">
	function burstCache() {
		if (!navigator.onLine) {
			document.body.innerHTML = 'Loading...';
			window.location = 'ErrorPage.html';
		}
	}

	burstCache();
</script>
</head>
<body onload="preventBack();"
	onpageshow="if (event.persisted) preventBack();" onunload=""
	class="hold-transition login-page">

	<tiles:insertAttribute name="banner" />

	<div class="wrapper">

		<tiles:insertAttribute name="content" />
		<tiles:insertAttribute name="footer" />

	</div>
</body>
</html>