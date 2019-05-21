<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>权限管理</title>
</head>
<link href="${pageContext.request.contextPath }/css/styles.css"
	rel="stylesheet" type="text/css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/BoMa_table_css.css"
	type="text/css" media="screen" />
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/scriptsN/jquery-1.3.2.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/scriptsN/simpla.jquery.configuration.js"></script>
</head>
<body class="body">
	<div>
		<input type="hidden" id="msg" value="${msg }" />
	</div>
	<div id="body-wrapper">
		<div id="main-content">
			<p id="page-intro">当前位置:>>权限管理</p>
			<div class="content-box">
				<table>
					<thead>
						<tr>
							<th width="20%">成员名称</th>
							<th width="20%">成员权限代号</th>
							<th width="40%">成员权限描述</th>
							<th width="20%">操作</th>
						</tr>
					</thead>
					<tfoot>
						<tr>
							<td colspan="4">
								<div id="light-pagination" class="pagination"></div>
								<div class="clear"></div>
							</td>
						</tr>
					</tfoot>
					<tbody id="tbodyManager" style="">
						<c:forEach items="${staffs }" var="staff">
							<tr class="staff${staff.id }">
								<td>${staff.user.name }</td>
								<td>${staff.power.code }</td>
								<td>${staff.power.description }</td>
								<td><a
									href="${pageContext.request.contextPath }/power/updatePower/${staff.id}"
									title="修改权限"> <img alt="修改权限"
										src="${pageContext.request.contextPath }/img/imagesN/icons/pencil.png">
								</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/getMsg.js"></script>
</html>