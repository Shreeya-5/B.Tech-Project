package EduPaper.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class QuestionPaperGenerator {
	public static void main(String[] args) {
		Connection con=DataSource.getConnection();
		Statement statement = null;
		ResultSet resultSet = null;

		try {
			// SQL query to select questions randomly from the database
			String query = "SELECT * FROM QuestionBank ORDER BY DBMS_RANDOM.RANDOM";

			PreparedStatement pstate = con.prepareStatement(query);
			ResultSet rs = pstate.executeQuery(query);

			List<String> questionPaper = new ArrayList<>();
			int totalMarks = 0;

			// Loop to retrieve questions until the total marks reach 30
			while (rs.next() && totalMarks < 30) {
				int marks = rs.getInt("Marks");
				if (totalMarks + marks <= 30) {
					String questionText = rs.getString("QuestionText");
					questionPaper.add(questionText + " [Marks: " + marks + "]");
					totalMarks += marks;
				}
			}

			// Displaying the question paper
			System.out.println("Question Paper:");
			for (String question : questionPaper) {
				System.out.println(question);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				// Closing resources
				if (resultSet != null) resultSet.close();
				if (statement != null) statement.close();
				if (con != null) con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}
