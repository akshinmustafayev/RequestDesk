<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="org.RequestDesk.misc.AuthorizeUtil" %>
<%
	AuthorizeUtil.UserLoadedJspRedirect(request, response, "UserSettings.jsp", "/usersettings");
	AuthorizeUtil.AuthorizedRedirect(request, response);
 %>
<!doctype html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<!-- All CSS -->
		<!-- Bootstrap CSS -->
		<link rel="stylesheet" href="css/bootstrap.min.css">
		<!-- Optional JavaScript -->
		<!-- jQuery first, then Popper.js, then Bootstrap JS -->
		<script src="js/jquery-3.2.1.slim.min.js"></script>
		<script src="js/popper.min.js"></script>
		<script src="js/bootstrap.min.js"></script>
		<title>RequestDesk - Profile Settings</title>
	</head>
	<body>
		<nav class="navbar navbar-expand navbar-light bg-light">
			<a class="navbar-brand ml-4" href="Home.jsp">RequestDesk</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav">
					<li class="nav-item">
						<a class="nav-link" href="Home.jsp">Home<span class="sr-only">(current)</span></a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="Requests.jsp">Requests</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="AdminHome.jsp">Admin</a>
					</li>
				</ul>
			</div>
			<ul class="navbar-nav ">
                <li class="nav-item dropdown">
                    <a href="#" class="nav-link dropdown-toggle active" id="navDropDownLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><%=session.getAttribute("fullname")%> </a>
                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navDropDownLink">
                        <a class="dropdown-item" href="UserSettings.jsp">Preferences</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="Logout.jsp">Logout</a>
                    </div>
                </li>
            </ul>
		</nav>
		<div class="card ml-4 mr-4 mt-2 mb-4">
			<div class="card-header">
				<div class="d-flex align-items-center">
					<span class="align-middle">Profile settings</span>
				</div>
			</div>
			<div class="card-body p-0">
				<div class="jumbotron card card-image rounded-0 border-0" style="background-image: url(img/usersettings_jumbotron.jpg);">
					<div class="text-white text-sm-left">
						<div>
							<h1 class="card-title font-weight-light p-0 m-0"><%=session.getAttribute("fullname")%></h1>
						</div>
					</div>
				</div>
					<form class="ml-4 mr-4 mt-1 mb-5" method="post" action="usersettings">
						<div class="form-group">
							<label for="language">Language</label>
							<select class="form-control w-25" id="language" name="language">
								<option value="en" ${language == 'en' ? 'selected' : ''}>English</option>
				                <option value="ru" ${language == 'ru' ? 'selected' : ''}>Русский</option>
							</select>
						</div>
						<button name="language_set_button" type="submit" class="btn btn-primary">Save</button>
						<%
							if(request.getAttribute("LangErrorHappened") != null)
							{
						  		out.println("<div class=\"alert alert-danger mt-3\" role=\"alert\">Error occured!</div>");
							}
							else if(request.getAttribute("LangChangeSuccess") != null)
							{
						  		out.println("<div class=\"alert alert-success mt-3\" role=\"alert\">Successfully changed!</div>");
							}
						%>
					</form>
				</div>
			</div>
		</div>
	</body>
</html>