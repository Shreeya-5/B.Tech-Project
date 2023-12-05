package EduPaper.dao;
import EduPapar.model.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.*;






public class ACourse {

    public int create(List<addCourse> lstscrs) {
        int i = 0;
        addCourse s = lstscrs.get(0);
        Connection con = DataSource.getConnection();
        System.out.println(con);

        try {
            if (!isCourseExists(s.getCourseId(), con)) { // Check if course exists
                PreparedStatement pstate = con.prepareStatement("INSERT INTO add_course VALUES (?, ?)");
                pstate.setInt(1, s.getCourseId());
                pstate.setString(2, s.getCourseName());
                i = pstate.executeUpdate();
            } else {
                System.out.println("Course already exists in the database.");
                // Handle case where the course already exists
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
        return i;
    }

    // Method to check if a course exists in the database
    private boolean isCourseExists(int courseId, Connection con) throws SQLException {
        boolean exists = false;

        PreparedStatement pstate = con.prepareStatement("SELECT * FROM add_course WHERE course_id = ?");
        pstate.setInt(1, courseId);
        ResultSet rs = pstate.executeQuery();

        if (rs.next()) {
            exists = true; // Course exists in the database
        }

        rs.close();
        pstate.close();
        
        return exists;
    }
}