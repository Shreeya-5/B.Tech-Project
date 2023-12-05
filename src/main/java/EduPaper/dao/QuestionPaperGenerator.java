package EduPaper.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.*;

public class QuestionPaperGenerator {
    public static void main(String[] args) {
        Connection con = null;
        Statement statement = null;
        ResultSet resultSet = null;

        try {
            // Establishing a database connection
            con = DataSource.getConnection();

            // Creating a statement for executing SQL queries
            statement = con.createStatement();

            // SQL query to retrieve all questions from QuestionBank table
            String query = "SELECT * FROM QuestionBank";
            
            // Executing the query
            resultSet = statement.executeQuery(query);

            // Displaying all questions
            System.out.println("All Questions:");
            if (!resultSet.isBeforeFirst()) {
                System.out.println("No questions found in the QuestionBank table.");
            } else {
                while (resultSet.next()) {
                    int questionNo = resultSet.getInt("QuestionNo");
                    int unitNo = resultSet.getInt("UnitNo");
                    String course = resultSet.getString("Course");
                    String questionText = resultSet.getString("QuestionText");
                    int marks = resultSet.getInt("Marks");
                    String difficultyLevel = resultSet.getString("DifficultyLevel");

                    System.out.println("Question No: " + questionNo);
                    System.out.println("Unit No: " + unitNo);
                    System.out.println("Course: " + course);
                    System.out.println("Question: " + questionText);
                    System.out.println("Marks: " + marks);
                    System.out.println("Difficulty Level: " + difficultyLevel);
                    System.out.println("---------------------------");
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                // Closing resources in the finally block
                if (resultSet != null) resultSet.close();
                if (statement != null) statement.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
