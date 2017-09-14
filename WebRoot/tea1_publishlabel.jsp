<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.util.*"%>
<%
	response.setContentType("text/html;charset=utf-8");
	request.setCharacterEncoding("utf-8");
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String testnumber = (String)session.getAttribute("number");
	boolean checkFlag = CheckNumber.checkTeacher(testnumber);
	if(!checkFlag){
		out.print("<script>alert('请先登录');window.location.href='index.jsp'</script>");
	}
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
		<link rel="stylesheet" type="text/css" href="Css/login.css" />
		<link rel="stylesheet" type="text/css" href="Css/control_index.css" />
		<script type="text/javascript" src="Js/jquery-1.7.2.min.js"></script>
		<script type="text/javascript" src="Js/layer.js"></script>
		<script type="text/javascript" src="Js/haidao.offcial.general.js"></script>
		<script type="text/javascript" src="Js/select.js"></script>
		<script type="text/javascript" src="Js/haidao.validate.js"></script>
<style>
		.position {
			margin-left:450px;
		}
</style>
</head>

<body>
		<div class="view-topbar">
			<div class="topbar-console">
				<div class="tobar-head fl">
					<a href="#" class="topbar-logo fl">
					<span><img src="Images/logo.png" width="20" height="20"/></span>
					</a>
					<a href="index.jsp" class="topbar-home-link topbar-btn text-center fl"><span>开放实验选课系统</span></a>
				</div>
			</div>
			<div class="topbar-info">
				<ul class="fr">
					<li class="fl topbar-info-item">
					<div class="dropdown">
						<a href="tea4_myinfo.jsp" class="topbar-btn">
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
								<span class="text-normal">发布课题</span>
							</a>
						</div>
						<ul class="sidebar-trans">
							<li>
								<a href="tea1_publishlabel.jsp">
									<b class="sidebar-icon"><img src="Images/icon_fa.png" width="16" height="16" /></b>
									<span class="text-normal">发布</span>
								</a>
							</li>
							<li>
								<a href="tea1_publishlabel2.jsp">
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
								<span class="text-normal">学生管理</span>
							</a>
						</div>
						<ul class="sidebar-trans">
							<li>
								<a href="tea2_stumanage.jsp">
									<b class="sidebar-icon"><img src="Images/icon_yi.png" width="16" height="16" /></b>
									<span class="text-normal">已录取</span>
								</a>
							</li>
							<li>
								<a href="tea2_stumanage2.jsp">
									<b class="sidebar-icon"><img src="Images/icon_wei.png" width="16" height="16" /></b>
									<span class="text-normal">未录取</span>
								</a>
							</li>
						</ul>
					</div>
					<div class="sidebar-nav">
						<div class="sidebar-title">
							<a href="#">
								<span class="icon"><b class="fl icon-arrow-down"></b></span>
								<span class="text-normal">成绩录入</span>
							</a>
						</div>
						<ul class="sidebar-trans">
							<li>
								<a href="tea3_inputgrade.jsp">
									<b class="sidebar-icon"><img src="Images/icon_lu.png" width="16" height="16" /></b>
									<span class="text-normal">录入</span>
								</a>
							</li>
							<li>
								<a href="tea3_searchgrade.jsp">
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
								<span class="text-normal">个人资料</span>
							</a>
						</div>
						<ul class="sidebar-trans">
							<li>
								<a href="tea4_myinfo.jsp">
									<b class="sidebar-icon"><img src="Images/icon_cha.png" width="16" height="16" /></b>
									<span class="text-normal">查看</span>
								</a>
							</li>
							<li>
								<a href="tea4_myinfo2.jsp">
									<b class="sidebar-icon"><img src="Images/icon_gai.png" width="16" height="16" /></b>
									<span class="text-normal">修改</span>
								</a>
							</li>
						</ul>
					</div>
				</div>			
			</div>
			<div class="view-product">
				<div class="manage-head">
						<h6 class="padding-left manage-head-con">发布课题</h6>
				</div>
				<div class='manage-record margin-lr'>	
				
				<form class="register-form" name="search" action="TeacherPublishLabel1Servlet" method="post" autocomplete="off">
					<div class="num-box ">
						<div class="area fl">
							课题名称
						</div>
						<input type="text"  name="name">
					</div>
					<div class="num-box ">
						<div class="area fl">
							上课地点
						</div>
						<input type="text" autofocus="true" name="place">
					</div>
					<div class="num-box ">
						<div class="area fl">
							上课时间
						</div>
						<input type="text"  autofocus="true" name="studytime">
					</div>
					<div class="num-box ">
						<div class="area fl">
							招生人数
						</div>
						<input type="text" autofocus="true" name="maxnum">
					</div>
					<div class="num-box ">
						<div class="area fl">
							课题简介
						</div>
						<input type="text"  autofocus="true" name="content">
					</div>
					<div class="num-box ">
						<div class="area fl">
							学期
						</div>
						<input type="text" " autofocus="true" name="term">
					</div>
					<div class="num-box ">
						<div class="area fl">
							学时
						</div>
						<input type="text"  autofocus="true" name="time">
					</div>
					<div class="num-box ">
						<div class="area fl">
							学分
						</div>
						<input type="text" autofocus="true" name="score">
					</div>
					<div class="position">
						<input type="submit" class="btn text-center login-btn" value="发布课题">
					</div>
				</form>
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