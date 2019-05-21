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
<title>审批</title>
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
	<input id="receiveLogs" type="hidden" value="" />
	<div align="left">
		<table border="1" width="47%" height="250" style="border-width: 0px;">
			<tr>
				<td style="border-style: none; border-width: medium">
					<form id="request" class="contact_form" action="#" method="post"
						name="contact_form">
						<ul>
							<li><h2>审批详情</h2> <span><c:if test="${type == 'myRequest' }">
										<button type="button" class="submit"
											onclick="returnMyRequest()">返回</button>
									</c:if> <c:if test="${type == 'waitRequest'}">
										<button type="button" class="submit"
											onclick="returnWaitRequest()">返回</button>
									</c:if> <c:if test="${type == 'dealed'}">
										<button type="button" class="submit"
											onclick="returnDealedRequest()">返回</button>
									</c:if></span></li>
						</ul>
						<table>
							<tr>
								<td style="width: 130px;"><span>审批类型：</span></td>
								<td><span>${requestContent[0] }</span></td>
							</tr>
							<c:if test="${request.requestType.id == 1 }">
								<tr>
									<td><span>起始时间：</span></td>
									<td><span>${requestContent[1] }</span></td>
								</tr>
								<tr>
									<td><span>结束时间：</span></td>
									<td><span>${requestContent[2] }</span></td>
								</tr>
								<tr>
									<td><span>请假事由：</span></td>
									<td><span>${requestContent[3] }</span></td>
								</tr>
								<tr>
									<td><span>备注：</span></td>
									<td><span><c:if test="${not empty requestContent[4] }">${requestContent[4] }</c:if><c:if test="${empty requestContent[4] }">无</c:if></span></td>
								</tr>
							</c:if>
							<c:if test="${request.requestType.id == 2 }">
								<tr>

									<td><span>报销金额：</span></td>
									<td><span>${requestContent[1] }</span></td>
								</tr>
								<tr>

									<td><span>报销类别：</span></td>
									<td><span>${requestContent[2] }</span></td>
								</tr>
								<tr>

									<td><span>费用明细：</span></td>
									<td><span>${requestContent[3] }</span></td>
								</tr>
								<tr>
									<td><span>备注：</span></td>
									<td><span><c:if test="${not empty requestContent[4] }">${requestContent[4] }</c:if><c:if test="${empty requestContent[4] }">无</c:if></span></td>
								</tr>
							</c:if>
							<c:if test="${request.requestType.id == 3 }">
								<tr>

									<td><span>出差地点：</span></td>
									<td><span>${requestContent[1] }</span></td>
								</tr>
								<tr>

									<td><span>起始时间：</span></td>
									<td><span>${requestContent[2] }</span></td>
								</tr>
								<tr>

									<td><span>结束时间：</span></td>
									<td><span>${requestContent[3] }</span></td>
								</tr>
								<tr>

									<td><span>出差事由:</span></td>
									<td><span>${requestContent[4] }</span></td>
								</tr>
								<tr>

									<td><span>备注：</span></td>
									<td><span><c:if test="${not empty requestContent[5] }">${requestContent[5] }</c:if><c:if test="${empty requestContent[5] }">无</c:if></span></td>
								</tr>
							</c:if>
							<tr>

								<td><span>发送时间：</span></td>
								<td><span>${fn:substring(request.requestTime,0,19) }</span></td>
							</tr>
							<tr>
								<td><span>发送人：</span></td>
								<td><span>${request.staff.user.name }</span></td>
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
								<td><span>审批状态：</span></td>
								<td><span>${request.dealStatus }</span></td>
							</tr>
							<c:if test="${not empty request.dealTime }">
								<tr>
									<td><span>处理时间：</span></td>
									<td><span>${fn:substring(request.dealTime,0,19) }</span></td>
								</tr>
							</c:if>
							<tr>
								<td colspan="2"><c:if test="${type == 'waitRequest'}">
										<button class="submit" type="button">
											<a
												href="${pageContext.request.contextPath }/request/changeRequestStatus/${request.id}?result=1"
												title="同意" style="color: white;">同意</a>
										</button>
										<button class="submit" type="button">
											<a
												href="${pageContext.request.contextPath }/request/changeRequestStatus/${request.id}?result=0"
												title="驳回" style="color: white;">驳回</a>
										</button>
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
	function returnMyRequest() {
		window.location.href = "${pageContext.request.contextPath }/request/toMyRequest";
	}
	function returnWaitRequest() {
		window.location.href = "${pageContext.request.contextPath }/request/waitRequest";
	}
	function returnDealedRequest() {
		window.location.href = "${pageContext.request.contextPath }/request/dealedRequest";
	}
</script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/jquery-3.1.1.min.js"></script>
</html>