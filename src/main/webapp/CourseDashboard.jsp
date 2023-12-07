<%@page import="EduPaper.model.userReg"%>
<%@page import="EduPaper.dao.ACourse"%>
<%@page import="java.util.List"%>
<%@page import="EduPaper.model.addCourse"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Course Management</title>
<%@ include file="Popups.jsp"%>
<%@ include file="index.html"%>
<%@ include file="navbar.jsp"%>
</head>
<style>
.container {
	margin-top: 80px;
}

.coursesDisplay {
	display: flex;
	flex-direction: row;
}

.course {
	display: flex;
	border-radius: 5px;
	border: 1px;
	margin: 10px;
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
<body>
	<%
	// Retrieving data from the session
	userReg loggedInUser = (userReg) session.getAttribute("loggedInUser");
	List<addCourse> allCourses = (List<addCourse>) session.getAttribute("allCourses");
	%>
	<!-- Course Modal -->
	<form action="CourseController">
		<div class="modal" id="courseModal">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title">Add Course</h4>
						<button type="button" class="close" onclick="closeCourseModal()">&times;</button>
					</div>
					<div class="modal-body">

						<div class="form-group">
							<label for="courseTitle">Course Title:</label> <input type="text"
								class="form-control" id="courseTitle" name="courseTitle"
								placeholder="Enter Course Title">
						</div>
						<div class="form-group">
							<label for="courseCode">Course Code:</label> <input type="text"
								class="form-control" id="courseCode" name="courseCode"
								placeholder="Enter Course Code">
						</div>

					</div>
					<div class="modal-footer">
						<button type="submit" class="btn btn-success" onclick="saveCourse">Save</button>
						<button type="button" class="btn btn-danger"
							onclick="closeCourseModal()">Close</button>
					</div>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="row">
				<div class="col-md-9 ">
					<!-- Content in the left part -->
					<div class="coursesDisplay">
						<%
						ACourse courseDao = new ACourse();
						List<addCourse> courses = courseDao.getAllCourses(user.getEmail());
						if (!courses.isEmpty()) {
						%>
						<h2>Add Courses</h2>
						<%
						

						for (addCourse course : courses) {
						%>
						<div class="course" id="<%=course.getCourseCode()%>">
							<a href="UnitDashboard"><%=course.getCourseCode()%></a>
						</div>
						<%
						}
						}
						%>
					</div>
				</div>
				<div class="col-md-3">
					<!-- Rightmost part with Add and Remove buttons -->
					<h3>Actions</h3>
					<button class="btn btn-primary btn-block" id="addCourseBtn"
						type="button" onclick="openCourseModal()">Add Course</button>
					<button class="btn btn-danger btn-block" id="removeCourseBtn" onclick="removeDiv()">Remove
						Course</button>
				</div>
			</div>
		</div>

		<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
		<script
			src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
		<script
			src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
		<script>
			function openCourseModal() {
				document.getElementById('courseModal').style.display = 'block';
			}

			function closeCourseModal() {
				document.getElementById('courseModal').style.display = 'none';
			}

			function saveCourse() {
				// Implement your save logic here
				closeCourseModal();
			}
			
		    // Assuming an action removes the div
		    function removeDiv() {
		        document.getElementById('divToRemove').style.display = 'none';
		    }
			
		</script>
	</form>
</body>
</html>
