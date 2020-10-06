package Course;

/**   
　　　　* 项目名称：Struts   
　　　　* 类名称：Course   
　　　　* 类描述：   
　　　　* 创建人：黄聪   
　　　　* 创建时间：2020年6月22日 上午11:17:52   
　　　　* @version        
　　　　*/
public class Course {
	private Integer id;
	private String name;//课程名称
	private String nature;//课程性质
	private String grade;//课程学分
	private String time;//课程时间
	private String week;//上课周数
	private String tname;//授课教师
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
	public String getNature() {
		return nature;
	}
	public void setNature(String nature) {
		this.nature = nature;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	@Override
	public String toString() {
		return "Course [id=" + id + ", name=" + name + ", nature=" + nature
				+ ", grade=" + grade + ", time=" + time + ", week=" + week
				+ ", tname=" + tname + "]";
	}
	
	public Course(String name, String nature, String grade, String time,
			String week, String tname) {
		super();
		this.name = name;
		this.nature = nature;
		this.grade = grade;
		this.time = time;
		this.week = week;
		this.tname = tname;
	}
	public Course() {
		// TODO Auto-generated constructor stub
	}
}
