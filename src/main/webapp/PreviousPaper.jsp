<%@page import="EduPaper.model.AddPaper"%>
<%@page import="EduPaper.dao.PaperDao"%>
<%@page import="EduPaper.model.AddUnit"%>
<%@page import="java.util.List"%>
<%@page import="EduPaper.dao.UnitDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@ include file="index.html"%>
<%@ include file="navbar.jsp"%>
</head>
<style>
.container {
	margin-top: 80px;
}

.paperDisplay {
	display: flex;
	flex-direction: column;
}

.paper {
	display: flex;
	border-radius: 5px;
	border: 1px;
	margin: 10px;
	background-color: #9EEBBF;
	height: 80px;
	width: 300px;
	justify-content: center;
	align-items: center;
	text-decoration: none;
	color: black;
	background-color: #9EEBBF;
	border-radius: 5px;
	background-color: #9EEBBF;
	cursor: pointer;
}

.paper:hover {
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
		String courseCode = (String) session.getAttribute("courseCodeForUnits");
		%>

		<div class="row">
			<div class="col-md-9">
				<h2><%=courseCode%></h2>
				<!-- Content in the left part -->
				<div class="paperDisplay">
					<%
					PaperDao paperDao = new PaperDao();
					List<AddPaper> papers = paperDao.getAllPapers(courseCode);

					if (papers != null && !papers.isEmpty()) {
						for (AddPaper paper : papers) {
					%>
					<form id="PaperId<%=paper.getPaperId()%>"
						action="PreviousPaperController" method="post">
						<input type="hidden" name="paperId"
							value="<%=paper.getPaperId()%>"> <a
							onclick="submitPaper('<%=paper.getPaperId()%>')" class="paper"
							id="paper_<%=paper.getPaperId()%>"> <%=paper.getPaperName()%>
							<br><%=paper.getTermName()%><br><%=paper.getDateOfCreation()%>
							<button type="button" style="display: none;"></button>
						</a>
					</form>

					<%
					}
					} else {
					%>
					<h2>No Paper Available</h2>
					<%
					}
					%>
				</div>
			</div>
			<!-- <div class="col-md-3">
				<!-- Rightmost part with Add and Remove buttons -->
				<!-- h3>Actions</h3 -->

				<!-- a href="QuestionInfo.jsp" class="btn btn-success btn-block">Delete	Paper</a--> 
			<!--  /div --> 
		</div>
	</div>
	<script>
		function openRemovePaperModal() {
			document.getElementById('removeUnitModal').style.display = 'block';
		}

		function closeRemovePaperModal() {
			document.getElementById('removeUnitModal').style.display = 'none';
		}

		function removeUnit() {
			// Implement your save logic here
			closeRemoveCourseModal();
		}

		function showMessage(message) {
			document.getElementById('modalMessage').innerText = message;
			$('#messageModal').modal('show'); // Show the modal
		}

		function submitPaper(paperId) {
			document.getElementById('PaperId' + paperId).submit();
		}
	</script>
</body>


</html>