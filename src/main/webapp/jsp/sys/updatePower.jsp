<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="${pageContext.request.contextPath }/css/styles.css"
	rel="stylesheet" type="text/css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/select/select.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/select/select2.css">
<title>修改权限</title>
</head>
<body>
	<div align="left">
		<table border="1" width="47%" height="250" style="border-width: 0px;">
			<tr>
				<td style="border-style: none; border-width: medium">
					<form id="createOrg" class="contact_form"
						action="${pageContext.request.contextPath }/power/updateStaffPower"
						method="post" name="contact_form" enctype="multipart/form-data">
						<ul>
							<li><h2>修改权限</h2>
								<span></span></li>
							<li><span>成员名称:</span><span>${staff.user.name }</span></li>
							<li><span>成员当前权限代号:</span><span>${staff.power.code }</span></li>
							<li><span>成员当前权限描述:</span><span>${staff.power.description }</span></li>
							<li><label for="powerId">选择权限：</label> <select id="power.id"
								name="power.id" class="combobox">
									<option value="0">--请选择--</option>
									<c:forEach items="${powers }" var="power">
										<option value="${power.id }">${power.code }</option>
									</c:forEach>
							</select></li>
							</div>
							<li><button id="submit" class="submit" type="submit">确认</button>
								<button type="button" class="submit" onclick="returnIndex()">返回</button></li>
						</ul>
						<input type="hidden" name="id" value="${staff.id }">
					</form>
				</td>
			</tr>
		</table>
	</div>
</body>
<script type="text/javascript">
	function returnIndex() {
		window.location.href = "${pageContext.request.contextPath }/power/powerManager";
	}
</script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/jquery-3.1.1.min.js"></script>
</html>