<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/jsp/context/mytags.jsp"%>
<!-- BEGIN GLOBAL MANDATORY STYLES -->
<link
	href="${webRoot}/static/global/plugins/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css" />
<link
	href="${webRoot}/static/global/plugins/simple-line-icons/simple-line-icons.min.css"
	rel="stylesheet" type="text/css" />
<link
	href="${webRoot}/static/global/plugins/bootstrap/css/bootstrap.min.css"
	rel="stylesheet" type="text/css" />
<link
	href="${webRoot}/static/global/plugins/uniform/css/uniform.default.css"
	rel="stylesheet" type="text/css" />
<link
	href="${webRoot}/static/global/plugins/bootstrap-switch/css/bootstrap-switch.min.css"
	rel="stylesheet" type="text/css" />
<!-- END GLOBAL MANDATORY STYLES -->
<!-- BEGIN PAGE LEVEL PLUGIN STYLES -->
<link href="${webRoot}/static/global/plugins/select2/select2.css"
	rel="stylesheet" type="text/css" />
<link
	href="${webRoot}/static/global/plugins/bootstrap-datepicker/css/bootstrap-datepicker3.min.css"
	rel="stylesheet" type="text/css" />
<link
	href="${webRoot}/static/global/plugins/treetable/default/jquery.treeTable.css"
	rel="stylesheet" type="text/css" />
<link
	href="${webRoot}/static/global/plugins/treetable/vsStyle/jquery.treeTable.css"
	rel="stylesheet" type="text/css" />
<link
	href="${webRoot}/static/global/plugins/ztree/css/zTreeStyle/zTreeStyle.css"
	rel="stylesheet" type="text/css" />
<link
	href="${webRoot}/static/global/plugins/bootstrap-fileinput/bootstrap-fileinput.css"
	rel="stylesheet" type="text/css" />
<!-- END PAGE LEVEL PLUGIN STYLES -->
<!-- BEGIN THEME STYLES -->
<link href="${webRoot}/static/global/css/components.css"
	id="style_components" rel="stylesheet" type="text/css" />
<link href="${webRoot}/static/global/css/plugins.css" rel="stylesheet"
	type="text/css" />
<link href="${webRoot}/static/admin/layout/css/layout.css"
	rel="stylesheet" type="text/css" />
<link href="${webRoot}/static/admin/layout/css/themes/darkblue.css"
	rel="stylesheet" type="text/css" id="style_color" />
<link href="${webRoot}/static/admin/layout/css/custom.css"
	rel="stylesheet" type="text/css" />
<link href="${webRoot}/static/custom/common.css" rel="stylesheet"
	type="text/css" />
<link href="${pageContext.request.contextPath }/css/styles.css"
	rel="stylesheet" type="text/css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/BoMa_table_css.css"
	type="text/css" media="screen" />
