package ManagerStudent;

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

/**   
　　　　* 项目名称：Struts   
　　　　* 类名称：ManagerStudentEdit   
　　　　* 类描述：   
　　　　* 创建人：黄聪   
　　　　* 创建时间：2020年6月22日 上午11:19:59   
　　　　* @version        
　　　　*/
public class ManagerStudentEdit extends ActionSupport{
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
		String password= request.getParameter("password");
		String email = request.getParameter("email");
		
		String classs=request.getParameter("classs");
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
		 
		 student.setAdress(adress);
		 	student.setClasss(classs);
		 	student.setCollege(college);
		 	
		 	student.setNumber(number);
		 	student.setPassword(password);
		 	student.setPnumber(pnumber);
		 
		
		 String sql ="select *from saccount where  number = '"+number+"'";
		 Query query = session.createSQLQuery(sql);
		 List list = query.list();
		 if(list.size() > 0){
			dao.supdate(student);
		 }
		return NONE;
	}
}
