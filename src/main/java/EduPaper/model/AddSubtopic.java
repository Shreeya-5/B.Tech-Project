package EduPaper.model;

public class AddSubtopic {
	private int subtopicId;
    private String subtopicName;
    private String unitNo;
    private String courseCode;
    
	public AddSubtopic(int subtopicId, String subtopicName, String unitNo, String courseCode) {
		super();
		this.subtopicId = subtopicId;
		this.subtopicName = subtopicName;
		this.unitNo = unitNo;
		this.courseCode = courseCode;
	}
	
	public AddSubtopic(String subtopicName, String unitNo, String courseCode) {
		super();
		this.subtopicName = subtopicName;
		this.unitNo = unitNo;
		this.courseCode = courseCode;
	}
	
	public AddSubtopic() {
		// TODO Auto-generated constructor stub
	}

	public int getSubtopicId() {
		return subtopicId;
	}
	public void setSubtopicId(int subtopicId) {
		this.subtopicId = subtopicId;
	}
	public String getSubtopicName() {
		return subtopicName;
	}
	public void setSubtopicName(String subtopicName) {
		this.subtopicName = subtopicName;
	}
	public String getUnitNo() {
		return unitNo;
	}
	public void setUnitNo(String unitNo) {
		this.unitNo = unitNo;
	}
	public String getCourseCode() {
		return courseCode;
	}
	public void setCourseCode(String courseCode) {
		this.courseCode = courseCode;
	}
}
