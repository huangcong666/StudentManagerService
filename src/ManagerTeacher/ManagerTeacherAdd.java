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

public class ManagerTeacherAdd extends ActionSupport{
	private static String CONIF_FILE_LOCATION="/hibernate.cfg.xml";
	private static String configFile = CONIF_FILE_LOCATION;
	Teacher teacher = new Teacher();
	Dao dao = new Dao();
	public static SessionFactory sf;
	HttpServletRequest request =ServletActionContext.getRequest();
	String number =request.getParameter("number");
	String password= request.getParameter("password");
	String email = request.getParameter("email");
	String sex = request.getParameter("sex");
	String name= request.getParameter("name");
	String tnumber = request.getParameter("tnumber");
	String pnumber = request.getParameter("pnumber");
	String adress = request.getParameter("adress");
	String college = request.getParameter("college");

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
		 
		 	
		 	teacher.setAdress(adress);
		 	teacher.setCollege(college);
		 	teacher.setEmail(email);
		 	teacher.setTname(name);
		 	teacher.setNumber(number);
		 	teacher.setPassword(password);
		 	teacher.setPnumber(pnumber);
		 	teacher.setSex(sex);
		 	teacher.setTnumber(tnumber);
			String sql ="select *from taccount where  number = '"+number+"'";
			Query query = session.createSQLQuery(sql);
			List list = query.list();
			if(number ==null){
				return NONE;
			}
			 if(password == null){
				return NONE;
			}
			if(list.size() ==0 || list == null){
				dao.tinsert(teacher);
				return "success";
			}else{
				return NONE;
			}
		 
		 
		 
		
		 
	}
}
