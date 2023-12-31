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
 * Servlet implementation class DiffLevelController
 */
@WebServlet("/DiffLevelController")
public class DiffLevelController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DiffLevelController() {
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
		String easyInput = request.getParameter("easy");
		int easy = Integer.parseInt(easyInput);
		String mediumInput = request.getParameter("medium");
		int medium = Integer.parseInt(mediumInput);
		String hardInput = request.getParameter("hard");
		int hard = Integer.parseInt(hardInput);

		Map<String, Integer> diffLevel = new HashMap<>();
		diffLevel.put("easy", easy);
		diffLevel.put("medium", medium);
		diffLevel.put("hard", hard);
		
		HttpSession session = request.getSession();
		session.setAttribute("diffLevelMark", diffLevel);

		response.sendRedirect("QueMarkInfo.jsp");
	}

}
