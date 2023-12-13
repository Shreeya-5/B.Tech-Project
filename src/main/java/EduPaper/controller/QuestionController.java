package EduPaper.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import EduPaper.dao.CourseDao;
import EduPaper.dao.QuestionDao;
import EduPaper.dao.UnitDao;
import EduPaper.model.AddCourse;
import EduPaper.model.AddQue;
import EduPaper.model.UserReg;

/**
 * Servlet implementation class QuestionController
 */
@WebServlet("/QuestionController")
public class QuestionController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public QuestionController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String queText = request.getParameter("question");
		String queType = request.getParameter("queType");
		int marks = Integer.parseInt(request.getParameter("Marks"));
		String diffLevel = request.getParameter("Difficulty");

		HttpSession session = request.getSession();
		String courseCode = (String) session.getAttribute("courseCodeForSubtopics");
		String unitNo = (String) session.getAttribute("unitNoForSubtopics");
		int id = (int) session.getAttribute("subtopicNoForQuestions");
		System.out.println(id);
		
		QuestionDao questionDao = new QuestionDao();
		AddQue que = new AddQue(id, queText, marks, diffLevel, queType, unitNo, courseCode);


		int result = questionDao.createQue(que);
		if (result>0) {
			response.sendRedirect("QuestionDashboard.jsp");
		}
		else {
			String errorMessage = "Failed to add the course. Please try again.";
			String script = "<script>showMessage('" + errorMessage + "');</script>";
			response.getWriter().write(script);
			response.sendRedirect("QuestionDashboard.jsp");
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
