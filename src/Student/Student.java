package Student;

public class Student {
	private Integer id;
	private String number;//学号
	private String password;//密码
	
	
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	private String sex;//性别
	private String name;//名字
	private String pnumber;//手机号码
	private String adress;//家庭住址
	private String classs;//班级
	private String college;//学院
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPnumber() {
		return pnumber;
	}
	public void setPnumber(String pnumber) {
		this.pnumber = pnumber;
	}
	public String getAdress() {
		return adress;
	}
	public void setAdress(String adress) {
		this.adress = adress;
	}
	public String getClasss() {
		return classs;
	}
	public void setClasss(String classs) {
		this.classs = classs;
	}
	public String getCollege() {
		return college;
	}
	public void setCollege(String college) {
		this.college = college;
	}
	private String IDnumber;//身份证号码
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getNumber() {
		return number;
	}
	public void setNumber(String number) {
		this.number = number;
	}
	public String getIDnumber() {
		return IDnumber;
	}
	public void setIDnumber(String iDnumber) {
		IDnumber = iDnumber;
	}
	@Override
	public String toString() {
		return "Student [id=" + id + ", number=" + number + ", password="
				+ password + ", sex=" + sex + ", name=" + name + ", pnumber="
				+ pnumber + ", adress=" + adress + ", classs=" + classs
				+ ", college=" + college + ", IDnumber=" + IDnumber + "]";
	}
	
	
	
	
	
	public Student(String number, String password, String sex, String name,
			String pnumber, String adress, String classs, String college,
			String iDnumber) {
		super();
		this.number = number;
		this.password = password;
		this.sex = sex;
		this.name = name;
		this.pnumber = pnumber;
		this.adress = adress;
		this.classs = classs;
		this.college = college;
		IDnumber = iDnumber;
	}
	public Student(){
		
	}
	
}
