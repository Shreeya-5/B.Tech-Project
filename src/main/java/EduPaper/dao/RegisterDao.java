package EduPaper.dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.*;

import EduPaper.model.*;

public class registerDao {
	public int Create(List<userReg> lstsreg) {
		int i=0;
		userReg s=lstsreg.get(0);
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
	public List<userReg> validateData(List<userLogin> lstlogin) {
		boolean b=false;
		userLogin lobj=lstlogin.get(0);
		List<userReg> lstreg=null;
		Connection con=DataSource.getConnection();
		try {
			PreparedStatement pstate = con.prepareStatement("select * from users where user_email=? and user_pass=?");
			pstate.setString(1, lobj.getEmail());
			pstate.setString(2, lobj.getPassword());
			ResultSet rs = pstate.executeQuery();			
			if (rs.next()) {
				b = true;
				lstreg=new LinkedList<userReg>();
				userReg s=new userReg(rs.getString(2),rs.getString(1),rs.getString(3),rs.getString(4),rs.getString(5));
				lstreg.add(s);
			} 
		} catch (Exception e) {
			// TODO: handle exception
		}
		return lstreg;

	}
	// 
	// public StudRegister Search(String cno) {
	//	 List<StudRegister> lstreg=null;
	//	 Connection con=DataSource.getConnection();
	//	 StudRegister r=null;
	//	 try {
	//		PreparedStatement pstate=con.prepareStatement("select *from studreg where cno=?");
	//		 pstate.setString(1,cno);
	//		 ResultSet rs=pstate.executeQuery();
	//		 if(rs.next()) {
	//			 r=new StudRegister(rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getInt(6),rs.getString(7),rs.getFloat(8),rs.getString(9));
	//		 }
	//	} catch (SQLException e) {
	//		// TODO Auto-generated catch block
	//		e.printStackTrace();
	//	}
	//	 finally {
	//		 try {
	//			con.close();
	//		} catch (SQLException e) {
	//			// TODO Auto-generated catch block
	//			e.printStackTrace();
	//		}
	//	 }
	//	 return r;
	// }
	// 
}
