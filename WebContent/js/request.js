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
		success : function(responseText) 
		{
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

function RequestLoadHistory()
{
	var requestid = GetDataFromItem("RDRequestID");
	var requesthistoryloading = document.getElementById("RDrequestHistoryLoading");
	var requesthistorytextcontainer = document.getElementById("RDrequestHistoryTextContainer");
	var requesthistorytext = document.getElementById("RDrequestHistoryText");
	
	requesthistoryloading.classList.remove("hidden");
	requesthistorytextcontainer.classList.add("hidden");
	requesthistorytext.innerHTML = "";
	
	$.ajax({
		type:"GET",
		url : 'api/GetRequestHistory',
		data : {
			requestid : requestid 
		},
		success : function(responseText) 
		{
			var result = JSON.parse(responseText);
			var historyText = "";
			
			if(result.history[0].historyid == -1)
			{
				RedirectToLoginPage();
			}
			else if (result.history[0].historyid == -2)
			{
				requesthistoryloading.classList.add("hidden");
				requesthistorytextcontainer.classList.remove("hidden");
				requesthistorytext.innerHTML = "<li class=\"list-group-item\">(empty)</li>";
			}
			else
			{
				for (var i = 0; i < result.history.length; i++) 
				{
					historyText = historyText + "<li class=\"list-group-item\">" + result.history[i].historyaction + " (" + result.history[i].historydate + ")" + "</li>"
				}
				requesthistoryloading.classList.add("hidden");
				requesthistorytextcontainer.classList.remove("hidden");
				requesthistorytext.innerHTML = historyText;
			}
		},
	    error: function (request, status, error) {
	    	requesthistoryloading.classList.add("hidden");
	    	requesthistorytextcontainer.classList.remove("hidden");
	    	requesthistorytext.innerHTML = error;
	    }
	});
}