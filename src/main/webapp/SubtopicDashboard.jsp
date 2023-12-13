<!DOCTYPE html>
<%@page import="java.util.List"%>
<%@page import="EduPaper.model.AddSubtopic"%>
<%@page import="EduPaper.dao.SubtopicDao"%>
<html lang="en">
<head>
<%@ include file="index.html"%>
<%@ include file="navbar.jsp"%>
<link rel="icon" href="favicon.ico" type="image/x-icon">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Subtopic Management</title>
</head>
<style>
.container {
	margin-top: 80px;
}

.subtopicDisplay {
	display: flex;
	flex-direction: column;
}

.subtopic {
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

.subtopic:hover {
	text-decoration: none;
	color: black;
	font-weight: bold;
	box-shadow: 0 1px 4px rgba(0, 0, 0, 0.3), 0 0 20px rgba(0, 0, 0, 0.1)
		inset;
	position: relative;
}
</style>
<body>
	<div class="container">
		<%
		String courseCode = (String) session.getAttribute("courseCodeForSubtopics");
				String unitNo = (String) session.getAttribute("unitNoForSubtopics");
		%>

		<!-- Add Subtopic Modal -->
		<form action="SubtopicController" method="get">

			<div class="modal" id="subtopicModal">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h4 class="modal-title">Add Subtopic</h4>
							<button type="button" class="close"
								onclick="closeSubtopicModal()">&times;</button>
						</div>
						<div class="modal-body">
							<div class="form-group">
								<label for="subtopicDescription">Subtopic Name:</label> <input
									class="form-control" id="subtopicName" name="subtopicName"
									placeholder="Subtopic Name">
							</div>
						</div>
						<div class="modal-footer">
							<button type="submit" class="btn btn-success"
								onclick="saveSubtopic()">Submit</button>
							<button type="button" class="btn btn-danger"
								onclick="closeSubtopicModal()">Cancel</button>
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

		<div class="row">
			<div class="col-md-9">
				<h2><%=unitNo%></h2>
				<!-- Content in the left part -->
				<div class="subtopicsDisplay">
					<%
					SubtopicDao subtopicDao = new SubtopicDao();
								List<AddSubtopic> subtopics = subtopicDao.getAllSubtopicsForUnitAndCourse(unitNo, courseCode);

								if (subtopics != null && !subtopics.isEmpty()) {
									for (AddSubtopic subtopic : subtopics) {
					%>
					<form id="subtopicNoForm<%=subtopic.getSubtopicId()%>"
						action="SubtopicController" method="post">
						<input type="hidden" name="subtopicNoForQuestions"
							value="<%=subtopic.getSubtopicId()%>"> <a
							onclick="submitSubtopic('<%=subtopic.getSubtopicId()%>')"
							class="subtopic" id="subtopic_<%=subtopic.getSubtopicId()%>">
							<%=subtopic.getSubtopicName()%>
							<button type="button" style="display: none;"></button>
						</a>
					</form>

					<%
					}
					} else {
					%>
					<h2>No Subtopics Available</h2>
					<%
					}
					%>
				</div>
			</div>
			<div class="col-md-3">
				<!-- Rightmost part with Add and Remove buttons -->
				<h3>Actions</h3>
				<button class="btn btn-primary btn-block" id="addSubtopicBtn"
					type="submit" onclick="openSubtopicModal()">Add Subtopic</button>
			</div>
		</div>
	</div>
	<script>
		function openSubtopicModal() {
			document.getElementById('subtopicModal').style.display = 'block';
		}

		function closeSubtopicModal() {
			document.getElementById('subtopicModal').style.display = 'none';
		}

		function saveSubtopic() {
			// Implement your save logic here
			closeSubtopicModal();
		}

		function showMessage(message) {
			document.getElementById('modalMessage').innerText = message;
			$('#messageModal').modal('show'); // Show the modal
		}

		function submitSubtopic(subtopicNo) {
			document.getElementById('subtopicNoForm' + subtopicNo).submit();
		}
	</script>

</body>
</html>
