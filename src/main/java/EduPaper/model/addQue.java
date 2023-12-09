package EduPaper.model;

public class addQue {
    private int queNo;
    private int subtopicId;
    private String unitNo;
    private String courseCode;
    private String quesText;
    private int marks;
    private String diffLevel;
    private String queType;
    

    public addQue() {
		super();
	}

    
	public addQue(int subtopicId, String quesText, int marks, String diffLevel, String queType, String unitNo,
			String courseCode) {
		super();
		this.subtopicId = subtopicId;
		this.quesText = quesText;
		this.marks = marks;
		this.diffLevel = diffLevel;
		this.queType = queType;
		this.unitNo = unitNo;
		this.courseCode = courseCode;
	}


	public addQue(int queNo, int subtopicId, String quesText, int marks, String diffLevel, String queType,
                  String unitNo, String courseCode) {
        this.queNo = queNo;
        this.subtopicId = subtopicId;
        this.quesText = quesText;
        this.marks = marks;
        this.diffLevel = diffLevel;
        this.queType = queType;
        this.unitNo = unitNo;
        this.courseCode = courseCode;
    }

    public int getQueNo() {
        return queNo;
    }

    public void setQueNo(int queNo) {
        this.queNo = queNo;
    }

    public int getSubtopicId() {
        return subtopicId;
    }

    public void setSubtopicId(int subtopicId) {
        this.subtopicId = subtopicId;
    }

    public String getQuesText() {
        return quesText;
    }

    public void setQuesText(String quesText) {
        this.quesText = quesText;
    }

    public int getMarks() {
        return marks;
    }

    public void setMarks(int marks) {
        this.marks = marks;
    }

    public String getDiffLevel() {
        return diffLevel;
    }

    public void setDiffLevel(String diffLevel) {
        this.diffLevel = diffLevel;
    }

    public String getQueType() {
        return queType;
    }

    public void setQueType(String queType) {
        this.queType = queType;
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