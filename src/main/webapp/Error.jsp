<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
   pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Error</title>
<%@ include file="index.html"%>
</head>
<style>
.img-with-text {
    text-align: justify;
}
.img-with-text img {
    display: block;
    margin: 0 auto;
}
</style>
<body>
<div class="container-fluid">
      <nav class="navbar navbar-expand-lg"
         style="margin-top: -9px; margin-left: -12px; margin-right: -12px;">
         <div class="container-fluid"
            style="background-color: #12276a; color: white; height: 60px;">
            <a href="#" class="navbar-brand"> <img alt="cumminslogo"
            style="height: 45px; width: 45px; border-radius: 25px;"
               src="CumminsLogo.png">
            </a> <a><h5>Student</h5></a>
            <button class="navbar-toggler" type="button" style="color: white;"
               data-bs-toggle="collapse" data-bs-target="#collapsibleNavbar">
               <span class="navbar-toggler-icon" style="color: white;"></span>
            </button>
            <div class="collapse navbar-collapse justify-content-end"
               id="collapsibleNavbar">
               <ul class="navbar-nav">
                  <li class="nav-item"><a class="nav-link" href="StudentHome.jsp">Home</a></li>
                  <li class="nav-item"><a class="nav-link" href="Dashboard.jsp">Logout</a></li>
                  <li class="nav-item"><a class="nav-link" href="StudProfile.jsp"><i
                        class="bi bi-person-circle"
                        style="font-size: 1.5rem; color: white;"></i></a></li>
               </ul>
            </div>
         </div>
      </nav>
   </div>
   <div class="container d-flex align-items-center justify-content-center" style="margin-top: -70px;">
      <div
         class="d-flex flex-column min-vh-100 justify-content-center align-items-center">
         <div class="alert alert-danger">
            <div
               class="container d-flex align-items-center justify-content-center">
               <strong><h1>Error!</h1></strong><br>
            </div>
            <h1>Something Went Wrong</h1>
         </div>
      </div>
   </div>
</body>
</html>
