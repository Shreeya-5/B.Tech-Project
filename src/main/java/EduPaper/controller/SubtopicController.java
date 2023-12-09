package EduPaper.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import EduPaper.dao.SubtopicDao;
import EduPaper.model.addSubtopic;

/**
 * Servlet implementation class SubtopicController
 */
@WebServlet("/SubtopicController")
public class SubtopicController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SubtopicController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String subtopicName = request.getParameter("subtopicName");
		
		HttpSession session = request.getSession();
		String courseCode = (String) session.getAttribute("courseCodeForSubtopics");
		String unitNo = (String) session.getAttribute("unitNoForSubtopics");

		SubtopicDao subtopicDao = new SubtopicDao();
		addSubtopic subtopic = new addSubtopic(subtopicName, unitNo, courseCode);
		System.out.println(unitNo);

		int result = subtopicDao.createSubtopic(subtopic);
		if (result>0) {
			response.sendRedirect("SubtopicDashboard.jsp");
		}
		else {
			String errorMessage = "Failed to add the course. Please try again.";
			String script = "<script>showMessage('" + errorMessage + "');</script>";
			response.getWriter().write(script);
			response.sendRedirect("SubtopicDashboard.jsp");
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int subtopicId = Integer.parseInt(request.getParameter("subtopicNoForQuestions"));

		HttpSession session = request.getSession();
		// Action to get course code for units
		session.setAttribute("subtopicNoForQuestions", subtopicId);
		response.sendRedirect("QuestionDashboard.jsp");

	}
}
