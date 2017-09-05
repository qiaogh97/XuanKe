<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.sql.*"%>
<%@page import="com.entity.Student"%>
<%@page import="com.dao.StudentDao"%>
<%@page import="com.entity.Stu_lab"%>
<%
	response.setContentType("text/html;charset=utf-8");
	request.setCharacterEncoding("utf-8");
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>开放实验选课系统</title>
<link rel="stylesheet" type="text/css" href="css/reset.css" />
<link rel="stylesheet" type="text/css" href="css/thems.css">
<link rel="stylesheet" type="text/css" href="css/responsive.css">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<style type="text/css">
p.leftmargin {
	margin-left: 35%
}
</style>
</head>

<!--头部-->
<div class="header">
	<div class="space_hx">&nbsp;</div>
	<div class="head_td"><a href="index.jsp">开放实验选课系统</a></div>
	<div class="space_hx">&nbsp;</div>
	<div class="nav_m">
		<div class="n_icon">&nbsp;</div>
		<ul class="nav clearfix">
			<li><a href="tea1_publishlabel.jsp">发布课题</a></li>
			<li><a href="tea2_stumanage.jsp">学生管理</a></li>
			<li class="now"><a href="tea3_inputgrade.jsp">成绩录入</a></li>
			<li><a href="tea4_myinfo.jsp">个人资料</a></li>
		</ul>
	</div>
</div>
<!--头部-->
<div class="space_hx">&nbsp;</div>
<div class="space_hx">&nbsp;</div>
<div class="scd clearfix">
	<div class="scd_l">
		<div class="title">
			<span>成绩录入</span>
		</div>
		<div class="scd_lm">
			<ul class="s_nav s_nav_a">
				<li class="now">
					<div class="li_m">
						<a href="tea3_inputgrade.jsp"><span>录入</span></a>
					</div>
				</li>
			</ul>
		</div>
	</div>
	<div class="scd_r">
		<div class="title">
			<span>录入</span>
		</div>
		
		<div class="scd_m">
		<%
			String labelnum = (String)request.getAttribute("labelnum");
			int labelnumber = Integer.parseInt(labelnum);
			String studentnum = (String)request.getAttribute("studentnum");
			
			StudentDao studentDao = new StudentDao();
			ArrayList<Student> students = studentDao.selectStudent(studentnum);
			Student student = students.get(0);
			%>
				<p><h3>成绩录入:</h3></p><br/>
			<%
		%>
		<form name="searchUser" method="post" action="TeacherInputGrade3Servlet">
			<table width="30%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td height="40"><span style="color:red;">*</span>课题编号：</td>
                    <td><input name="labelnum" type="text" class="text2"  value="<%=labelnum%>" readonly="true" style="background:#CCCCCC"></td>
                  </tr>
                  <tr>
                    <td height="40"><span style="color:red;">*</span>学生编号：</td>
                    <td><input name="studentnum" type="text" class="text2"  value="<%=studentnum%>" readonly="true" style="background:#CCCCCC"></td>
                  </tr>
                  <tr>
                    <td height="40"><span style="color:red;">*</span>学生姓名：</td>
                    <td><input  type="text" class="text2"   value="<%=student.getNameString()%>" readonly="true" style="background:#CCCCCC"></td>
                  </tr>
                  <tr>
                    <td height="40"><span style="color:red;">*</span>学生专业：</td>
                    <td><input  type="text" class="text2"   value="<%=student.getMajorString()%>" readonly="true" style="background:#CCCCCC"></td>
                  </tr>
                  <tr>
                    <td height="40"><span style="color:red;">*</span>学生班级：</td>
                    <td><input  type="text" class="text2"   value="<%=student.getClassString()%>" readonly="true" style="background:#CCCCCC"></td>
                  </tr>
                  <tr>
                    <td height="40"><span style="color:red;">*</span>学生电话：</td>
                    <td><input  type="text" class="text2"   value="<%=student.getTelString()%>" readonly="true" style="background:#CCCCCC"></td>
                  </tr>
                   <tr>
                    <td height="40"><span style="color:red;">*</span>成绩：</td>
                    <td><input type="text" class="text2" name="grade"></td>
                  </tr>
                </table>
                <div>
                  	<input height="40" type="submit" name="modify" id="modify" value="确定录入">
				</div>
		</form>
		</div>
		
		
		
	</div>
</div>

</html>