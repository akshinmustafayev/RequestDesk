<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="org.RequestDesk.misc.AuthorizeUtil" %>
<%
	AuthorizeUtil.UserLoadedJspRedirect(request, response, "Requests.jsp", "/requests");
	AuthorizeUtil.AuthorizedRedirect(request, response);
 %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="context" value="${pageContext.request.contextPath}" />
<c:set var="ErrorRequestNotFound" value='${requestScope["ErrorRequestNotFound"]}'/>
<c:set var="ErrorEmptyRequestID" value='${requestScope["ErrorEmptyRequestID"]}'/>
<c:set var="ErrorRequestNotNumber" value='${requestScope["ErrorRequestNotNumber"]}'/>
<!doctype html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon">
		<!-- All CSS -->
		<link rel="stylesheet" href="css/requestdesk.css">
		<link rel="stylesheet" href="css/requests.css">
		<!-- Bootstrap CSS -->
		<link rel="stylesheet" href="css/bootstrap.min.css">
		<link rel="stylesheet" href="css/open-iconic-bootstrap.css">
		<!-- Optional JavaScript -->
		<!-- jQuery first, then Popper.js, then Bootstrap JS -->
		<script src="js/jquery-3.2.1.min.js"></script>
		<script src="js/popper.min.js"></script>
		<script src="js/bootstrap.min.js"></script>
		<script src="js/requestdesk.js"></script>
		<script src="js/requests.js"></script>
		<title>RequestDesk - Requests</title>
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
					<span class="align-middle" style="width:50px;">Go to:</span>
					<form method="GET" class="d-flex" action="request">
						<input name="requestid" type="number" class="form-control" placeholder="request id #" style="width:115px;" required="">
						<button type="submit" class="btn btn-outline-primary ml-2">Go</button>
					</form>
				</div>
			</div>
			<div class="card-body">
				<c:choose>
					<c:when test = "${ErrorRequestNotFound == true}">
						<div class="alert alert-danger" role="alert">Request not found!</div>
					</c:when>
				</c:choose>
				<c:choose>
					<c:when test = "${ErrorEmptyRequestID == true}">
						<div class="alert alert-danger" role="alert">Empty request ID. Please enter a valid request id!</div>
					</c:when>
				</c:choose>
				<c:choose>
					<c:when test = "${ErrorRequestNotNumber == true}">
						<div class="alert alert-danger" role="alert">Number must be entered!</div>
					</c:when>
				</c:choose>
				<table class="table">
					<thead>
						<tr>
							<th scope="col">#</th>
							<th scope="col">Request Topic</th>
							<th scope="col">Author</th>
							<th scope="col">Assigned to</th>
							<th scope="col">Created Date</th>
						</tr>
					</thead>
					<tbody>
						<tr data-href="#">
							<th scope="row">1</th>
							<td>Mark</td>
							<td>Otto</td>
							<td>@mdo</td>
							<td>@mdo</td>
						</tr>
						<tr data-href="https://google.com">
							<th scope="row">2</th>
							<td>Jacob</td>
							<td>Thornton</td>
							<td>Thornton</td>
							<td>@fat</td>
						</tr>
						<tr>
							<th scope="row">3</th>
							<td>Larry</td>
							<td>the Bird</td>
							<td>@twitter</td>
							<td>@twitter</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</body>
</html>