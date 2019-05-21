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
	<input type="hidden" id="logId" name="logId" value="${log.id }" />
	<div align="left">
		<table border="1" width="47%" height="250" style="border-width: 0px;">
			<tr>
				<td style="border-style: none; border-width: medium">
					<form id="createOrg" class="contact_form" action="#" method="post"
						name="contact_form">
						<ul>
							<li><h2>日志详情</h2> <span><c:if test="${log.staff.user.id == user.id }">
										<button type="button" class="submit" onclick="returnMyLog()">返回</button>
									</c:if> <c:if test="${log.staff.user.id != user.id }">
										<button type="button" class="submit"
											onclick="returnReceiveLog()">返回</button>
									</c:if></span></li>
						</ul>
						<table>
							<tr>
								<td style="width: 130px;"><span>日志类型：</span></td>
								<td><span>${logContent[0] }</span></td>
							</tr>
							<c:if test="${log.logType.id == 1 }">
								<tr>

									<td><span>今日完成工作：</span></td>
									<td><span>${logContent[1] }</span></td>
								</tr>
								<tr>

									<td><span>今日工作总结：</span></td>
									<td><span>${logContent[2] }</span></td>
								</tr>
								<tr>

									<td><span>明日工作计划：</span></td>
									<td><span>${logContent[3] }</span></td>
								</tr>
							</c:if>
							<c:if test="${log.logType.id == 2 }">
								<tr>

									<td><span>本周完成工作：</span></td>
									<td><span>${logContent[1] }</span></td>
								</tr>
								<tr>

									<td><span>本周工作总结：</span></td>
									<td><span>${logContent[2] }</span></td>
								</tr>
								<tr>

									<td><span>下周工作计划：</span></td>
									<td><span>${logContent[3] }</span></td>
								</tr>
							</c:if>
							<c:if test="${log.logType.id == 3 }">
								<tr>

									<td><span>本月完成工作：</span></td>
									<td><span>${logContent[1] }</span></td>
								</tr>
								<tr>

									<td><span>本月工作总结：</span></td>
									<td><span>${logContent[2] }</span></td>
								</tr>
								<tr>

									<td><span>本月工作计划：</span></td>
									<td><span>${logContent[3] }</span></td>
								</tr>
							</c:if>
							<tr>

								<td><span>需协调与帮助：</span></td>
								<td><span><c:if test="${not empty logContent[4] }">${logContent[4] }</c:if><c:if test="${empty logContent[4] }">无</c:if></span></td>
							</tr>
							<tr>
								<td><span>备注：</span></td>
								<td><span><c:if test="${not empty logContent[5] }">${logContent[5] }</c:if><c:if test="${empty logContent[5] }">无</c:if></span></td>
							</tr>
							<tr>
								<td><span>发送时间：</span></td>
								<td><span>${fn:substring(log.createTime,0,19) }</span></td>
							</tr>
							<tr>
								<td><span>发送人：</span></td>
								<td><span>${log.staff.user.name }</span></td>
							</tr>
							<tr>
								<td><span>附件:</span></td>
								<td><c:if test="${not empty map }">
										<c:forEach items="${map}" var="v">
											<a
												href="${pageContext.request.contextPath }/log/fileDownload?filename=${v.key}">${v.value}</a>
										</c:forEach>
									</c:if> <c:if test="${empty map }">
										<span>无</span>
									</c:if></td>
							</tr>
							<tr>
								<td><span>评论：</span></td>
								<td><span><c:if test="${empty type }"><c:if
											test="${log.status == 0 or empty log.status}">
											<textarea id="comment" name="comment" placeholder="你可以在这里输入评论"
												rows="6" cols="40"></textarea>
										</c:if></c:if><c:if test="${log.status == 1 or not empty type}">
											<c:if test="${empty log.comment }">无</c:if>
											<c:if test="${not empty log.comment }">${log.comment }</c:if>
										</c:if></span></td>
							</tr>
							<tr>
								<td><c:if test="${empty type }">
										<c:if test="${log.status == 0 or empty log.status }">
											<button id="submit" class="submit" type="submit"
												onclick="remarkLog()">标记为已读</button>
										</c:if>
									</c:if></td>
							</tr>
						</table>
					</form>
				</td>
			</tr>
		</table>
	</div>
</body>
<script type="text/javascript">
	function returnMyLog() {
		window.location.href = "${pageContext.request.contextPath }/log/toMyLog";
	}
	function returnReceiveLog() {
		window.location.href = "${pageContext.request.contextPath }/log/receiveLog";
	}
	function remarkLog(logId) {
		var params = {};
		params.comment = $('#comment').val();
		params.id = $('#logId').val();
		$.ajax({
			url : "/CGB-PQM-OA/log/remarkLog",
			method : "post",
			dataType : "json",
			data : params,
			success : function(data) {
				alert(data.result);
				window.location.href = "${pageContext.request.contextPath }/log/receiveLog";
			}
		});
	}
</script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/jquery-3.1.1.min.js"></script>
</html>