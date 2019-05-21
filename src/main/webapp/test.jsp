<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>test</title>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>test</title>
</head>
<body>
	<!-- 获取当前坐标经纬度 -->
	<p id="demo">点击按钮获取您当前坐标（可能需要比较长的时间获取）：</p>
	<button onclick="getLocation()">点我</button>
	<script>
		var x = document.getElementById("demo");
		function getLocation() {
			if (navigator.geolocation) {
				navigator.geolocation.getCurrentPosition(showPosition);
			} else {
				x.innerHTML = "该浏览器不支持获取地理位置。";
			}
		}

		function showPosition(position) {
			x.innerHTML = "纬度: " + position.coords.latitude + "<br>经度: "
					+ position.coords.longitude;
		}
	</script>
<!-- 	<script type="text/javascript" src="http://api.map.baidu.com/api?v=1.3"></script>
	根据地址获取经纬度
	<div style="width: 730px; margin: auto;">
		要查询的地址：<input id="text_" type="text" value="杭州汇峰国际D幢413"
			style="margin-right: 100px;" /> 查询结果(经纬度)：<input id="result_"
			type="text" /> <input type="button" value="查询"
			onclick="searchByStationName();" />
		<div id="container"
			style="position: absolute; margin-top: 30px; width: 730px; height: 590px; top: 50; border: 1px solid gray; overflow: hidden;">
		</div>
	</div> -->
</body>
<!-- <script type="text/javascript">
	 var map = new BMap.Map("container");
	 /*map.centerAndZoom("宁波", 12);
	map.enableScrollWheelZoom(); //启用滚轮放大缩小，默认禁用
	map.enableContinuousZoom(); //启用地图惯性拖拽，默认禁用

	map.addControl(new BMap.NavigationControl()); //添加默认缩放平移控件
	map.addControl(new BMap.OverviewMapControl()); //添加默认缩略地图控件
	map.addControl(new BMap.OverviewMapControl({
		isOpen : true,
		anchor : BMAP_ANCHOR_BOTTOM_RIGHT
	})); //右下角，打开
	 */
	var localSearch = new BMap.LocalSearch(map);
	/* localSearch.enableAutoViewport(); //允许自动调节窗体大小 */
	document.getElementById("container").style.display="none";
	function searchByStationName() {
		map.clearOverlays();//清空原来的标注
		var keyword = document.getElementById("text_").value;
		localSearch.setSearchCompleteCallback(function(searchResult) {
			var poi = searchResult.getPoi(0);
			document.getElementById("result_").value = poi.point.lng + ","
					+ poi.point.lat;
			map.centerAndZoom(poi.point, 13);
			var marker = new BMap.Marker(new BMap.Point(poi.point.lng,
					poi.point.lat)); // 创建标注，为要查询的地方对应的经纬度
			map.addOverlay(marker);
			var content = document.getElementById("text_").value
					+ "<br/><br/>经度：" + poi.point.lng + "<br/>纬度："
					+ poi.point.lat;
			var infoWindow = new BMap.InfoWindow("<p style='font-size:14px;'>"
					+ content + "</p>");
			marker.addEventListener("click", function() {
				this.openInfoWindow(infoWindow);
			});
			// marker.setAnimation(BMAP_ANIMATION_BOUNCE); //跳动的动画
		});
		localSearch.search(keyword);
	}
</script> -->
</html>