<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="${pageContext.request.contextPath }/css/styles.css"
	rel="stylesheet" type="text/css" />
<title>发日志</title>
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
					<form id="createOrg" class="contact_form" action="${pageContext.request.contextPath }/log/sendLog" method="post"
						name="contact_form" enctype="multipart/form-data">
						<ul>
							<li><h2>发日志</h2><span></span></li>
							<li><label for="logType">日志类型：</label> <select id="logType"
								name="logType" class="combobox">
									<option value="0">--请选择--</option>
									<option value="1">日报</option>
									<option value="2">周报</option>
									<option value="3">月报</option>
							</select></li>
							<div id="todayLog" style="display: none;">
							<li><label for="todayWork" style="font-size: 18px;">今日完成工作：
							</label> <textarea id="todayWork" name="todayWork"
									placeholder="todayWork" rows="6" cols="40"></textarea></li>
							<li><label for="todaySummary" style="font-size: 18px;">今日工作总结：
							</label> <textarea id="todaySummary" name="todaySummary"
									placeholder="todaySummary" rows="6" cols="40"></textarea></li>
							<li><label for="tomorrowWork" style="font-size: 18px;">明日工作计划：
							</label> <textarea id="tomorrowWork" name="tomorrowWork"
									placeholder="tomorrowWork" rows="6" cols="40"></textarea></li>
							</div>
							<div id="weekLog" style="display: none;">
							<li><label for="thisWeekWork" style="font-size: 18px;">本周完成工作：
							</label> <textarea id="thisWeekWork" name="thisWeekWork"
									placeholder="thisWeekWork" rows="6" cols="40"></textarea></li>
							<li><label for="thisWeekSummary" style="font-size: 18px;">本周工作总结：
							</label> <textarea id="thisWeekSummary" name="thisWeekSummary"
									placeholder="thisWeekSummary" rows="6" cols="40"></textarea></li>
							<li><label for="nextWeekWork" style="font-size: 18px;">下周工作计划：
							</label> <textarea id="nextWeekWork" name="nextWeekWork"
									placeholder="nextWeekWork" rows="6" cols="40"></textarea></li>
							</div>
							<div>
							<div id="monthLog" style="display: none;">
							<li><label for="thisMonthWork" style="font-size: 18px;">本月完成工作：
							</label> <textarea id="thisMonthWork" name="thisMonthWork"
									placeholder="thisMonthWork" rows="6" cols="40"></textarea></li>
							<li><label for="thisMonthSummary" style="font-size: 18px;">本月工作总结：
							</label> <textarea id="thisMonthSummary" name="thisMonthSummary"
									placeholder="thisMonthSummary" rows="6" cols="40"></textarea></li>
							<li><label for="nextMonthWork" style="font-size: 18px;">下月工作计划：
							</label> <textarea id="nextMonthWork" name="nextMonthWork"
									placeholder="nextMonthWork" rows="6" cols="40"></textarea></li>
							</div>
							<div id="others" style="display: none;">
							<li><label for="require" style="font-size: 18px;">需协调与帮助：
							</label> <textarea id="require" name="require" placeholder="require"
									rows="6" cols="40"></textarea></li>
							<li><label for="remark" style="font-size: 18px;">备注：
							</label>
							<textarea id="remark" name="remark" placeholder="remark" rows="6"
									cols="40"></textarea></li>
							<!-- <li><label for="file">添加附件:</label> <input type="file"
								name="file" id="file"/></li> -->
							<li><label for="file">添加附件:</label><input id="file" name="file" type="file" /></li>
							<li><label for="receive">发给谁：</label> <select id="receive" name="receive"
								class="combobox">
									<option value="0">--请选择--</option>
									<c:forEach items="${targets }" var="target">
										<option value="${target.id }">${target.name }</option>
									</c:forEach>
							</select></li>
							</div>
							<li><button id="submit" class="submit" type="submit">确认</button>
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
	src="${pageContext.request.contextPath }/js/log/sendLog.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/getMsg.js"></script>
</html>