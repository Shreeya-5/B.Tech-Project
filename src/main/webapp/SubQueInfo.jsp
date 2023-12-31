<!DOCTYPE html>
<html lang="en">
<head>
<%@ include file="index.html"%>
<%@ include file="navbar.jsp"%>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Add Sub Questions</title>
</head>
<style>
.left-container {
	width: 50%;
	float: left;
	margin-left: -100px;
}

.right-container {
	width: 50%;
	float: right;
}

.subque-section {
	margin-bottom: 20px;
	background-color: #f14a8d;
	padding: 15px;
	border-radius: 5px;
}

.form-group {
	margin-bottom: 15px;
}

.btn-container {
	margin-top: 20px;
	text-align: center;
}

.btn-primary {
	background-color: #f14a8d;
	border-color: #9EEBBF;
	color: black;
}

.btn-primary:hover {
	background-color: #6A0DAD;
	border-color: #6A0DAD;
	color: black;
}
</style>
<body>
	<form action="SubQueInfoController" method="post">
		<%
		int NumberOfQuestionInput = (int) session.getAttribute("NumberOfQuestionInput");
		%>
		<div class="container">
			<div class="left-container">
				<h3>Questions</h3>

				<div class="subque-section">
					<%
					for (int i = 1; i <= NumberOfQuestionInput; i++) {
					%>
					<label for="subQ1Input">Enter Subquestions for Q<%=i%></label> <input
						type="text" class="form-control" id="subQ<%=i%>Input"
						name="subQ<%=i%>Input">

					<%
					}
					%>
				</div>
				<button class="btn btn-primary" id="backBtn">Back</button>
				<button type="submit" class="btn btn-primary" id="nextBtn">Next</button>
			</div>
		</div>
	</form>
	<script>
		document.addEventListener('DOMContentLoaded', function() {
			// Back button click event
			document.getElementById('backBtn').addEventListener('click',
					function() {
						window.location.href = 'QuestionInfo.jsp';
					});
		});
	</script>

</body>
</html>
