<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta charset="ISO-8859-1">
<title>Register</title>
<%@ include file="index.html"%>
</head>
<style>
.card {
	border-radius: 1rem;
}

button {
   margin-top: 20px;
}

p {
	font-size: 14px;
	margin-top: -22px;
}
</style>
</head>
<body
	style="background: linear-gradient(to bottom right, #E6E6FA, #87CEFA);">
	<form action="RegisterController">
		<section class="vh-100">
			<div class="container py-3 h-100">
				<div
					class="row d-flex justify-content-center align-items-center h-100">
					<div class="col-xl-5">
						<div class="card shadow-2-strong" style="border-radius: 1rem;">
							<div class="card-body p-5 text-center">

								<h2 class="mb-4">Register</h2>

								<div class="mb-3">
									<input type="text" required="required" name="name"
										placeholder="Enter Name"
										class="form-control form-control-lg rounded-pill" />
								</div>
								<div class="mb-3">
									<input type="text" required="required" name="email"
										placeholder="Enter Email"
										class="form-control form-control-lg rounded-pill" />
								</div>
								<div class="mb-3">
									<input type="text" required="required" name="mobno"
										placeholder="Enter Mobile No."
										class="form-control form-control-lg rounded-pill" />
								</div>
								<div class="mb-3">
									<input type="password" required="required" name="pass"
										placeholder="Enter Password"
										class="form-control form-control-lg rounded-pill" />
								</div>
								<div class="mb-3">
                           <input type="password" required="required" name="cpass"
                              placeholder="Confirm Password"
                              class="form-control form-control-lg rounded-pill" />
                        </div>
								<button class="btn btn-primary btn-lg rounded-pill w-100"
									type="submit">Login</button>
								<br>
								<br>
								<p class="mb-0">
									Already have an account? <a href="Login.jsp">Login here</a>
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