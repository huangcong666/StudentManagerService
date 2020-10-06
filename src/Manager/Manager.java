package Manager;

/**   
　　　　* 项目名称：Struts   
　　　　* 类名称：Manager   
　　　　* 类描述：   
　　　　* 创建人：黄聪   
　　　　* 创建时间：2020年6月22日 上午11:18:07   
　　　　* @version        
　　　　*/
public class Manager {
	private Integer id;
	private String account;//账号
	private String password;//密码
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	@Override
	public String toString() {
		return "Manager [id=" + id + ", account=" + account + ", password="
				+ password + "]";
	}
	
	public Manager(String account, String password) {
		super();
		this.account = account;
		this.password = password;
	}
	public Manager() {
		// TODO Auto-generated constructor stub
	}
}
