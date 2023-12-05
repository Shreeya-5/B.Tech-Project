<!DOCTYPE html>
<html lang="en">
<%@ include file="Popups.jsp"%>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Unit Management</title>
</head>
<%@ include file="index.html"%>
<%@ include file="navbar.jsp" %>
<style>
.container {
	margin-top: 80px;
}
.unit {
	display: flex;
	border-radius: 5px;
	border: 1px;
	background-color: #9EEBBF;
	height: 80px;
	width: 120px;
	text-align: center;
	align-items:center;
	justify-content: center;
	text-decoration: none;
	
}
.unit a{
	text-align: center;
	color: black;
}
.unit a:hover {
	text-decoration: none;
	color: black;
	font-weight: bold;
}
</style>
<body>
<div class="container">
    <div class="row">
        <div class="col-md-9">
            <!-- Content in the left part -->
            <div class="unit">
             <a href="QuestionDashboard.jsp" >Unit 1</a>
            </div>
        </div>
        <div class="col-md-3">
            <!-- Rightmost part with Add and Remove buttons -->
            <h3>Actions</h3>
            <button class="btn btn-primary btn-block" id="addUnitBtn" type="submit" onclick="openUnitModal()">Add Unit</button>
            <button class="btn btn-success btn-block" id="generatePaperBtn">Generate Paper</button>
            <button class="btn btn-info btn-block" id="previousPaperBtn">Previous Paper</button>
            <button class="btn btn-danger btn-block" id="removeUnitBtn">Remove Unit</button>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
