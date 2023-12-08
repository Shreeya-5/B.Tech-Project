<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<html>
<%@ include file="UserProfile.jsp"%>
<head>
<link rel="icon" href="favicon.ico" type="image/x-icon">
<%@ include file="index.html"%>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
.container {
   margin-top: 80px;
}
.navbar {
	padding: 8px;
	background: linear-gradient(to right, #e53075, #245ead);
	display: flex;
	align-items: center;
	justify-content: space-between;
}

.nav-bar {
	display: flex;
	justify-content: center;
	align-items: center;
}

.navbar-brand {
	padding-right: 8px;
}

.nav-title {
	text-decoration: none;
	font-size: 2rem;
	color: white; /* Mix color for title */
}

.link {
	text-decoration: none;
	color: white;
	padding: 5px;
}

.bi-person-circle {
	font-size: 1.5rem;
}

.link:hover {
	color: white;
	font-weight: bold;
}
</style>
</head>
<body>
	<nav class="navbar fixed-top navbar-light bg-light">
		<div class="nav-bar">
			<div class="navbar-brand">
				<img src="EduPaperLogo.png" alt="Avatar Logo" style="height: 40px;">
			</div>
		</div>
		<div>
			<a class="link" href="CourseDashboard.jsp">Home</a> 
			<a class="link" href="home.jsp">About us</a> 
			<a class="link" href="Login.jsp">Log out</a>
			<button class="btn" type="submit" onclick="showPopup()">
				<i class="link bi bi-person-circle"></i>
			</button>
		</div>
	</nav>
</body>
</html>