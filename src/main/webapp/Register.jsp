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
	font-size: 14px;
}

button {
   margin-top: 15px;
}
p {
	font-size: 12px;
	margin-top: -18px;
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

								<h3 class="mb-4">Register</h3>

								<div class="mb-3">
									<input type="text" required="required" name="name"
										placeholder="Enter Name"
										class="form-control rounded-pill" />
								</div>
								<div class="mb-3">
									<input type="text" required="required" name="email"
										placeholder="Enter Email"
										class="form-control rounded-pill" />
								</div>
								<div class="mb-3">
									<select name="department" required="required"
                                        class="form-control rounded-pill">
                                        <option value="" disabled selected>Select Department</option>
                                        <option value="BSH">Basic Sciences and Humanities (F.Y. B.Tech)</option>
                                        <option value="COMP">Computer Engineering</option>
                                        <option value="ENTC">Electronics and Telecommunication</option>
                                        <option value="IT">Information Technology</option>
                                        <option value="INSTRU">Instrumentation And Control</option>
                                        <option value="MECH">Mechanical Engineering</option>
                                    </select>
								</div>
								<div class="mb-3">
									<input type="text" required="required" name="mobno"
										placeholder="Enter Mobile No."
										class="form-control rounded-pill" />
								</div>
								<div class="mb-3">
									<input type="password" required="required" name="pass"
										placeholder="Enter Password"
										class="form-control rounded-pill" />
								</div>
								<div class="mb-3">
                           <input type="password" required="required" name="cpass"
                              placeholder="Confirm Password"
                              class="form-control rounded-pill" />
                        </div>
								<button class="btn btn-primary rounded-pill w-100"
									type="submit">Register</button>
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