package EduPaper.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class PaperInfoController
 */
@WebServlet("/PaperInfoController")
public class PaperInfoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PaperInfoController() {
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
		String PaperName = request.getParameter("PaperName");
		String TermName = request.getParameter("TermName");
		String dateOfExam = request.getParameter("dateOfExam");
		String timeLength = request.getParameter("timeLength");
		
		Map<String, String> paperInfo = new HashMap<>();
		paperInfo.put("PaperName", PaperName);
		paperInfo.put("TermName", TermName);
		paperInfo.put("dateOfExam", dateOfExam);
		paperInfo.put("timeLength", timeLength);
		
		HttpSession session = request.getSession();
		session.setAttribute("paperInfo", paperInfo);

		response.sendRedirect("PaperDisplay.jsp");
	}

}
