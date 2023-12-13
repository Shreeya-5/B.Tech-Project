package EduPaper.dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

import EduPaper.model.*;

public class RegisterDao {
	public int CreateUser(List<UserReg> lstsreg) {
		int i=0;
		UserReg s=lstsreg.get(0);
		Connection con=DataSource.getConnection();
		try {
			PreparedStatement pstate=con.prepareStatement("insert into users values(?,?,?,?,?)");

			pstate.setString(2,s.getName());
			pstate.setString(1,s.getEmail());
			pstate.setString(3,s.getMobno());
			pstate.setString(4,s.getPassword());
			pstate.setString(5,s.getDept());
			i=pstate.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return i;
	}
	public List<UserReg> validateData(List<UserLogin> lstlogin) {
		UserLogin lobj=lstlogin.get(0);
		List<UserReg> lstreg=null;
		Connection con=DataSource.getConnection();
		try {
			PreparedStatement pstate = con.prepareStatement("select * from users where user_email=? and user_pass=?");
			pstate.setString(1, lobj.getEmail());
			pstate.setString(2, lobj.getPassword());
			ResultSet rs = pstate.executeQuery();			
			if (rs.next()) {
				lstreg=new LinkedList<UserReg>();
				UserReg s=new UserReg(rs.getString(2),rs.getString(1),rs.getString(3),rs.getString(4),rs.getString(5));
				lstreg.add(s);
			} 
		} catch (Exception e) {
			// TODO: handle exception
		}
		return lstreg;

	}
}