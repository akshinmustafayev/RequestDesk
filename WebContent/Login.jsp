<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="org.RequestDesk.misc.AuthorizeUtil" %>
<%
	AuthorizeUtil.UserLoadedJspRedirect(request, response, "Login.jsp", "/login");
	AuthorizeUtil.AuthorizedRedirectLogin(request, response);
 %>
<!doctype html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon">
		<!-- Bootstrap CSS -->
		<link rel="stylesheet" href="css/bootstrap.min.css">
		<link rel="stylesheet" href="css/login.css">
		<!-- Optional JavaScript -->
		<!-- jQuery first, then Popper.js, then Bootstrap JS -->
		<script src="js/jquery-3.2.1.min.js"></script>
		<script src="js/popper.min.js"></script>
		<script src="js/bootstrap.min.js"></script>
		<title>RequestDesk Login</title>
	</head>
	<body class="text-center">
		<form class="form-signin" method="post" action="login">
			<img class="mb-4" src="img/logo.png" alt="" width="72" height="72">
			<h1 class="h3 mb-3 font-weight-normal">Please sign in</h1>
			<label for="inputLogin" class="sr-only">Login</label>
			<input name="login" type="text" id="inputLogin" class="form-control" placeholder="Login" required="" autofocus="">
			<label for="inputPassword" class="sr-only">Password</label>
			<input name="password" type="password" id="inputPassword" class="form-control" placeholder="Password" required="">
			<button name="login_button" class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
			
			<%
				if(request.getAttribute("WrongLoginMsg") != null)
				{
			  		out.println("<div class=\"alert alert-danger mt-3\" role=\"alert\">Login or Password is incorrect!</div>");
				}
			%>
			
			<p class="mt-5 mb-3 text-muted">© 2020</p>
		</form>
	</body>
</html>