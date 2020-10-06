package Scourse;

import java.util.LinkedList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import Grade.Grade;

import com.opensymphony.xwork2.ActionSupport;

import dao.Dao;

public class ScourseAdd extends ActionSupport{
	private static String CONIF_FILE_LOCATION="/hibernate.cfg.xml";
	private static String configFile = CONIF_FILE_LOCATION;
	Scource scource = new Scource();
	Dao dao = new Dao();
	public static SessionFactory sf;
	HttpServletRequest request =ServletActionContext.getRequest();
	 HttpSession session1 = ServletActionContext.getRequest().getSession();
	String name = request.getParameter("name");
	String week = request.getParameter("week");
	String time = request.getParameter("time");
	String tname= request.getParameter("tname");
	String nature= request.getParameter("nature");
	String grade = request.getParameter("grade");
	String number = (String) session1.getAttribute("number");
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
		
		 	scource.setNumber(number);
		 	scource.setName(name);
		 	scource.setGrade(grade);
		 	scource.setNature(nature);
		 	scource.setTime(time);
		 	scource.setWeek(week);
		 	scource.setTname(tname);
			String sql ="select *from scourse where  number = '"+session1.getAttribute("number")+"' and name='"+name+"'";
			Query query = session.createSQLQuery(sql);
			List list = query.list();
			if(number ==null){
				return NONE;
			}
			
			if(list.size() ==0 || list == null){
				dao.Sinsert(scource);
				this.addActionMessage("选课成功");
				
				return "success";
			}else{
				this.addActionMessage("选课失败");
				return "false";
			}
		 
		 
		 
		
		 
	}
}
