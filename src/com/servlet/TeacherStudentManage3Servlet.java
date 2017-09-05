package com.servlet;


import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.dao.LabelDao;
import com.dao.Stu_LabDao;
import com.entity.Label;

public class TeacherStudentManage3Servlet extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		resp.setContentType("text/html");  
        resp.setCharacterEncoding("utf-8");
        req.setCharacterEncoding("utf-8");
        PrintWriter out = resp.getWriter();
        
        
        
        //type是类型，1代表录取，2代表拒绝
        String type = req.getParameter("type");
        //object1代表stu_lab.getLabelnum()
        //object1代表stu_lab.getStudentnumString()
        String labelnum = req.getParameter("object1");
        int labelnumber = Integer.parseInt(labelnum);
        String studentnum = req.getParameter("object2");
        if("1".equals(type)){ // 表示录取
        	//将人数加1
        	LabelDao labelDao = new LabelDao();
        	ArrayList<Label> selectLabel = labelDao.selectLabel(null, labelnumber);
        	Label label = new Label();
        	for(int i=0;i<selectLabel.size();i++){
        		label = selectLabel.get(i);
        	}
        	int maxnum = label.getMaxnum();
        	int nownum = label.getNownum();
        	if(nownum>=maxnum){
        		//人数已经够了，不能再加了
        		out.print("<script>alert('人数达到限制，录取失败！');window.location.href='tea2_stumanage2.jsp'</script>");
        	}else {
        		//将标记改成1
        		Stu_LabDao stu_LabDao = new Stu_LabDao();
        		int flag = stu_LabDao.updateStu_lab1(Integer.parseInt(labelnum), studentnum, 1);
        		//将人数加1
        		nownum++;
                int flag2 = labelDao.updateLabelNowtime(Integer.parseInt(labelnum), nownum);
        		if (flag+flag2>=2) {
					//成功
        			out.print("<script>alert('录取成功！');window.location.href='tea2_stumanage2.jsp'</script>");
				}else {
					//修改数据库失败
					out.print("<script>alert('服务器忙，录取失败！');window.location.href='tea2_stumanage2.jsp'</script>");
				}
				
			}
        	
        }
        else if("2".equals(type)){ // 表示拒绝
    		//将标记改成2
    		Stu_LabDao stu_LabDao = new Stu_LabDao();
    		int flag = stu_LabDao.updateStu_lab1(Integer.parseInt(labelnum), studentnum, 2);
        	if (flag==1) {
        		out.print("<script>alert('拒绝成功！');window.location.href='tea2_stumanage2.jsp'</script>");
			}else {
				out.print("<script>alert('服务器忙，拒绝失败！');window.location.href='tea2_stumanage2.jsp'</script>");
			}
        }
		
	}
}
