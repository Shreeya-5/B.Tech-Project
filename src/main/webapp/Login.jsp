<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta charset="utf-8">
<title>Login</title>
<%@ include file="index.html"%>
<style>
.card {
	border-radius: 1rem;
}

button {
   margin-top: 20px;
}

.forgot-password, p {
	font-size: 14px;
}

p {
   margin-top: -22px;
}
</style>
</head>
<body
	style="background: linear-gradient(to bottom right, #E6E6FA, #87CEFA);">
	<form action="LoginController">
		<section class="vh-100">
			<div class="container py-3 h-100">
				<div
					class="row d-flex justify-content-center align-items-center h-100">
					<div class="col-12 col-md-8 col-lg-6 col-xl-4">
						<div class="card shadow-2-strong" style="border-radius: 1rem;">
							<div class="card-body p-4 text-center">

								<h2 class="mb-4">Login</h2>

								<div class="mb-3">
									<input type="text" required="required" name="email"
										placeholder="Enter Email"
										class="form-control form-control-lg rounded-pill" />
								</div>

								<div class="mb-3">
									<input type="password" required="required" name="pass"
										placeholder="Enter Password"
										class="form-control form-control-lg rounded-pill" />
									<div class="text-end">
										<a href="ForgotPassword.jsp" class="forgot-password">Forgot
											Password?</a>
									</div>
								</div>

								<button class="btn btn-primary btn-lg rounded-pill w-100"
									type="submit">Login</button>
								<br>
								<br>
								<p class="mb-0">
									Don't have an account? <a href="Register.jsp">Register here</a>
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
	</form>
</body>
</html>