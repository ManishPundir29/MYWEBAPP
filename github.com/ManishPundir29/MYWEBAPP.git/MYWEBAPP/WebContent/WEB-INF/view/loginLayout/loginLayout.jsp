<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>


<!--                                       C   S   S                                         -->

<!-- Bootstrap 3.3.5 -->
<link rel="stylesheet"
	href="<c:url value='/resources/bootstrap/css/bootstrap-3.3.7.min.css'/>">

<!-- Font Awesome Icons -->
<link
	href="<c:url value='/resources/font-awesome-4.4.0/css/font-awesome.min.css'/>"
	rel="stylesheet" type="text/css" />


<!-- Theme style -->
<link rel="stylesheet"
	href="<c:url value='/resources/dist/css/AdminLTE.css'/>">

<!-- AdminLTE Skins. Choose a skin from the css/skins
         folder instead of downloading all of them to reduce the load. -->
<link rel="stylesheet"
	href="<c:url value='/resources/dist/css/skins/_all-skins.css'/>">
<link rel="stylesheet" href="<c:url value='/resources/dist/css/icjs-theme-default.css'/>">

<link rel="stylesheet" href="<c:url value='/resources/dist/css/cfcs.css'/>">
<link href="<c:url value='/resources/plugins/landingpage/screen.css'/>" rel="stylesheet" type="text/css" />

<%-- <!-- jQuery 2.2.3 -->
<script
	src="<c:url value='/resources/plugins/jQuery/jquery-2.2.3.min.js'/>"></script> --%>

<!-- jQuery 3.3.1 -->
<script src="<c:url value='/resources/plugins/jQuery/jquery-3.3.1.min.js'/>"></script>   
	
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
</head>

<!--      								J   S      FILES    									 -->
<!-- Bootstrap 3.3.5 -->
<script src="<c:url value='/resources/bootstrap/js/bootstrap-3.3.7.min.js'/>"></script>

<!-- AdminLTE Skins. Choose a skin from the css/skins
         folder instead of downloading all of them to reduce the load. -->
<script src="<c:url value='/resources/dist/js/app.js'/>"></script>




 <!--
BODY TAG OPTIONS:
=================
Apply one or more of the following classes to get the
desired effect
|---------------------------------------------------------|
| SKINS         | skin-blue                               |
|               | skin-black                              |
|               | skin-purple                             |
|               | skin-yellow                             |
|               | skin-red                                |
|               | skin-green                              |
|---------------------------------------------------------|
|LAYOUT OPTIONS | fixed                                   |
|               | layout-boxed                            |
|               | layout-top-nav                          |
|               | sidebar-collapse                        |
|               | sidebar-mini                            |
|---------------------------------------------------------|
-->

    <!-- onload="preventBack();"
	onpageshow="if (event.persisted) preventBack();" onunload=""
	class="hold-transition skin-blue sidebar-mini" id="body"> -->

<body> 
<tiles:insertAttribute name="header" />
	<div class="wrapper">			
		<tiles:insertAttribute name="content" />		
	</div>
	<tiles:insertAttribute name="footer" />

</body>
</html>