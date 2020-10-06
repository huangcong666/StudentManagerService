package ManagerTeacher;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import Teacher.Teacher;

import com.opensymphony.xwork2.ActionSupport;

import dao.Dao;

public class ManagerTeacherEdit extends ActionSupport{
	private static String CONIF_FILE_LOCATION="/hibernate.cfg.xml";
	private static String configFile = CONIF_FILE_LOCATION;
	Teacher teacher = new Teacher();
	Dao dao = new Dao();
	public static SessionFactory sf;
	HttpServletRequest request =ServletActionContext.getRequest();
	
	Session session = sf.openSession();
	Transaction tran = null;
	 HttpSession s = request.getSession();
	 String number =request.getParameter("number");
		String password= request.getParameter("password");
		String email = request.getParameter("email");
		String pnumber = request.getParameter("pnumber");
		String adress = request.getParameter("adress");
		String college = request.getParameter("college");
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
		 
		 	teacher.setAdress(adress);
		 	teacher.setCollege(college);
		 	teacher.setEmail(email);
		 
		 	teacher.setNumber(number);
		 	teacher.setPassword(password);
		 	teacher.setPnumber(pnumber);
		
		 	
		 String sql ="select *from taccount where  number = '"+number+"'";
		 Query query = session.createSQLQuery(sql);
		 List list = query.list();
		 if(list.size() > 0){
			dao.tupdate(teacher);
		 }
		return NONE;
	}
}
