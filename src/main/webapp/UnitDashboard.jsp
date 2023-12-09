<!DOCTYPE html>
<%@page import="java.util.List"%>
<%@page import="EduPaper.model.addUnit"%>
<%@page import="EduPaper.dao.UnitDao"%>
<html lang="en">
<head>
<%@ include file="index.html"%>
<%@ include file="navbar.jsp"%>
<link rel="icon" href="favicon.ico" type="image/x-icon">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Unit Management</title>
</head>
<style>
.container {
	margin-top: 80px;
}

.unitDisplay {
	display: flex;
	flex-direction: column;
}

.unit {
	display: flex;
	border-radius: 5px;
	border: 1px;
	margin: 10px;
	background-color: #9EEBBF;
	height: 80px;
	width: 120px;
	text-align: center;
	justify-content: center;
	align-items: center;
	text-decoration: none;
	color: black;
	background-color: #9EEBBF;
	border-radius: 5px;
	background-color: #9EEBBF;
	cursor: pointer;
}

.unit:hover {
	text-decoration: none;
	color: black;
	font-weight: bold;
	box-shadow: 0 1px 4px rgba(0, 0, 0, 0.3), 0 0 20px rgba(0, 0, 0, 0.1)
		inset;
	position: relative;
}
</style>
<body>
	<div class="container">
		<%
		String courseCode = (String) session.getAttribute("courseCodeForUnits");
		%>

		<!-- Add Unit Modal -->
		<form action="UnitController" method="get">
			<div class="modal" id="unitModal">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h4 class="modal-title">Add Unit</h4>
							<button type="button" class="close" onclick="closeUnitModal()">&times;</button>
						</div>
						<div class="modal-body">

							<div class="form-group">
								<label for="unitName">Unit No:</label> <input type="text"
									class="form-control" id="unitNo" name="unitNo"
									placeholder="Unit No">
							</div>
							<div class="form-group">
								<label for="unitDescription">Unit Name:</label> <input
									class="form-control" id="unitName" name="unitName"
									placeholder="Unit Name"></input>
							</div>
						</div>
						<div class="modal-footer">
							<button type="submit" class="btn btn-success"
								onclick="saveUnit()">Submit</button>
							<button type="button" class="btn btn-danger"
								onclick="closeUnitModal()">Cancel</button>
						</div>
					</div>
				</div>
			</div>
		</form>

		<!-- Modal for displaying messages -->
		<div class="modal" id="messageModal">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title">Message</h4>
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>
					<div class="modal-body">
						<p id="modalMessage"></p>
					</div>
				</div>
			</div>
		</div>

		<div class="row">
			<div class="col-md-9">
				<h2><%=courseCode%></h2>
				<!-- Content in the left part -->
				<div class="unitsDisplay">
					<%
					UnitDao unitDao = new UnitDao();
					List<addUnit> units = unitDao.getAllUnits(courseCode);

					if (units != null && !units.isEmpty()) {
						for (addUnit unit : units) {
					%>
					<form id="unitNoForm<%=unit.getUnitNo()%>" action="UnitController"
						method="post">
						<input type="hidden" name="unitNoForSubtopics" value="<%=unit.getUnitNo()%>">
						<input type="hidden" name="courseCodeForSubtopics"
							value="<%=unit.getCourseCode()%>"> <a
							onclick="submitUnit('<%=unit.getUnitNo()%>')" class="unit"
							id="unit_<%=unit.getUnitNo()%>"> <%=unit.getUnitName()%>
							<button type="button" style="display: none;"></button>
						</a>
					</form>

					<%
					}
					} else {
					%>
					<h2>No Units Available</h2>
					<%
					}
					%>
				</div>
			</div>
			<div class="col-md-3">
				<!-- Rightmost part with Add and Remove buttons -->
				<h3>Actions</h3>
				<button class="btn btn-primary btn-block" id="addUnitBtn"
					type="submit" onclick="openUnitModal()">Add Unit</button>
				<button class="btn btn-success btn-block" id="generatePaperBtn">Generate
					Paper</button>
				<button class="btn btn-info btn-block" id="previousPaperBtn">Previous
					Paper</button>
			</div>
		</div>
	</div>
	<script>
		function openUnitModal() {
			document.getElementById('unitModal').style.display = 'block';
		}

		function closeUnitModal() {
			document.getElementById('unitModal').style.display = 'none';
		}

		function saveUnit() {
			// Implement your save logic here
			closeUnitModal();
		}

		function openRemoveUnitModal() {
			document.getElementById('removeUnitModal').style.display = 'block';
		}

		function closeRemoveUnitModal() {
			document.getElementById('removeUnitModal').style.display = 'none';
		}

		function removeUnit() {
			// Implement your save logic here
			closeRemoveCourseModal();
		}

		function showMessage(message) {
			document.getElementById('modalMessage').innerText = message;
			$('#messageModal').modal('show'); // Show the modal
		}

		function submitUnit(unitNo) {
			document.getElementById('unitNoForm' + unitNo).submit();
		}
	</script>

</body>
</html>
