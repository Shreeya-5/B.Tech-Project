package EduPaper.dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.*;

import EduPaper.model.*;

public class ACourse {

	public int create(List<addCourse> lstscrs) {
		int i = 0;
		addCourse s = lstscrs.get(0);
		Connection con = DataSource.getConnection();

		try {
			PreparedStatement pstate = con.prepareStatement("INSERT INTO course VALUES (?,?)");
			pstate.setString(1, s.getCourseName());
			pstate.setString(2, s.getCourseCode());
			i = pstate.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return i;
	}   
	
	public List<addCourse> getAllCourses() {
        List<addCourse> courses = new ArrayList<>();
        Connection con = DataSource.getConnection();
        try {
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM course");

            while (rs.next()) {
                addCourse course = new addCourse();
                course.setCourseName(rs.getString("courseName"));
                course.setCourseCode(rs.getString("courseCode"));
                courses.add(course);
                System.out.println("Courses" + courses);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return courses;
    }
}