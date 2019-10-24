<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE html>
<html lang="en">
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
		<meta http-equiv="content-type" content="text/html;charset=utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title>login</title>

		<link rel="stylesheet" type="text/css" href="css/style.css">
		<link rel="stylesheet" type="text/css" href="css/swal.css">
		<link rel="stylesheet" type="text/css" href="css/yzm.css">

		<script type="text/javascript" src="js/swal.js"></script>
		<script type="text/javascript" src="js/background.js"></script>
		<script type="text/javascript" src="js/vector.js"></script>
		<script type="text/javascript" src="js/yzm.js"></script>

		<style>
			#register{
				position:absolute;
				width:10px;
				height:10px;
				right:0px;
				top:0px;
				z-index:100;
			}
		</style>
	</head>
	<body>
		
		<div id="container">
			
			<div id="output">
				<div class="containerT">	
				<div id="register" align="right" >
					<a style="right:3%;" href="register.jsp">注册</a>
					<a style="right:3%;" href="changepassword.jsp">忘记密码？</a>
				</div>
					<h1>用户登录</h1>
					<form class="form" id="entry_form" name="login" action="login.jsp" method="post">
						<input type="text" class="username" name="name" placeholder="账号" id="entry_name" />
						<input type="password" class="password" name="pwd" placeholder="密码" id="entry_password" />

						<input type="text" id="input" placeholder="输入验证码" value="" />
						
						<input type="button" class="button" id="code" onclick="createCode()" /><!-- 这里的type=“button”是yzm.css的button -->
						
						<input type="button" class="button" value="验证" onclick="vali()" /> <!-- 这里的type=“button”是yzm.css的button -->
						<button type="submit" id="entry_btn" class="login" onclick="TryLogin()" disabled="true">登录</button>

						<div id="prompt" class="prompt"></div>
					</form>
				</div>
			</div>
		</div>



		<!-- ---------------------------------------------------------------------- -->
		<script>
			function TryLogin() {
				if ($(".username").val() == '')
					swal("请输入用户名!");
				else if ($(".password").val() == '')
					swal("请输入密码!");
				else {
					window.location.href = 'login.jsp'; //跳转到登录验证页面
				}

			}

			function vali() {
				var oValue = document.getElementById('input').value.toUpperCase();
				if (oValue == 0) {
					swal('请输入验证码!');
				} else if (oValue != code) {
					swal('验证码不正确，请重新输入!');
					oValue = ' ';
					createCode();
				} else {
					var yzm = document.getElementById("code");
					yzm.style.backgroundColor="greenyellow";

					var btn = document.getElementById("entry_btn");
					btn.disabled=false;
				}
			}
		</script>
		<!-- ---------------------------------------------------------------------- -->

		<script type="text/javascript">
			$(function() {
				Victor("container", "output"); //登录背景函数
				$("#entry_name").focus();
				$(document).keydown(function(event) {
					if (event.keyCode == 13) {
						$("#entry_btn").click();
					}
				});
			});
		</script>
		<div style="text-align:center;">
		</div>
	</body>
</html>
