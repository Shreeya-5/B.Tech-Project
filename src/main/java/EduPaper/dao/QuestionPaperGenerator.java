package EduPaper.dao;

import java.sql.*;
import java.util.List;

import EduPaper.model.AddQue;

public class QuestionPaperGenerator {
	public static void main(String[] args) {

		boolean isDeleted = false;
		Connection con = DataSource.getConnection();

		try {
			PreparedStatement pstate = con.prepareStatement("DELETE FROM questionbank where Course_code = ?");
			pstate.setString(1, "ML1");

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
	}
}
