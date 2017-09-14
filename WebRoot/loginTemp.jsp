<%@page import="com.dao.TeacherDao"%>
<%@page import="com.dao.StudentDao"%>
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
	<%
   	String person = request.getParameter("person");
   	String number = request.getParameter("number");
   	String name = request.getParameter("name");
   	String classname = request.getParameter("classname");
   	String tel = request.getParameter("tel");
   	String major = request.getParameter("major");
   	String password = request.getParameter("password");
   	String regex = "^((13[0-9])|(14[5|7])|(15([0-3]|[5-9]))|(18[0,5-9]))\\d{8}$"; 
   	boolean flag2 = tel.matches(regex);
   	if("1".equals(person)){
	   	if(number==""){
	   		out.print("<script>alert('编号不能为空！');window.location.href='stu_login.jsp'</script>");
	   	}else if(name==""){
	   		out.print("<script>alert('姓名不能为空！');window.location.href='stu_login.jsp'</script>");
	   	}else if(classname==""){
	   		out.print("<script>alert('班级不能为空！');window.location.href='stu_login.jsp'</script>");
	   	}else if(tel==""){
	   		out.print("<script>alert('电话不能为空！');window.location.href='stu_login.jsp'</script>");
	   	}else if(!flag2){
	   		out.print("<script>alert('电话号码格式不对！');window.location.href='stu_login.jsp'</script>");
	   	}else if(major==""){
	   		out.print("<script>alert('专业不能为空！');window.location.href='stu_login.jsp'</script>");
	   	}else if(password==""){
	   		out.print("<script>alert('密码不能为空！');window.location.href='stu_login.jsp'</script>");
	   	}
		StudentDao studentDao = new StudentDao();
		int flag = studentDao.insertStudent(number, name, classname, tel, major, password);
		if(flag==1){
			response.sendRedirect("stu1_readylabel.jsp");
		}else{
			out.print("<script>alert('注册失败!');window.location.href='stu_login.jsp'</script>");
		}
   	}else{
   		if(number==""){
	   		out.print("<script>alert('编号不能为空！');window.location.href='tea_login.jsp'</script>");
	   	}else if(name==""){
	   		out.print("<script>alert('姓名不能为空！');window.location.href='tea_login.jsp'</script>");
	   	}else if(classname==""){
	   		out.print("<script>alert('班级不能为空！');window.location.href='tea_login.jsp'</script>");
	   	}else if(tel==""){
	   		out.print("<script>alert('电话不能为空！');window.location.href='tea_login.jsp'</script>");
	   	}else if(!flag2){
	   		out.print("<script>alert('电话号码格式不对！');window.location.href='tea_login.jsp'</script>");
	   	}else if(major==""){
	   		out.print("<script>alert('专业不能为空！');window.location.href='tea_login.jsp'</script>");
	   	}else if(password==""){
	   		out.print("<script>alert('密码不能为空！');window.location.href='tea_login.jsp'</script>");
	   	}
		TeacherDao teacherDao = new TeacherDao();
		int flag = teacherDao.insertTeacher(number, name, tel, major, password);
		if(flag==1){
			response.sendRedirect("tea1_publishlabel.jsp");
		}else{
			out.print("<script>alert('注册失败!');window.location.href='tea_login.jsp'</script>");
		}
   	}
   	session.setAttribute("number",number);
   	%>
</body>
</html>