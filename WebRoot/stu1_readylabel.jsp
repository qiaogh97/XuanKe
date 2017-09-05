<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.entity.*"%>
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
	<div class="head_td"><a href="index.jsp">开放实验选课系统</a></div>
	<div class="space_hx">&nbsp;</div>
	<div class="nav_m">
		<div class="n_icon">&nbsp;</div>
		<ul class="nav clearfix">
			<li class="now"><a href="stu1_readylabel.jsp">候选课题</a></li>
			<li><a href="stu2_mylabel.jsp">我的课题</a></li>
			<li><a href="stu3_mygrade.jsp">我的成绩</a></li>
			<li><a href="stu4_myinfo.jsp">个人资料</a></li>
		</ul>
	</div>
</div>
<!--头部-->
<div class="space_hx">&nbsp;</div>
<div class="space_hx">&nbsp;</div>
<div class="scd clearfix">
	<div class="scd_l">
		<div class="title">
			<span>候选课题</span>
		</div>
		<div class="scd_lm">
			<ul class="s_nav s_nav_a">
				<li class="now">
					<div class="li_m">
						<a href="stu1_readylabel.jsp"><span>查询</span></a>
					</div>
				</li>
			</ul>
		</div>
	</div>
	<div class="scd_r">
		<div class="title">
			<span>查询</span>
			<form id="search" name="search" method ="post" action = "StudentSelectLabelServlet">  
        		教师编号:<input type="text" name="teachernum"/> <br/> 
        		课程编号:<input type="text" name="labelnum"/> <br/> 
        		<input type="submit" name="sl" value="查询符合条件的课程"/>
			</form>
			<div align = "center">
		<table border="1" cellspacing="0" cellpadding="0" ">
            <tr bgcolor="ff9900" style="font-weight:bold;">
                <td align="center" width="80px">编号</td>
                <td align="center" width="80px">名称</td>
                <td align="center" width="80px">学期</td>
                <td align="center" width="120px">教师名称</td>
                <td align="center" width="120px">上课地点</td>
                <td align="center" width="120px">招生人数</td>
                <td align="center" width="120px">当前人数</td>
                <td align="center" width="120px">内容简介</td>
                <td align="center" width="80px">学时</td>
                <td align="center" width="80px">学分</td>
                <td align="center" width="120px">上课时间</td>
            </tr>
            <%
    		ArrayList<Label> selectLabelList = (ArrayList<Label>)request.getAttribute("selectLabelList");
            if(selectLabelList!= null && selectLabelList.size() > 0){
            	for (int i = 0; i < selectLabelList.size(); i++) {
            		Label label = selectLabelList.get(i);
					out.print("<tr>");
		            out.print("<td >"+label.getNumber()+"</td>");
		            out.print("<td >"+label.getNameString()+"</td>");
		            out.print("<td >"+label.getTermString()+"</td>");
		            out.print("<td >"+label.getTeachernameString()+"</td>");
		            out.print("<td >"+label.getPlaceString()+"</td>");
		            out.print("<td >"+label.getMaxnum()+"</td>");
		            out.print("<td >"+label.getNownum()+"</td>");
		            out.print("<td >"+label.getContentString()+"</td>");
		            out.print("<td >"+label.getTimeString()+"</td>");
		            out.print("<td >"+label.getScore()+"</td>");
		            out.print("<td >"+label.getStudytimeString()+"</td>");
		            out.print("</tr>");
				}
            }
    		%>
        </table>
		</div>
		</div>
	</div>
</div>

</html>