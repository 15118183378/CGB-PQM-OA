<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="${pageContext.request.contextPath }/css/styles.css"
	rel="stylesheet" type="text/css" />
<title>日志</title>
<style type="text/css">
td {
	vertical-align: top;
	font-family: cursive;
	font-size: 18px;
	padding: 10px;
}
</style>
</head>
<body>
	<div align="left">
		<table border="1" width="47%" height="250" style="border-width: 0px;">
			<tr>
				<td style="border-style: none; border-width: medium">
					<form id="createOrg" class="contact_form" action="#" method="post"
						name="contact_form">

						<ul>
							<li><h2>公告</h2> <span><button type="button"
										class="submit" onclick="returnHome()">返回</button></span></li>
						</ul>
						<table>
							<tr>
								<td>标题：</td>
								<td>${announcement.title }</td>
							</tr>
							<tr>
								<td>类别：</td>
								<td>${announcement.announcementType }</td>
							</tr>
							<tr>
								<td>发布者：</td>
								<td>${announcement.issuer }</td>
							</tr>
							<tr>
								<td>发布时间：</td>
								<td>${announcement.createTime }</td>
							</tr>
							<tr>
								<td>正文：</td>
								<td>${announcement.content }</td>
							</tr>
						</table>
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
</html>