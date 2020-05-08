function RequestLoadSolution()
{
	var requestid = GetDataFromItem("RDRequestID");
	var requestsolutionloading = document.getElementById("RDrequestSolutionLoading");
	var requestsolutiontextcontainer = document.getElementById("RDrequestSolutionTextContainer");
	var requestsolutiontext = document.getElementById("RDrequestSolutionText");
	
	requestsolutionloading.classList.remove("hidden");
	requestsolutiontextcontainer.classList.add("hidden");
	requestsolutiontext.innerHTML = "";
	
	$.ajax({
		type:"GET",
		url : 'api/GetRequestSolution',
		data : {
			requestid : requestid 
		},
		success : function(responseText) {
			var result = JSON.parse(responseText);
			
			if(result.requestid == -1)
			{
				RedirectToLoginPage();
			}
			else
			{
				requestsolutionloading.classList.add("hidden");
				requestsolutiontextcontainer.classList.remove("hidden");
				requestsolutiontext.innerHTML = result.requestsolution;
			}
		},
	    error: function (request, status, error) {
	    	requestsolutionloading.classList.add("hidden");
			requestsolutiontextcontainer.classList.remove("hidden");
			requestsolutiontext.innerHTML = error;
	    }
	});
}