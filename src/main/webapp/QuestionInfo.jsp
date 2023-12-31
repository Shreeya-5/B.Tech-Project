<!DOCTYPE html>
<html lang="en">
<head>
<%@ include file="index.html"%>
<%@ include file="navbar.jsp"%>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Questions Information</title>
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
	<form action="QuestionInfoController" id="queNoInfo" method="post">
		<div class="container">
			<div class="left-container">
				<h3>Questions</h3>

				<div class="Questionpaper-section">
					<div class="form-group">
						<label>Number Of Questions</label> <input
							name="NumberOfQuestionInput" type="text" class="form-control"
							id="NumberOfQuestionInput"
							placeholder="Enter Number Of questions">
					</div>

					<div class="form-group">
						<label>Total Marks For Paper</label> <input name="TotalMarksInput"
							type="text" class="form-control" id="TotalMarksInput"
							placeholder="Enter Total Marks">
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
						window.location.href = 'UnitDashboard.jsp';
					});

		});
	</script>

</body>
</html>
