package EduPaper.controller;

import com.google.gson.Gson;
import java.io.IOException;
import java.util.LinkedList;
import java.util.List;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import EduPaper.dao.ACourse;
import EduPaper.dao.registerDao;
import EduPaper.model.addCourse;
import EduPaper.model.userLogin;
import EduPaper.model.userReg;

/**
 * Servlet implementation class RegisterController
 */
@WebServlet("/CourseController")
public class CourseController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private  static int logincnt=0;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CourseController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String courseTitle = request.getParameter("courseTitle");
	    String courseCode = request.getParameter("courseCode");
		
	    HttpSession session = request.getSession();
		userReg user = (userReg) session.getAttribute("loggedInUser");

	    ACourse courseDAO = new ACourse();
	    addCourse newCourse = new addCourse();
	    newCourse.setCourseCode(courseCode);
	    newCourse.setCourseName(courseTitle);
	    newCourse.setDeptName(user.getDept());
	    newCourse.setUserEmail(user.getEmail());
	    
	    int result = courseDAO.create(newCourse);
	    if (result>0) {
	    	response.sendRedirect("CourseDashboard.jsp");
	    }
	    
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}
}