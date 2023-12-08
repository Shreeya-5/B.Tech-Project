package EduPaper.model;

public class addUnit {
	private String unitNo;
	private String courseCode;
	private String unitName;
	
	public addUnit() {
		super();
	}

	public addUnit(String unitNo, String courseCode, String unitName) {
		super();
		this.unitNo = unitNo;
		this.courseCode = courseCode;
		this.unitName = unitName;
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

	public String getUnitName() {
		return unitName;
	}

	public void setUnitName(String unitName) {
		this.unitName = unitName;
	}
	
	
}
