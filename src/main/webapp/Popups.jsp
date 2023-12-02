<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Popup Example</title>
<!-- Include Bootstrap CSS and JavaScript -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<style>
</style>
</head>
<body>
	<div class="container mt-5">
		<h1>Popup Example</h1>

		<!-- Course Button -->
		<button type="button" class="btn btn-primary" data-toggle="modal"
			data-target="#courseModal">Course</button>

		<!-- Unit Button -->
		<button type="button" class="btn btn-success" data-toggle="modal"
			data-target="#unitModal">Unit</button>

		<!-- Questions Button -->
		<button type="button" class="btn btn-info" data-toggle="modal"
			data-target="#questionsModal">Questions</button>

		<!-- Course Modal -->
		<div class="modal fade" id="courseModal" tabindex="-1" role="dialog"
			aria-labelledby="courseModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">

					<!-- Modal Header -->
					<div class="modal-header">
						<h4 class="modal-title">Add Course</h4>
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>

					<div class="modal-body">
						<form>
							<div class="form-group">
								<label for="courseTitle">Course Title:</label> <input
									type="text" class="form-control" id="courseTitle"
									placeholder="Enter Course Title">
							</div>
							<div class="form-group">
								<label for="courseCode">Course Code:</label> <input type="text"
									class="form-control" id="courseCode"
									placeholder="Enter Course Code">
							</div>
							<div class="form-group">
								<label for="courseDesc">Course Description:</label>
								<textarea class="form-control" id="courseDesc"
									placeholder="Enter Course Description"></textarea>
							</div>
						</form>
					</div>

					<!-- Modal footer -->
					<div class="modal-footer">
						<button type="button" class="btn btn-success" data-dismiss="modal">Save</button>
						<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>

		<!-- Unit Modal -->
		<div class="modal fade" id="unitModal" tabindex="-1" role="dialog"
			aria-labelledby="unitModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="submitCancelModalLabel">Add Unit</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<form>
							<div class="mb-3">
								<label for="unitName" class="col-form-label">Unit Name:</label>
								<input type="text" class="form-control" id="unitName"
									placeholder="Unit Name">
							</div>
							<div class="mb-3">
								<label for="unitDescription" class="col-form-label">Unit
									Description:</label>
								<textarea class="form-control" id="unitDescription"
									placeholder="Unit Description"></textarea>
							</div>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-success" data-dismiss="modal">Submit</button>
						<button type="button" class="btn btn-danger" data-dismiss="modal">Cancle</button>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Questions Modal -->
	<div class="modal fade" id="questionsModal" tabindex="-1" role="dialog"
		aria-labelledby="questionsModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">Subjective Question</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<form>
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
					</form>
				</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-success" data-dismiss="modal">Submit</button>
					<button type="button" class="btn btn-danger" data-dismiss="modal">Cancle</button>
				</div>

			</div>
		</div>
	</div>
	</div>
</body>
</html>
