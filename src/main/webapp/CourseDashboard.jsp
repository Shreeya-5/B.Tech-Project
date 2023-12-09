<%@page import="EduPaper.model.userReg"%>
<%@page import="EduPaper.dao.CourseDao"%>
<%@page import="java.util.List"%>
<%@page import="EduPaper.model.addCourse"%>
<!DOCTYPE html>
<html lang="en">
<head>
<%@ include file="index.html"%>
<%@ include file="navbar.jsp"%>
<link rel="icon" href="favicon.ico" type="image/x-icon">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Course Management</title>
</head>
<style>
.container {
	margin-top: 80px;
}

.coursesDisplay {
	display: flex;
	flex-direction: column;
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
	color: black;
	background-color: #9EEBBF;
	border-radius: 5px;
	background-color: #9EEBBF;
	cursor: pointer;
}

.course:hover {
	text-decoration: none;
	color: black;
	font-weight: bold;
	box-shadow: 0 1px 4px rgba(0, 0, 0, 0.3), 0 0 20px rgba(0, 0, 0, 0.1)
		inset;
	position: relative;
}
</style>
<body>
	<%
	// Retrieving data from the session
	userReg loggedInUser = (userReg) session.getAttribute("loggedInUser");
	%>
	<!--Add Course Modal -->
	<form action="CourseController" method="get">
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
						<button type="submit" class="btn btn-success"
							onclick="saveCourse()">Save</button>
						<button type="button" class="btn btn-danger"
							onclick="closeCourseModal()">Close</button>
					</div>
				</div>
			</div>
		</div>
	</form>

	<!-- Remove Course Modal -->
	<form action="CourseController" method="post">
		<input type="hidden" name="action" value="removeCourse">
		<div class="modal" id="removeCourseModal">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title">Remove Course</h4>
						<button type="button" class="close"
							onclick="closeRemoveCourseModal()">&times;</button>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<label for="courseCode">Course Code:</label> <input type="text"
								class="form-control" id="courseCode" name="courseCode"
								placeholder="Enter Course Code">
						</div>

					</div>
					<div class="modal-footer">
						<button type="submit" class="btn btn-success"
							onclick="removeCourse()">Submit</button>
						<button type="button" class="btn btn-danger"
							onclick="closeRemoveCourseModal()">Close</button>
					</div>
				</div>
			</div>
		</div>
	</form>

	<!-- Modal for displaying messages -->
	<div class="modal" id="messageModal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">Message</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<div class="modal-body">
					<p id="modalMessage"></p>
				</div>
			</div>
		</div>
	</div>

	<div class="container">
		<div class="row">

			<div class="col-md-9 ">
			<h2><%=user.getDept() %></h2>
				<!-- Content in the left part -->
				<div class="coursesDisplay">
					<%
					CourseDao courseDao = new CourseDao();
					List<addCourse> courses = courseDao.getAllCourses(user.getEmail());

					if (courses != null && !courses.isEmpty()) {
						for (addCourse course : courses) {
					%>
					<form id="courseCodeForm<%=course.getCourseCode()%>"
						action="CourseController" method="post">
						<input type="hidden" name="courseCodeForUnits"
							value="<%=course.getCourseCode()%>"> <a
							onclick="submitCourse('<%=course.getCourseCode()%>')"
							class="course" id="course_<%=course.getCourseCode()%>"> <%=course.getCourseName()%>
							<button type="button" style="display: none;"></button>
						</a>
					</form>

					<%
					}
					} else {
					%>
					<h2>No Courses Available</h2>
					<%
					}
					%>
				</div>
			</div>

			<div class="col-md-3">
				<!-- Rightmost part with Add and Remove buttons -->
				<h3>Actions</h3>
				<button class="btn btn-primary btn-block" id="addCourseBtn"
					type="button" onclick="openCourseModal()">Add Course</button>
				<button class="btn btn-danger btn-block" id="removeCourseBtn"
					onclick="openRemoveCourseModal()">Remove Course</button>
			</div>
		</div>
	</div>
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

		function openRemoveCourseModal() {
			document.getElementById('removeCourseModal').style.display = 'block';
		}

		function closeRemoveCourseModal() {
			document.getElementById('removeCourseModal').style.display = 'none';
		}

		function removeCourse() {
			// Implement your save logic here
			closeRemoveCourseModal();
		}

		function showMessage(message) {
			document.getElementById('modalMessage').innerText = message;
			$('#messageModal').modal('show'); // Show the modal
		}

		function submitCourse(courseCode) {
			document.getElementById('courseCodeForm' + courseCode).submit();
			
		}
		
	</script>

</body>
</html>
