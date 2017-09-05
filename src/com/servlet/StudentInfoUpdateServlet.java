package com.servlet;


import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.LabelDao;
import com.dao.Stu_LabDao;
import com.dao.StudentDao;
import com.entity.Label;
import com.entity.Stu_lab;

public class StudentInfoUpdateServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doPost(req, resp);
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		try {
			resp.setContentType("text/html");  
	        resp.setCharacterEncoding("utf-8");
	        req.setCharacterEncoding("utf-8");
	        PrintWriter out = resp.getWriter();

	        
	        String number = req.getParameter("number");
	        String name = req.getParameter("name");
	        String classname = req.getParameter("class");
	        String tel = req.getParameter("tel");
	        String major = req.getParameter("major");
	        String password = req.getParameter("password");
	        
	        StudentDao studentDao = new StudentDao();
	        int flag = studentDao.updateStudent(number, name, classname, tel, major, password);
	        if (flag==1) {
				out.print("<script>alert('修改成功！');window.location.href='stu4_myinfo2.jsp'</script>");
			}else {
				out.print("<script>alert('修改失败！');window.location.href='stu4_myinfo2.jsp'</script>");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
