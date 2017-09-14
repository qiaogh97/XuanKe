<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.entity.*"%>
<%@ page import="com.dao.*"%>
<%@ page import="com.util.*"%>

<%
	response.setContentType("text/html;charset=utf-8");
	request.setCharacterEncoding("utf-8");
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String testnumber = (String)session.getAttribute("number");
	boolean checkFlag = CheckNumber.checkStudent(testnumber);
	if(!checkFlag){
		out.print("<script>alert('请先登录');window.location.href='index.jsp'</script>");
	}
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<!-- <meta charset="utf-8"> -->
		<title>开放实验选课系统</title>
		<link rel="stylesheet" type="text/css" href="Css/identify.css" />
		<link rel="stylesheet" type="text/css" href="Css/layout.css" />
		<link rel="stylesheet" type="text/css" href="Css/account.css" />
		<link rel="stylesheet" type="text/css" href="Css/style.css" />
		<link rel="stylesheet" type="text/css" href="Css/login.css" />
		<link rel="stylesheet" type="text/css" href="Css/control_index.css" />
		<script type="text/javascript" src="Js/jquery-1.7.2.min.js"></script>
		<script type="text/javascript" src="Js/layer.js"></script>
		<script type="text/javascript" src="Js/haidao.offcial.general.js"></script>
		<script type="text/javascript" src="Js/select.js"></script>
		<script type="text/javascript" src="Js/haidao.validate.js"></script>
</head>
<style>
		.position {
			margin-left:450px;
		}
</style>
<body>
	<div class="view-topbar">
			<div class="topbar-console">
				<div class="tobar-head fl">
					<a href="#" class="topbar-logo fl">
					<span><img src="Images/logo.png" width="20px" height="20px"/></span>
					</a>
					<a href="index.jsp" class="topbar-home-link topbar-btn text-center fl"><span>开放实验选课系统</span></a>
				</div>
			</div>
			<div class="topbar-info">
				<ul class="fr">
					<li class="fl topbar-info-item">
					<div class="dropdown">
						<a href="stu4_myinfo.jsp" class="topbar-btn">
						<span class="fl text-normal"><%=testnumber %></span>
						</a>
					</div>
					</li>
				</ul>
			</div>
		</div>
		<div class="view-body">
			<div class="view-sidebar">
				<div class="sidebar-content">
					<div class="sidebar-nav">
						<div class="sidebar-title">
							<a href="#">
								<span class="icon"><b class="fl icon-arrow-down"></b></span>
								<span class="text-normal">候选课题</span>
							</a>
						</div>
						<ul class="sidebar-trans">
							<li>
								<a href="stu1_readylabel.jsp">
									<b class="sidebar-icon"><img src="Images/icon_cha.png" width="16" height="16" /></b>
									<span class="text-normal">查询</span>
								</a>
							</li>
						</ul>
					</div>
					
					<div class="sidebar-nav">
						<div class="sidebar-title">
							<a href="#">
								<span class="icon"><b class="fl icon-arrow-down"></b></span>
								<span class="text-normal">我的课题</span>
							</a>
						</div>
						<ul class="sidebar-trans">
							<li>
								<a href="stu2_mylabel.jsp">
									<b class="sidebar-icon"><img src="Images/icon_shen.png" width="16" height="16" /></b>
									<span class="text-normal">申报</span>
								</a>
							</li>
							<li>
								<a href="stu2_mylabel2.jsp">
									<b class="sidebar-icon"><img src="Images/icon_cha.png" width="16" height="16" /></b>
									<span class="text-normal">查看</span>
								</a>
							</li>
						</ul>
					</div>
					
					
					<div class="sidebar-nav">
						<div class="sidebar-title">
							<a href="#">
								<span class="icon"><b class="fl icon-arrow-down"></b></span>
								<span class="text-normal">我的成绩</span>
							</a>
						</div>
						<ul class="sidebar-trans">
							<li>
								<a href="stu3_mygrade.jsp">
									<b class="sidebar-icon"><img src="Images/icon_cha.png" width="16" height="16" /></b>
									<span class="text-normal">查看</span>
								</a>
							</li>
						</ul>
					</div>
					
					
					
					
					<div class="sidebar-nav">
						<div class="sidebar-title">
							<a href="#">
								<span class="icon"><b class="fl icon-arrow-down"></b></span>
								<span class="text-normal">个人资料</span>
							</a>
						</div>
						<ul class="sidebar-trans">
							<li>
								<a href="stu4_myinfo.jsp">
									<b class="sidebar-icon"><img src="Images/icon_cha.png" width="16" height="16" /></b>
									<span class="text-normal">查看</span>
								</a>
							</li>
							<li>
								<a href="stu4_myinfo2.jsp">
									<b class="sidebar-icon"><img src="Images/icon_gai.png" width="16" height="16" /></b>
									<span class="text-normal">修改</span>
								</a>
							</li>
						</ul>
					</div>
				</div>
			</div>
			<div class="view-product">
				<div class="authority">
					<div class="authority-head">
						<div class="manage-head">
							<h6 class="layout padding-left manage-head-con">修改个人信息
							</h6>
						</div>
					</div>
					</div>
		<%
			String studentnum = (String)session.getAttribute("number");
		       
		       StudentDao studentDao = new StudentDao();
		       ArrayList<Student> selectStudent = studentDao.selectStudent(studentnum);
			   Student student = selectStudent.get(0);
		%>
		<div class="main">
			<div class="login-dom">
				<form class="register-form" name="search" action="StudentInfoUpdateServlet" method="post" autocomplete="off">
					<div class="num-box ">
						<div class="area fl">
							学生编号
						</div>
						<input type="text" value="<%=student.getNumberString()%>" readonly="true" autofocus="true" name="number" id="num-name">
					</div>
					<div class="num-box ">
						<div class="area fl">
							姓名
						</div>
						<input type="text" value="<%=student.getNameString()%>" autofocus="true" name="name" id="num-name">
					</div>
					<div class="num-box ">
						<div class="area fl">
							班级
						</div>
						<input type="text" value="<%=student.getClassString()%>" autofocus="true" name="class" id="num-name">
					</div>
					<div class="num-box ">
						<div class="area fl">
							电话
						</div>
						<input type="text" value="<%=student.getTelString()%>" autofocus="true" name="tel" id="num-name">
					</div>
					<div class="num-box ">
						<div class="area fl">
							专业
						</div>
						<input type="text" value="<%=student.getMajorString()%>" autofocus="true" name="major" id="num-name">
					</div>
					<div class="num-box ">
						<div class="area fl">
							密码
						</div>
						<input type="password" value="<%=student.getPwdString()%>" autofocus="true" name="password" id="num-name">
					</div>
					<div class="position">
						<input type="submit" class="btn text-center login-btn" value="提交修改">
					</div>
				</form>
			</div>	
			</div>
			</div>
		</div>
<script>
			$(".sidebar-title").live('click', function() {
				if ($(this).parent(".sidebar-nav").hasClass("sidebar-nav-fold")) {
					$(this).next().slideDown(200);
					$(this).parent(".sidebar-nav").removeClass("sidebar-nav-fold");
				} else {
					$(this).next().slideUp(200);
					$(this).parent(".sidebar-nav").addClass("sidebar-nav-fold");
				}
			});
		</script>
</body>
</html>