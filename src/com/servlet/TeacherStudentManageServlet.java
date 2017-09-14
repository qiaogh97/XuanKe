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
import com.entity.Stu_lab;

public class TeacherStudentManageServlet extends HttpServlet {
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
	        
	        //取得登录状态下的老师的编号
	        HttpSession session = req.getSession();
	        String teachernum = (String)session.getAttribute("number");
	        
	        //查询该老师名下的所有课题
	        LabelDao labelDao = new LabelDao();
	        ArrayList<Label> selectLabelList = labelDao.selectLabel(teachernum, -1);//用来存放查询课题表结果的
	        
	        ArrayList<Integer> listsint = new ArrayList<Integer>();//存放该老师名下的所有课题编号
	        ArrayList<Stu_lab> stu_labList = new ArrayList<Stu_lab>();//存放最终查询出来的学生课题表
	        
	        //把课题编号放进来
	        for(int i=0;i<selectLabelList.size();i++){
	        	Label label = selectLabelList.get(i);
	        	listsint.add(label.getNumber());
	        }
	        //把学生课题表中的该老师的课题下的学生全部取出来
	        Stu_LabDao stu_LabDao = new Stu_LabDao();
	        for(int i=0;i<listsint.size();i++){
	        	ArrayList<Stu_lab> selectStu_lab2 = stu_LabDao.selectStu_lab2(listsint.get(i), 1);//根据该编号依次查询数据
	        	for(int j =0 ;j<selectStu_lab2.size();j++){
	        		stu_labList.add(selectStu_lab2.get(j));
	        	}
	        }
			req.setAttribute("stu_labList", stu_labList);
			RequestDispatcher rd = req.getRequestDispatcher("tea2_stumanage.jsp");  
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
