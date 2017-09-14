<%@page import="com.dao.TeacherDao"%>
<%@page import="com.dao.StudentDao"%>
<%@page import="com.entity.Student"%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.db.DBHelper"%>
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
		<meta charset="utf-8">
		<title>开放实验选课系统</title>
		<link rel="stylesheet" type="text/css" href="Css/identify.css" />
		<link rel="stylesheet" type="text/css" href="Css/layout.css" />
		<link rel="stylesheet" type="text/css" href="Css/account.css" />
		<link rel="stylesheet" type="text/css" href="Css/style.css" />
		<link rel="stylesheet" type="text/css" href="Css/control_index.css" />
		<script type="text/javascript" src="Js/jquery-1.7.2.min.js"></script>
		<script type="text/javascript" src="Js/layer/layer.js"></script>
		<script type="text/javascript" src="Js/haidao.offcial.general.js"></script>
		<script type="text/javascript" src="Js/select.js"></script>
		<script type="text/javascript" src="Js/haidao.validate.js"></script>
	</head>
<body>
	<h1 align="center">开放实验选课系统</h1>
	
<div class="view-product">
	<font size="6">
		<p>跳转中...</p> 
	</font>
	</div>
	<%
   	String person = request.getParameter("person");//1学生2老师
   	String student = request.getParameter("student");
   	String teacher = request.getParameter("teacher");
   	String number = request.getParameter("number");
   	String password = request.getParameter("password");
   	session.setAttribute("number",number);
	if(student!=null){//学生
		StudentDao studentdao = new StudentDao();
		int flag = studentdao.login(number,password);
		if (flag==1) {
			response.sendRedirect("stu1_readylabel.jsp");
		}else {
			out.print("<script>alert('登录失败，用户名或密码错误!');window.location.href='index.jsp'</script>");
		}
	}else if(teacher!=null)//教师
	{
		TeacherDao teacherDao = new TeacherDao();
		int flag = teacherDao.login(number,password);
		if (flag==1) {
			response.sendRedirect("tea1_publishlabel.jsp"); 
		}else {
			out.print("<script>alert('登录失败，用户名或密码错误!');window.location.href='index.jsp'</script>");
		}
	}
   	%>
</body>
</html>