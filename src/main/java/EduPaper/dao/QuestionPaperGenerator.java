package EduPaper.dao;

import java.sql.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class QuestionPaperGenerator {
    public static void main(String[] args) {
        Connection con = null;
        Statement statement = null;
        ResultSet resultSet = null;

        try {
            // Load the JDBC driver
            Class.forName("oracle.jdbc.OracleDriver");

            // Establish the connection to the database
			 con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","shreeya");

            // Create a statement
            statement = con.createStatement();

            // Execute a query to retrieve data
            String sqlQuery = "SELECT * FROM questionier";
            resultSet = statement.executeQuery(sqlQuery);

            // Process the result set
            while (resultSet.next()) {
                // Retrieve data from each row
                String column1Data = resultSet.getString("questionno");
                // Get other columns similarly
                
                // Process retrieved data (print it in this example)
                System.out.println("Column 1: " + column1Data);
                // Process other columns similarly
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        } finally {
            // Close resources
            try {
                if (resultSet != null) resultSet.close();
                if (statement != null) statement.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
