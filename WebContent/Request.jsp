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
		<!-- Bootstrap CSS -->
		<link rel="stylesheet" href="css/home.css">
		<link rel="stylesheet" href="css/bootstrap.min.css">
		<link rel="stylesheet" href="css/open-iconic-bootstrap.css">
		<!-- Optional JavaScript -->
		<!-- jQuery first, then Popper.js, then Bootstrap JS -->
		<script src="js/jquery-3.2.1.slim.min.js"></script>
		<script src="js/popper.min.js"></script>
		<script src="js/bootstrap.min.js"></script>
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
					<span class="align-middle pr-3 pt-2" style="float:left;">Request id#: </span>
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
			<div class="card-body p-0">
				<h4 class="card-title">Please help me with my request by solving my issue</h4>
				<span class="badge badge-secondary mb-3">by Martin Byrde</span>
				<span class="badge badge-secondary mb-3">on Apr 24, 2020 09:32 PM</span>
				<span class="badge badge-secondary mb-3">Status: Open</span>
				
				<ul class="nav nav-tabs">
					<li class="nav-item">
						<a class="nav-link active" data-toggle="tab" href="#request">Request</a>
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
					<div id="request" class="tab-pane active border-right border-bottom border-left p-3">
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
					</div>
					<div id="approvers" class="tab-pane fade border-right border-bottom border-left p-3">
						<h3>Menu 1</h3>
						<p>Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
					</div>
					<div id="solution" class="tab-pane fade border-right border-bottom border-left p-3">
						<h3>Menu 2</h3>
						<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam.</p>
					</div>
					<div id="history" class="tab-pane fade border-right border-bottom border-left p-3">
						<h3>Menu 2</h3>
						<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam.</p>
					</div>
				</div>
				
				<table class="table table-striped mt-3">
					<tbody>
						<tr>
							<td>Status:</td>
							<td><span class="badge badge-primary">Open</span></td>
							<td>Author:</td>
							<td><span class="badge badge-dark">Martin Byrde</span></td>
						</tr>
						<tr>
							<td>Assigned to:</td>
							<td><span class="badge badge-dark">Technician number 1</span></td>
							<td>Group:</td>
							<td><span class="badge badge-dark">System Admins</span></td>
						</tr>
						<tr>
							<td>Created date:</td>
							<td><span class="badge badge-dark">on Apr 24, 2020 09:32 PM</span></td>
							<td></td>
							<td></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</body>
</html>