package Teacher;

public class Teacher {
	private Integer tid;
	private String number;//教师编号
	private String tnumber;//身份证号
	private String pnumber;//手机号码
	private String adress;//家庭地址
	private String email;//邮箱地址
	private String tname;//名字
	private String sex;//性别
	private String college;//学院
	private String password;//密码
	
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	public String getTname() {
		return tname;
	}
	public void setTname(String tname) {
		this.tname = tname;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getCollege() {
		return college;
	}
	public void setCollege(String college) {
		this.college = college;
	}
	
	public Integer getTid() {
		return tid;
	}
	public void setTid(Integer tid) {
		this.tid = tid;
	}
	public String getNumber() {
		return number;
	}
	
	public String getTnumber() {
		return tnumber;
	}
	public void setTnumber(String tnumber) {
		this.tnumber = tnumber;
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
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public void setNumber(String number) {
		this.number = number;
	}
	
	
	
	
	@Override
	public String toString() {
		return "Teacher [tid=" + tid + ", number=" + number + ", tnumber="
				+ tnumber + ", pnumber=" + pnumber + ", adress=" + adress
				+ ", email=" + email + ", tname=" + tname + ", sex=" + sex
				+ ", college=" + college + ", password=" + password + "]";
	}
	
	
	
	
	public Teacher(String number, String tnumber, String pnumber,
			String adress, String email, String tname, String sex,
			String college, String password) {
		super();
		this.number = number;
		this.tnumber = tnumber;
		this.pnumber = pnumber;
		this.adress = adress;
		this.email = email;
		this.tname = tname;
		this.sex = sex;
		this.college = college;
		this.password = password;
	}
	public Teacher() {
		// TODO Auto-generated constructor stub
	}
	
}
