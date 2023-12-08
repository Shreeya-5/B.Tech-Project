package EduPaper.dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

import EduPaper.model.*;

public class CourseDao {

	public int create(addCourse s) {
		int i = 0;
		Connection con = DataSource.getConnection();

		try {
			PreparedStatement pstate = con.prepareStatement("INSERT INTO course VALUES (?,?,?,?)");
			pstate.setString(2, s.getCourseName());
			pstate.setString(1, s.getCourseCode());
			pstate.setString(3, s.getDeptName());
			pstate.setString(4, s.getUserEmail());
			
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
	
	public List<addCourse> getAllCourses(String email) {
        List<addCourse> courses = new ArrayList<>();
        Connection con = DataSource.getConnection();
        try {
        	PreparedStatement pstate = con.prepareStatement("select * from course where user_email=?");
			pstate.setString(1, email);

			ResultSet rs = pstate.executeQuery();
			while (rs.next()) {
	            // Retrieve data from each row
	            String courseName = rs.getString("course_name");
	            String courseCode = rs.getString("course_code");
	            String deptName = rs.getString("dept_name");
	            String userEmail = rs.getString("user_email");

	            // Create an addCourse object and set its attributes
	            addCourse course = new addCourse();
	            course.setCourseName(courseName);
	            course.setCourseCode(courseCode);
	            course.setDeptName(deptName);
	            course.setUserEmail(userEmail);

	            // Add the course object to the courses list
	            courses.add(course);
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
	
	public boolean removeCourseByCode(String courseCode) {
        boolean isRemoved = false;
        Connection con = DataSource.getConnection();

        try {
            PreparedStatement pstate = con.prepareStatement("DELETE FROM course WHERE Course_code = ?");
            pstate.setString(1, courseCode);

            int rowsAffected = pstate.executeUpdate();
            if (rowsAffected > 0) {
                isRemoved = true;
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
        return isRemoved;
    }
}