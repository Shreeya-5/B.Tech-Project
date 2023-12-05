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

import EduPapar.model.userLogin;
import EduPapar.model.userReg;
import EduPaper.dao.registerDao;

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
		String email=request.getParameter("email");
		String password=request.getParameter("pass");
		
		userLogin studlogin=new userLogin(email,password);
		List<userLogin> lstlogin=new LinkedList<>();
		lstlogin.add(studlogin);
		
		registerDao userReg=new registerDao();
		List<userReg> lstreg=userReg.validateData(lstlogin);
		
		
		HttpSession session=request.getSession();
		session.setAttribute("studlist",lstreg);
		
		if(lstreg!=null) {
			response.sendRedirect("CourseDashboard.jsp");
		}
		else {
			logincnt++;
				if(logincnt<3)
					response.sendRedirect("Login.jsp");
				else {
					response.sendRedirect("Block.jsp");
				}
		}	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
