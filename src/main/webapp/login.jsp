<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>OA登录</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/css/login.css">
<style type="text/css">
body, td, th {
	font-family: "Source Sans Pro", sans-serif;
}

body {
	background-color: #2B2B2B;
}
</style>
</head>
<body onload="loadTopWindow();" style="text-align: center;">
	<div class="wrapper">
		<div class="container">
			<h1>Welcome</h1>
			<form class="form">
				<span id="msg">${not empty msg?msg:"" }</span> 
				<input id="userName" type="text" placeholder="Username"> 
				<input id="psd" type="password" placeholder="Password">
				<button type="button" id="login-button">Login</button>
				<button type="button" onclick="register()">Register</button>
			</form>
		</div>
		<div id="register" style="display: none; margin: 0 auto;">
			<%-- <%@include file="/jsp/sys/register.jsp"%> --%>
			<form action="${pageContext.request.contextPath }/user/register"
				class="form" style="padding-left: 460px;">
				<table>
					<tr>
						<td colspan="2"><h2>OA用户注册</h2></td>
					</tr>
					<tr>
						<td>名称：</td>
						<td><input type="text" name="name" placeholder="name"
							required /></td>
					</tr>
					<tr>
						<td>性别：</td>
						<td><input type="text" name="gender" placeholder="gender"
							required /></td>
					</tr>
					<tr>
						<td>手机号码：</td>
						<td><input type="text" name="tel" placeholder="tel" required />
						</td>
					</tr>
					<tr>
						<td>用户名：</td>
						<td><input type="text" name="username" placeholder="username"
							required /></td>
					</tr>
					<tr>
						<td>密码：</td>
						<td><input type="password" name="password" placeholder="password"
							required /></td>
					</tr>
					<tr>
						<td></td>
						<td>
							<button type="submit">确认</button>
							<button onclick="returnLogin()">返回</button>
						</td>
					</tr>
				</table>
			</form>
		</div>
		<ul class="bg-bubbles">
			<li>OA</li>
			<li>OA</li>
			<li>OA</li>
			<li>OA</li>
			<li>OA</li>
			<li>OA</li>
			<li>OA</li>
			<li>OA</li>
		</ul>
	</div>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/js/jquery-3.1.1.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/js/login.js"></script>
</body>
<script type="text/javascript">
	function register() {
		$('.container').css("display", "none");
		$('#register').css('display', 'block');
	}
	function returnLogin() {
		$('.container').css("display", "block");
		$('#register').css('display', 'none');
	}
</script>
</html>
