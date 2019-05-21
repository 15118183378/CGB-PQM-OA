<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="com.dy.oa.pojo.Staff"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<title></title>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/jquery-3.1.1.min.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/index.css"
	type="text/css" />
<link href="${pageContext.request.contextPath }/css/styles.css"
	rel="stylesheet" type="text/css" />
<style type="text/css">
body {
	font: bold 12px Arial, Helvetica, sans-serif;
	margin: 0;
	padding: 0;
	min-width: 960px;
	color: #bbbbbb;
} 
</style>
</head>

<body>
	<input id="staffId" type="hidden" name="staffId" value="${staff.id }" />
	<div style="background-color: white;">
		<table style="width: 100%;">
			<tr>
				<td><span style="font-size: 20px;padding-left: 20px;">当前位置>><%= ((Staff)request.getAttribute("staff")).getUser().getName()%>的考勤统计</span></td>
				<td><div id="main" style="width: 360px; height: 180px;float: left;"></div></td>
			</tr>
		</table>
		<script src="${pageContext.request.contextPath }/js/echarts.js"></script>
		<!-- 为ECharts准备一个具备大小（宽高）的Dom -->
		<script type="text/javascript">
		var myChart = echarts.init(document.getElementById('main'));
		var option = {
			    title : {
			        text: '本月打卡统计',
			        x:'center'
			    },
			    tooltip : {
			        trigger: 'item',
			        formatter: "{a} <br/>{b} : {c} ({d}%)"
			    },
			    legend: {
			        orient: 'vertical',
			        left: 'left',
			        data: ['正常打卡','打卡异常','未打卡']
			    },
			    series : [
			        {
			            name: '访问来源',
			            type: 'pie',
			            radius : '55%',
			            center: ['50%', '60%'],
			            data:[
			                {value:11, name:'正常打卡'},
			                {value:12, name:'打卡异常'},
			                {value:8, name:'未打卡'},
			            ],
			            itemStyle: {
			                emphasis: {
			                    shadowBlur: 10,
			                    shadowOffsetX: 0,
			                    shadowColor: 'rgba(0, 0, 0, 0.5)'
			                }
			            }
			        }
			    ]
			};
		myChart.setOption(option);
		</script>
	</div>
	<!-- 账户主要表格 -->
	<div class="account-box">
		<h2 class="account-title">
			<span class="left c3">打卡情况<a href="#" class="f-btn-fhby right" onclick="returnSignList()">返回</a></span> <a href="###"
				class="f-btn-fhby right">返回本月</a>
			<div class="clearfix right">
				<div class="f-btn-jian left">&lt;</div>
				<div class="left f-riqi">
					<span class="f-year">2017</span>年<span class="f-month">1</span>月
				</div>
				<div class="f-btn-jia left">&gt;</div>
				<!-- 一定不能换行-->
			</div>
		</h2>
		<div class="f-rili-table">
			<div class="f-rili-head celarfix">
				<div class="f-rili-th">周日</div>
				<div class="f-rili-th">周一</div>
				<div class="f-rili-th">周二</div>
				<div class="f-rili-th">周三</div>
				<div class="f-rili-th">周四</div>
				<div class="f-rili-th">周五</div>
				<div class="f-rili-th">周六</div>
				<div class="clear"></div>
			</div>
			<div class="f-tbody clearfix"></div>
		</div>
	</div>
