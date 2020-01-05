


$(document).ready(function(){
	//alert("f");  
	$(".select2").select2({}); 
	$('#pillar').change(
			function() {		
				$("#officeId").select2("val", "");	
				$.getJSON('registerUser/findOfficesByPillar',
								{
							pillarid : $(this).val(),
									ajax : 'true'
								},
								
								function(data) {
									var html = '<option value="">---Select---</option>';
									var len = data.length;
									for (var i = 0; i < len; i++) {
							//alert("k"+data[i].incident_sub_type_code);
										html += '<option value="' + data[i].officeId + '">'
												+ data[i].officeTitle
												+ '</option>';
									}
									html += '</option>';

									$('#officeId').html(html);
								});
			});

	
});

