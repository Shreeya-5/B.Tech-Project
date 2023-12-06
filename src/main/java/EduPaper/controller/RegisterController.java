package EduPaper.controller;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import EduPaper.dao.registerDao;
import EduPaper.model.userReg;

/**
 * Servlet implementation class RegisterController
 */
@WebServlet("/RegisterController")
public class RegisterController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String sname=request.getParameter("name");
		String email=request.getParameter("email");
		String dept=request.getParameter("department");
		String mobno=request.getParameter("mobno");
		String pass=request.getParameter("pass");
		String cpass=request.getParameter("cpass");
		
		userReg usermodel=new userReg(sname,email,dept,mobno,pass);
		List<userReg> lstsreg=new LinkedList<>();
		lstsreg.add(usermodel);
		registerDao regdao=new registerDao();
		int i=regdao.Create(lstsreg);
		if(i>0) {
			System.out.println("inserted successfully..");
			response.sendRedirect("Login.jsp");
		}
		else {
			response.sendRedirect("Error.jsp");
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
