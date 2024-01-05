package EduPaper.dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

import EduPaper.model.*;

public class PaperDao {

	public int createPaper(AddPaper s) {
		int i = 0;
		Connection con = DataSource.getConnection();

		try {
			PreparedStatement pstate = con.prepareStatement("INSERT INTO paper (course_code, user_email, paper_Name, term_Name, date_Of_Exam, date_Of_Creation, time_Length) VALUES (?,?,?,?,?,?,?)");
			pstate.setString(1, s.getCourseId());
			pstate.setString(2, s.getEmail());
			pstate.setString(3, s.getPaperName());
			pstate.setString(4, s.getTermName());
			pstate.setString(5, s.getDateOfExam());
			pstate.setString(6, s.getDateOfCreation());
			pstate.setString(7, s.getTimeLength());

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

	public List<AddPaper> getAllPapers(String courseCode) {
		List<AddPaper> papers = new ArrayList<>();
		Connection con = DataSource.getConnection();
		try {
			PreparedStatement pstate = con.prepareStatement("select * from paper where course_code=?");
			pstate.setString(1, courseCode);

			ResultSet rs = pstate.executeQuery();
			while (rs.next()) {
				// Retrieve data from each row
				int paperId = rs.getInt("paper_Id");
				String code = rs.getString("course_code");
				String userEmail = rs.getString("user_email");
				String paperName = rs.getString("paper_name");
				String termName = rs.getString("term_name"); // Retrieve termName from the database
				String dateOfExam = rs.getString("date_of_exam");
				String dateOfCreation = rs.getString("date_of_creation");
				String timeLength = rs.getString("time_length");

				// Create an addCourse object and set its attributes
				AddPaper paper = new AddPaper();

				paper.setPaperId(paperId);
				paper.setCourseId(code);
				paper.setEmail(userEmail);
				paper.setPaperName(paperName);
				paper.setTermName(termName);
				paper.setDateOfExam(dateOfExam);
				paper.setDateOfCreation(dateOfCreation);
				paper.setTimeLength(timeLength);

				// Add the course object to the courses list
				papers.add(paper);
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
		return papers;
	}

	public AddPaper getPaper(String date) {
		AddPaper paper = new AddPaper();
		Connection con = DataSource.getConnection();
		try {
			PreparedStatement pstate = con.prepareStatement("select * from paper where date_of_creation = ?");
			pstate.setString(1, date);

			ResultSet rs = pstate.executeQuery();
			while (rs.next()) {
				// Retrieve data from each row
				int paperId = rs.getInt("paper_Id");
				String courseCode = rs.getString("course_code");
				String userEmail = rs.getString("user_email");
				String paperName = rs.getString("paper_name");
				String termName = rs.getString("term_name"); // Retrieve termName from the database
				String dateOfExam = rs.getString("date_of_exam");
				String dateOfCreation = rs.getString("date_of_creation");
				String timeLength = rs.getString("time_length");

				paper.setPaperId(paperId);
				paper.setCourseId(courseCode);
				paper.setEmail(userEmail);
				paper.setPaperName(paperName);
				paper.setTermName(termName);
				paper.setDateOfExam(dateOfExam);
				paper.setDateOfCreation(dateOfCreation);
				paper.setTimeLength(timeLength);
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
		return paper;
	}

	public boolean removePaperById(int paperId) {

		boolean isPaperRemoved = false;
		Connection con = DataSource.getConnection();

		try {
			PreparedStatement pstate = con.prepareStatement("DELETE FROM paper WHERE Course_code = ?");
			pstate.setInt(1, paperId);

			int rowsAffected = pstate.executeUpdate();
			if (rowsAffected > 0) {
				isPaperRemoved = true;
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

		return isPaperRemoved;
	}

	public List<AddQue> getPaperQuestions(int id) {
		List<AddQue> Ques = new ArrayList<>();
		Connection con = DataSource.getConnection();
		try {
			PreparedStatement pstate = con.prepareStatement("select * from paperQuestions where paper_id=?");
			pstate.setInt(1, id);

			ResultSet rs = pstate.executeQuery();
			while (rs.next()) {
				// Retrieve data from each row
				int paperId = rs.getInt("paper_id");
				String quesText = rs.getString("que_text");
				int marks = rs.getInt("marks");
				String diffLevel = rs.getString("diff_level");
				String queType = rs.getString("que_type");

				// Create an addCourse object and set its attributes
				AddQue que = new AddQue();

				que.setPaperId(paperId);
				que.setQuesText(quesText);
				que.setMarks(marks);
				que.setDiffLevel(diffLevel);
				que.setQueType(queType);

				// Add the course object to the courses list
				Ques.add(que);
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
		return Ques;
	}
}