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
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/log/log.css"
	type="text/css" />
<title>通讯录</title>
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
							<li><h2>通讯录</h2><span></span></li>
							<li><span>所属公司：</span><span>${user.organize.name }</span></li>
							<div id="body-wrapper">
								<div id="main-content">
									<div class="content-box">
										<%
											int num = 1;
										%>
										<table>
											<thead>
												<tr>
													<th width="10%">编号</th>
													<th width="25%">名称</th>
													<th width="25%">性别</th>
													<th width="40%">联系方式</th>
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
											<tbody id="tbodyCompany">
												<c:forEach items="${users }" var="people">
													<tr class="people${people.id }">
														<td><%=num%></td>
														<td>${people.name }</td>
														<td>${people.gender }</td>
														<td>${people.tel }</td>
													</tr>
													<% num++; %>
												</c:forEach>
											</tbody>
										</table>
									</div>
								</div>
							</div>
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
	src="${pageContext.request.contextPath }/js/log/sendLog.js"></script>
</html>