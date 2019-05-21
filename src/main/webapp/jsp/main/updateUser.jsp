<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.dy.oa.pojo.User"%>
<html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="${pageContext.request.contextPath }/css/styles.css"
	rel="stylesheet" type="text/css" />
<title>发日志</title>
</head>
<body>
	<div><input type="hidden" id="msg" value="${msg }"/></div>
	<div align="left">
		<table border="1" width="47%" height="250" style="border-width: 0px;">
			<tr>
				<td style="border-style: none; border-width: medium">
					<form id="updateUser" class="contact_form" action="${pageContext.request.contextPath }/user/updateUser" method="post"
						name="contact_form" enctype="multipart/form-data">
						<ul>
							<li><h2>修改个人信息</h2><span></span></li>
							<li><label for="name">名称：</label><input name="name" type="text" value="${user.name }" /></li>
							<li><label for="password">密码：</label><input name="password" type="password" value="${user.password }" /></li>
							<li><label for="tel">联系电话：</label><input name="tel" type="text" value="${user.tel }" /></li>
							<li><button id="submit" class="submit" type="submit">确认</button>
								<button class="submit" type="button" onclick="returnHome()">返回</button></li>
						</ul>
					</form>
				</td>
			</tr>
		</table>
	</div>
</body>
<script type="text/javascript">
	function returnHome() {
		window.location.href = "${pageContext.request.contextPath }/user/home";
	}
</script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/getMsg.js"></script>
</html>