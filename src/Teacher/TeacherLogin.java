package Teacher;


import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.criterion.CriteriaSpecification;

import com.opensymphony.xwork2.ActionSupport;

import dao.Dao;

public class TeacherLogin extends ActionSupport{
	private String message;
	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	private static String CONIF_FILE_LOCATION="/hibernate.cfg.xml";
	private static String configFile = CONIF_FILE_LOCATION;
	Teacher teacher = new Teacher();
	Dao dao = new Dao();
	public static SessionFactory sf;
	HttpServletRequest request =ServletActionContext.getRequest();
	String number =request.getParameter("number");
	String password= request.getParameter("password");
	Session session = sf.openSession();
	Transaction tran = null;
	 HttpSession s = request.getSession();
	 HttpSession session1 = ServletActionContext.getRequest().getSession();
		
	static{
		
		try {
			Configuration conf = new Configuration().configure(configFile);
			sf = conf.buildSessionFactory();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	
	@Override
	public String execute() throws Exception {
	
		teacher.setNumber(number);
		teacher.setPassword(password);
		
		session1.setAttribute("tnumber", number);
		String sql ="select *from taccount where  number = '"+number+"' and password ='"+password+"'";
		Query query = session.createSQLQuery(sql).setResultTransformer(CriteriaSpecification.ALIAS_TO_ENTITY_MAP);
		List list = query.list();
		if(number ==null){
			return "false";
		}
		 if(password == null){
			return "false";
		}
		
		
		
		if(list.size() > 0){
			
					Map<String, Object>map = (Map<String, Object>) list.get(0);
					
					
						session1.setAttribute("tname", map.get("tname"));
						System.out.println("tname:"+map.get("tname"));
						this.addActionMessage("登陆成功");
						return "success";
					
					
					
	
		}else{
			
			this.addActionMessage("登陆失败");
			 return "false";
		 }
	
	}	
}
