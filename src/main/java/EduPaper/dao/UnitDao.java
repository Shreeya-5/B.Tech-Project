package EduPaper.dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

import EduPaper.model.*;

public class UnitDao {

	public int createUnit(AddUnit s) {
		int i = 0;
		Connection con = DataSource.getConnection();

		try {
			PreparedStatement pstate = con.prepareStatement("INSERT INTO unit VALUES (?,?,?)");
			pstate.setString(1, s.getUnitNo());
			pstate.setString(2, s.getCourseCode());
			pstate.setString(3, s.getUnitName());

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

	public List<AddUnit> getAllUnits(String code) {
		List<AddUnit> units = new ArrayList<>();
		Connection con = DataSource.getConnection();
		try {
			PreparedStatement pstate = con.prepareStatement("select * from unit where course_code=?");
			pstate.setString(1, code);

			ResultSet rs = pstate.executeQuery();
			while (rs.next()) {
				// Retrieve data from each row
				String unitNo = rs.getString("unit_No");
				String courseCode = rs.getString("course_code");
				String unitName = rs.getString("unit_name");

				// Create an addCourse object and set its attributes
				AddUnit unit = new AddUnit();
				unit.setUnitNo(unitNo);
				unit.setCourseCode(courseCode);
				unit.setUnitName(unitName);

				// Add the course object to the courses list
				units.add(unit);
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
		return units;
	}

	public boolean removeAllUnits(String courseCode) {
		
		List<AddUnit> allUnits =  getAllUnits(courseCode);
		boolean isRemoved = false;
		Connection con = DataSource.getConnection();

		if (!allUnits.isEmpty() && allUnits != null) {
			try {
				PreparedStatement pstate = con.prepareStatement("DELETE FROM unit WHERE course_code = ?");
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