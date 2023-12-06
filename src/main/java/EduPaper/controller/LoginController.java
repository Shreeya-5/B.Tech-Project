package EduPaper.controller;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import EduPaper.dao.ACourse;
import EduPaper.dao.registerDao;
import EduPaper.model.addCourse;
import EduPaper.model.userLogin;
import EduPaper.model.userReg;

/**
 * Servlet implementation class LoginController
 */
@WebServlet("/LoginController")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private  static int logincnt=0;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Removing data from the session
		HttpSession session = request.getSession();
		session.removeAttribute("loggedInUser");

		String email=request.getParameter("email");
		String password=request.getParameter("pass");

		userLogin studlogin=new userLogin(email,password);
		List<userLogin> lstlogin=new LinkedList<>();
		lstlogin.add(studlogin);

		registerDao userReg=new registerDao();
		List<userReg> lstreg=userReg.validateData(lstlogin);
		
		if (lstreg != null && !lstreg.isEmpty()) {
            session.setAttribute("loggedInUser", lstreg.get(0));

            // Redirect to a dashboard or desired page upon successful login
            response.sendRedirect("CourseDashboard.jsp");
        }
		else {
			logincnt++;
			if(logincnt<3)
				response.sendRedirect("Login.jsp");
			else {
				response.sendRedirect("Block.jsp");
			}
		}	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
