package EduPaper.dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

import EduPaper.model.*;

public class QuestionDao {

	public int createQue(AddQue que) {
		int i = 0;
		Connection con = DataSource.getConnection();

		try {
			PreparedStatement pstate = con.prepareStatement("INSERT INTO QuestionBank (Subtopic_id, Unit_no, Course_code, Que_Text, Marks, Diff_Level, Que_type) VALUES (?,?,?,?,?,?,?)");

			pstate.setInt(1, que.getSubtopicId());
			pstate.setString(2, que.getUnitNo());
			pstate.setString(3, que.getCourseCode());
			pstate.setString(4, que.getQuesText());
			pstate.setInt(5, que.getMarks());
			pstate.setString(6, que.getDiffLevel());
			pstate.setString(7, que.getQueType());

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

	public List<AddQue> getAllQue(int subtopicId) {
		List<AddQue> ques = new ArrayList<>();
		Connection con = DataSource.getConnection();
		try {
			PreparedStatement pstate = con.prepareStatement("select * from questionbank where subtopic_id =?");
			pstate.setInt(1, subtopicId);

			ResultSet rs = pstate.executeQuery();
			while (rs.next()) {
				// Retrieve data from each row
				int queNo = rs.getInt("que_no");
				int subtopicNo = rs.getInt("subtopic_id");
				String quesText = rs.getString("que_text");
				int marks = rs.getInt("marks");
				String diffLevel = rs.getString("diff_level");
				String queType = rs.getString("que_type");
				String unitNo = rs.getString("unit_No");
				String courseCode = rs.getString("course_code");

				// Create an addCourse object and set its attributes
				AddQue que = new AddQue(queNo, subtopicNo, quesText, marks, diffLevel, queType, unitNo, courseCode);

				// Add the course object to the courses list
				ques.add(que);
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
		return ques;
	}

	public List<AddQue> getAllQueByCourse(String code) {
		List<AddQue> ques = new ArrayList<>();
		Connection con = DataSource.getConnection();
		try {
			PreparedStatement pstate = con.prepareStatement("select * from questionbank where course_code =?");
			pstate.setString(1, code);

			ResultSet rs = pstate.executeQuery();
			while (rs.next()) {
				// Retrieve data from each row
				int queNo = rs.getInt("unit_name");
				int subtopicNo = rs.getInt("subtopic_id");
				String quesText = rs.getString("que_text");
				int marks = rs.getInt("marks");
				String diffLevel = rs.getString("diff_level");
				String queType = rs.getString("que_type");
				String unitNo = rs.getString("unit_No");
				String courseCode = rs.getString("course_code");

				// Create an addCourse object and set its attributes
				AddQue que = new AddQue(queNo, subtopicNo, quesText, marks, diffLevel, queType, unitNo, courseCode);

				// Add the course object to the courses list
				ques.add(que);
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
		return ques;
	}

	public boolean deleteQueByCourse(String courseCode) {
		boolean isDeleted = false;
		Connection con = DataSource.getConnection();

		try {
			PreparedStatement pstate = con.prepareStatement("DELETE FROM questionbank where Course_code = ?");
			pstate.setString(1, courseCode);

			int rowsAffected = pstate.executeUpdate();
			if (rowsAffected > 0) {
				isDeleted = true;
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
		return isDeleted;
	}
}