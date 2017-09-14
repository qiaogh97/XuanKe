<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.entity.*"%>
<%@ page import="com.dao.*"%>
<%@ page import="com.util.*"%>
<%
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
		<script type="text/javascript" src="Js/layer/layer.js"></script>
		<script type="text/javascript" src="Js/haidao.offcial.general.js"></script>
		<script type="text/javascript" src="Js/select.js"></script>
		<script type="text/javascript" src="Js/haidao.validate.js"></script>
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
							<h6 class="layout padding-left manage-head-con">查看资料
							</h6>
						</div>
					</div>
					
				</div>

				<div class="authority-content">
						<div class="list-content show">
							<div class="offcial-table tr-border margin-big-top clearfix">
								<div class="tr-th clearfix">
									<div class="th w15">
										学号
									</div>
									<div class="th w15">
										姓名
									</div>
									<div class="th w15">
										班级
									</div>
									<div class="th w20">
										电话
									</div>
									<div class="th w15">
										专业
									</div>
									<div class="th w20">
										密码
									</div>
								</div>
							
							<%
						        String studentnum = (String)session.getAttribute("number");
						        StudentDao studentDao = new StudentDao();
						        ArrayList<Student> selectStudent = studentDao.selectStudent(studentnum);
						        if(selectStudent.size()==0){
						        	out.print("<script>alert('请先登录');window.location.href='index.jsp'</script>");
						        }else{
						        Student student = selectStudent.get(0);
						        out.print("<div class=\"tr clearfix border-bottom-none\">");
										out.print("<div class=\"th w15\">"+student.getNumberString()+"</div>");
										out.print("<div class=\"th w15\">"+student.getNameString()+"</div>");
										out.print("<div class=\"th w15\">"+student.getClassString()+"</div>");
										out.print("<div class=\"th w20\">"+student.getTelString()+"</div>");
										out.print("<div class=\"th w15\">"+student.getMajorString()+"</div>");
										out.print("<div class=\"th w20\">"+student.getPwdString()+"</div>");
							            out.print("</div>");
						        }        
   							%>
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