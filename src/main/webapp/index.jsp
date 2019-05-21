<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.dy.oa.pojo.User"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>办公自动化</title>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="format-detection" content="telephone=no">

<link rel="stylesheet"
	href="${pageContext.request.contextPath }/plugins/layui/css/layui.css"
	media="all" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/global.css" media="all">
<link rel="stylesheet" type="text/css"
	href="http://www.jq22.com/jquery/font-awesome.4.6.0.css">

</head>
<body>
	<%-- <form action="#">
		<input id="msg" type="hidden"
			value="<%=request.getParameter("msg")%>" />
	</form> --%>
	<div class="layui-layout layui-layout-admin"
		style="border-bottom: solid 5px #1aa094;">
		<div class="layui-header header header-demo">
			<div class="layui-main">
				<div class="admin-login-box">
					<a class="logo" style="left: 0;">
						<!-- href="http://beginner.zhengjinfan.cn/demo/beginner_admin/" -->
						<span style="font-size: 22px;">办公自动化系统</span>
					</a>
					<div class="admin-side-toggle">
						<i class="fa fa-bars" aria-hidden="true"></i>
					</div>
					<div class="admin-side-full">
						<i class="fa fa-life-bouy" aria-hidden="true"></i>
					</div>
				</div>
				<ul class="layui-nav admin-header-item">
					<li class="layui-nav-item"><a href="javascript:;"
						class="admin-header-user"> <img
							src="${pageContext.request.contextPath }/images/0.jpg" /> <span>${user.name }</span>
					</a>
						<dl class="layui-nav-child">
							<dd id="lock">
								<a href="javascript:;"> <i class="fa fa-lock"
									aria-hidden="true"
									style="padding-right: 3px; padding-left: 1px;"></i> 锁屏 (Alt+L)
								</a>
							</dd>
							<dd>
								<a href="${pageContext.request.contextPath }/user/signOut"><i
									class="fa fa-sign-out" aria-hidden="true"></i> 注销</a>
							</dd>
						</dl></li>
				</ul>
				<ul class="layui-nav admin-header-item-mobile">
					<li class="layui-nav-item"><a
						href="${pageContext.request.contextPath }/user/signOut"><i
							class="fa fa-sign-out" aria-hidden="true"></i> 注销</a></li>
				</ul>
			</div>
		</div>
		<div class="layui-side layui-bg-black" id="admin-side">
			<c:if test="${not empty user.organize.id }">
				<div class="layui-side-scroll" id="admin-navbar-side"
					lay-filter="side"></div>
			</c:if>
		</div>
		<div class="layui-body"
			style="bottom: 0; border-left: solid 2px #1AA094;" id="admin-body">
			<div class="layui-tab admin-nav-card layui-tab-brief"
				lay-filter="admin-tab">
				<ul class="layui-tab-title">
					<li class="layui-this"><i class="fa fa-dashboard"
						aria-hidden="true"></i><cite onclick="reload()">首页</cite></li>
				</ul>
				<div class="layui-tab-content"
					style="min-height: 150px; padding: 5px 0 0 0;">
					<div class="layui-tab-item layui-show">
						<iframe src="${pageContext.request.contextPath }/user/home"></iframe>
					</div>
				</div>
			</div>
		</div>
		<div class="layui-footer footer footer-demo" id="admin-footer">
			<div class="layui-main">
				<p>
					2019 &copy; <a href="#">pengqiming</a> 深圳科技
				</p>
			</div>
		</div>
		<div class="site-tree-mobile layui-hide">
			<i class="layui-icon">&#xe602;</i>
		</div>
		<div class="site-mobile-shade"></div>

		<!--锁屏模板 start-->
		<script type="text/template" id="lock-temp">
				<div class="admin-header-lock" id="lock-box">
					<div class="admin-header-lock-img">
						<img src="images/0.jpg"/>
					</div>
					<div class="admin-header-lock-name" id="lockUserName">beginner</div>
					<input type="text" class="admin-header-lock-input" value="输入密码解锁.." name="lockPwd" id="lockPwd" />
					<button class="layui-btn layui-btn-small" id="unlock">解锁</button>
				</div>
			</script>
		<!--锁屏模板 end -->
		<script type="text/javascript"
			src="${pageContext.request.contextPath }/js/jquery-3.1.1.min.js"></script>
		<script type="text/javascript"
			src="${pageContext.request.contextPath }/plugins/layui/layui.js"></script>
		<script type="text/javascript"
			src="${pageContext.request.contextPath }/datas/nav.js"></script>
		<script src="${pageContext.request.contextPath }/js/index.js"></script>
		<%-- <script src="${pageContext.request.contextPath }/js/getMsg.js"></script> --%>
		<script type="text/javascript">
			function reload() {
				window.location.reload();
			}
		</script>
	</div>
</body>
</html>