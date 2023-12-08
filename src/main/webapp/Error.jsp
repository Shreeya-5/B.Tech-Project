<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" href="favicon.ico" type="image/x-icon">
<meta charset="ISO-8859-1">
<title>Error</title>
<%@ include file="navbar.jsp"%>
<%@ include file="index.html"%>
</head>
<style>
.error {
	display: flex;
	align-items: center;
	justify-content: center;
}

</style>
<body>
	<div class="container">
		<div class="error">
			<div class="alert alert-danger">
				<div style="text-align: center;">
					<strong><h1>Error!</h1></strong><br>
				</div>
				<h1 style="text-align: center;">Something Went Wrong</h1>
			</div>
		</div>
	</div>
</body>
</html>
