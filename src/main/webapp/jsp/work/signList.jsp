<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<head>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="${pageContext.request.contextPath }/css/styles.css"
	rel="stylesheet" type="text/css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/BoMa_table_css.css"
	type="text/css" media="screen" />
<title>考勤统计</title>
</head>
<body>
	<div align="left">
		<table border="1" width="47%" height="250" style="border-width: 0px;">
			<tr>
				<td style="border-style: none; border-width: medium">
					<form id="work" class="contact_form" action="#" method="post"
						name="contact_form">
						<ul>
							<li><h2>考勤统计</h2>
								<span></span></li>
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
													<th width="20%">员工名称</th>
													<th width="40%">加入时间</th>
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
											<tbody id="tbodyCompany">
												<c:forEach items="${stas }" var="sta">
													<tr class="staff${sta.id }">
														<td><%=num%></td>
														<td>${sta.user.name }</td>
														<td>${fn:substring(sta.joinTime,0,19) }</td>
														<td><a
															href="${pageContext.request.contextPath }/sign/lookStaffSign/${sta.id}"
															title="Look">查看考勤信息</a></td>
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
						</ul>
					</form>
				</td>
			</tr>
		</table>
	</div>
</body>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/jquery-3.1.1.min.js"></script>
</html>