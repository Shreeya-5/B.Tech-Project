package EduPaper.controller;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import EduPapar.model.addCourse;
import EduPaper.dao.ACourse;

/**
 * Servlet implementation class RegisterController
 */
@WebServlet("/CourseController")
public class CourseController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CourseController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String coursename=request.getParameter("Course_name");
		int courseid=request.getParameter("Course_id");
		
		
		addCourse coursemodel=new addCourse(courseid,coursename);
		List<addCourse> lstscrs=new LinkedList<>();
		lstscrs.add(coursemodel);
		ACourse coursedao=new ACourse();
		int i=coursedao.create(lstscrs);
		if(i>0) {
			System.out.println("inserted successfully..");
			response.sendRedirect("CourseDashboard.jsp");
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
