<!DOCTYPE html>
<html lang="en">
<head>
<%@ include file="index.html"%>
<%@ include file="navbar.jsp"%>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Paper Information</title>
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

.Questionpaper-section {
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
	<%
	int TotalMarksInput = (int) session.getAttribute("TotalMarksInput");
	%>
	<form action="PaperInfoController" method="post">
		<div class="container">
			<div class="left-container">
				<h3>Paper Information</h3>

				<div class="Questionpaper-section">
					<h5>
						Paper Marks :
						<%=TotalMarksInput%></h5>
					<div class="form-group">
						<label for="PaperNameInput">Paper Name</label> <input type="text"
							class="form-control" id="PaperName" name="PaperName"
							placeholder="Enter Paper Name">
					</div>

					<div class="form-group">
						<label for="TermNameInput">Term Name</label> <input type="text"
							class="form-control" id="TermName" name="TermName"
							placeholder="Enter Term Name">
					</div>

					<div class="form-group">
						<label for="dateOfExamInput">Date of the Exam</label> <input
							type="date" class="form-control" id="dateOfExam"
							name="dateOfExam">
					</div>

					<div class="form-group">
						<label for="timeLengthInput">Time Length</label> <input
							type="text" class="form-control" id="timeLength"
							name="timeLength" placeholder="Enter time length">
					</div>

				</div>

				<button class="btn btn-primary" id="backBtn">Back</button>
				<button class="btn btn-primary" type="submit" id="nextBtn">Generate
					PDF</button>
			</div>
		</div>
	</form>
	<script>
		document.addEventListener('DOMContentLoaded', function() {
			// Back button click event
			document.getElementById('backBtn').addEventListener('click',
					function() {
						window.location.href = 'QueMarkInfo.jsp';
					});
		});
	</script>

</body>
</html>
