package Student;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.criterion.CriteriaSpecification;
import org.hibernate.transform.Transformers;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.opensymphony.xwork2.ActionSupport;

public class StudentLogin extends ActionSupport{
	private String message;
	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	private static String CONIF_FILE_LOCATION="/hibernate.cfg.xml";
	private static String configFile = CONIF_FILE_LOCATION;
	
	Student student = new Student();
	
	public static SessionFactory sf;
	HttpServletRequest request =ServletActionContext.getRequest();
	
	Session session = sf.openSession();
	Transaction tran = null;
	String number = request.getParameter("number");
	String password = request.getParameter("password");
	
	String str;
	ObjectMapper mapper = new ObjectMapper();
	JSONArray arr = new JSONArray();
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
		student.setNumber(number);
		student.setPassword(password);
		session1.setAttribute("number", number);
		String sql ="select *from saccount where  number = '"+number+"' and password ='"+password+"'";
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
				session1.setAttribute("name", map.get("name"));
				
				System.out.println("name:"+map.get("name"));
				this.addActionMessage("登陆成功");
				return "success";
			


	}else{
		this.addActionMessage("登陆失败");
		 return "false";
	 }

}	
	
		
	
	
}
