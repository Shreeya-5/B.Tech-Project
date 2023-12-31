<!DOCTYPE html>
<%@page import="java.util.List"%>
<html lang="en">
<head>
<%@ include file="index.html"%>
<%@ include file="navbar.jsp"%>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Subquestion Marks</title>
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

.que-mark-section {
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
	<%
	List<Integer> subQuestions = (List<Integer>) session.getAttribute("subQuestions");
	List<String> subQueNames = (List<String>) session.getAttribute("subQueNames");
	int TotalMarksInput = (int) session.getAttribute("TotalMarksInput");
	%>
	<form action="QueMarkInfoController" method="post">
		<div class="container">
			<div class="left-container">
				<div class="que-mark-section">

					<h3>Subquestion Marks</h3>
					<h5>
						Paper Marks :
						<%=TotalMarksInput%></h5>
					<%
					for (int i = 1; i <= subQuestions.size(); i++) {
						for (int j = 0; j < subQuestions.get(i - 1); j++) {
					%>
					<div class="form-group">
						<label>Marks for Subquestion Q<%=i%> <%=subQueNames.get(j)%></label>
						<input type="number" class="form-control"
							id="Q<%=i%><%=subQueNames.get(j)%>Marks"
							name="Q<%=i%><%=subQueNames.get(j)%>">
					</div>
					<%
					}
					}
					%>
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
						window.location.href = 'DiffLevel.jsp';
					});
		});
	</script>

</body>
</html>
