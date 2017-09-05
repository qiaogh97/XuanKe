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
<base href="<%=basePath%>">

<title>开放实验选课系统</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
</head>
<body>
	<h1 align="center">开放实验选课系统</h1>
	

	<font size="6">
		<p>跳转中...</p> 
	<%
   	String person = request.getParameter("person");//1学生2老师
   	String number = request.getParameter("number");
   	String password = request.getParameter("password");
   	session.setAttribute("number",number);
	if("1".equals(person)){//学生
		StudentDao studentdao = new StudentDao();
		int flag = studentdao.login(number,password);
		if (flag==1) {
			response.sendRedirect("stu1_readylabel.jsp");
		}else {
			out.print("<script>alert('登录失败，用户名或密码错误!');window.location.href='index.jsp'</script>");
		}
	}else if("2".equals(person))//教师
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