<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="Profile.jsp"%>
<%@ include file="index.html"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
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
				<img src="CumminsLogo.png" alt="Avatar Logo" style="width: 45px;"
					class="rounded-circle">
			</div>
			<div class="nav-title">EduPaper</div>
		</div>
		<div>
			<a class="link" href="#">Home</a> <a class="link" href="#">About
				us</a> <a class="link" href="#">Log out</a>
			<button class="btn" type="submit" onclick="showPopup()">

				<i class="link bi bi-person-circle"></i>

			</button>
		</div>
	</nav>
</body>
</html>