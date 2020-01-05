
jQuery(document).ready(function($) {
    $(".clickable-row").click(function() {
        window.document.location = $(this).data("href");
    });
});



$(document).ready(function() {
	 $('a[data-toggle="tab"]').on( 'shown.bs.tab', function (e) {
	        $.fn.dataTable.tables( {visible: true, api: true} ).columns.adjust();
	      
	        
	       
	    } );
	
  var prisondatattable =$('#prisonTable').DataTable({
    	
    	 "scrollX": true,
    	 "scrollY": true
    	   
    			
    		});
  var policedatattable=$('#policeTable').DataTable(
    {
    	 "scrollX": true,
    	 "scrollY": 400
    }		
    );
    

 $('#export_btn').click( function () {
       // alert( prisondatattable.rows('.selected').data().length +' row(s) selected' );
        //alert( policedatattable.rows('.selected').data().length +' row(s) selected' );

        var prisonarraylength= prisondatattable.rows('.selected').data().length;
        var policearraylength= policedatattable.rows('.selected').data().length;
        
        if(prisonarraylength == "undefined")
    	{
        	prisonarraylength=0;
    	
    	}
    if(policearraylength == "undefined")
	{
    	policearraylength=0;
	
	}
        if(prisonarraylength>0)
        {
        	$("#prisonbox").show();	
        }
        else
        {
        	$("#prisonbox").hide();
        }
        if(policearraylength>0)
        {
        	$("#policebox").show();		
        }
        else
        {
        	$("#policebox").hide();
        }
        
        var prisonarray=prisondatattable.rows('.selected').data();
        var policearray=policedatattable.rows('.selected').data();
        if(prisonarray.length == "undefined")
        	{
        	prisonarray.length=0;
        	
        	}
        if(policearray.length == "undefined")
    	{
        	policearray.length=0;
    	
    	}
        
        $("#filterpolicetable").find("tr:gt(0)").remove();
        
        if(policearray.length>0){
        for (var i = 0; i < policearray.length; i++) {
     	   var srno=i+1;
             	var newRowContent = "<tr><td style=\"white-space: nowrap;\"><input onchange=\"checkbox_clickedpolicetable($(this))\" style=\"margin-right: 5px;vertical-align: -1px;\" type=\"checkbox\" id=\"police" + i + "\" value=\"" + i + "\">"+srno+"</td><td>" + policearray[i][1] + "</td><td>" + policearray[i][2] + "</td><td>" + policearray[i][3] +  "</td><td>" + policearray[i][4] + "</td><td>" + policearray[i][5] + "</td><td>" + policearray[i][6] + "</td><td>" + policearray[i][7] + "</td><td>" + policearray[i][8] +  "</td><td>" + policearray[i][9] +"</td><td>" + policearray[i][10] +"</td><td>" + policearray[i][11] +"</td><td>" + policearray[i][12] +"</td><td>" + policearray[i][13] + "</td></tr>";
             	

             	$("#filterpolicetable tbody").append(newRowContent);
             } 
 }
        $("#filterprisontable").find("tr:gt(0)").remove();
        if(prisonarray.length>0){
        for (var i = 0; i < prisonarray.length; i++) {
        	var srno=i+1;
        	var newRowContent = "<tr><td style=\"white-space: nowrap;\"><input onchange=\"checkbox_clickedprisontable($(this))\" style=\"margin-right: 5px;vertical-align: -1px;\" type=\"checkbox\" id=\"prison" + i + "\" value=\"" + i + "\">"+srno+"</td><td>" + prisonarray[i][1] + "</td><td>" + prisonarray[i][2] + "</td><td>" + prisonarray[i][3] +  "</td><td>" + prisonarray[i][4] + "</td><td>" + prisonarray[i][5] + "</td><td>" + prisonarray[i][6] + "</td><td>" + prisonarray[i][7] + "</td><td>" + prisonarray[i][8] +  "</td><td>" + prisonarray[i][9] + "</td></tr>";
        	

        	$("#filterprisontable tbody").append(newRowContent);
        } 
      }
      
        
        $("#combinedtable").modal("show");  
        
    } );

} );

function checkbox_clicked(myvar){
	
    	myvar.parent().parent().toggleClass('selected');
    }
function checkbox_clickedprisontable(myvar){
	
	myvar.parent().parent().toggleClass('selectedprisontable');

}
function checkbox_clickedpolicetable(myvar){
	
	myvar.parent().parent().toggleClass('selectedpolicetable');

}

function printpdf()
{

	var colsnameprisontable= ["Srno","fIRNumber","prisonerName","age","fatherName","motherName","state","district","ps_code","permanentAddress"];
	var colsnamepolicetable=["Srno","accVictimSrno","fullName","gender","mobileNo","address","nationality","firRegNum","firNum","arrestDate","state","district","ps","actSection"];
	
	  
	
	/* console.log(getTableData($("#filterprisontable"),colsnameprisontable,"tr.selectedprisontable").length);	
	console.log(getTableData($("#filterpolicetable"),colsnamepolicetable,"tr.selectedpolicetable").length); */
	
  var prisonjsonarray = getTableData($("#filterprisontable"),colsnameprisontable,"tr.selectedprisontable");
	//alert("lengthprison"+prisonjsonarray.length);
  var policejsonarray = getTableData($("#filterpolicetable"),colsnamepolicetable,"tr.selectedpolicetable");
  //alert("lengthpolice"+policejsonarray.length);
  var allpillar={"prisonresult":prisonjsonarray,"policeresult":policejsonarray};
  $("#datasend").val(JSON.stringify(allpillar));
  
 /*  $("#prisonresult").val(prisonjsonarray);
  $("#policeresult").val((policejsonarray)); */
  $("#pdfprint").attr("method", "POST");
 
	$("#pdfprint").attr("action", "printresultresource");
	$("#pdfprint").attr("target", "_blank");
	
	$("#pdfprint").submit();
	  $("#combinedtable").modal("hide");
 
// var allpillar={"prisonresult":prisonjsonarray};
 
	/* // process the form
		$.ajax({
			type : 'POST', // define the type of HTTP verb we want to use (POST for our form)
			url : "printresultresource", // the url where we want to POST
			data : JSON.stringify(allpillar), // our data object
			beforeSend : function(xhr) {
				xhr.setRequestHeader("Accept", "application/json");
				xhr.setRequestHeader("Content-Type", "application/json");
				xhr.setRequestHeader('X-CSRF-Token', $('#secureToken').val());
			},
			dataType : 'json', // what type of data do we expect back from the server
			encode : true,
			success : function(data, textStatus, jqXHR) {
				   window.open(data.fileUrl);
				
				
			},
			error : function(jqXHR, textStatus, errorThrown) {
				alert(textStatus, errorThrown);
			}
		}); */
		
		

  
}



function getTableData(table,colnamarr,rowcssname) {
    var data = [];
    var srno=0;
    table.find(rowcssname).each(function (rowIndex, r) {
    	//alert("s");
        var cols = [];
        var jsonData = {};
        srno=srno +1;
        $(this).find('th,td').each(function (colIndex, c) {
        	
        	if(colIndex==0)
        		{
           	 jsonData[colnamarr[colIndex]] =1 ;

        		}
        	else{
        	 jsonData[colnamarr[colIndex]] = c.textContent;
        	} 
        });
        data.push(jsonData);
    });
    
    return data;
}
