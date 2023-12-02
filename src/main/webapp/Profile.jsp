<!DOCTYPE html>
<html>
<%@ include file="index.html"%>

<head>
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

/* Custom CSS for the right section */
.right-section {
	padding: 10px;
}

.info-box {
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
	width: 120px;
	height: 120px;
	background-color: #007BFF;
	border-radius: 50%;
	margin: 0 auto;
}

.profile-icon i {
	font-size: 60px;
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
	margin-bottom: 20px;
	background-color: white;
	border: 1px solid #ced4da;
	border-radius: 8px;
	padding: 20px;
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
	<div class="modal fade" id="profileModal" tabindex="-1" role="dialog"
		aria-labelledby="profileModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header">
						<h4 class="modal-title">User Profile</h4>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true"></span>&times;</button>
						
					</div>
				<div class="modal-body">
					<div class="profile-box">
						<div class="row">
							<div class="col-lg-6 left-section">
								<div class="profile-icon">
									<span class="glyphicon glyphicon-user"></span> <i
										class="fas fa-user"></i>
									<!-- You can change the icon here -->
								</div>
							</div>

							<div class="col-lg-6 right-section">
								<div class="info-box">
									<span class="info-label">Username:</span> <span id="username">Riddhi
										Chipade</span>
								</div>

								<div class="info-box">
									<span class="info-label">Email:</span> <span id="email">riddhi@gmail.com</span>
								</div>

								<div class="info-box">
									<span class="info-label">Mobile No.:</span> <span id="mobile">1234567890</span>
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

</html>
