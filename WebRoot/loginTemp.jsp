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
   	String person = request.getParameter("person");
   	String number = request.getParameter("number");
   	String name = request.getParameter("name");
   	String classname = request.getParameter("classname");
   	String tel = request.getParameter("tel");
   	String major = request.getParameter("major");
   	String password = request.getParameter("password");
   	session.setAttribute("number",number);
	if("1".equals(person)){//学生
		StudentDao studentDao = new StudentDao();
		int flag = studentDao.insertStudent(number, name, classname, tel, major, password);
		if(flag==1){
			response.sendRedirect("stu1_readylabel.jsp");
		}else{
			out.print("<script>alert('注册失败!');window.location.href='login.jsp'</script>");
		}
	}else if("2".equals(person))//教师
	{
		TeacherDao teacherDao = new TeacherDao();
		int flag = teacherDao.insertTeacher(number, name, tel, major, password);
		if(flag==1){
			response.sendRedirect("tea1_publishlabel.jsp");
		}else{
			out.print("<script>alert('注册失败!');window.location.href='login.jsp'</script>");
		}
	}
   	%>
</body>
</html>