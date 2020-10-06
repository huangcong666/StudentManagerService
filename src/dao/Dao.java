package dao;


import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import Course.Course;
import Grade.Grade;
import Manager.Manager;
import Scourse.Scource;
import Student.Student;
import Teacher.Teacher;






/**   
　　　　* 项目名称：Struts   
　　　　* 类名称：Dao   
　　　　* 类描述：   
　　　　* 创建人：黄聪   
　　　　* 创建时间：2020年6月22日 上午11:17:44   
　　　　* @version        
　　　　*/
public class Dao {
	HttpServletRequest request = ServletActionContext.getRequest();
	private static String CONIF_FILE_LOCATION="/hibernate.cfg.xml";
	private static String configFile = CONIF_FILE_LOCATION;
	public Dao() {
		// TODO Auto-generated constructor stub
	}
	
	public static SessionFactory sf;
	static{
		
		try {
			Configuration conf = new Configuration().configure(configFile);
			sf = conf.buildSessionFactory();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	
	
	public void insert(Manager manager){
		HttpServletRequest request = ServletActionContext.getRequest();
		Session session = sf.openSession();
		Transaction tran = null;
	
		try {
				request.setCharacterEncoding("utf-8");
				tran = session.beginTransaction();
				session.save(manager);
				tran.commit();
		} catch (Exception e) {
			// TODO: handle exception
			if(tran !=null){
				tran.rollback();
			}
			e.printStackTrace();
		}finally{
			session.close();
			
		}
	}
	
	public void delete(Manager manager){
		HttpServletRequest request = ServletActionContext.getRequest();
		Session session = sf.openSession();
		Transaction tran = null;
		try {
			String sql= "delete from maccount where account='"+manager.getAccount()+"'";
			Query query = session.createSQLQuery(sql);
			tran = session.beginTransaction();
			query.executeUpdate();
			tran.commit();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			if(tran !=null){
				tran.rollback();
			}
		}
		finally{
			session.close();
			
		}
	}
	public void update(Manager manager){
		HttpServletRequest request = ServletActionContext.getRequest();
		Session session = sf.openSession();
		Transaction tran = null;
		try {
			String sql= "update maccount set password='"+manager.getPassword()+"' where account='"+manager.getAccount()+"'";
			Query query = session.createSQLQuery(sql);
			tran = session.beginTransaction();
			query.executeUpdate();
			tran.commit();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			if(tran !=null){
				tran.rollback();
			}
		}
		finally{
			session.close();
			
		}
	}
	public void tinsert(Teacher teacher){
		HttpServletRequest request = ServletActionContext.getRequest();
		Session session = sf.openSession();
		Transaction tran = null;
	
		try {
				request.setCharacterEncoding("utf-8");
				tran = session.beginTransaction();
				session.save(teacher);
				tran.commit();
		} catch (Exception e) {
			// TODO: handle exception
			if(tran !=null){
				tran.rollback();
			}
			e.printStackTrace();
		}finally{
			session.close();
			
		}
	}
	
	public void tupdate(Teacher teacher){
		HttpServletRequest request = ServletActionContext.getRequest();
		Session session = sf.openSession();
		Transaction tran = null;
		try {
			String sql = "update taccount set password='"+teacher.getPassword()+"',pnumber='"+teacher.getPnumber()+"',adress='"+teacher.getAdress()+"',email='"+teacher.getEmail()+"',college='"+teacher.getCollege()+"' where number = '"+teacher.getNumber()+"'";
			Query query = session.createSQLQuery(sql);
			tran = session.beginTransaction();
			query.executeUpdate();
			tran.commit();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			if(tran !=null){
				tran.rollback();
			}
		}
		finally{
			session.close();
			
		}
	}
	public void tdelete(Teacher teacher){
		HttpServletRequest request = ServletActionContext.getRequest();
		Session session = sf.openSession();
		Transaction tran = null;
		try {
			String sql= "delete from taccount where number='"+teacher.getNumber()+"'";
			Query query = session.createSQLQuery(sql);
			tran = session.beginTransaction();
			query.executeUpdate();
			tran.commit();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			if(tran !=null){
				tran.rollback();
			}
		}
		finally{
			session.close();
			
		}
	}
	public void sinsert(Student student){
		HttpServletRequest request = ServletActionContext.getRequest();
		Session session = sf.openSession();
		Transaction tran = null;
	
		try {
				request.setCharacterEncoding("utf-8");
				tran = session.beginTransaction();
				session.save(student);
				tran.commit();
		} catch (Exception e) {
			// TODO: handle exception
			if(tran !=null){
				tran.rollback();
			}
			e.printStackTrace();
		}finally{
			session.close();
			
		}
	}
	public void sdelete(Student student){
		HttpServletRequest request = ServletActionContext.getRequest();
		Session session = sf.openSession();
		Transaction tran = null;
		try {
			String sql= "delete from saccount where number='"+student.getNumber()+"'";
			Query query = session.createSQLQuery(sql);
			tran = session.beginTransaction();
			query.executeUpdate();
			tran.commit();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			if(tran !=null){
				tran.rollback();
			}
		}
		finally{
			session.close();
			
		}
	}
	public void supdate(Student student){
		HttpServletRequest request = ServletActionContext.getRequest();
		Session session = sf.openSession();
		Transaction tran = null;
		try {
			String sql = "update saccount set password='"+student.getPassword()+"',pnumber='"+student.getPnumber()+"',adress='"+student.getAdress()+"',college='"+student.getCollege()+"',classs='"+student.getClasss()+"' where number = '"+student.getNumber()+"'";
			Query query = session.createSQLQuery(sql);
			tran = session.beginTransaction();
			query.executeUpdate();
			tran.commit();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			if(tran !=null){
				tran.rollback();
			}
		}
		finally{
			session.close();
			
		}
	}
	
	
	public void cinsert(Course course){
		HttpServletRequest request = ServletActionContext.getRequest();
		Session session = sf.openSession();
		Transaction tran = null;
	
		try {
				request.setCharacterEncoding("utf-8");
				tran = session.beginTransaction();
				session.save(course);
				tran.commit();
		} catch (Exception e) {
			// TODO: handle exception
			if(tran !=null){
				tran.rollback();
			}
			e.printStackTrace();
		}finally{
			session.close();
			
		}
	}
	
	
	public void cupdate(Course course){
		HttpServletRequest request = ServletActionContext.getRequest();
		Session session = sf.openSession();
		Transaction tran = null;
		try {
			String sql = "update course set time='"+course.getTime()+"',nature='"+course.getNature()+"',week='"+course.getWeek()+"',tname='"+course.getTname()+"' where name = '"+course.getName()+"'";
			Query query = session.createSQLQuery(sql);
			tran = session.beginTransaction();
			query.executeUpdate();
			tran.commit();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			if(tran !=null){
				tran.rollback();
			}
		}
		finally{
			session.close();
			
		}
	}
	
	public void cdelete(Course course){
		HttpServletRequest request = ServletActionContext.getRequest();
		Session session = sf.openSession();
		Transaction tran = null;
		try {
			String sql= "delete from course where name='"+course.getName()+"'";
			Query query = session.createSQLQuery(sql);
			tran = session.beginTransaction();
			query.executeUpdate();
			tran.commit();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			if(tran !=null){
				tran.rollback();
			}
		}
		finally{
			session.close();
			
		}
	}
	
	public void tupdates(Teacher teacher){
		HttpServletRequest request = ServletActionContext.getRequest();
		Session session = sf.openSession();
		Transaction tran = null;
		try {
			String sql = "update taccount set password='"+teacher.getPassword()+"' where number = '"+teacher.getNumber()+"'";
			Query query = session.createSQLQuery(sql);
			tran = session.beginTransaction();
			query.executeUpdate();
			tran.commit();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			if(tran !=null){
				tran.rollback();
			}
		}
		finally{
			session.close();
			
		}
	}
	public void ginsert(Grade grade){
		HttpServletRequest request = ServletActionContext.getRequest();
		Session session = sf.openSession();
		Transaction tran = null;
	
		try {
				request.setCharacterEncoding("utf-8");
				tran = session.beginTransaction();
				session.save(grade);
				tran.commit();
		} catch (Exception e) {
			// TODO: handle exception
			if(tran !=null){
				tran.rollback();
			}
			e.printStackTrace();
		}finally{
			session.close();
			
		}
	}
	public void supdates(Student student){
		HttpServletRequest request = ServletActionContext.getRequest();
		Session session = sf.openSession();
		Transaction tran = null;
		try {
			String sql = "update saccount set password='"+student.getPassword()+"' where number = '"+student.getNumber()+"'";
			Query query = session.createSQLQuery(sql);
			tran = session.beginTransaction();
			query.executeUpdate();
			tran.commit();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			if(tran !=null){
				tran.rollback();
			}
		}
		finally{
			session.close();
			
		}
	}
	public void gupdate(Grade grade){
		HttpServletRequest request = ServletActionContext.getRequest();
		Session session = sf.openSession();
		Transaction tran = null;
		try {
			String sql = "update grade set grade='"+grade.getGrade()+"' where number = '"+grade.getNumber()+"'";
			Query query = session.createSQLQuery(sql);
			tran = session.beginTransaction();
			query.executeUpdate();
			tran.commit();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			if(tran !=null){
				tran.rollback();
			}
		}
		finally{
			session.close();
			
		}
	}
	public void Sinsert(Scource scource){
		HttpServletRequest request = ServletActionContext.getRequest();
		Session session = sf.openSession();
		Transaction tran = null;
	
		try {
				request.setCharacterEncoding("utf-8");
				tran = session.beginTransaction();
				session.save(scource);
				tran.commit();
		} catch (Exception e) {
			// TODO: handle exception
			if(tran !=null){
				tran.rollback();
			}
			e.printStackTrace();
		}finally{
			session.close();
			
		}
	}
	
}
