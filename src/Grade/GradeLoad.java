package Grade;

import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

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

import com.fasterxml.jackson.databind.ObjectMapper;
import com.opensymphony.xwork2.ActionSupport;

public class GradeLoad extends ActionSupport{
	private static String CONIF_FILE_LOCATION="/hibernate.cfg.xml";
	private static String configFile = CONIF_FILE_LOCATION;
	public static SessionFactory sf;
	HttpServletRequest request =ServletActionContext.getRequest();
	Session session = sf.openSession();
	Transaction tran = null;
	 HttpSession s = request.getSession();
		HttpSession session1 = ServletActionContext.getRequest().getSession();
		Grade grade;
	
		
		
    
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
				
				SQLQuery query =(SQLQuery) session.createSQLQuery("select * from grade where tname = '"+session1.getAttribute("tname")+"'");
				List<Object[]> list=query.list();
				
				 List<Grade> mylist = new LinkedList<Grade>();
				for(Object[] object:list){  
					grade = new Grade();
					
					grade.setNumber((String)object[1]);
					grade.setCourse((String)object[2]);
					grade.setGrade((String)object[3]);
					grade.setTname((String)object[4]);
					mylist.add(grade);
					
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
