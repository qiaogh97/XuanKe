package com.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.LabelDao;
import com.entity.Label;

public class StudentSelectLabelServlet extends HttpServlet{

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
	        
	        String teachernum = null;
	        if(req.getParameter("teachernum")!="")
	        	teachernum=req.getParameter("teachernum");
	        int labelnum = -1;
	        if(req.getParameter("labelnum")!="")
	        	labelnum=new Integer(req.getParameter("labelnum"));
	        LabelDao labelDao = new LabelDao();
	        ArrayList<Label> selectLabelList = labelDao.selectLabel(teachernum, labelnum);
	        
			req.setAttribute("selectLabelList", selectLabelList);
			
			RequestDispatcher rd = req.getRequestDispatcher("stu1_readylabel.jsp");  
			try {  
			    rd.forward(req, resp);  
			         return;  
			}catch(Exception e){
				e.printStackTrace();
			}         			
	        
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
