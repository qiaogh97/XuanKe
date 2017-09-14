<%@page import="com.dao.StudentDao"%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.entity.*"%>
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
		<script type="text/javascript" src="Js/layer.js"></script>
		<script type="text/javascript" src="Js/haidao.offcial.general.js"></script>
		<script type="text/javascript" src="Js/select.js"></script>
		<script type="text/javascript" src="Js/haidao.validate.js"></script>
		
		<!-- 为了加入输入框而添加的导入代码 -->
		<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
		<link href="Css/login.css" rel="stylesheet" type="text/css">
		<script type="text/javascript" src="Js/js.js"></script>
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
							<h6 class="layout padding-left manage-head-con">查询课题
							</h6>
						</div>
					</div>
					
				</div>
				<div>
					<form class="login-form" autocomplete="off" id="search" name="search" method="post" action="StudentSelectLabelServlet">
						<div class="login-box border text-small" id="box">
							<div class="name border-bottom">
								<input type="text" placeholder="教师编号" id="teachernum" name="teachernum" datatype="*" nullmsg="请填写教师编号">
							</div>
							<div class="name border-bottom">
								<input type="text" placeholder="课程编号" id="labelnum" name="labelnum" nullmsg="请填写课程编号">
							</div>
						</div>
						<div class="position">
						<input type="submit" class="btn text-center login-btn" name="sl" value="查询符合条件的课程">
						</div>
					</form>
			
					<div class="authority-content">
						<div class="list-content show">
							<div class="offcial-table tr-border margin-big-top clearfix">
								<div class="tr-th clearfix">
									<div class="th w5">
										编号
									</div>
									<div class="th w10">
										名称
									</div>
									<div class="th w10">
										学期
									</div>
									<div class="th w5">
										教师
									</div>
									<div class="th w10">
										地点
									</div>
									<div class="th w10">
										人数上限
									</div>
									<div class="th w10">
										当前人数
									</div>
									<div class="th w20">
										简介
									</div>
									<div class="th w5">
										学时
									</div>
									<div class="th w5">
										学分
									</div>
									<div class="th w10">
										时间
									</div>
								</div>
								<%
					    		ArrayList<Label> selectLabelList = (ArrayList<Label>)request.getAttribute("selectLabelList");
					            if(selectLabelList!= null && selectLabelList.size() > 0){
					            	for (int i = 0; i < selectLabelList.size(); i++) {
					            		Label label = selectLabelList.get(i);
					            		out.print("<div class=\"tr clearfix border-bottom-none\">");
					            		out.print("<div class=\"th w5\">"+label.getNumber()+"</div>");
					            		out.print("<div class=\"th w10\">"+label.getNameString()+"</div>");
					            		out.print("<div class=\"th w10\">"+label.getTermString()+"</div>");
					            		out.print("<div class=\"th w5\">"+label.getTeachernameString()+"</div>");
					            		out.print("<div class=\"th w10\">"+label.getPlaceString()+"</div>");
					            		out.print("<div class=\"th w10\">"+label.getMaxnum()+"</div>");
					            		out.print("<div class=\"th w10\">"+label.getNownum()+"</div>");
					            		out.print("<div class=\"th w20\">"+label.getContentString()+"</div>");
					            		out.print("<div class=\"th w5\">"+label.getTimeString()+"</div>");
					            		out.print("<div class=\"th w5\">"+label.getScore()+"</div>");
					            		out.print("<div class=\"th w10\">"+label.getStudytimeString()+"</div>");
					            		out.print("</div>");
									}
					            }
					    		%>
							</div>
						</div>
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