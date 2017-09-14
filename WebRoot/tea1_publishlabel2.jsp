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
					<h6 class="padding-left manage-head-con">查询课题</h6>
				</div>
				<div class="manage-detail">
					<form id="search" name="search" method ="post" action = "TeacherPublishLabel2Servlet">  
        				<input class="btn text-center login-btn" type="submit" value="查询已经发布的课题" />
					</form>
				</div>
				<div class="manage-record margin-lr">							
							<div class="offcial-table margin-top clearfix">
								<div class="tr-th clearfix">
									<div class="th w5 text-center">
										编号
									</div>
									<div class="th w10 text-center">
										名称
									</div>
									<div class="th w10 text-center">
										学期
									</div>
									<div class="th w10 text-center">
										教师名称
									</div>
									<div class="th w15 text-center">
										上课地点
									</div>
									<div class="th w5 text-center">
										招生人数
									</div>
									<div class="th w5 text-center">
										当前人数
									</div>
									<div class="th w20 text-center">
										内容介绍
									</div>
									<div class="th w5 text-center">
										学时
									</div>
									<div class="th w5 text-center">
										学分
									</div>
									<div class="th w10 text-center">
										上课时间
									</div>
								</div>
								<%
    		ArrayList<Label> selectLabelList = (ArrayList<Label>)request.getAttribute("selectLabelList");
            if(selectLabelList!= null && selectLabelList.size() > 0){
            	for (int i = 0; i < selectLabelList.size(); i++) {
            		Label label = selectLabelList.get(i);
					out.print("<div class='tr clearfix border-bottom-none'>");
		            out.print("<div class='td w5 text-center'>"+label.getNumber()+"</div>");
		            out.print("<div class='td w10 text-center'>"+label.getNameString()+"</div>");
		            out.print("<div class='td w10 text-center'>"+label.getTermString()+"</div>");
		            out.print("<div class='td w10 text-center'>"+label.getTeachernameString()+"</div>");
		            out.print("<div class='td w15 text-center'>"+label.getPlaceString()+"</div>");
		            out.print("<div class='td w5 text-center'>"+label.getMaxnum()+"</div>");
		            out.print("<div class='td w5 text-center'>"+label.getNownum()+"</div>");
		            out.print("<div class='td w20 text-center'>"+label.getContentString()+"</div>");
		            out.print("<div class='td w5 text-center'>"+label.getTimeString()+"</div>");
		            out.print("<div class='td w5 text-center'>"+label.getScore()+"</div>");
		            out.print("<div class='td w10 text-center'>"+label.getStudytimeString()+"</div>");
		            out.print("</div>");
				}
            }
    		%>
					</div>
				</div>
				<div class="show-page padding-big-right">
							<div class="page">
								<div class="page">
									<ul class="offcial-page margin-top margin-big-right">
										<li>共<em class="margin-small-left margin-small-right">
											<%int selectLabelListSize=0;if(selectLabelList!=null)selectLabelListSize=selectLabelList.size();out.print(selectLabelListSize); %></em>条数据</li>
										<li>每页显示<em class="margin-small-left margin-small-right">15</em>条</li>
										<li><a class="next disable">上一页</a></li>
										<li></li>
										<li><a class="next disable">下一页</a></li>
										<li><span class="fl">共<em class="margin-small-left margin-small-right"><%out.print(selectLabelListSize/16+1); %></em>页</span></li>
									</ul>
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