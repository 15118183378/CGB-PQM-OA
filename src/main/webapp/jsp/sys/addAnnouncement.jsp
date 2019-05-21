<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="${pageContext.request.contextPath }/css/styles.css"
	rel="stylesheet" type="text/css" />
<title>发布公告</title>
</head>
<body>
	<div><input type="hidden" id="msg" value="${msg }"/></div>
	<div align="left">
		<table border="1" width="47%" height="250" style="border-width: 0px;">
			<tr>
				<td style="border-style: none; border-width: medium">
					<form id="addAnnouncement" class="contact_form"
						action="${pageContext.request.contextPath }/announcement/addAnnouncement"
						method="post" name="contact_form">
						<ul>
							<li><h2>发布公告</h2>
								<span class="required_notification">* 表示必填项</span></li>
							<li><label for="title" style="font-size: 18px;">标题：</label>
								<input id="title" class="title" type="text" name="title"
								placeholder="title" required /></li>
							<li><label for="announcementType" style="font-size: 18px;">类别：</label>
								<input id="announcementType" class="announcementType"
								type="text" name="announcementType"
								placeholder="announcementType" required /></li>
							<li><label for="content" style="font-size: 18px;">内容：
							</label>
							<textarea id="content" class="content" name="content"
									placeholder="content" rows="6" cols="40" required></textarea></li>
							<li><button id="submit" class="submit" type="submit">添加</button>
								<button class="submit" type="reset">重置</button></li>
						</ul>
					</form>
				</td>
			</tr>
		</table>
	</div>
</body>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/getMsg.js"></script>
</html>