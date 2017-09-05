package com.servlet;


import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.LabelDao;
import com.dao.Stu_LabDao;
import com.entity.Label;

public class TeacherInputGrade2Servlet extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		//out.print("<script>alert('录入失败！');window.location.href='tea3_inputgrade.jsp'</script>");
		resp.setContentType("text/html");  
        resp.setCharacterEncoding("utf-8");
        req.setCharacterEncoding("utf-8");
        PrintWriter out = resp.getWriter();
        
        
        
        //object1代表stu_lab.getLabelnum()
        //object1代表stu_lab.getStudentnumString()
        String labelnum = req.getParameter("object1");
        String studentnum = req.getParameter("object2");
        
        req.setAttribute("labelnum", labelnum);
    	req.setAttribute("studentnum", studentnum);
    	RequestDispatcher rd = req.getRequestDispatcher("tea3_inputgrade2.jsp");  
		try {  
		    rd.forward(req, resp);  
		         return;  
		}catch(Exception e){
			e.printStackTrace();
		}
        
        
	}
}
