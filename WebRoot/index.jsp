<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.Date"%>
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
<link rel="stylesheet" type="text/css" href="css/reset.css"/>
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
  <body>
<!--头部-->
<div class="header">
<div class="space_hx">&nbsp;</div>
<div class="head_td"><a href="index.jsp">开放实验选课系统</a></div>
    <div class="space_hx">&nbsp;</div>
    <div class="nav_m">
        <div class="n_icon">&nbsp;</div>
        <ul class="nav clearfix">
        </ul>
    </div>
</div>
	<font size="6"> <br> <br>
		<table align="center" width="300" height="200">
			<tr>
				<td align="center"><font size="6">登录界面</font></td>
			</tr>
			<tr>
				<td align="center">
					<form padding-top="0" action="indexTemp.jsp" method="post">
						账号: <input type="text" name="number"> <br/> 密码: <input
							type="password" name="password"> <br/><br/><select
							id='person' name='person'>
							<option value="1">学生</option>
							<option value="2">教师</option>
						</select> <br/><br/>
						<input type="submit" name="b" value="登录">
					</form>
					
				</td>
			</tr>
		</table>
		<font size=2><a href="login.jsp">还没有 账号？点击注册</a></font>
	</font>
</body>
</html>
