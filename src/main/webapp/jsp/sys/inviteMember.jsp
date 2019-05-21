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
	href="${pageContext.request.contextPath }/css/BoMa_table_css.css"
	type="text/css" media="screen" />
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript">
	function inviteMember(id) {
		var params = {};
		params.id = id;
		$.ajax({
			url : "/CGB-PQM-OA/staff/inviteMember",
			method : "post",
			dataType : "json",
			data : params,
			success : function(data) {
				alert(data.msg);
			}
		});
	}
</script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/getMsg.js"></script>
<title>邀请成员</title>
</head>
<body>
	<div><input type="hidden" id="msg" value="${msg }"/></div>
	<div align="left">
		<table border="1" width="47%" height="250" style="border-width: 0px;">
			<tr>
				<td style="border-style: none; border-width: medium">
					<form id="createOrg" class="contact_form"
						action="${pageContext.request.contextPath }/staff/searchUser"
						method="post" name="contact_form">
						<ul>
							<li><h2>邀请成员</h2> <span class="required_notification">*
									表示必填项</span></li>
							<li><input id="search" class="search" type="text"
								name="username" placeholder="用户名模糊搜索" required />
								<button class="submit" type="submit">搜索</button></li>
						</ul>
					</form>
				</td>
			</tr>
		</table>
		<c:if test="${not empty users }">
			<div id="body-wrapper">
				<div id="main-content">
					<div class="content-box">
						<%
							int num = 1;
						%>
						<table>
							<thead>
								<tr>
									<th width="20%">编号</th>
									<th width="20%">用户名</th>
									<th width="30%">名称</th>
									<th width="10%">性别</th>
									<th width="20%">操作</th>
								</tr>
							</thead>
							<tfoot>
								<tr>
									<td colspan="5">
										<div id="light-pagination" class="pagination"></div>
										<div class="clear"></div>
									</td>
								</tr>
							</tfoot>
							<tbody id="tbodyCompany">
								<c:forEach items="${users }" var="user">
									<tr class="user${user.id }">
										<td><%=num%></td>
										<td>${user.username }</td>
										<td>${user.name }</td>
										<td>${user.gender }</td>
										<td><button type="button" class="submit" onclick="inviteMember(${user.id})">邀请</button></td>
									</tr>
									<%
										num++;
									%>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</c:if>
	</div>
</body>
</html>