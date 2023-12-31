package EduPaper.model;

public class AddPaper {
	private int paperId;
	private String courseId;
	private String email;
	private String paperName;
	private String termName;
	private String dateOfExam;
	private String dateOfCreation;
	private String timeLength;
	
	public AddPaper(String courseId, String email, String paperName, String termName, String dateOfExam,
			String dateOfCreation, String timeLength) {
		super();
		this.courseId = courseId;
		this.email = email;
		this.paperName = paperName;
		this.termName = termName;
		this.dateOfExam = dateOfExam;
		this.dateOfCreation = dateOfCreation;
		this.timeLength = timeLength;
	}

	public AddPaper(int paperId, String courseId, String email, String paperName, String termName, String dateOfExam,
			String dateOfCreation, String timeLength) {
		super();
		this.paperId = paperId;
		this.courseId = courseId;
		this.email = email;
		this.paperName = paperName;
		this.termName = termName;
		this.dateOfExam = dateOfExam;
		this.dateOfCreation = dateOfCreation;
		this.timeLength = timeLength;
	}
	
	public AddPaper() {
		// TODO Auto-generated constructor stub
	}

	public int getPaperId() {
		return paperId;
	}
	public void setPaperId(int paperId) {
		this.paperId = paperId;
	}
	public String getPaperName() {
		return paperName;
	}
	public void setPaperName(String paperName) {
		this.paperName = paperName;
	}
	public String getTermName() {
		return termName;
	}
	public void setTermName(String termName) {
		this.termName = termName;
	}
	public String getDateOfExam() {
		return dateOfExam;
	}
	public void setDateOfExam(String dateOfExam) {
		this.dateOfExam = dateOfExam;
	}
	public String getDateOfCreation() {
		return dateOfCreation;
	}
	public void setDateOfCreation(String dateOfCreation) {
		this.dateOfCreation = dateOfCreation;
	}
	public String getTimeLength() {
		return timeLength;
	}
	public void setTimeLength(String timeLength) {
		this.timeLength = timeLength;
	}
	public String getCourseId() {
		return courseId;
	}
	public void setCourseId(String courseId) {
		this.courseId = courseId;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
}
