package EduPaper.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class QueMarkInfoController
 */
@WebServlet("/QueMarkInfoController")
public class QueMarkInfoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QueMarkInfoController() {
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
		HttpSession session = request.getSession();
		List<Integer> subQuestions = (List<Integer>) session.getAttribute("subQuestions");
		List<String> subQueNames = (List<String>) session.getAttribute("subQueNames");
		int TotalMarksInput = (int) session.getAttribute("TotalMarksInput");
		
        List<Integer> subQueMarks = new ArrayList<>(); // Collection to store subquestions
		for (int i = 1; i <= subQuestions.size(); i++) {
			for (int j = 0; j < subQuestions.get(i - 1); j++) {
				String subQueMark = request.getParameter("Q"+i+subQueNames.get(j)+"");
				subQueMarks.add(Integer.parseInt(subQueMark));
			}
		}
		session.setAttribute("subQueMarks", subQueMarks);
		response.sendRedirect("PaperInfo.jsp");
	}

}
