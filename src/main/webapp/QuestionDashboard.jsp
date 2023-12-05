<!DOCTYPE html>
<html lang="en">
<%@ include file="Popups.jsp"%>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Course Management</title>
</head>
<style>
.container {
	margin-top: 80px;
}
</style>
<%@ include file="navbar.jsp" %>
<%@ include file="index.html"%>
<body>
<div class="container">
    <div class="row">
        <div class="col-md-9">
            <!-- Content in the left part -->
            <div class="Question">
             <a >1. What is Computer?</a>
            </div>
        </div>
        <div class="col-md-3">
            <!-- Rightmost part with Add and Remove buttons -->
            <h3>Actions</h3>
            <button class="btn btn-primary btn-block" id="addCourseBtn" type="submit" onclick="openQuestionsModal()">Add Questions</button>
            
            <button class="btn btn-danger btn-block" id="removeCourseBtn">Remove Question</button>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
