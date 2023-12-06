package EduPaper.model;

public class addCourse {
	private String courseName;
	private String courseCode;

	public addCourse() {}

	public addCourse(String courseName, String courseCode) {
		super();
		this.courseName = courseName;
		this.courseCode = courseCode;
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
	
}