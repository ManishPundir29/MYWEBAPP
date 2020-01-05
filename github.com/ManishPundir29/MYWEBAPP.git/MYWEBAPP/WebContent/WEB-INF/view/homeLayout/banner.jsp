<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
#header-wrap {
	background-image: url(${pageContext.request.contextPath}/resources/images/govt_of_ind_logo2.png);
	
}
</style>
<div id="load" style="display: none">
	<div id="loadDiv" class="loadDiv">
		<div class="panel panel-primary">
			<div class="panel-heading text-center">
				<button type="button" id="loadercloseid" class="close" data-dismiss="alert"
				style="float: right;opacity: 1; color: #fff;">
					<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
				</button>
				<div class="panel-title">Please Wait While Your Request is Being Processed</div>

			</div>

			<div class="panel-body text-center">
				<h3>Loading</h3>
				<img src="resources/images/loading.gif" alt="loader Image" />
				<p>Do not hit the refresh or back buttons or you will lose your place in line!</p>
			</div>
			<!-- <div class="panel-footer">
					</div> 
			-->
		</div>
	</div>
</div>
 <!-- Modal -->
  <div class="modal fade" id="LoaderModal" role="dialog" data-keyboard="false" data-backdrop="static" style="z-index: 5000;">
    <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Please Wait While Your Request is Being Processed</h4>
        </div>
        <div class="modal-body text-center">
         <h3>Loading</h3>
				<img src="resources/images/loading.gif" alt="loader Image" />
				<p class="modal-message">Do not hit the refresh or back buttons or you will lose your place in line!</p>
        </div>
        <!-- <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div> -->
      </div>
      
    </div>
  </div>
  
    <div class="modal fade" id="ConfirmModal" role="dialog" data-keyboard="false" data-backdrop="static" style="z-index: 5000;">
    <div class="modal-dialog" style="margin-top:10% ">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header" style="background-color: #044073;">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Confirm</h4>
        </div>
        <div class="modal-body text-center ">
			<div class="container-fluid pnone">
				<div class="col-md-2">
				<i class="glyphicon glyphicon-alert mart10" style="font-size: 4.5em;color: #c9302c;"></i>
				</div>
				<div class="col-md-10 pnone mart10" style="font-size: 17px;">
					This will reset all filters and search parameters recently used.<br>Proceed to make fresh search!
				</div>
			  </div>
			
			
        </div>
         <div class="modal-footer">
          <a href="#" id="backconfirm" class="btn btn-default" style="background-color: #044073;color: white;" >Confirm</a>
          <button type="button" class="btn btn-danger" data-dismiss="modal">Cancel</button>
        </div> 
      </div>
      
    </div>
  </div>

<header id="header-wrap">
	<div class="container">
		<div class="col-sm-12 login_header">
			<h3>ICJS System Monitoring Servers</h3>
			<p>( Ministry of Home Affairs, Government of India )</p>

		</div>
		</div>
</header>