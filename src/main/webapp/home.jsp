<!DOCTYPE html>
<html>
<head>
<link rel="icon" href="favicon.ico" type="image/x-icon">
<meta charset="ISO-8859-1">
<title>Edupaper - Home</title>
<%@ include file="index.html"%>
<style>
.container-fluid {
	padding: 38px;
	text-align: center;
	width: 100%;
	background: linear-gradient(to right, #ffb6c1, #87ceeb);
}

.facilities {
	font-size: 1.2rem;
}

.get-started-button {
	background-color: #245ead;
	color: white;
	padding: 10px 20px;
	border: none;
	border-radius: 5px;
	font-size: 1.5rem;
	cursor: pointer;
	margin: 10px 0;
}

.sign-in-link {
	font-size: 1.2rem;
	margin-top: 10px;
}

.img {
	margin-right: 5px;
}

h1 {
	font-size: 54px;
}

.features {
	font-size: 24px;
}
</style>
</head>
<body>
	<div class="container-fluid">
		<h1>Set papers online with ease now on EduPaper</h1>
		<button class="get-started-button" id="getStartedButton">Get
			Started</button>
		<p class="sign-in-link">
			Already have an account?<a href="Login.jsp"> Sign in</a>
		</p>
		<p class="features">
			<img src="check.png" style="width: 15px;" class="img">Supports
			Multiple Courses <img src="check.png" style="width: 15px;"
				class="img">All units covered <img src="check.png"
				style="width: 15px;" class="img">Set Marks & Difficulty <img
				src="check.png" style="width: 15px;" class="img">Send PDF to
			examiner</p>
		<p class="sign-in-link" style="margin-left: 24px; margin-right: 24px;">
			Examination Process is important BUT Preparing Question Paper is
			Challenging. A simplified and easy to use solution to create question
			papers. With SetNow question Paper Generator, the entire tedious task
			of manual question paper creation is eradicated swiftly and
			efficiently. SetNow question paper generator is a remarkable solution
			for schools /colleges and other educational institutes. Generally
			conducting an exam is an extremely lengthy process. This may take a
			lot of time. Teachers have no much time for creating question papers,
			so exceedingly perceived school /universities hire other resources
			who can make test papers. Using the free demo of question paper
			generator software, the dependency on other human resources is
			decreasing. Question paper generator generates questions in just
			minutes. The system allows adding a complexity of question-level
			using a multitude question like Multiple Choice, Descriptive
			Question. The system generates module-wise question paper. One can
			set marks per question-wise, module-wise, module to module also the
			functionality of without displaying marks on the question paper. One
			can export question paper to PDF format after the question paper is
			generated.</p>
	</div>
	<script>
		document.getElementById('getStartedButton').addEventListener('click',
				function() {
					// Redirect to the desired page (e.g., Register.jsp)
					window.location.href = 'Register.jsp';
				});
	</script>

</body>
</html>
