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
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/log/log.css"
	type="text/css" />
<title>收到的审批</title>
<style type="text/css">
select {
	-webkit-appearance: none;
	-moz-appearance: none;
	appearance: none;
	position: relative;
	display: inline-block;
	width: 100px;
	height: 25px;
	font: 14px/20px "Microsoft YaHei";
	color: black;
}

/*清除ie的默认选择框样式清除，隐藏下拉箭头*/
select::-ms-expand {
	display: none;
}
</style>
</head>
<body>
	<input id="requestTypeId" name="requestTypeId" type="hidden" value="${requestTypeId }" />
	<input id="msg" type="hidden" value="${msg }" />
	<input id="type" type="hidden" value="${type }" />
	<div align="left">
		<table border="1" width="47%" height="250" style="border-width: 0px;">
			<tr>
				<td style="border-style: none; border-width: medium">
					<form id="createOrg" class="contact_form" action="#" method="post"
						name="contact_form">
						<ul>
							<li><h2>审批信息</h2> <span></span></li>
							<li><label for="requestType">按类型筛选：</label> <select
								id="requestType" name="requestType" class="combobox">
									<option value="0">--请选择--</option>
									<option value="1">请假</option>
									<option value="2">报销</option>
									<option value="3">出差</option>
							</select></li>
							<!-- <li><label for="startTime">开始时间：</label> <input type="text"
								name="startTime" placeholder="1990-1-1" /></li>
							<li><label for="endTime">结束时间：</label> <input type="text"
								name="endTime" placeholder="1990-1-1" /></li> -->
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
													<th width="20%">来自</th>
													<th width="30%">创建时间</th>
													<th width="15%">审批状态</th>
													<th width="15%">操作</th>
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
												<c:forEach items="${requests }" var="request">
													<tr class="request${request.id }">
														<td><%=num%></td>
														<td>${request.staff.user.name }</td>
														<td>${fn:substring(request.requestTime,0,19) }</td>
														<td>${request.dealStatus }</td>
														<td><a
															href="${pageContext.request.contextPath }/request/selectByRequestId/${request.id}?type=${type}"
															title="Edit"><c:if test="${type == 'waitRequest' }">处理</c:if>
																<c:if test="${type == 'dealed' }">查看</c:if></a></td>
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
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/getMsg.js"></script>
<script type="text/javascript">
	$(function() {
		if($("#requestTypeId").val() != null && $("#requestTypeId").val() != "") {
			$("#requestType").val($("#requestTypeId").val());
		}
	});
	$('#requestType').change(function() {
		if($('#type').val() == "dealed"){
			window.location.href = "${pageContext.request.contextPath }/request/getDealedRequest/" + $("#requestType").val();
		} else {
			window.location.href = "${pageContext.request.contextPath }/request/getWaitRequest/" + $("#requestType").val();
		}
		
	});
</script>
</html>