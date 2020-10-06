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
　　　　* 类名称：ManagerStudentAdd   
　　　　* 类描述：   
　　　　* 创建人：黄聪   
　　　　* 创建时间：2020年6月22日 上午11:19:49   
　　　　* @version        
　　　　*/
public class ManagerStudentAdd extends ActionSupport{
	private static String CONIF_FILE_LOCATION="/hibernate.cfg.xml";
	private static String configFile = CONIF_FILE_LOCATION;
	Student student = new Student();
	Dao dao = new Dao();
	public static SessionFactory sf;
	HttpServletRequest request =ServletActionContext.getRequest();
	String number =request.getParameter("number");
	String password= request.getParameter("password");
	String classs = request.getParameter("classs");
	String sex = request.getParameter("sex");
	String name= request.getParameter("name");
	String IDnumber = request.getParameter("IDnumber");
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
		 
		 	student.setAdress(adress);
		 	student.setClasss(classs);
		 	student.setCollege(college);
		 	student.setIDnumber(IDnumber);
		 	student.setName(name);
		 	student.setNumber(number);
		 	student.setPassword(password);
		 	student.setPnumber(pnumber);
		 	student.setSex(sex);
			String sql ="select *from saccount where  number = '"+number+"'";
			Query query = session.createSQLQuery(sql);
			List list = query.list();
			if(number ==null){
				return NONE;
			}
			 if(password == null){
				return NONE;
			}
			if(list.size() ==0 || list == null){
				dao.sinsert(student);
				return "success";
			}else{
				return NONE;
			}
		 
		 
		 
		
		 
	}
}
