<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="EduPaper.dao.ACourse"%>
<%@page import="java.util.List"%>
<%@page import="EduPaper.model.addCourse"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<% ACourse courseDAO = new ACourse();
   List<addCourse> allCourses = (List<addCourse>) request.getAttribute("allCourses");
   if (allCourses != null && !allCourses.isEmpty()) {
       for (addCourse course : allCourses) {
%>
<div class="course">
    <a href="UnitDashboard.jsp"><%= course.getCourseName() %></a>
</div>
<%   }
   } else { %>
<div>
    <h2>No Courses Added</h2>
</div>
<% } %>


</body>
</html>