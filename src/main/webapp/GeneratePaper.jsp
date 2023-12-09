<!DOCTYPE html>
<html lang="en">
<head>
<%@ include file="index.html"%>
<%@ include file="navbar.jsp"%>
<link rel="icon" href="favicon.ico" type="image/x-icon">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Course Management</title>
<style>
.btn-group:hover .dropdown-menu {
	display: block;
}

.container {
	margin-top: 80px;
}
</style>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-9">
				<!-- Content in the left part -->
				<h3>Main Content</h3>
				<p>This is the main content of the page.</p>
			</div>
			<div class="col-md-3">
				<!-- Rightmost part with three buttons -->
				<h3>Actions</h3>
				<div class="btn-group-vertical" role="group">
					<!-- Courses button with dropdown menu -->
					<div class="btn-group">
						<button class="btn btn-primary" type="button">Courses</button>
						<div class="dropdown-menu">
							<a class="dropdown-item" href="#">Course 1</a> <a
								class="dropdown-item" href="#">Course 2</a> <a
								class="dropdown-item" href="#">Course 3</a>
						</div>
					</div>
					<!-- Explore button -->
					<button class="btn btn-success" id="exploreBtn">Explore</button>
					<!-- Add button -->
					<button class="btn btn-info" id="addBtn">Add</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
