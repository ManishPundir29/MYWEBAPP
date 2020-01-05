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


<footer class="main-footer padt0">
<div id="marquBo" class="marb10">
 	 <!-- <marquee direction="right" scrolldelay="500" scrollamount="20" style="background:#fff;" onmouseover="this.stop();" onmouseout="this.start();">
          <div class="mar_content">
            <ul>
              <li><i class="fa fa-clock-o" aria-hidden="true"></i> &nbsp;Morning Time:  9am to 6pm</li>
              <li><i class="fa fa-phone-square" aria-hidden="true"></i> &nbsp;Phone No: 011-22560103</li> 
              <li><i class="fa fa-envelope" aria-hidden="true" style="margin-right:3px;"></i>&nbsp;Email id: support-icjs@gov.in</li>             
              <li><i class="fa fa-home" aria-hidden="true"></i> &nbsp; Address : 3rd floor, NICSI Building, Shastri Park, New Delhi</li>
            </ul>
            
          </div>
        </marquee> -->
        
        <div class="mar_content">
            <ul>
              
              <li><i class="fa fa-phone-square" aria-hidden="true"></i> &nbsp;Phone No: 011-22560103</li>   
              <li><i class="fa fa-envelope" aria-hidden="true" style="margin-right:3px;"></i>&nbsp;Email id: support-icjs@gov.in</li>             
              <li><i class="fa fa-phone" aria-hidden="true"></i> &nbsp;Support - Timing:  9am to 6pm</li>
            </ul>
            
          </div>
    </div>
	<div style="text-align: center">

		<span id="clockbox"> </span> 
			<br> <p>version 1.3 &copy; Content Owned by Ministry of Home Affairs, Government of India. <br> ICJS system is designed, developed and hosted
		       by National Informatics Centre, Ministry of Electronics &amp; Information Technology, Government of India. </p>
	</div>
</footer>