<%@ page import="java.util.Date"%>
<script type="text/javascript">

var m_millDiff = 0;
function startTime() {
    var timeServer = ('<%= new Date().getTime()%>');
    var timeLocal=new Date();
    if(m_millDiff==0)
    {
      m_millDiff = timeServer - timeLocal;
    }
    timeLocal.setMilliseconds(timeLocal.getMilliseconds() + m_millDiff);
    document.getElementById('clockbox').innerHTML = timeLocal;
    var t = setTimeout(function(){startTime()},500);
}
$(document).ready(function(){
	startTime();
});
</script>
<style>
 .main-footer {
    padding: 0 0 7px 0px;
    position: absolute;
    width: 100%;
    bottom: 0;
} 

</style>
 <footer class="main-footer"	>
<div id="marquBo" class="marb10">
 	
        
    </div>

		<p id="clockbox" style="float:left; width:100%; text-align:center;"></p> 
		<span id="clockbox"> </span> 
	<br> <strong>Designed, Developed and Maintained by Manish Pundir </strong>
		<br> 

	
</footer> 



