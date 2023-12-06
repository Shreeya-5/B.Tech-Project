<%@page import="EduPaper.model.userReg"%>
<%@page import="EduPaper.model.addCourse"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@ include file="index.html"%>
</head>
<style>
.link {
	text-decoration: none;
	color: white;
	padding: 5px;
}

.bi-person-circle {
	font-size: 1.5rem;
}

.link:hover {
	color: white;
	font-weight: bold;
}

.left-section {
	display: flex;
	align-items: center;
	justify-content: center;
}

/* Custom CSS for the right section */
.right-section {
	padding: 10px;
}

.info-box {
	margin-bottom: 10px;
	width: 50%;
	margin-bottom: 10px;
}

.info-label {
	font-weight: bold;
}

/* Custom CSS for the profile icon */
.profile-icon {
	display: flex;
	justify-content: center;
	align-items: center;
	width: 200px;
	height: 200px;
	background-color: #007BFF;
	border-radius: 50%;
	margin: 0 auto;
}

.profile-icon i {
	font-size: 100px;
	color: #fff;
	align-items: center;
}

.modal-header {
	background-color: #007BFF;
	color: white;
	border-bottom: none;
}

.modal-title {
	font-size: 24px;
}

.modal-body {
	background-color: #f8f9fa;
	padding: 20px;
}

.info-label {
	font-weight: bold;
	font-size: 16px;
}

.info-box {
	margin-bottom: 15px;
	background-color: white;
	border: 1px solid #ced4da;
	border-radius: 8px;
	width: 300px;
	padding: 10px;
}

/* Add some padding and margin to buttons */
.modal-footer button {
	margin: 0 10px;
	padding: 10px 20px;
}

.modal-footer button.btn-primary {
	background-color: #007BFF;
	border: none;
}

/* Style input fields */
.form-control {
	border: 1px solid #ced4da;
	border-radius: 4px;
}

.profile-box {
	background-color: white;
	border: 1px solid #ced4da;
	border-radius: 8px;
	padding: 20px;
}
</style>
</head>

<body>
	<%
	// Retrieving data from the session
	userReg user = (userReg) session.getAttribute("loggedInUser");
	%>
	<div class="modal fade" id="profileModal" tabindex="-1" role="dialog"
		aria-labelledby="profileModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="profileModalLabel">User Profile</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="profile-box">
						<div class="row">
							<div class="col left-section">
								<div class="profile-icon">
									<span class="glyphicon glyphicon-user"></span> <i
										class="fas fa-user"></i>
									<!-- You can change the icon here -->
								</div>
							</div>

							<div class="col right-section">
								<div class="info-box">
									<span class="info-label">Username:</span> <span id="username"><%=user.getName()%></span>
								</div>

								<div class="info-box">
									<span class="info-label">Email:</span> <span id="email"><%=user.getEmail()%></span>
								</div>
								<div class="info-box">
									<span class="info-label">Department:</span> <span id="email"><%=user.getDept()%></span>
								</div>
								<div class="info-box">
									<span class="info-label">Mobile No.:</span> <span id="mobile"><%=user.getMobno()%></span>
									<br>
									<button class="btn btn-secondary edit-mobile-button"
										onclick="editMobile()">Edit</button>
									<button id="update-mobile"
										class="btn btn-primary save-mobile-button"
										onclick="saveMobile()">Save</button>
								</div>

								<button class="btn btn-primary change-password-button"
									onclick="showChangePasswordPopup()">Change Password</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="modal fade" id="changePasswordModal" tabindex="-1"
		role="dialog" aria-labelledby="changePasswordModalLabel"
		aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="changePasswordModalLabel">Reset
						Password</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="info-box">
						<label for="existing-password" class="info-label">Existing
							Password:</label> <input type="password" id="existing-password"
							class="form-control">
					</div>

					<div class="info-box">
						<button class="btn btn-primary reset-password-button"
							onclick="resetPassword()">Reset Password</button>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Include Bootstrap JS and Popper.js -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

	<script>
		function showPopup() {
			$('#profileModal').modal('show');
		}

		function editMobile() {
			var mobileValue = document.getElementById('mobile');
			var editButton = document.querySelector('.edit-mobile-button');
			var updateMobileButton = document.getElementById('update-mobile');

			mobileValue.innerHTML = '<input type="text" id="new-mobile" class="form-control" value="' + mobileValue.textContent + '">';
			editButton.style.display = 'none';
			updateMobileButton.style.display = 'inline-block';
		}

		function saveMobile() {
			var mobileValue = document.getElementById('mobile');
			var editButton = document.querySelector('.edit-mobile-button');
			var updateMobileButton = document.getElementById('update-mobile');
			var newMobileInput = document.getElementById('new-mobile');

			mobileValue.textContent = newMobileInput.value;
			editButton.style.display = 'inline-block';
			updateMobileButton.style.display = 'none';
		}

		function showChangePasswordPopup() {
			$('#changePasswordModal').modal('show');
		}

		function resetPassword() {
			// You can add code here to handle password reset.
		}
	</script>
</body>

</body>
</html>