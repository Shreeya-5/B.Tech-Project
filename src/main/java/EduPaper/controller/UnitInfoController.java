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

import EduPaper.dao.UnitDao;
import EduPaper.model.AddUnit;

/**
 * Servlet implementation class UnitInfoController
 */
@WebServlet("/UnitInfoController")
public class UnitInfoController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UnitInfoController() {
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
		String courseCode = (String) session.getAttribute("courseCodeForUnits");

		UnitDao unitDao = new UnitDao();
		List<AddUnit> units = unitDao.getAllUnits(courseCode);

        List<Integer> allUnitMarks = new ArrayList<>(); // Collection to store subquestions
		if (units != null && !units.isEmpty()) {	
			for (AddUnit unit : units) {
				String unitMarks = request.getParameter("Unit" + unit.getUnitNo() + "Input");
				allUnitMarks.add(Integer.parseInt(unitMarks));
			}
		}
		session.setAttribute("allUnitMarks", allUnitMarks);
		response.sendRedirect("DiffLevel.jsp");
	}

}
