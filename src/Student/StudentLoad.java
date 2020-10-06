package Student;

import java.util.LinkedList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import Student.Student;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.opensymphony.xwork2.ActionSupport;

public class StudentLoad extends ActionSupport{
	private static String CONIF_FILE_LOCATION="/hibernate.cfg.xml";
	private static String configFile = CONIF_FILE_LOCATION;
	public static SessionFactory sf;
	HttpServletRequest request =ServletActionContext.getRequest();
	Session session = sf.openSession();
	Transaction tran = null;
	 HttpSession s = request.getSession();
	 JSONObject obj = new JSONObject();
     Student student;
     HttpSession session1 = ServletActionContext.getRequest().getSession();
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
					
					SQLQuery query =(SQLQuery) session.createSQLQuery("select * from saccount where number='"+session1.getAttribute("number")+"'");
					List<Object[]> list=query.list();
					
					 List<Student> mylist = new LinkedList<Student>();
					for(Object[] object:list){  
						student = new Student();
						student.setAdress((String)object[7]);
						student.setClasss((String)object[6]);
						student.setCollege((String)object[8]);
						student.setNumber((String)object[1]);
						student.setPassword((String)object[5]);
						student.setPnumber((String)object[4]);
						student.setSex((String)object[3]);
					
						mylist.add(student);
						
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
