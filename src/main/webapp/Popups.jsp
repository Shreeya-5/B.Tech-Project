<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Popup Example</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
  <!-- 	<div class="container mt-5">
		<h1>Popup Example</h1>

		<!-- Course Button -->
		<button type="button" class="btn btn-primary" onclick="openCourseModal()">Course</button>

		<!-- Unit Button -->
		<button type="button" class="btn btn-success" onclick="openUnitModal()">Unit</button>

		<!-- Questions Button -->
		<button type="button" class="btn btn-info" onclick="openQuestionsModal()">Questions</button>
   -->
		<!-- Course Modal -->
		<div class="modal" id="courseModal">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title">Add Course</h4>
						<button type="button" class="close" onclick="closeCourseModal()">&times;</button>
					</div>
					<div class="modal-body">
						<form>
							<div class="form-group">
								<label for="courseTitle">Course Title:</label>
								<input type="text" class="form-control" id="courseTitle" placeholder="Enter Course Title">
							</div>
							<div class="form-group">
								<label for="courseCode">Course Code:</label>
								<input type="text" class="form-control" id="courseCode" placeholder="Enter Course Code">
							</div>
							<div class="form-group">
								<label for="courseDesc">Course Description:</label>
								<textarea class="form-control" id="courseDesc" placeholder="Enter Course Description"></textarea>
							</div>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-success" onclick="saveCourse()">Save</button>
						<button type="button" class="btn btn-danger" onclick="closeCourseModal()">Close</button>
					</div>
				</div>
			</div>
		</div>

		<!-- Unit Modal -->
		<div class="modal" id="unitModal">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title">Add Unit</h4>
						<button type="button" class="close" onclick="closeUnitModal()">&times;</button>
					</div>
					<div class="modal-body">
						<form>
							<div class="form-group">
								<label for="unitName">Unit Name:</label>
								<input type="text" class="form-control" id="unitName" placeholder="Unit Name">
							</div>
							<div class="form-group">
								<label for="unitDescription">Unit Description:</label>
								<textarea class="form-control" id="unitDescription" placeholder="Unit Description"></textarea>
							</div>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-success" onclick="saveUnit()">Submit</button>
						<button type="button" class="btn btn-danger" onclick="closeUnitModal()">Cancel</button>
					</div>
				</div>
			</div>
		</div>

		<!-- Questions Modal -->
		<div class="modal" id="questionsModal">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title">Subjective Question</h4>
						<button type="button" class="close" onclick="closeQuestionsModal()">&times;</button>
					</div>
					<div class="modal-body">
						<form>
							<div class="form-group">
								<label for="question">Question:</label>
								<input type="text" class="form-control" id="question" name="question">
							</div>
							<div class="form-group">
								<label for="category">Category:</label>
								<input type="text" class="form-control" id="category" name="category">
							</div>
							<div class="form-group">
								<label for="Marks">Marks:</label>
								<input type="text" class="form-control" id="Marks" name="Marks">
							</div>
							<div class="form-group">
								<label for="Difficulty">Difficulty Level:</label>
								<select class="form-control" id="Difficulty" name="Difficulty">
									<option value="easy">Easy</option>
									<option value="moderate">Moderate</option>
									<option value="difficult">Difficult</option>
								</select>
							</div>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-success" onclick="submitQuestion()">Submit</button>
						<button type="button" class="btn btn-danger" onclick="closeQuestionsModal()">Cancel</button>
					</div>
				</div>
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

		function openUnitModal() {
			document.getElementById('unitModal').style.display = 'block';
		}

		function closeUnitModal() {
			document.getElementById('unitModal').style.display = 'none';
		}

		function saveUnit() {
			// Implement your save logic here
			closeUnitModal();
		}

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
	</script>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
