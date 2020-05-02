<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="org.RequestDesk.misc.AuthorizeUtil" %>
<%
	AuthorizeUtil.UserLoadedJspRedirect(request, response, "NewRequest.jsp", "/newrequest");
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
		<link rel="stylesheet" href="css/bootstrap.min.css">
		<link rel="stylesheet" href="css/summernote-bs4.min.css">
		<!-- Optional JavaScript -->
		<!-- jQuery first, then Popper.js, then Bootstrap JS -->
		<script src="js/jquery-3.2.1.slim.min.js"></script>
		<script src="js/popper.min.js"></script>
		<script src="js/bootstrap.min.js"></script>
		<script src="js/summernote-bs4.min.js"></script>
		<script src="js/newrequest.js"></script>
		<title>RequestDesk - New request</title>
	</head>
	<body>
		<nav class="navbar navbar-expand navbar-light bg-light">
			<a class="navbar-brand ml-4" href="${context}/home">RequestDesk</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav">
					<li class="nav-item active">
						<a class="nav-link" href="${context}/home">Home<span class="sr-only">(current)</span></a>
					</li>
					<li class="nav-item">
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
		<div class="card ml-4 mr-4 mt-2">
			<div class="card-header">
				<div class="d-flex align-items-center">
					<span class="align-middle" style="float:left;">Create new request</span>
				</div>
			</div>
			<div class="card-body">
				<form method="post" action="newrequest">
					<div class="form-group">
						<label for="requestInputTopic">Topic</label>
						<input name="requestTopic" type="text" class="form-control" id="requestInputTopic" aria-describedby="requestTopic" placeholder="Enter topic">
						<small id="requestTopic" class="form-text text-muted">Enter request topic here</small>
					</div>
					<div class="form-group">
				    	<label for="requestInputPriority">Priority</label>
					    <select name="requestPriority" class="form-control" id="requestInputPriority">
					    	<option value="1">High</option>
					    	<option value="2">Medium</option>
					    	<option value="3">Low</option>
					    </select>
					    <small id="requestTopic" class="form-text text-muted">Enter request priority here. <small class="font-italic">For example "High" priority</small></small>
				  	</div>
					<div class="form-group">
						<label for="requestDescriptionInput">Description</label>
						<textarea name="requestDescription" class="form-control" id="requestDescriptionInput" rows="3"></textarea>
						<small id="requestDescription" class="form-text text-muted">Enter full description of the issue</small>
					</div>
					<button name="newrequest_button" type="submit" class="btn btn-primary">Create</button>
				</form>
			</div>
		</div>
	</body>
</html>