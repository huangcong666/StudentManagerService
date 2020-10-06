package Manager;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import com.opensymphony.xwork2.ActionSupport;

import dao.Dao;

/**   
　　　　* 项目名称：Struts   
　　　　* 类名称：ManagerAdd   
　　　　* 类描述：   
　　　　* 创建人：黄聪   
　　　　* 创建时间：2020年6月22日 上午11:18:14   
　　　　* @version        
　　　　*/
public class ManagerAdd extends ActionSupport{
	private static String CONIF_FILE_LOCATION="/hibernate.cfg.xml";
	private static String configFile = CONIF_FILE_LOCATION;
	Manager manager = new Manager();
	Dao dao = new Dao();
	public static SessionFactory sf;
	HttpServletRequest request =ServletActionContext.getRequest();
	String account =request.getParameter("account");
	String password= request.getParameter("password");
	Session session = sf.openSession();
	Transaction tran = null;
	 HttpSession s = request.getSession();
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
		 
		 	manager.setAccount(account);
			manager.setPassword(password);
		
			String sql ="select *from maccount where  account = '"+account+"'";
			Query query = session.createSQLQuery(sql);
			List list = query.list();
			if(account ==null){
				return NONE;
			}
			 if(password == null){
				return NONE;
			}
			if(list.size() ==0 || list == null){
				dao.insert(manager);
				return "success";
			}else{
				return NONE;
			}
		 
		 
		 
		
		 
	}
}
