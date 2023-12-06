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
<body>
	<%// Retrieving data from the session
	userReg loggedInUser = (userReg) session.getAttribute("loggedInUser");
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
						<button type="button" onclick="addNewCourse()"
							class="btn btn-success">Save</button>
						<button type="button" class="btn btn-danger"
							onclick="closeCourseModal()">Close</button>
					</div>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="row">
				<div class="col-md-9">
					<!-- Content in the left part -->
					<div id="coursesDisplay">
						<%-- Fetch and display course names from the database --%>
						<% ACourse courseDAO = new ACourse();
                       List<addCourse> allCourses = courseDAO.getAllCourses();
                       if (allCourses != null && !allCourses.isEmpty()) {
                           for (addCourse course : allCourses) {
                    %>
						<div class="course">
							<a href="UnitDashboard.jsp"><%= course.getCourseName() %></a>
						</div>
						<%   }
                       } else { %>
						<div>
							<h2>No Courses Added</h2>
						</div>
						<% } %>
					</div>
				</div>
				<div class="col-md-3">
					<!-- Rightmost part with Add and Remove buttons -->
					<h3>Actions</h3>
					<button class="btn btn-primary btn-block" id="addCourseBtn"
						type="button" onclick="openCourseModal()">Add Course</button>
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
			$(document).ready(function() {
			    // Function to load existing courses on page load
			    loadCourses();
			});

			function loadCourses() {
			    $.ajax({
			        type: 'GET',
			        url: 'CourseController',
			        success: function(response) {
			            $('#coursesDisplay').html(response); // Display courses
			        },
			        error: function() {
			            alert('Error while loading courses.');
			        }
			    });
			}
			
			function addNewCourse() {
	            var courseTitle = $('#courseTitle').val(); // Assuming courseTitle is an input field
	            var courseCode = $('#courseCode').val();

	            if (courseTitle !== null && courseTitle.trim() !== '') {
	                $.ajax({
	                    type: 'POST',
	                    url: 'CourseController',
	                    data: {
	                        courseTitle: courseTitle,
	                        courseCode: courseCode
	                    },
	                    success: function(response) {
	                        if (response === 'success') {
	                            // If the course is successfully added on the server side,
	                            // dynamically add it to the UI
	                            $('#coursesContainer').append('<div class="course"><a href="UnitDashboard.jsp">' + courseTitle + '</a></div>');
	                        } else {
	                            alert('Failed to add the course.');
	                        }
	                    },
	                    error: function() {
	                        alert('Error while adding the course.');
	                    }
	                });
	            } else {
	                alert('Please enter a valid course name.');
	            }
	        }

		</script>
	</form>
</body>
</html>
