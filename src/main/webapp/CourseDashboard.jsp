<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Course Management</title>
</head>
<style>
.container {
	margin-top: 80px;
}

.course {
	display: flex;
	border-radius: 5px;
	border: 1px;
	background-color: #9EEBBF;
	height: 80px;
	width: 120px;
	text-align: center;
	justify-content: center;
	align-items: center;
	text-decoration: none;
}

.course a {
	color: black;
}

.course a:hover {
	text-decoration: none;
	color: black;
	font-weight: bold;
}
</style>
<%@ include file="Popups.jsp"%>
<%@ include file="navbar.jsp"%>
<%@ include file="index.html"%>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-9">
				<!-- Content in the left part -->
				<div class="course">
					<a href="UnitDashboard.jsp">Software Engineering</a>
				</div>
			</div>
			<div class="col-md-3">
				<!-- Rightmost part with Add and Remove buttons -->
				<h3>Actions</h3>
				<button class="btn btn-primary btn-block" id="addCourseBtn"
					type="submit" onclick="openCourseModal()">Add Course</button>

				<button class="btn btn-danger btn-block" id="removeCourseBtn">Remove
					Course</button>
			</div>
		</div>
	</div>

	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
