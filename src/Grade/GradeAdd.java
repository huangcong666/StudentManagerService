package Grade;

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

public class GradeAdd extends ActionSupport{
	private static String CONIF_FILE_LOCATION="/hibernate.cfg.xml";
	private static String configFile = CONIF_FILE_LOCATION;
	Grade g = new Grade();
	Dao dao = new Dao();
	HttpSession session1 = ServletActionContext.getRequest().getSession();
	public static SessionFactory sf;
	HttpServletRequest request =ServletActionContext.getRequest();
	String number = request.getParameter("number");
	String course = request.getParameter("course");
	String grade = request.getParameter("grade");
	String tname = (String) session1.getAttribute("tname");
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
		 
		 	g.setNumber(number);
		 	g.setCourse(course);
		 	g.setGrade(grade);
		 	g.setTname(tname);
			String sql ="select *from grade where  course = '"+course+"'and number='"+number+"'";
			Query query = session.createSQLQuery(sql);
			List list = query.list();
			if(number ==null){
				return NONE;
			}
			 if(course == null){
				return NONE;
			}
			if(list.size() ==0 || list == null){
				dao.ginsert(g);
				return "success";
			}else{
				return "false";
			}
		 
		 
		 
		
		 
	}
}
