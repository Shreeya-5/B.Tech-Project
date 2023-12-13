<!DOCTYPE html>
<%@page import="java.util.List"%>
<%@page import="EduPaper.model.AddQue"%>
<%@page import="EduPaper.dao.QuestionDao"%>
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

.QuestionDisplay {
	display: flex;
	flex-direction: column;
}

.Question {
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

.Question:hover {
	text-decoration: none;
	color: black;
	font-weight: bold;
	box-shadow: 0 1px 4px rgba(0, 0, 0, 0.3), 0 0 20px rgba(0, 0, 0, 0.1)
		inset;
	position: relative;
}
</style>
<body>
	<!-- Add Questions Modal -->
	<form action="QuestionController">
		<div class="modal" id="questionsModal">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title">Subjective Question</h4>
						<button type="button" class="close"
							onclick="closeQuestionsModal()">&times;</button>
					</div>
					<div class="modal-body">

						<div class="form-group">
							<label for="question">Question:</label> <input type="text"
								placeholder="Enter Question" class="form-control" id="question"
								name="question">
						</div>
						<div class="form-group">
							<label for="queType">Question Type:</label> <select
								class="form-control" id="queType" name="queType">
								<option value="" disabled selected>Select Question Type</option>
								<option value="subjective">Subjective</option>
								<option value="objective">Objective</option>
							</select>
						</div>
						<div class="form-group">
							<label for="Marks">Marks:</label> <input type="text"
								placeholder="Enter Marks" class="form-control" id="Marks"
								name="Marks">
						</div>
						<div class="form-group">
							<label for="Difficulty">Difficulty Level:</label> <select
								class="form-control" id="Difficulty" name="Difficulty">
								<option value="" disabled selected>Select Difficulty</option>
								<option value="easy">Easy</option>
								<option value="moderate">Moderate</option>
								<option value="difficult">Difficult</option>
							</select>
						</div>
					</div>
					<div class="modal-footer">
						<button type="submit" class="btn btn-success"
							onclick="submitQuestion()">Submit</button>
						<button type="button" class="btn btn-danger"
							onclick="closeQuestionsModal()">Cancel</button>
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

	<%
	int subtopicId = (int) session.getAttribute("subtopicNoForQuestions");
	%>
	<div class="container">
		<div class="row">
			<div class="col-md-9">
				<!-- Content in the left part -->
				<%
				QuestionDao queDao = new QuestionDao();
						List<AddQue> ques = queDao.getAllQue(subtopicId);

						if (ques != null && !ques.isEmpty()) {
							for (AddQue que : ques) {
				%>
				<form id="QuestionNoForm<%=que.getQueNo()%>"
					action="QuestionDashboard.jsp" method="post">
					<input type="hidden" name="QuestionNo" value="<%=que.getQueNo()%>">
					<a onclick="submitQuestion('<%=que.getQueNo()%>')" class="Question"
						id="Question_<%=que.getQueNo()%>"> <%=que.getQuesText()%>
						<button type="button" style="display: none;"></button>
					</a>
				</form>

				<%
				}
				} else {
				%>
				<h2>No Questions Available</h2>
				<%
				}
				%>
				<div class="QuestionDisplay"></div>
			</div>

			<div class="col-md-3">
				<!-- Rightmost part with Add and Remove buttons -->
				<h3>Actions</h3>
				<button class="btn btn-primary btn-block" id="addCourseBtn"
					type="submit" onclick="openQuestionsModal()">Add Questions</button>
			</div>
		</div>
	</div>
	<script>
		function openQuestionsModal() {
			document.getElementById('questionsModal').style.display = 'block';
		}

		function closeQuestionsModal() {
			document.getElementById('questionsModal').style.display = 'none';
		}

		function submitQuestion() {
			// Implement your submit logic here
			closeQuestionsModal();
		}
		function showMessage(message) {
			document.getElementById('modalMessage').innerText = message;
			$('#messageModal').modal('show'); // Show the modal
		}

		function submitQuestion(queNo) {
			document.getElementById('questionNoForm' + queNo).submit();
		}
	</script>


</body>
</html>
