<!DOCTYPE html>
<html lang="en">
<head>
<%@ include file="index.html"%>
<%@ include file="navbar.jsp"%>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Difficulty level</title>
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

.difficulty-section {
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
	<form action="DiffLevelController" method="post">
		<div class="container">
			<div class="left-container">
				<h3>Difficulty</h3>

				<div class="difficulty-section">
					<h5>Paper Marks : <%=TotalMarksInput%></h5>
					<div class="form-group">
						<label for="easyInput">Easy</label> <input type="text"
							class="form-control" id="easy" name="easy"
							placeholder="Enter marks for Easy">
					</div>

					<div class="form-group">
						<label for="mediumInput">Medium</label> <input type="text"
							class="form-control" id="medium" name="medium"
							placeholder="Enter marks for Medium">
					</div>

					<div class="form-group">
						<label for="hardInput">Hard</label> <input type="text"
							class="form-control" id="hard" name="hard"
							placeholder="Enter marks for Hard">
					</div>
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
						window.location.href = 'UnitInfo.jsp';
					});
		});
	</script>

</body>
</html>
