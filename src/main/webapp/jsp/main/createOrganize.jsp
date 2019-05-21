<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="${pageContext.request.contextPath }/css/styles.css"
	rel="stylesheet" type="text/css" />
<title>新建组织</title>
</head>
<body>
	<div align="left">
		<table border="1" width="47%" height="250" style="border-width: 0px;">
			<tr>
				<td style="border-style: none; border-width: medium">
					<form id="createOrg" class="contact_form"
						action="${pageContext.request.contextPath }/organize/addOrganize"
						method="post" name="contact_form">
						<ul>
							<li><h2>新建企业</h2> <span class="required_notification">*
									表示必填项</span></li>
							<li><label for="name" style="font-size: 18px;">企业名称：</label>
								<input type="text" name="name" placeholder="name" required />
							<c:if test="${not empty param.msg }">
									<span id="msg" style="color: red;"><%=request.getParameter("msg")%></span>
								</c:if></li>
							<li><label for="description" style="font-size: 18px;">企业简介：</label>
								<input type="text" name="description" placeholder="description" /></li>
							<li><label for="code" style="font-size: 18px;">企业编码：</label>
								<input type="text" name="code" placeholder="code" /></li>
							<li><label for="province" style="font-size: 18px;">所在省：</label>
								<input id="province" type="text" name="province"
								placeholder="province" required /></li>
							<li><label for="city" style="font-size: 18px;">所在市：</label>
								<input id="city" type="text" name="city" placeholder="city"
								required /></li>
							<li><label for="area" style="font-size: 18px;">所在县/区：</label>
								<input id="area" type="text" name="area" placeholder="area"
								required /></li>
							<li><label for="position" style="font-size: 18px;">具体地址：</label>
								<input id="position" type="text" name="position"
								placeholder="position" required /></li>
							<li style="display: none;"><input id="longitude"
								type="hidden" name="longitude" /></li>
							<li style="display: none;"><input id="latitude"
								type="hidden" name="latitude" /></li>
							<li><button class="submit" type="button" onclick="check()">确认</button>
								<button type="button" class="submit" onclick="returnIndex()">返回</button></li>
						</ul>
					</form>
				</td>
			</tr>
		</table>
		<script type="text/javascript"
			src="http://api.map.baidu.com/api?v=1.3"></script>
		<div id="container" style="display: none;"></div>
	</div>
</body>
<script type="text/javascript">
	function returnIndex() {
		window.location.href = "${pageContext.request.contextPath }/user/home";
	}
</script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/main/createOrganize.js"></script>
</html>