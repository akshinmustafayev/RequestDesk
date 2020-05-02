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
		<title>RequestDesk - Home</title>
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
					<span class="align-middle">Home</span>
				</div>
			</div>
			<div class="card-body p-0">
				<div class="jumbotron card card-image rounded-0 border-0" style="background-image: url(img/home_jumbotron.jpg);">
					<div class="text-white text-center">
						<div>
							<h2 class="card-title font-weight-light">Create new request by selecting options below</h2>
						</div>
					</div>
				</div>
				<div class="container mb-5 p-0">
					<div class="row row-cols-3 m-2">
						<c:forEach begin="0" items="${requestTypes}" var="requestType">
							<div class="col">
								<div class="card">
									<div class="card-body">
										<h5 class="card-title">${requestType.GetName()}</h5>
										<h6 class="card-subtitle mb-2 text-muted">${requestType.GetCreatedDate()}</h6>
										<p class="card-text">${requestType.GetDescription()}</p>
										<a href="${context}/newrequest?id=${requestType.GetId()}" class="card-link">Create</a>
									</div>
								</div>
								<c:if test = "${requestType.GetNeedApproval() == true}">
						        	<div class="card-badge rounded text-center"><span class="oi oi-bolt"></span></div>
						      	</c:if>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>