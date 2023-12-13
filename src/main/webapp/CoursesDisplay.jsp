<%@ page language="java" contentType="text/html; charset=ISO-8859-1"%>
<%@page import="EduPaper.model.AddCourse"%>
<%@page import="EduPaper.dao.CourseDao"%>
<%@page import="java.util.List"%>
<%@page import="EduPaper.model.UserReg"%>
<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" href="favicon.ico" type="image/x-icon">
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<h1>Course List</h1>

    <%
    // Retrieve logged-in user details from the session
                UserReg loggedInUser = (UserReg) session.getAttribute("loggedInUser");

                // Retrieve courses for the logged-in user from the database
                CourseDao courseDAO = new CourseDao();
                List<AddCourse> allCourses = courseDAO.getAllCourses(loggedInUser.getEmail());

                if (allCourses != null && !allCourses.isEmpty()) {
                    // Display the list of courses
    %>
        <ul>
            <%
            for (AddCourse course : allCourses) {
            %>
                <li><%= course.getCourseName() %> - <%= course.getCourseCode() %></li>
                <%
            }
            %>
        </ul>
        <%
    } else {
        // If no courses found for the user
        %>
        <p>No courses added yet.</p>
        <%
    }
    %>


</body>
</html>