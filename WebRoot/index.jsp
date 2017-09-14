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
<!DOCTYPE html>
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
	</style>
	<body class="login-bg">
		<div class="main ">
			<div class="login-dom login-max">
				<div class="logo text-center">
					<img src="Images/logo.png" width="180px" height="180px">
				</div>
				<div class="login container " id="login">
					<p class="text-big text-center logo-color">
						开放实验选课系统
					</p>
					<form class="login-form" action="indexTemp.jsp" method="post" autocomplete="off">
						<div class="login-box border text-small" id="box">
							<div class="name border-bottom">
								<input type="text" placeholder="账号" id="username" name="number" nullmsg="请填写帐号信息">
							</div>
							<div class="pwd">
								<input type="password" placeholder="密码" id="password" name="password" nullmsg="请填写帐号密码">
							</div>
						</div>
						<input type="submit" name="student" class="btn text-center login-btn" value="学生登录">
						<input type="submit" name="teacher" class="btn text-center login-btn2" value="教师登录">
					</form>
					<div class="forget">
						<a href="stu_login.jsp" class="forget-pwd text-small fl">学生注册</a>
					</div>
					<div class="forget">
						<a href="tea_login.jsp" class="forget-pwd text-small fl">教师注册</a>
					</div>
				</div>
			</div>

			<div class="popupDom">
				<div class="popup text-default">
				</div>
			</div>
		</div>
	</body>
	<script type="text/javascript" src="Js/Validform_v5.3.2_min.js"></script>
	<script type="text/javascript">
		function popup_msg(msg) {
			$(".popup").html("" + msg + "");
			$(".popupDom").animate({
				"top": "0px"
			}, 400);
			setTimeout(function() {
				$(".popupDom").animate({
					"top": "-40px"
				}, 400);
			}, 2000);
		}

		/*动画（注册）*/
		$(document).ready(function(e) {
			// $("input[name=username]").focus();
			// $('.login-form').Validform({
			// 	ajaxPost: true,
			// 	tiptype: function(msg) {
			// 		if (msg) popup_msg('' + msg + '');
			// 	},
			// 	callback: function(ret) {
			// 		popup_msg('' + ret.info + '');
			// 		if (ret.status == 1) {
			// 			if (ret.uc_user_synlogin) {
			// 				$("body").append(ret.uc_user_synlogin);
			// 			}
			// 			setTimeout("window.location='" + ret.url + "'", 2000);
			// 		}
			// 	}
			// })

		});
	</script>

</html>