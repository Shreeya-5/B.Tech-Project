<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Course Management</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        /* Custom CSS to expand dropdown on hover */
        .btn-group:hover .dropdown-menu {
            display: block;
        }
    </style>
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
            <!-- Rightmost part with three buttons -->
            <h3>Actions</h3>
            <div class="btn-group-vertical" role="group">
                <!-- Courses button with dropdown menu -->
                <div class="btn-group">
                    <button class="btn btn-primary" type="button">
                        Courses
                    </button>
                    <div class="dropdown-menu">
                        <a class="dropdown-item" href="#">Course 1</a>
                        <a class="dropdown-item" href="#">Course 2</a>
                        <a class="dropdown-item" href="#">Course 3</a>
                    </div>
                </div>
                <!-- Explore button -->
                <button class="btn btn-success" id="exploreBtn">Explore</button>
                <!-- Add button -->
                <button class="btn btn-info" id="addBtn">Add</button>
            </div>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
