function createOrg() {
	window.location.href = "http://localhost:8080/CGB-PQM-OA/organize/toCreateOrganize";
}
function createIndex() {
	window.location.href = "http://localhost:8080/CGB-PQM-OA/user/loginSuccess";
}

function check() {
	var map = new BMap.Map("container");
	var localSearch = new BMap.LocalSearch(map);
	document.getElementById("container").style.display = "none";
	map.clearOverlays();// 清空原来的标注
	var province = document.getElementById("province").value;
	var city = document.getElementById("city").value;
	var area = document.getElementById("area").value;
	var position = document.getElementById("position").value;
	var keyword = province + city + area + position;
	localSearch.setSearchCompleteCallback(function(searchResult) {
		var poi = searchResult.getPoi(0);
		if(poi=="" || poi==null) {
			alert("请输入正确的地址");
		} else {
			document.getElementById("longitude").value = poi.point.lng;
			document.getElementById("latitude").value =  poi.point.lat;
			document.getElementById("createOrg").submit();
		}
	});
	localSearch.search(keyword);
}