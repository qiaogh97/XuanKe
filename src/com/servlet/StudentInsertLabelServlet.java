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
import com.entity.Label;

public class StudentInsertLabelServlet extends HttpServlet {
	
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
	        HttpSession session = req.getSession();
	        String studentnum = (String)session.getAttribute("number");
	        String labelnumString = req.getParameter("labelnum");
	        
	        if (labelnumString=="") {
	        	out.print("<script>alert('课程编号不能为空！');window.location.href='stu2_mylabel.jsp'</script>");
			}else {
				int labelnum = Integer.parseInt(labelnumString);
				
				Stu_LabDao stu_LabelDao = new Stu_LabDao();
				int result = stu_LabelDao.insertStu_lab(studentnum, labelnum, 0);
				
				if(result==1){
					out.print("<script>alert('提交成功！');window.location.href='stu2_mylabel.jsp'</script>");
				}	
				else{
					out.print("<script>alert('提交失败！');window.location.href='stu2_mylabel.jsp'</script>");
				}  
				         			
				
			}
	        
	        
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
