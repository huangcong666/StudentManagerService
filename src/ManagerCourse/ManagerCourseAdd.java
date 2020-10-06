package ManagerCourse;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;







import Course.Course;

import com.opensymphony.xwork2.ActionSupport;

import dao.Dao;

/**   
　　　　* 项目名称：Struts   
　　　　* 类名称：ManagerCourseAdd   
　　　　* 类描述：   
　　　　* 创建人：黄聪   
　　　　* 创建时间：2020年6月22日 上午11:19:24   
　　　　* @version        
　　　　*/
public class ManagerCourseAdd extends ActionSupport{
	private static String CONIF_FILE_LOCATION="/hibernate.cfg.xml";
	private static String configFile = CONIF_FILE_LOCATION;
	Course course = new Course();
	Dao dao = new Dao();
	public static SessionFactory sf;
	HttpServletRequest request =ServletActionContext.getRequest();

	String name= request.getParameter("name");
	String nature = request.getParameter("nature");
	String grade = request.getParameter("grade");
	String time = request.getParameter("time");
	String tname= request.getParameter("tname");
	String week = request.getParameter("week");
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
		 
		 	course.setGrade(grade);
		 	course.setName(name);
		 	course.setNature(nature);
		 	course.setTime(time);
		 	course.setTname(tname);
		 	course.setWeek(week);
			String sql ="select *from course where  name = '"+name+"'";
			Query query = session.createSQLQuery(sql);
			List list = query.list();
			if(name ==null){
				return NONE;
			}
			 if(nature == null){
				return NONE;
			}
			if(list.size() ==0 || list == null){
				dao.cinsert(course);
				return "success";
			}else{
				return NONE;
			}
		 
		 
		 
		
		 
	}
}
