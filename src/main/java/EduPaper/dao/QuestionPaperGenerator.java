package EduPaper.dao;

import java.sql.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class QuestionPaperGenerator {
	public static void main(String[] args) {
		Connection con = null;
		ResultSet resultSet = null;

		try {
			// Load the JDBC driver
			Class.forName("oracle.jdbc.OracleDriver");

			// Establish the connection to the database
			con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","shreeya");

			// Create a statement
			PreparedStatement pstate = con.prepareStatement("SELECT * FROM users");

			// Execute a query to retrieve data
			resultSet = pstate.executeQuery();

			// Process the result set
			while (resultSet.next()) {
				// Retrieve data from each row
				String column1Data = resultSet.getString("user_email");
				// Get other columns similarly

				// Process retrieved data (print it in this example)
				System.out.println("Column 1: " + column1Data);
				// Process other columns similarly
			}
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		} finally {
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
}
