package EduPaper.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class QuestionInfoController
 */
@WebServlet("/QuestionInfoController")
public class QuestionInfoController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public QuestionInfoController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String NumberOfQuestionInput = request.getParameter("NumberOfQuestionInput");
		String TotalMarksInput = request.getParameter("TotalMarksInput");

		HttpSession session = request.getSession();
		session.setAttribute("NumberOfQuestionInput", Integer.parseInt(NumberOfQuestionInput));
		session.setAttribute("TotalMarksInput", Integer.parseInt(TotalMarksInput));

		response.sendRedirect("SubQueInfo.jsp");
	}

}
