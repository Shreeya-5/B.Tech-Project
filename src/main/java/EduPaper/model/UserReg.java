package EduPaper.model;

public class UserReg {
	private String name;
	private String email;
	private String dept;
	private String mobno;
	private String password;
	
	public UserReg() {}
	
	public UserReg(String name, String email, String mobno, String password, String dept) {
		super();
		this.name = name;
		this.email = email;
		this.dept = dept;
		this.mobno = mobno;
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getDept() {
		return dept;
	}

	public void setDept(String dept) {
		this.dept = dept;
	}

	public String getMobno() {
		return mobno;
	}

	public void setMobno(String mobno) {
		this.mobno = mobno;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
	
}