</body>
<script>
	
	function returnSignList() {
		window.location.href = "/CGB-PQM-OA/sign/toSignList";
	}
	
	$(function() {
		var normalday = 0;
		var exceptionday = 0;
		var notday = 0;
		//页面加载初始化年月
		var mydate = new Date();
		$(".f-year").html(mydate.getFullYear());
		$(".f-month").html(mydate.getMonth() + 1);
		showDate(mydate.getFullYear(), mydate.getMonth() + 1);
		//日历上一月
		$(".f-btn-jian ").click(function() {
			normalday = 0;
			exceptionday = 0;
			notday = 0;
			var mm = parseInt($(".f-month").html());
			var yy = parseInt($(".f-year").html());
			if (mm == 1) {//返回12月
				$(".f-year").html(yy - 1);
				$(".f-month").html(12);
				showDate(yy - 1, 12);
			} else {//上一月
				$(".f-month").html(mm - 1);
				showDate(yy, mm - 1);
			}
		})
		//日历下一月
		$(".f-btn-jia").click(function() {
			normalday = 0;
			exceptionday = 0;
			notday = 0;
			var mm = parseInt($(".f-month").html());
			var yy = parseInt($(".f-year").html());
			if (mm == 12) {//返回12月
				$(".f-year").html(yy + 1);
				$(".f-month").html(1);
				showDate(yy + 1, 1);
			} else {//上一月
				$(".f-month").html(mm + 1);
				showDate(yy, mm + 1);
			}
		})
		//返回本月
		$(".f-btn-fhby").click(function() {
			normalday = 0;
			exceptionday = 0;
			notday = 0;
			$(".f-year").html(mydate.getFullYear());
			$(".f-month").html(mydate.getMonth() + 1);
			showDate(mydate.getFullYear(), mydate.getMonth() + 1);
		})

		//读取年月写入日历  重点算法!!!!!!!!!!!
		function showDate(yyyy, mm) {
			var dd = new Date(parseInt(yyyy), parseInt(mm), 0); //Wed Mar 31 00:00:00 UTC+0800 2010  
			var daysCount = dd.getDate(); //本月天数  
			var mystr = "";//写入代码
			var icon = "";//图标代码
			var today = new Date().getDate(); //今天几号  21
			var monthstart = new Date(parseInt(yyyy) + "/" + parseInt(mm)
					+ "/1").getDay()//本月1日周几  
			var lastMonth; //上一月天数
			var nextMounth//下一月天数
			if (parseInt(mm) == 1) {
				lastMonth = new Date(parseInt(yyyy) - 1, parseInt(12), 0)
						.getDate();
			} else {
				lastMonth = new Date(parseInt(yyyy), parseInt(mm) - 1, 0)
						.getDate();
			}
			if (parseInt(mm) == 12) {
				nextMounth = new Date(parseInt(yyyy) + 1, parseInt(1), 0)
						.getDate();
			} else {
				nextMounth = new Date(parseInt(yyyy), parseInt(mm) + 1, 0)
						.getDate();
			}
			//计算上月空格数
			for (j = monthstart; j > 0; j--) {
				mystr += "<div class='f-td f-null f-lastMonth' style='color:#ccc;'>"
						+ (lastMonth - j + 1) + "</div>";
			}

			//本月单元格
			for (i = 0; i < daysCount; i++) {
				//这里为一个单元格，添加内容在此
				mystr += "<div class='f-td f-number'><span class='f-day'>"
						+ (i + 1) + "</span>";
				var year = mydate.getFullYear();
				var month = mydate.getMonth() + 1;
				var params = {};
				params.year = $(".f-year").html();
				params.month = $(".f-month").html();
				params.day = i + 1;
				params.staffId = $('#staffId').val();
				$.ajax({
					url : "/CGB-PQM-OA/sign/getStaffSignMsg",
					method : "post",
					dataType : "json",
					data : params,
					async : false,
					success : function(data) {
						if (data.sign != null) {
							if(data.sign.signOut != null && data.sign.signOut != "") {
								mystr += "<div class='f-valid'></div>"
								 + "<div class='f-table-msg'><span>上班打卡时间:" + data.sign.signIn
								 + "<br>下班打卡时间:" + data.sign.signOut + "</span></div>";
								normalday += 1;
							} else {
								mystr += "<div class='f-invalid'></div>"
								 + "<div class='f-table-msg'><span>上班打卡时间:" + data.sign.signIn
								 + "</span></div>";
								exceptionday += 1;
							}
						} else {
							notday += 1;
						}
						mystr += "</div>";
					}
				});
			}
			option.series[0].data[0] = {name:'正常打卡',value:normalday};
			option.series[0].data[1] = {name:'打卡异常',value:exceptionday};
			option.series[0].data[2] = {name:'未打卡',value:notday};
			myChart.setOption(option);
			//计算下月空格数
			for (k = 0; k < 42 - (daysCount + monthstart); k++) {//表格保持等高6行42个单元格
				mystr += "<div class='f-td f-null f-nextMounth' style='color:#ccc;'>"
						+ (k + 1) + "</div>";
			}

			//写入日历
			$(".f-rili-table .f-tbody").html(mystr);
			//给今日加class
			if (mydate.getFullYear() == yyyy) {
				if ((mydate.getMonth() + 1) == mm) {
					var today = mydate.getDate();
					var lastNum = $(".f-lastMonth").length;
					$(".f-rili-table .f-td").eq(today + lastNum - 1).addClass(
							"f-today");
				}
			}
			//绑定选择方法
			$(".f-rili-table .f-number").off("click");
			$(".f-rili-table .f-number").on("click", function() {
				$(".f-rili-table .f-number").removeClass("f-on");
				$(this).addClass("f-on");
			});

			//绑定查看方法
			$(".f-valid").off("mouseover");
			$(".f-valid").on("mouseover", function() {
				$(this).parent().find(".f-table-msg").show();
			});
			$(".f-table-msg").off("mouseover");
			$(".f-table-msg").on("mouseover", function() {
				$(this).show();
			});
			$(".f-valid").off("mouseleave");
			$(".f-valid").on("mouseleave", function() {
				$(this).parent().find(".f-table-msg").hide();
			});
			$(".f-invalid").off("mouseover");
			$(".f-invalid").on("mouseover", function() {
				$(this).parent().find(".f-table-msg").show();
			});
			$(".f-invalid").off("mouseleave");
			$(".f-invalid").on("mouseleave", function() {
				$(this).parent().find(".f-table-msg").hide();
			});
			$(".f-table-msg").off("mouseleave");
			$(".f-table-msg").on("mouseleave", function() {
				$(this).hide();
			});
		}

	})
</script>
</html>