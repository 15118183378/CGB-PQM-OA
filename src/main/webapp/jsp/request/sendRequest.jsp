<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="${pageContext.request.contextPath }/css/styles.css"
	rel="stylesheet" type="text/css" />
<title>发起审批</title>
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
	<div><input type="hidden" id="msg" value="${msg }"/></div>
	<div align="left">
		<table border="1" width="47%" height="250" style="border-width: 0px;">
			<tr>
				<td style="border-style: none; border-width: medium">
					<form id="createOrg" class="contact_form" action="${pageContext.request.contextPath }/request/sendRequest" method="post"
						name="contact_form" enctype="multipart/form-data">
						<ul>
							<li><h2>发起审批</h2><span></span></li>
							<li><label for="requestType">审批类型：</label> <select id="requestType"
								name="requestType" class="combobox">
									<option value="0">--请选择--</option>
									<option value="1">请假</option>
									<option value="2">报销</option>
									<option value="3">出差</option>
							</select></li>
							<div id="leave" style="display: none;">
							<li><label for="startTime" style="font-size: 18px;">起始时间：
							</label><input id="startTime" type="text" name="startTime" placeholder="1990-1-1"/></li>
							<li><label for="endTime" style="font-size: 18px;">结束时间：
							</label> <input id="endTime" type="text" name="endTime" placeholder="1990-1-1"/></li>
							<li><label for="leaveReason" style="font-size: 18px;">请假事由：
							</label> <textarea id="leaveReason" name="leaveReason"
									placeholder="leaveReason" rows="6" cols="40"></textarea></li>
							</div>
							<div id="reimburse" style="display: none;">
							<li><label for="money" style="font-size: 18px;">报销金额：
							</label> <input id="money" name="money"
									placeholder="money" /></li>
							<li><label for="reimburseType" style="font-size: 18px;">报销类别：
							</label> <input id="reimburseType" name="reimburseType"
									placeholder="reimburseType" /></li>
							<li><label for="detail" style="font-size: 18px;">费用明细：
							</label> <textarea id="detail" name="detail"
									placeholder="detail" rows="6" cols="40"></textarea></li>
							</div>
							<div>
							<div id="trip" style="display: none;">
							<li><label for="address" style="font-size: 18px;">出差地点：
							</label> <input id="address" type="text" name="address" placeholder="如：北京、上海、杭州"/></li>
							<li><label for="tripStartTime" style="font-size: 18px;">起始时间：
							</label><input id="tripStartTime" type="text" name="tripStartTime" placeholder="1990-1-1"/></li>
							<li><label for="tripEndTime" style="font-size: 18px;">结束时间：
							</label> <input id="tripEndTime" type="text" name="tripEndTime" placeholder="1990-1-1"/></li>
							<li><label for="tripReason" style="font-size: 18px;">出差事由：
							</label> <textarea id="tripReason" name="tripReason"
									placeholder="tripReason" rows="6" cols="40"></textarea></li>
							</div>
							<div id="others" style="display: none;">
							<li><label for="remark" style="font-size: 18px;">备注：
							</label>
							<textarea id="remark" name="remark" placeholder="remark" rows="6"
									cols="40"></textarea></li>
							<li><label for="file">添加附件:</label><input id="file" name="file" type="file" /></li>
							<li><label for="receive">审批人：</label> <select id="receive" name="receive"
								class="combobox">
									<option value="0">--请选择--</option>
									<c:forEach items="${dealPeoples }" var="dealPeople">
										<option value="${dealPeople.id }">${dealPeople.name }</option>
									</c:forEach>
							</select></li>
							</div>
							<li><button id="submit" class="submit" type="submit">提交</button>
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
	src="${pageContext.request.contextPath }/js/request/sendRequest.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/getMsg.js"></script>
</html>