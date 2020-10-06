package Grade;

public class Grade {
	private Integer id;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	private String number;
	private String course;
	private String grade;
	private String tname;
	public String getTname() {
		return tname;
	}
	public void setTname(String tname) {
		this.tname = tname;
	}
	
	public Grade(String number, String course, String grade, String tname) {
		super();
		this.number = number;
		this.course = course;
		this.grade = grade;
		this.tname = tname;
	}
	@Override
	public String toString() {
		return "Grade [id=" + id + ", number=" + number + ", course=" + course
				+ ", grade=" + grade + ", tname=" + tname + "]";
	}
	public String getNumber() {
		return number;
	}
	public void setNumber(String number) {
		this.number = number;
	}
	public String getCourse() {
		return course;
	}
	public void setCourse(String course) {
		this.course = course;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public Grade() {
		// TODO Auto-generated constructor stub
	}
}
