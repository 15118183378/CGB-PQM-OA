<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<title></title>
<style type="text/css">
body {
	font: bold 12px Arial, Helvetica, sans-serif;
	margin: 0;
	padding: 0;
	min-width: 960px;
	color: #bbbbbb;
} 

a {
	text-decoration: none;
	color: #00c6ff;
}

h1 {
	font: 4em normal Arial, Helvetica, sans-serif;
	padding: 20px;
	margin: 0;
	text-align: center;
}

h1 small {
	font: 0.2em normal Arial, Helvetica, sans-serif;
	text-transform: uppercase;
	letter-spacing: 0.2em;
	line-height: 5em;
	display: block;
}

h2 {
	font-weight: 700;
	color: #bbb;
	font-size: 20px;
}

h2, p {
	margin-bottom: 10px;
}

@font-face {
	font-family: 'BebasNeueRegular';
	font-weight: normal;
	font-style: normal;
}

.container {
	width: 960px;
	margin: 0 auto;
	overflow: hidden;
}

.clock {
	width: 800px;
	margin: 0 auto;
	padding: 30px;
}

#Date {
	font-family: 'BebasNeueRegular', Arial, Helvetica, sans-serif;
	font-size: 36px;
	text-align: center;
	text-shadow: 0 0 5px #00c6ff;
}

ul {
	width: 800px;
	margin: 0 auto;
	padding: 0px;
	list-style: none;
	text-align: center;
}

ul li {
	display: inline;
	font-size: 10em;
	text-align: center;
	font-family: 'BebasNeueRegular', Arial, Helvetica, sans-serif;
	text-shadow: 0 0 5px #00c6ff;
}

#point {
	position: relative;
	-moz-animation: mymove 1s ease infinite;
	-webkit-animation: mymove 1s ease infinite;
	padding-left: 10px;
	padding-right: 10px;
}

@
-webkit-keyframes mymove { 0% {
	opacity: 1.0;
	text-shadow: 0 0 20px #00c6ff;
}

50%
{
opacity








:








0;
text-shadow








:none








;
}
100%
{
opacity








:








1
.0








;
text-shadow








:








0
0
20
px




 




#00c6ff








;
}
}
@
-moz-keyframes mymove { 0% {
	opacity: 1.0;
	text-shadow: 0 0 20px #00c6ff;
}
50%
{
opacity








:








0;
text-shadow








:none








;
}
100%
{
opacity








:








1
.0








;
text-shadow








:








0
0
20
px




 




#00c6ff








;
}
}
</style>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.6.4.min.js"></script>
<script type="text/javascript">
	$(document).ready(
			function() {
				// Create two variable with the names of the months and days in an array
				var monthNames = [ "January", "February", "March", "April",
						"May", "June", "July", "August", "September",
						"October", "November", "December" ];
				var dayNames = [ "Sunday", "Monday", "Tuesday", "Wednesday",
						"Thursday", "Friday", "Saturday" ]

				// Create a newDate() object
				var newDate = new Date();
				// Extract the current date from Date object
				newDate.setDate(newDate.getDate());
				// Output the day, date, month and year    
				$('#Date').html(
						dayNames[newDate.getDay()] + " " + newDate.getDate()
								+ ' ' + monthNames[newDate.getMonth()] + ' '
								+ newDate.getFullYear());

				setInterval(function() {
					// Create a newDate() object and extract the seconds of the current time on the visitor's
					var seconds = new Date().getSeconds();
					// Add a leading zero to seconds value
					$("#sec").html((seconds < 10 ? "0" : "") + seconds);
				}, 1000);

				setInterval(function() {
					// Create a newDate() object and extract the minutes of the current time on the visitor's
					var minutes = new Date().getMinutes();
					// Add a leading zero to the minutes value
					$("#min").html((minutes < 10 ? "0" : "") + minutes);
				}, 1000);

				setInterval(function() {
					// Create a newDate() object and extract the hours of the current time on the visitor's
					var hours = new Date().getHours();
					// Add a leading zero to the hours value
					$("#hours").html((hours < 10 ? "0" : "") + hours);
				}, 1000);

			});
</script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/jquery-3.1.1.min.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/index.css"
	type="text/css" />
<link href="${pageContext.request.contextPath }/css/styles.css"
	rel="stylesheet" type="text/css" />
</head>

<body>
	<div style="background-color: white;">
		<table style="width: 100%;">
			<tr>
				<td colspan="2"><span style="font-size: 20px;padding-left: 20px">当前位置>>我的考勤</span></td>
				<td rowspan="3"><div id="main" style="width: 360px; height: 180px;float: left;"></div></td>
			</tr>
			<tr>
				<td style="width: 10%; text-align: right;"><span
					style="font-size: 20px;">当前时间 :</span></td>
				<td style="width: 40%"><div class="container"
						style="width: 200px;float: left;">
						<div class="clock" style="width: 200px; background-color: white;">
							<div id="Date" style="font-size: 12px; color: black;"></div>
							<ul style="font-size: 2px; width: 200px; color: black;">
								<li id="hours"></li>
								<li id="point">:</li>
								<li id="min"></li>
								<li id="point">:</li>
								<li id="sec"></li>
							</ul>
						</div></td>
				<td></td>
			</tr>
			<tr>
				<td style="width: 20%; text-align: right;"><button type="button" class="submit"
						onclick="signIn()">上班打卡</button></td>
				<td style="width: 40%;padding-left: 60px;"><button type="button" class="submit"
						onclick="signOut()">下班打卡</button></td>
				<td></td>
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
			<span class="left c3">打卡情况</span> <a href="###"
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
<script type="text/javascript">
	function signIn() {
		if (navigator.geolocation) {
			navigator.geolocation.getCurrentPosition(showPosition);
		} else {
			alert("获取地理位置失败");
		}
	}
	function showPosition(position) {
		var params = {};
		params.latitude = position.coords.latitude;
		params.longitude = position.coords.longitude;
		$.ajax({
			url : "/CGB-PQM-OA/sign/signIn",
			method : "post",
			dataType : "json",
			data : params,
			success : function(data) {
				alert(data.msg);
				if(data.msg == "打卡成功") {
					window.location.href = "main.jsp";
				}
			}
		});
	}
	function showPosition2(position) {
		var params = {};
		params.latitude = position.coords.latitude;
		params.longitude = position.coords.longitude;
		$.ajax({
			url : "/CGB-PQM-OA/sign/signOut",
			method : "post",
			dataType : "json",
			data : params,
			success : function(data) {
				alert(data.msg);
				if(data.msg == "打卡成功") {
					window.location.href = "main.jsp";
				}
			}
		});
	}
	function signOut() {
		if (navigator.geolocation) {
			navigator.geolocation.getCurrentPosition(showPosition2);
		} else {
			alert("获取地理位置失败");
		}
	}
</script>
<script>
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
				$
						.ajax({
							url : "/CGB-PQM-OA/sign/getSignMsg",
							method : "post",
							dataType : "json",
							data : params,
							async : false,
							success : function(data) {
								if (data.sign != null) {
									if (data.sign.signOut != null
											&& data.sign.signOut != "") {
										mystr += "<div class='f-valid'></div>"
												+ "<div class='f-table-msg'><span>上班打卡时间:"
												+ data.sign.signIn
												+ "<br>下班打卡时间:"
												+ data.sign.signOut
												+ "</span></div>";
										normalday += 1;
									} else {
										mystr += "<div class='f-invalid'></div>"
												+ "<div class='f-table-msg'><span>上班打卡时间:"
												+ data.sign.signIn
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