$(function() {
	$('#requestType').change(function() {
		if ($('#requestType').val() == 0) {
			$('#leave').css("display", "none");
			$('#reimburse').css("display", "none");
			$('#trip').css("display", "none");
			$('#others').css("display", "none");
		}
		if ($('#requestType').val() == 1) {
			$('#leave').css("display", "block");
			$('#reimburse').css("display", "none");
			$('#trip').css("display", "none");
			$('#others').css("display", "block");
		}
		if ($('#requestType').val() == 2) {
			$('#leave').css("display", "none");
			$('#reimburse').css("display", "block");
			$('#trip').css("display", "none");
			$('#others').css("display", "block");
		}
		if ($('#requestType').val() == 3) {
			$('#leave').css("display", "none");
			$('#reimburse').css("display", "none");
			$('#trip').css("display", "block");
			$('#others').css("display", "block");
		}
	});
	$("#submit").click(function() {
		var reg = new RegExp("\n", "g");
		var type= $('#requestType').val();
		var receive = $("#receive").val();
		if(type == null || type.trim() == "" || type == 0) {
			alert("请选择审批类型");
			return false;
		}
		if(receive == null || receive.trim() == "" || receive == 0) {
			alert("请选择审批人!");
			return false;
		}
		var startTime = $("#startTime").val();
		var endTime = $("#endTime").val();
		var leaveReason = $("#leaveReason").val();
		if(type == 1) {
			if(startTime == null || startTime.trim() == "") {
				alert("起始日期不能为空!");
				return false;
			}
			if(endTime == null || endTime.trim() == "") {
				alert("结束日期不能为空!");
				return false;
			}
			if(leaveReason == null || leaveReason.trim() == "") {
				alert("请假事由不能为空!");
				return false;
			}
			var lr = $("#leaveReason").val().replace(reg,"<br/>");
			$("#leaveReason").val(lr);
		}
		if(type == 2) {
			var money = $("#money").val();
			var reimburseType = $("#reimburseType").val();
			var detail = $("#detail").val();
			if(money == null || money.trim() == "") {
				alert("报销金额不能为空!");
				return false;
			}
			if(reimburseType == null || reimburseType.trim() == "") {
				alert("报销类别不能为空!");
				return false;
			}
			if(detail == null || detail.trim() == "") {
				alert("费用明细不能为空!");
				return false;
			}
			var d = $("#detail").val().replace(reg,"<br/>");
			$("#detail").val(d);
		}
		if(type == 3) {
			var address = $("#address").val();
			var tripStartTime = $("#tripStartTime").val();
			var tripEndTime = $("#tripEndTime").val();
			var tripReason = $("#tripReason").val();
			if(address == null || address.trim() == "") {
				alert("出差地点不能为空!");
				return false;
			}
			if(tripStartTime == null || tripStartTime.trim() == "") {
				alert("起始时间不能为空!");
				return false;
			}
			if(tripEndTime == null || tripEndTime.trim() == "") {
				alert("结束时间不能为空!");
				return false;
			}
			if(tripReason == null || tripReason.trim() == "") {
				alert("出差事由不能为空!");
				return false;
			}
			var tr = $("#tripReason").val().replace(reg,"<br/>");
			$("#tripReason").val(tr);
		}
		var re = $("#remark").val().replace(reg,"<br/>");
		$("#remark").val(re);
	});
});

