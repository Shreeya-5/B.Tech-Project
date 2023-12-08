<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Pop-up Example</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
	
	

	<!-- Questions Modal -->
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
								class="form-control" id="question" name="question">
						</div>
						<div class="form-group">
							<label for="category">Category:</label> <input type="text"
								class="form-control" id="category" name="category">
						</div>
						<div class="form-group">
							<label for="Marks">Marks:</label> <input type="text"
								class="form-control" id="Marks" name="Marks">
						</div>
						<div class="form-group">
							<label for="Difficulty">Difficulty Level:</label> <select
								class="form-control" id="Difficulty" name="Difficulty">
								<option value="easy">Easy</option>
								<option value="moderate">Moderate</option>
								<option value="difficult">Difficult</option>
							</select>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-success"
							onclick="submitQuestion()">Submit</button>
						<button type="button" class="btn btn-danger"
							onclick="closeQuestionsModal()">Cancel</button>
					</div>
				</div>
			</div>
		</div>
	</form>
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
	</script>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