<!-- END THEME STYLES -->
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/getMsg.js"></script>
<body style="background-color: #f0f8ff">
	<div>
		<input type="hidden" id="msg" value="${msg }" />
	</div>
	<div class="col-md-12">
		<div class="row">
			<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
				<div class="dashboard-stat blue-madison">
					<div class="visual">
						<i class="fa fa-comments"></i>
					</div>
					<div class="details">
						<div class="number">姓名</div>
						<div class="desc">${user.name }</div>
					</div>
					<a class="more" href="javascript:;"> change <i
						class="m-icon-swapright m-icon-white"></i>
					</a>
				</div>
			</div>
			<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
				<div class="dashboard-stat red-intense">
					<div class="visual">
						<i class="fa fa-bar-chart-o"></i>
					</div>
					<div class="details">
						<div class="number">性别</div>
						<div class="desc">${user.gender }</div>
					</div>
					<a class="more" href="javascript:;"> change <i
						class="m-icon-swapright m-icon-white"></i>
					</a>
				</div>
			</div>
			<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
				<div class="dashboard-stat green-haze">
					<div class="visual">
						<i class="fa fa-shopping-cart"></i>
					</div>
					<div class="details">
						<div class="number">手机号</div>
						<div class="desc">${user.tel }</div>
					</div>
					<a class="more" href="javascript:;"> change <i
						class="m-icon-swapright m-icon-white"></i>
					</a>
				</div>
			</div>
			<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
				<div class="dashboard-stat purple-plum">
					<div class="visual">
						<i class="fa fa-globe"></i>
					</div>
					<div class="details">
						<div class="number">密码</div>
						<div class="desc">****</div>
					</div>
					<a class="more" href="javascript:;"> change <i
						class="m-icon-swapright m-icon-white"></i>
					</a>
				</div>
			</div>
		</div>
		<c:if test="${not empty user.organize.id }">
			<div class="col-md-6 col-sm-6">
				<div class="portlet light bordered">
					<div class="portlet-title">
						<div class="caption">
							<i class="icon-share font-blue-steel"></i> <span
								class="caption-subject font-blue-steel ">公告</span>
						</div>
						<!-- <div class="actions">
							<div class="btn-group">
								<a class="btn btn-sm btn-default btn-circle" href="javascript:;"
									data-toggle="dropdown" data-hover="dropdown"
									data-close-others="true"> 筛选 <i class="fa fa-angle-down"></i>
								</a>
								<div
									class="dropdown-menu hold-on-click dropdown-checkboxes pull-right">
									<label><input type="checkbox" /> Finance</label> <label><input
										type="checkbox" /> Membership</label> <label><input
										type="checkbox" /> Customer Support</label> <label><input
										type="checkbox" /> HR</label> <label><input type="checkbox" />
										System</label>
								</div>
							</div>
						</div> -->
					</div>
					<div class="portlet-body">
						<div class="scroller" style="height: 300px;"
							data-always-visible="1" data-rail-visible="0">
							<ul class="feeds">
								<c:forEach items="${announcements }" var="announcement">
									<li><a href="javascript:;">
											<div style="width: 100%">
												<div class="col1" style="width: 50%">
													<div class="cont">
														<div class="cont-col1">
															<div class="label label-sm label-success">
																<i class="fa fa-bar-chart-o"></i>
															</div>
															<div class="desc"
																style="float: right; font-size: 15px; padding-left: 15px;">
																<a
																	href="${pageContext.request.contextPath }/announcement/lookAnnouncement/${announcement.id}">${announcement.title }</a>
															</div>
														</div>
													</div>
												</div>
												<div class="col2" style="width: 50%">
													<div class="date" style="float: right;">发布人：${announcement.issuer }
														&nbsp; ${fn:substring(announcement.createTime,0,19) }</div>
												</div>
											</div></li>
									</a>
								</c:forEach>
							</ul>
						</div>
						<div class="scroller-footer">
							<div class="btn-arrow-link pull-right">
								<a href="javascript:;">See All Records</a> <i
									class="icon-arrow-right"></i>
							</div>
						</div>
					</div>
				</div>
			</div>
		</c:if>
		<c:if test="${empty user.organize.id }">
			<c:if test="${empty invites }">
				<div class="col-md-6 col-sm-6">
					<div>
						<h2>邀请信息</h2>
						<div style="text-align: center;">
							<img src="${pageContext.request.contextPath }/images/compute.png"
								alt="没有邀请信息">
							<p>抱歉，还没有收到企业邀请，您可以立即创建企业，邀请同事一起工作</p>
						</div>
					</div>
				</div>
			</c:if>
			<c:if test="${not empty invites }">
				<div class="col-md-6 col-sm-6">
					<div>
						<h2>邀请信息</h2>
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
												<th width="20%">公司名称</th>
												<th width="40%">公司描述</th>
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
											<c:forEach items="${invites }" var="invite">
												<tr class="invite${invite.id }">
													<td><%=num%></td>
													<td>${invite.organize.name }</td>
													<td>${invite.organize.description }</td>
													<td><button type="button" class="submit"
															onclick="accept(${invite.organize.id})">接受</button></td>
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
					</div>
				</div>
			</c:if>
			<li style="text-align: center; width: 100%;list-style: none "><button class="btn btn-primary" onclick="createOrg()">创建企业</button></li>
		</c:if>
	</div>
</body>
<script src="${webRoot}/js/main/createOrganize.js"
	type="text/javascript"></script>
<script src="${webRoot}/static/global/plugins/jquery.min.js"
	type="text/javascript"></script>
<script src="${webRoot}/static/global/plugins/jquery-migrate.min.js"
	type="text/javascript"></script>
