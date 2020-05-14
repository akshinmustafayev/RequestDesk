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
		<link rel="stylesheet" href="css/adminhome.css">
		<!-- Bootstrap CSS -->
		<link rel="stylesheet" href="css/bootstrap.min.css">
		<link rel="stylesheet" href="css/open-iconic-bootstrap.css">
		<!-- Optional JavaScript -->
		<!-- jQuery first, then Popper.js, then Bootstrap JS -->
		<script src="js/jquery-3.2.1.min.js"></script>
		<script src="js/popper.min.js"></script>
		<script src="js/bootstrap.min.js"></script>
		<title>RequestDesk - Admin Home</title>
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
		<h1 class="display-5 ml-4 mr-4 mt-2 mb-4">Details</h1>
		<div class="row ml-4 mr-4 mt-2 mb-4">
            <div class="thumbnails">
			    <a class="thumbnail" href="${context}/admintechnicians">
			        <img class="thumbnail-image" src="img/admin/technician.png" alt="Technicians" />
			        <p class="caption mt-1">Technicians</p>
			    </a>
			    <a class="thumbnail" href="#">
			        <img class="thumbnail-image" src="img/admin/groups.svg" alt="Groups" />
			        <p class="caption mt-1">Groups</p>
			    </a>
			    <a class="thumbnail" href="#">
			        <img class="thumbnail-image" src="img/admin/users.svg" alt="Users" />
			        <p class="caption mt-1">Users</p>
			    </a>
			</div>
        </div>
        <h1 class="display-5 ml-4 mr-4 mt-2 mb-4">Requests</h1>
		<div class="row ml-4 mr-4 mt-2 mb-4">
            <div class="thumbnails">
			    <a class="thumbnail" href="#">
			        <img class="thumbnail-image" src="img/admin/requesttypes.svg" alt="Request types" />
			        <p class="caption mt-1">Request types</p>
			    </a>
			    <a class="thumbnail" href="#">
			        <img class="thumbnail-image" src="img/admin/requestpriorities.svg" alt="Request priorities" />
			        <p class="caption mt-1">Request priorities</p>
			    </a>
			    <a class="thumbnail" href="#">
			        <img class="thumbnail-image" src="img/admin/requeststatuses.svg" alt="Request statuses" />
			        <p class="caption mt-1">Request statuses</p>
			    </a>
			</div>
        </div>
        <h1 class="display-5 ml-4 mr-4 mt-2 mb-4">System</h1>
		<div class="row ml-4 mr-4 mt-2 mb-4">
            <div class="thumbnails">
			    <a class="thumbnail" href="#">
			        <img class="thumbnail-image" src="img/admin/emailsettings.svg" alt="Email settings" />
			        <p class="caption mt-1">Email settings</p>
			    </a>
			</div>
        </div>
	</body>
</html>