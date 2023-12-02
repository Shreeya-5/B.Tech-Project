<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Unit Management</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>

<%@ include file="navbar.jsp" %>

<div class="container">
    <div class="row">
        <div class="col-md-9">
            <!-- Content in the left part -->
            <h3>Main Content</h3>
            <p>This is the main content of the page.</p>
        </div>
        <div class="col-md-3">
            <!-- Rightmost part with Add and Remove buttons -->
            <h3>Actions</h3>
            <button class="btn btn-primary btn-block" id="addUnitBtn">Add Unit</button>
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
