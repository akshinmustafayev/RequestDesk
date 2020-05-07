<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="org.RequestDesk.misc.AuthorizeUtil" %>
<%
	AuthorizeUtil.UserLoadedJspRedirect(request, response, "Request.jsp", "/request");
	AuthorizeUtil.AuthorizedRedirect(request, response);
 %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="context" value="${pageContext.request.contextPath}" />
<!doctype html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<!-- All CSS -->
		<link rel="stylesheet" href="css/requestdesk.css">
		<link rel="stylesheet" href="css/request.css">
		<!-- Bootstrap CSS -->
		<link rel="stylesheet" href="css/bootstrap.min.css">
		<link rel="stylesheet" href="css/open-iconic-bootstrap.css">
		<!-- Optional JavaScript -->
		<!-- jQuery first, then Popper.js, then Bootstrap JS -->
		<script src="js/jquery-3.2.1.slim.min.js"></script>
		<script src="js/popper.min.js"></script>
		<script src="js/bootstrap.min.js"></script>
		<script src="js/requestdesk.js"></script>
		<script src="js/request.js"></script>
		<title>RequestDesk - Request</title>
	</head>
	<body>
		<nav class="navbar navbar-expand navbar-light bg-light">
			<a class="navbar-brand ml-4" href="${context}/home">RequestDesk</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav">
					<li class="nav-item">
						<a class="nav-link" href="${context}/home">Home<span class="sr-only">(current)</span></a>
					</li>
					<li class="nav-item active">
						<a class="nav-link" href="${context}/requests">Requests</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="${context}/adminhome">Admin</a>
					</li>
				</ul>
			</div>
			<ul class="navbar-nav ">
                <li class="nav-item dropdown">
                    <a href="#" class="nav-link dropdown-toggle" id="navDropDownLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><%=session.getAttribute("fullname")%> </a>
                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navDropDownLink">
                        <a class="dropdown-item" href="${context}/usersettings">Preferences</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="Logout.jsp">Logout</a>
                    </div>
                </li>
            </ul>
		</nav>
		<div class="card ml-4 mr-4 mt-2 mb-4">
			<div class="card-header">
				<div class="d-flex align-items-center">
					<span class="align-middle pr-3" style="float:left;" id="RDRequestID" data-info="${request.GetId()">Request id#: ${request.GetId()}</span>
					<div class="dropdown ml-3">
						<button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenu2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Actions</button>
						<div class="dropdown-menu" aria-labelledby="dropdownMenu2">
							<button class="dropdown-item" type="button">Close</button>
							<button class="dropdown-item" type="button">Assign</button>
							<button class="dropdown-item" type="button">Delete request</button>
						</div>
					</div>
				</div>
			</div>
			<div class="card-body">
				<h4 class="card-title">${request.GetTopic()}</h4>
				<span class="badge badge-secondary mb-3">by ${user.GetFullName()}</span>
				<span class="badge badge-secondary mb-3">${request.GetCreatedDate()}</span>
				<span class="badge badge-secondary mb-3">Status: ${status.GetName()}</span>
				
				<ul class="nav nav-tabs">
					<li class="nav-item">
						<a class="nav-link active" data-toggle="tab" href="#description">Description</a>
					</li>
					<!--  
					<li class="nav-item">
						<a class="nav-link" data-toggle="tab" href="#approvers">Approvers</a>
					</li>
					-->
					<li class="nav-item">
						<a class="nav-link" data-toggle="tab" href="#solution">Solution</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" data-toggle="tab" href="#history">History</a>
					</li>
				</ul>

				<div class="tab-content">
					<div id="description" class="tab-pane active border-right border-bottom border-left p-3">
						<p>${request.GetDescription()}</p>
					</div>
					<div id="approvers" class="tab-pane fade border-right border-bottom border-left p-3">
						<h3>Menu 1</h3>
						<p></p>
					</div>
					<div id="solution" class="tab-pane fade border-right border-bottom border-left p-3">
						<!--
						<div class="card card-body bg-light">
						     <p>${request.GetSolution()}</p>
						</div>
						-->
						<div class="loadingcenter">
							<div class="spinner-grow" role="status">
								<span class="sr-only">Loading...</span>
							</div>
						</div>	
					</div>
					<div id="history" class="tab-pane fade border-right border-bottom border-left p-3">
						<div class="card card-body bg-light">
						     History
						</div>
					</div>
				</div>
				
				<table class="table table-striped mt-3">
					<tbody>
						<tr>
							<td>Status:</td>
							<td><span class="badge badge-primary">${status.GetName()}</span></td>
							<td>Author:</td>
							<td><span class="badge badge-dark">${user.GetFullName()}</span></td>
						</tr>
						<tr>
							<td>Assigned to:</td>
							<td><span class="badge badge-dark">${assigned.GetFullName()}</span></td>
							<td>Group:</td>
							<td><span class="badge badge-dark">${group.GetName()}</span></td>
						</tr>
						<tr>
							<td>Created date:</td>
							<td><span class="badge badge-dark">${request.GetCreatedDate()}</span></td>
							<td></td>
							<td></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</body>
</html>