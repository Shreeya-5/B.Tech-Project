package EduPaper.model;

public class addCourse {
	private String courseName;
	private String courseCode;
	private String deptName;
	private String userEmail;

	public addCourse() {}

	public addCourse(String courseName, String courseCode, String deptName, String userEmail) {
		super();
		this.courseName = courseName;
		this.courseCode = courseCode;
		this.deptName = deptName;
		this.userEmail = userEmail;
	}

	public String getCourseName() {
		return courseName;
	}

	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}

	public String getCourseCode() {
		return courseCode;
	}

	public void setCourseCode(String courseCode) {
		this.courseCode = courseCode;
	}

	public String getDeptName() {
		return deptName;
	}

	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	
}