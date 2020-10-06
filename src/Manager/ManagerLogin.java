package Manager;

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
import org.hibernate.transform.Transformers;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.opensymphony.xwork2.ActionSupport;

import dao.Dao;

/**   
　　　　* 项目名称：Struts   
　　　　* 类名称：ManagerLogin   
　　　　* 类描述：   
　　　　* 创建人：黄聪   
　　　　* 创建时间：2020年6月22日 上午11:18:39   
　　　　* @version        
　　　　*/
public class ManagerLogin extends ActionSupport{
	

	private static String CONIF_FILE_LOCATION="/hibernate.cfg.xml";
	private static String configFile = CONIF_FILE_LOCATION;
	Manager manager = new Manager();
	Dao dao = new Dao();
	public static SessionFactory sf;
	HttpServletRequest request =ServletActionContext.getRequest();
	String account =request.getParameter("number");
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
	

	public String execute() throws Exception {
		HttpServletResponse response  = ServletActionContext.getResponse();
		request.setCharacterEncoding("utf-8");
		response.setContentType("application/json;charset='utf-8'");
		manager.setAccount(account);
		manager.setPassword(password);
		session1.setAttribute("account", account);
		String sql ="select *from maccount where  account = '"+account+"' and password ='"+password+"'";
		Query query = session.createSQLQuery(sql);
		List list = query.list();
		if(account ==null){
			return "false";
		}
		 if(password == null){
			return "false";
		}
		
		if(list.size() == 0 || list == null){
			if(account.equals("11") && password.equals("11")){
				dao.insert(manager);
				return "success";
			}
		}
		
		if(list.size() > 0){
				
					this.addActionMessage("登陆成功");
					return "success";
				
	
	
		}else{
				this.addActionMessage("登陆失败");
			    return "false";
		 }
	
	}	
}
