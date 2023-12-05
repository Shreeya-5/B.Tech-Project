package EduPapar.model;

public class addCourse {
	private String Course_name;
	private int Course_id;

	public addCourse() {}

	public addCourse(int Course_id, String Course_name) {
		super();
		this.Course_id = Course_id;
		this.Course_name = Course_name;
		}

	public int getCourseId() {
		return Course_id;
	}

	public void setCourse_id(int Course_id) {
		this.Course_id = Course_id;
	}

	public String getCourseName() {
		return Course_name;
	}

	public void setCourseName(String Course_name) {
		this.Course_name = Course_name;
	}

}