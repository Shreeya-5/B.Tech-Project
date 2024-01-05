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
 * Servlet implementation class SubQueInfoController
 */
@WebServlet("/SubQueInfoController")
public class SubQueInfoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SubQueInfoController() {
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
		int NumberOfQuestionInput = (int) session.getAttribute("NumberOfQuestionInput");
		
        List<String> subQueNames = new ArrayList<>(); // Collection to store subquestions
        subQueNames.add("a");
        subQueNames.add("b");
        subQueNames.add("c");
        subQueNames.add("d");
        subQueNames.add("e");
        subQueNames.add("f");
        subQueNames.add("g");
        subQueNames.add("h");
        subQueNames.add("i");
        subQueNames.add("j");
		
        List<Integer> subQuestions = new ArrayList<>(); // Collection to store subquestions
		for (int i = 1; i <= NumberOfQuestionInput; i++) {
			String subQuestion = request.getParameter("subQ"+i+"Input");
			int subQueNo = Integer.parseInt(subQuestion);
            subQuestions.add(subQueNo); // Add subquestion to the collection
		}
		session.setAttribute("subQuestions", subQuestions);
		session.setAttribute("subQueNames", subQueNames);
		
		response.sendRedirect("UnitInfo.jsp");
	}

}
