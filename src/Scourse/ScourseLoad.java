package Scourse;

import java.util.LinkedList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;

import org.apache.struts2.ServletActionContext;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import Teacher.Teacher;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.opensymphony.xwork2.ActionSupport;

import dao.Dao;

public class ScourseLoad extends ActionSupport{
	private static String CONIF_FILE_LOCATION="/hibernate.cfg.xml";
	private static String configFile = CONIF_FILE_LOCATION;
	public static SessionFactory sf;
	HttpServletRequest request =ServletActionContext.getRequest();
	Session session = sf.openSession();
	Transaction tran = null;
	 HttpSession s = request.getSession();
	 HttpSession session1 = ServletActionContext.getRequest().getSession();
     Scource scource;
	  String str;
			ObjectMapper mapper = new ObjectMapper();
			JSONArray arr = new JSONArray();
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
				try {
				 	HttpServletResponse response  = ServletActionContext.getResponse();
					response.setContentType("application/json;charset='utf-8'");
					response.setCharacterEncoding("utf-8");
					
					SQLQuery query =(SQLQuery) session.createSQLQuery("select * from scourse where number='"+session1.getAttribute("number")+"'");
					List<Object[]> list=query.list();
					
					 List<Scource> mylist = new LinkedList<Scource>();
					for(Object[] object:list){  
						scource =new Scource();
						
						scource.setName((String)object[1]);
						scource.setNature((String)object[2]);
						scource.setTime((String)object[6]);
						scource.setTname((String)object[7]);
						scource.setWeek((String)object[4]);
						scource.setGrade((String)object[3]);
						mylist.add(scource);
						
					}
					
					
					
					arr = arr.fromObject(mylist);
					System.out.println(arr);
					response.getWriter().print(arr);
					response.getWriter().flush();
					response.getWriter().close();
					return "success";
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			return NONE;
			// TODO Auto-generated method stub
			
		}
			
}
