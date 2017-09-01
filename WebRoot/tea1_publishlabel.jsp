<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.sql.*"%>
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
	<div class="head_td">开放实验选课系统</div>
	<div class="space_hx">&nbsp;</div>
	<div class="nav_m">
		<div class="n_icon">&nbsp;</div>
		<ul class="nav clearfix">
			<li class="now"><a href="tea1_publishlabel.jsp">发布课题</a></li>
			<li><a href="tea2_stumanage.jsp">学生管理</a></li>
			<li><a href="tea3_inputgrade.jsp">成绩录入</a></li>
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
			<span>发布课题</span>
		</div>
		<div class="scd_lm">
			<ul class="s_nav s_nav_a">
				<li class="now">
					<div class="li_m">
						<a href="tea1_publishlabel.jsp"><span>发布</span></a>
					</div>
				</li>
				<li>
					<div class="li_m">
						<a href="tea1_publishlabel2.jsp"><span>查询</span></a>
					</div>
				</li>
			</ul>
		</div>
	</div>
	<div class="scd_r">
		<div class="title">
			<span>发布</span>
		</div>
		<br /> <br /> <br />
		<div>
			<form padding-top="0" action="TeacherPublishLabel1Servlet" method="post">
				课题名称: <input type="text" name="name"> <br> 
				上课地点: <input type="text" name="place"> <br> 
				上课时间: <input type="text" name="studytime"> <br>
				招生人数: <input type="text" name="maxnum"> <br> 
				课题简介: <input type="text" name="content"><br>
				学&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;期: <input type="text" name="term"> <br> 
				学&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;时: <input type="text" name="time"> <br>
				学&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;分: <input type="text" name="score"> <br>
				<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="submit" name="b" value="发布课题">
			</form>

		</div>



	</div>
</div>

</html>