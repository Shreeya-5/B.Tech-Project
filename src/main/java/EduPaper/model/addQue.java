package EduPaper.model;

public class addQue {
	private int questionNo;
	private int unitNo;
	private String course;
	private String questionText;
	private int marks;
	private String difficultyLevel;
	private String queType;
	
	public addQue(int questionNo, int unitNo, String course, String questionText, int marks, String difficultyLevel,
			String queType) {
		this.questionNo = questionNo;
		this.unitNo = unitNo;
		this.course = course;
		this.questionText = questionText;
		this.marks = marks;
		this.difficultyLevel = difficultyLevel;
		this.queType = queType;
	}
	
	public int getQuestionNo() {
		return questionNo;
	}
	public void setQuestionNo(int questionNo) {
		this.questionNo = questionNo;
	}
	public int getUnitNo() {
		return unitNo;
	}
	public void setUnitNo(int unitNo) {
		this.unitNo = unitNo;
	}
	public String getCourse() {
		return course;
	}
	public void setCourse(String course) {
		this.course = course;
	}
	public String getQuestionText() {
		return questionText;
	}
	public void setQuestionText(String questionText) {
		this.questionText = questionText;
	}
	public int getMarks() {
		return marks;
	}
	public void setMarks(int marks) {
		this.marks = marks;
	}
	public String getDifficultyLevel() {
		return difficultyLevel;
	}
	public void setDifficultyLevel(String difficultyLevel) {
		this.difficultyLevel = difficultyLevel;
	}
	public String getQueType() {
		return queType;
	}
	public void setQueType(String queType) {
		this.queType = queType;
	}
}
