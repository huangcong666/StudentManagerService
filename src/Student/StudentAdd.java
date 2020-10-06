package Student;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import Student.Student;


import com.opensymphony.xwork2.ActionSupport;

import dao.Dao;

public class StudentAdd extends ActionSupport{
	private static String CONIF_FILE_LOCATION="/hibernate.cfg.xml";
	private static String configFile = CONIF_FILE_LOCATION;
	Student student = new Student();
	Dao dao = new Dao();
	public static SessionFactory sf;
	HttpServletRequest request =ServletActionContext.getRequest();
	
	Session session = sf.openSession();
	Transaction tran = null;
	 HttpSession s = request.getSession();
	 String number =request.getParameter("number");
	
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
		// TODO Auto-generated method stub
		 
		 request.setCharacterEncoding("utf-8");
		 	student.setNumber(number);
		 	
		
		 String sql ="select *from saccount where  number = '"+number+"'";
		 Query query = session.createSQLQuery(sql);
		 List list = query.list();
		 if(list.size() > 0){
			dao.sinsert(student);
			return "success";
		 }
		return NONE;
	}
}
