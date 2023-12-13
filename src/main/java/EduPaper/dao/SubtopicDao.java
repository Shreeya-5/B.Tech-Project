package EduPaper.dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

import EduPaper.model.*;

public class SubtopicDao {

	public int createSubtopic(AddSubtopic subtopic) {
		int i = 0;
		Connection con = DataSource.getConnection();
		

		try {
			PreparedStatement pstate = con.prepareStatement("INSERT INTO Subtopic (SUBTOPIC_NAME, UNIT_NO, COURSE_CODE) VALUES (?,?,?)");

			System.out.println(subtopic.getUnitNo());
			pstate.setString(1, subtopic.getSubtopicName());
			pstate.setString(2, subtopic.getUnitNo());
			pstate.setString(3, subtopic.getCourseCode());

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

	public List<AddSubtopic> getAllSubtopicsForUnitAndCourse(String unitNo, String courseCode) {
		List<AddSubtopic> subtopics = new ArrayList<>();
		Connection con = DataSource.getConnection();

		try {
			PreparedStatement pstate = con.prepareStatement("SELECT * FROM Subtopic WHERE UNIT_NO = ? AND COURSE_CODE = ?");
			pstate.setString(1, unitNo);
			pstate.setString(2, courseCode);

			ResultSet rs = pstate.executeQuery();
			while (rs.next()) {
				int subtopicId = rs.getInt("SUBTOPIC_ID");
				String subtopicName = rs.getString("SUBTOPIC_NAME");
				// Assuming you also want to retrieve unitNo and courseCode for the subtopic
				String retrievedUnitNo = rs.getString("UNIT_NO");
				String retrievedCourseCode = rs.getString("COURSE_CODE");

				AddSubtopic subtopic = new AddSubtopic(subtopicId, subtopicName, retrievedUnitNo, retrievedCourseCode);
				subtopics.add(subtopic);
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
		return subtopics;
	}
	
	public List<AddSubtopic> getAllSubtopicsForCourse(String courseCode) {
		List<AddSubtopic> subtopics = new ArrayList<>();
		Connection con = DataSource.getConnection();

		try {
			PreparedStatement pstate = con.prepareStatement("SELECT * FROM Subtopic WHERE COURSE_CODE = ?");
			pstate.setString(1, courseCode);

			ResultSet rs = pstate.executeQuery();
			while (rs.next()) {
				int subtopicId = rs.getInt("SUBTOPIC_ID");
				String subtopicName = rs.getString("SUBTOPIC_NAME");
				// Assuming you also want to retrieve unitNo and courseCode for the subtopic
				String retrievedUnitNo = rs.getString("UNIT_NO");
				String retrievedCourseCode = rs.getString("COURSE_CODE");

				AddSubtopic subtopic = new AddSubtopic(subtopicId, subtopicName, retrievedUnitNo, retrievedCourseCode);
				subtopics.add(subtopic);
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
		return subtopics;
	}

	public boolean removeAllSubtopicsForCourse(String courseCode) {
		boolean isRemoved = false;
		List<AddSubtopic> allSubtopics = getAllSubtopicsForCourse(courseCode);
		Connection con = DataSource.getConnection();
		
		if (!allSubtopics.isEmpty() && allSubtopics != null) {
			try {
				PreparedStatement pstate = con.prepareStatement("DELETE FROM Subtopic WHERE COURSE_CODE = ?");
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
		}

		else {
			isRemoved = true;
		}
		
		return isRemoved;
	}
}