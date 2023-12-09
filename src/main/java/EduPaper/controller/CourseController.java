package EduPaper.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import EduPaper.dao.CourseDao;
import EduPaper.model.addCourse;
import EduPaper.model.userReg;

/**
 * Servlet implementation class RegisterController
 */
@WebServlet("/CourseController")
public class CourseController extends HttpServlet {
	private static final long serialVersionUID = 1L;

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

		CourseDao courseDAO = new CourseDao();
		addCourse newCourse = new addCourse();
		newCourse.setCourseCode(courseCode);
		newCourse.setCourseName(courseTitle);
		newCourse.setDeptName(user.getDept());
		newCourse.setUserEmail(user.getEmail());

		int result = courseDAO.createCourse(newCourse);
		if (result>0) {
			response.sendRedirect("CourseDashboard.jsp");
		}
		else {
			String errorMessage = "Failed to add the course. Please try again.";
			String script = "<script>showMessage('" + errorMessage + "');</script>";
			response.getWriter().write(script);
			response.sendRedirect("CourseDashboard.jsp");
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		CourseDao courseDAO = new CourseDao();
		boolean isCourseRemoved = false;

		String action = request.getParameter("action");

		if (action != null && action.equals("removeCourse")) {
			// Action to remove the course
			String courseCodeToRemove = request.getParameter("courseCode");

			isCourseRemoved = courseDAO.removeCourseByCode(courseCodeToRemove);

			if (isCourseRemoved) {
				// Course removed successfully
				response.sendRedirect("CourseDashboard.jsp");
			} else {
				// Display an error message in the modal using JavaScript
				String errorMessage = "Failed to remove the course. Please try again.";
				String script = "<script>showMessage('" + errorMessage + "');</script>";
				response.getWriter().write(script);
				response.sendRedirect("CourseDashboard.jsp");

			}
		} else {
			// Action to get course code for units
			String courseCodeForUnits = request.getParameter("courseCodeForUnits");
			session.setAttribute("courseCodeForUnits", courseCodeForUnits);
			response.sendRedirect("UnitDashboard.jsp");
		}
	}
}