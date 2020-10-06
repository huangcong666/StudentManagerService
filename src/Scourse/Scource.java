package Scourse;

public class Scource {
	private String name;//课程名字
	private String number;//学生学号
	private String grade;//学分
	private String nature;//性质
	private String time;//时间
	private String week;//上课周数
	private String tname;//授课老师
	private Integer id;
	public Scource(String name, String number, String grade, String nature,
			String time, String week, String tname) {
		super();
		this.name = name;
		this.number = number;
		this.grade = grade;
		this.nature = nature;
		this.time = time;
		this.week = week;
		this.tname = tname;
	}
	@Override
	public String toString() {
		return "Scource [name=" + name + ", number=" + number + ", grade="
				+ grade + ", nature=" + nature + ", time=" + time + ", week="
				+ week + ", tname=" + tname + ", id=" + id + "]";
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getNumber() {
		return number;
	}
	public void setNumber(String number) {
		this.number = number;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public String getNature() {
		return nature;
	}
	public void setNature(String nature) {
		this.nature = nature;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getWeek() {
		return week;
	}
	public void setWeek(String week) {
		this.week = week;
	}
	public String getTname() {
		return tname;
	}
	public void setTname(String tname) {
		this.tname = tname;
	}
	public Scource() {
		// TODO Auto-generated constructor stub
	}
}
