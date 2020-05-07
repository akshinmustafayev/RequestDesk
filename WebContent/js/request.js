function RequestLoadSolution()
{
	var requestid = GetDataFromItem();
	
	$.ajax({
		type:"GET",
		url : 'api/GetUserServlet',
		data : {
			userName : $('#userName').val()
		},
		success : function(responseText) {
			$('#ajaxGetUserServletResponse').text(responseText);
		}
	});
}