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
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
		<title>开放实验选课系统</title>
		<meta name="keywords" content="开放实验选课系统" />
		<meta name="description" content="开放实验选课系统" />
		<link href="Css/layout.css" rel="stylesheet" type="text/css">
		<link href="Css/login.css" rel="stylesheet" type="text/css">
		<script type="text/javascript" src="Js/jquery-1.7.2.min.js"></script>
		<script type="text/javascript" src="Js/js.js"></script>
	</head>
	<style>
		.ibar {display: none;}
		.submit {
			margin-left:550px;
			
		}
	</style>
  <body class="login-bg">
			<div class="main">
			<div class="login-dom">
			<p class="text-big text-center logo-color">
						开放实验选课系统
					</p>
				<form class="register-form" name="register" action="LoginServlet" method="post" autocomplete="off">
					<div class="num-box ">
						<div class="area fl">
							编号
						</div>
						<input type="text" placeholder="请输入编号" autofocus="true" id="num-name" name="number">
					</div>
					<div class="num-box ">
						<div class="area fl">
							姓名
						</div>
						<input type="text" placeholder="请输入姓名" autofocus="true" id="num-name" name="name">
					</div>
					<div class="num-box ">
						<div class="area fl">
							班级
						</div>
						<input type="text" placeholder="请输入班级" autofocus="true" id="num-name" name="classname">
					</div>
					<div class="num-box ">
						<div class="area fl">
							电话
						</div>
						<input type="text" placeholder="请输入电话" autofocus="true" id="num-name" name="tel">
					</div>
					<div class="num-box ">
						<div class="area fl">
							专业
						</div>
						<input type="text" placeholder="请输入专业" autofocus="true" id="num-name" name="major">
					</div>
					<div class="num-box ">
						<div class="area fl">
							密码
						</div>
						<input type="password" placeholder="请输入密码" autofocus="true" id="num-name" name="password">
					</div>
					<div class="submit">
						<input type="submit" class="btn text-center login-btn" value="立即注册">
					</div>
					<input type="hidden" id="person" name="person" value="1"/>
				</form>
			</div>	
			</div>	
			<script>
	function check(){
		var number = document.getElementById("number");
		var name = document.getElementById("name");
		var classname = document.getElementById("classname");
		var major = document.getElementById("major");
		var password = document.getElementById("password");
		if(number == ""){
		    alert("编号不能为空！");
		    return false;
		}else if(name == ""){
			alert("姓名不能为空！");
			return false;
		}else if(classname == ""){
			alert("班级不能为空！");
			return false;
		}else if(major ==""){
			alert("专业不能为空！");
			return false;
		}else if(password ==""){
			alert("密码不能为空！");
			return false;
		}
		}
	</script>
</body>
</html>
