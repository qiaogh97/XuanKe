package com.servlet;


import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.dao.Stu_LabDao;

public class TeacherInputGrade3Servlet extends HttpServlet {
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
	        
	        String gradeString = req.getParameter("grade");
	        int grade = Integer.parseInt(gradeString);
	        String labelnumString = req.getParameter("labelnum");
	        int labelnum = Integer.parseInt(labelnumString);
	        String studentnum = req.getParameter("studentnum");
	        
	        Stu_LabDao stu_LabDao = new Stu_LabDao();
	        int flag = stu_LabDao.updateStu_lab2(labelnum, studentnum, grade);
	        if (flag==1) {
	        	out.print("<script>alert('录入成功！');window.location.href='tea3_inputgrade.jsp'</script>");
			}else {
				out.print("<script>alert('录入失败！');window.location.href='tea3_inputgrade.jsp'</script>");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