<!-- IMPORTANT! Load jquery-ui.min.js before bootstrap.min.js to fix bootstrap tooltip conflict with jquery ui tooltip -->
<script
	src="${webRoot}/static/global/plugins/jquery-ui/jquery-ui.min.js"
	type="text/javascript"></script>
<script
	src="${webRoot}/static/global/plugins/bootstrap/js/bootstrap.min.js"
	type="text/javascript"></script>
<script
	src="${webRoot}/static/global/plugins/bootstrap-hover-dropdown/bootstrap-hover-dropdown.min.js"
	type="text/javascript"></script>
<script
	src="${webRoot}/static/global/plugins/jquery-slimscroll/jquery.slimscroll.min.js"
	type="text/javascript"></script>
<script src="${webRoot}/static/global/plugins/jquery.blockui.min.js"
	type="text/javascript"></script>
<script src="${webRoot}/static/global/plugins/jquery.cokie.min.js"
	type="text/javascript"></script>
<script
	src="${webRoot}/static/global/plugins/uniform/jquery.uniform.min.js"
	type="text/javascript"></script>
<script
	src="${webRoot}/static/global/plugins/bootstrap-switch/js/bootstrap-switch.min.js"
	type="text/javascript"></script>
<!-- END CORE PLUGINS -->
<!-- BEGIN PAGE LEVEL PLUGINS -->
<script
	src="${webRoot}/static/global/plugins/jquery-validation/js/jquery.validate.min.js"
	type="text/javascript"></script>
<script
	src="${webRoot}/static/global/plugins/jquery-validation/js/additional-methods.min.js"
	type="text/javascript"></script>
<script
	src="${webRoot}/static/global/plugins/jquery-validation/js/localization/messages_zh.js"
	type="text/javascript"></script>
<script src="${webRoot}/static/custom/validate-override.js"
	type="text/javascript"></script>
<script src="${webRoot}/static/custom/validate-custom.js"
	type="text/javascript"></script>
<script src="${webRoot}/static/global/plugins/select2/select2.min.js"
	type="text/javascript"></script>
<script src="${webRoot}/static/global/plugins/jquery.pulsate.min.js"
	type="text/javascript"></script>
<script
	src="${webRoot}/static/global/plugins/bootstrap-datepicker/js/bootstrap-datepicker.min.js"
	type="text/javascript"></script>
<script
	src="${webRoot}/static/global/plugins/bootstrap-datepicker/locales/bootstrap-datepicker.zh-CN.min.js"
	type="text/javascript"></script>
<script
	src="${webRoot}/static/global/plugins/treetable/jquery.treeTable.js"
	type="text/javascript"></script>
<script
	src="${webRoot}/static/global/plugins/ztree/js/jquery.ztree.core.js"
	type="text/javascript"></script>
<script
	src="${webRoot}/static/global/plugins/ztree/js/jquery.ztree.excheck.js"
	type="text/javascript"></script>
<script
	src="${webRoot}/static/global/plugins/bootstrap-fileinput/bootstrap-fileinput.js"
	type="text/javascript"></script>
<script src="${webRoot}/static/global/plugins/echarts.common.min.js"
	type="text/javascript"></script>
<!-- END PAGE LEVEL PLUGINS -->
<script type="text/javascript">
	// 项目访问根目录
	var webRoot = '${webRoot}';
	$(function() {
		$('.more')
				.click(
						function() {
							window.location.href = "${pageContext.request.contextPath }/user/toUpdate";
						});
		if ($('#msg').val() != null && $('#msg').val().trim() != "") {
			parent.location.reload();
		}
	});
	function accept(organizeId) {
		if (!confirm('确认接受该公司的邀请么？')) {
			return;
		}
		window.location.href = "/CGB-PQM-OA/user/acceptOrg/"
				+ organizeId;
	}
</script>
<!-- BEGIN PAGE LEVEL SCRIPTS -->
<script src="${webRoot}/static/global/scripts/metronic.js"
	type="text/javascript"></script>
<script src="${webRoot}/static/admin/layout/scripts/layout.js"
	type="text/javascript"></script>
<script src="${webRoot}/static/admin/layout/scripts/quick-sidebar.js"
	type="text/javascript"></script>
<!-- END PAGE LEVEL SCRIPTS -->