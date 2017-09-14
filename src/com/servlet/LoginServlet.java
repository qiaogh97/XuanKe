package com.servlet;


import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.StudentDao;
import com.dao.TeacherDao;

public class LoginServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doPost(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			response.setContentType("text/html");  
	        response.setCharacterEncoding("utf-8");
	        request.setCharacterEncoding("utf-8");
	        
	        
			PrintWriter out = response.getWriter();
			HttpSession session = request.getSession();
			
		   	String person = request.getParameter("person");
		   	String number = request.getParameter("number");
		   	String name = request.getParameter("name");
		   	String classname = request.getParameter("classname");
		   	String tel = request.getParameter("tel");
		   	String major = request.getParameter("major");
		   	String password = request.getParameter("password");
		   	
		   	session.setAttribute("number",number);
		   	String regex = "^((13[0-9])|(14[5|7])|(15([0-3]|[5-9]))|(18[0,5-9]))\\d{8}$"; 
		   	boolean flag2 = tel.matches(regex);
		   	if("1".equals(person)){
			   	if(number==""){
			   		out.print("<script>alert('编号不能为空！');window.location.href='stu_login.jsp'</script>");
			   		return;
			   	}else if(name==""){
			   		out.print("<script>alert('姓名不能为空！');window.location.href='stu_login.jsp'</script>");
			   		return;
			   	}else if(classname==""){
			   		out.print("<script>alert('班级不能为空！');window.location.href='stu_login.jsp'</script>");
			   		return;
			   	}else if(tel==""){
			   		out.print("<script>alert('电话不能为空！');window.location.href='stu_login.jsp'</script>");
			   		return;
			   	}else if(!flag2){
			   		out.print("<script>alert('电话号码格式不对！');window.location.href='stu_login.jsp'</script>");
			   		return;
			   	}else if(major==""){
			   		out.print("<script>alert('专业不能为空！');window.location.href='stu_login.jsp'</script>");
			   		return;
			   	}else if(password==""){
			   		out.print("<script>alert('密码不能为空！');window.location.href='stu_login.jsp'</script>");
			   		return;
			   	}
				StudentDao studentDao = new StudentDao();
				int flag = studentDao.insertStudent(number, name, classname, tel, major, password);
				if(flag==1){
					response.sendRedirect("stu1_readylabel.jsp");
				}else{
					out.print("<script>alert('注册失败!');window.location.href='stu_login.jsp'</script>");
					return;
				}
		   	}else{
		   		if(number==""){
			   		out.print("<script>alert('编号不能为空！');window.location.href='tea_login.jsp'</script>");
			   		return;
			   	}else if(name==""){
			   		out.print("<script>alert('姓名不能为空！');window.location.href='tea_login.jsp'</script>");
			   		return;
			   	}else if(tel==""){
			   		out.print("<script>alert('电话不能为空！');window.location.href='tea_login.jsp'</script>");
			   		return;
			   	}else if(!flag2){
			   		out.print("<script>alert('电话号码格式不对！');window.location.href='tea_login.jsp'</script>");
			   		return;
			   	}else if(major==""){
			   		out.print("<script>alert('专业不能为空！');window.location.href='tea_login.jsp'</script>");
			   		return;
			   	}else if(password==""){
			   		out.print("<script>alert('密码不能为空！');window.location.href='tea_login.jsp'</script>");
			   		return;
			   	}
				TeacherDao teacherDao = new TeacherDao();
				int flag = teacherDao.insertTeacher(number, name, tel, major, password);
				if(flag==1){
					response.sendRedirect("tea1_publishlabel.jsp");
				}else{
					out.print("<script>alert('注册失败!');window.location.href='tea_login.jsp'</script>");
				}
		   	}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
