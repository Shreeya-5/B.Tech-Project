<!DOCTYPE html>
<%@page import="EduPaper.model.AddUnit"%>
<%@page import="java.util.List"%>
<%@page import="EduPaper.dao.UnitDao"%>
<html lang="en">
<head>
<%@ include file="index.html"%>
<%@ include file="navbar.jsp"%>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Difficulty level</title>
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

.Unit-section {
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
	String courseCode = (String) session.getAttribute("courseCodeForUnits");
	int TotalMarksInput = (int) session.getAttribute("TotalMarksInput");
	%>
	<form action="UnitInfoController" method="post">
		<div class="container">
			<div class="left-container">
				<div class="Unit-section">

					<h3>Unit</h3>
					<%
					UnitDao unitDao = new UnitDao();
					List<AddUnit> units = unitDao.getAllUnits(courseCode);

					if (units != null && !units.isEmpty()) {
						for (AddUnit unit : units) {
					%>
					<div class="form-group">
						<label for="unit1Input"><%=unit.getUnitName()%></label> <input
							type="text" class="form-control"
							id="Unit<%=unit.getUnitNo()%>Input"
							name="Unit<%=unit.getUnitNo()%>Input">
					</div>
					<%
					}
					}
					%>
					<h5>
						Paper Marks :
						<%=TotalMarksInput%></h5>

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
						window.location.href = 'SubQueInfo.jsp';
					});
		});
	</script>

</body>
</html>
