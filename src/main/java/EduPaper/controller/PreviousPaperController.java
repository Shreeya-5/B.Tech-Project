package EduPaper.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import EduPaper.dao.UnitDao;
import EduPaper.model.AddUnit;

/**
 * Servlet implementation class PreviousPaperController
 */
@WebServlet("/PreviousPaperController")
public class PreviousPaperController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PreviousPaperController() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String unitNo = request.getParameter("unitNo");
		String unitName = request.getParameter("unitName");

		HttpSession session = request.getSession();
		String courseCode = (String) session.getAttribute("courseCodeForUnits");

		UnitDao unitDao = new UnitDao();
		AddUnit newUnit = new AddUnit();
		newUnit.setUnitNo(unitNo);
		newUnit.setCourseCode(courseCode);
		newUnit.setUnitName(unitName);
		int result = unitDao.createUnit(newUnit);
		if (result > 0) {
			response.sendRedirect("UnitDashboard.jsp");
		}
		else {
			String errorMessage = "Failed to add the unit. Please try again.";
			String script = "<script>showMessage('" + errorMessage + "');</script>";
			response.getWriter().write(script);
			response.sendRedirect("UnitDashboard.jsp");
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();

		// Action to get course code for units
		String paperId = request.getParameter("paperId");
		session.setAttribute("paperId", paperId);
		
		response.sendRedirect("SubtopicDashboard.jsp");
	}
}
