<%@ page language="java" contentType="text/html; charset=ISO-8859-1"%>
<%@page import="EduPaper.model.addCourse"%>
<%@page import="EduPaper.dao.ACourse"%>
<%@page import="java.util.List"%>
<%@page import="EduPaper.model.userReg"%>
<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<h1>Course List</h1>

    <%
    // Retrieve logged-in user details from the session
    userReg loggedInUser = (userReg) session.getAttribute("loggedInUser");

    // Retrieve courses for the logged-in user from the database
    ACourse courseDAO = new ACourse();
    List<addCourse> allCourses = courseDAO.getAllCourses(loggedInUser.getEmail());

    if (allCourses != null && !allCourses.isEmpty()) {
        // Display the list of courses
        %>
        <ul>
            <%
            for (addCourse course : allCourses) {
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