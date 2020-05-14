<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="org.RequestDesk.misc.AuthorizeUtil" %>
<%
	AuthorizeUtil.UserLoadedJspRedirect(request, response, "Home.jsp", "/home");
	AuthorizeUtil.AuthorizedRedirect(request, response);
 %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="context" value="${pageContext.request.contextPath}" />
<!doctype html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon">
		<!-- All CSS -->
		<link rel="stylesheet" href="css/requestdesk.css">
		<!-- Bootstrap CSS -->
		<link rel="stylesheet" href="css/bootstrap.min.css">
		<link rel="stylesheet" href="css/open-iconic-bootstrap.css">
		<!-- Optional JavaScript -->
		<!-- jQuery first, then Popper.js, then Bootstrap JS -->
		<script src="js/jquery-3.2.1.min.js"></script>
		<script src="js/popper.min.js"></script>
		<script src="js/bootstrap.min.js"></script>
		<title>RequestDesk - Admin Technicians</title>
	</head>
	<body>
		<nav class="navbar navbar-expand navbar-light bg-light">
			<a class="navbar-brand ml-4" href="${context}/home"><img src="img/logo.png" alt="Logo" class="requestdesk-logo"> RequestDesk</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav">
					<li class="nav-item">
						<a class="nav-link" href="${context}/home">Home<span class="sr-only">(current)</span></a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="${context}/requests">Requests</a>
					</li>
					<li class="nav-item active">
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
		<div class="row ml-4 mr-4 mt-3 mb-4">
			<div class="col-4">
				<div id="accordion">
					<div class="card border-bottom-0">
						<div class="card-header" id="adminDetails">
							<h5 class="mb-0">
								<button class="btn btn-link" data-toggle="collapse" data-target="#collapseDetails" aria-expanded="true" aria-controls="collapseDetails">Details</button>
							</h5>
						</div>
						<div id="collapseDetails" class="collapse show border-bottom-0" aria-labelledby="adminDetails" data-parent="#accordion">
							<div class="card-body p-0 m-0">
								<div class="list-group pl-4">
									<a href="${context}/admintechnicians" class="list-group-item list-group-item-action rounded-0 border-left-0 border-right-0 active">Technicians</a>
									<a href="${context}/admingroups" class="list-group-item list-group-item-action rounded-0 border-left-0 border-right-0">Groups</a>
									<a href="${context}/adminusers" class="list-group-item list-group-item-action rounded-0 border-left-0 border-bottom-0 border-right-0">Users</a>
								</div>
							</div>
						</div>
					</div>
					
					<div class="card border-bottom-0">
						<div class="card-header" id="adminRequests">
							<h5 class="mb-0">
								<button class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapseRequests" aria-expanded="false" aria-controls="collapseRequests">Requests</button>
							</h5>
						</div>
						<div id="collapseRequests" class="collapse" aria-labelledby="adminRequests" data-parent="#accordion">
							<div class="card-body p-0 m-0">
								<div class="list-group pl-4">
									<a href="${context}/adminrequesttypes" class="list-group-item list-group-item-action rounded-0 border-left-0 border-right-0 active">Request types</a>
									<a href="${context}/adminrequestpriorities" class="list-group-item list-group-item-action rounded-0 border-left-0 border-right-0">Request priorities</a>
									<a href="${context}/adminstatuses" class="list-group-item list-group-item-action rounded-0 border-left-0 border-bottom-0 border-right-0">Request statuses</a>
								</div>
							</div>
						</div>
					</div>
					
					<div class="card border-bottom-0">
						<div class="card-header" id="headingSystem">
							<h5 class="mb-0">
								<button class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapseSystem" aria-expanded="false" aria-controls="collapseSystem">System</button>
							</h5>
						</div>
						<div id="collapseSystem" class="collapse" aria-labelledby="headingSystem" data-parent="#accordion">
							<div class="card-body p-0 m-0">
								<div class="list-group pl-4">
									<a href="${context}/adminemailsettings" class="list-group-item list-group-item-action rounded-0 border-left-0 border-right-0 active">Email settings</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-8">
				<h1 class="display-5 ml-4 mr-4 mt-2 mb-4">Technicians</h1>
				<table class="table">
					<thead>
						<tr>
							<th scope="col"></th>
							<th scope="col">Technician name</th>
							<th scope="col">Technician email</th>
							<th scope="col">Role</th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test = "${technicians.size() > 0}">
								<c:forEach begin="0" items="${technicians}" var="technician">
									<tr data-href="${context}/admintechnicianprofile?userid=${technician.GetId()}">
										<td><input type="checkbox"></td>
										<td>${technician.GetFullName()}</td>
										<td>${technician.GetEmail()}</td>
										<td>${technician.GetUserRoleName()}</td>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td></td>
									<th scope="row"></th>
									<td>(empty)</td>
									<td></td>
								</tr>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
			</div>
		</div>
	</body>
</html>