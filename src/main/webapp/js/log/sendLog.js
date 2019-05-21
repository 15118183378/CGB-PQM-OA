$(function() {
	$('#logType').change(function() {
		if ($('#logType').val() == 0) {
			$('#todayLog').css("display", "none");
			$('#weekLog').css("display", "none");
			$('#monthLog').css("display", "none");
			$('#others').css("display", "none");
		}
		if ($('#logType').val() == 1) {
			$('#todayLog').css("display", "block");
			$('#weekLog').css("display", "none");
			$('#monthLog').css("display", "none");
			$('#others').css("display", "block");
		}
		if ($('#logType').val() == 2) {
			$('#todayLog').css("display", "none");
			$('#weekLog').css("display", "block");
			$('#monthLog').css("display", "none");
			$('#others').css("display", "block");
		}
		if ($('#logType').val() == 3) {
			$('#todayLog').css("display", "none");
			$('#weekLog').css("display", "none");
			$('#monthLog').css("display", "block");
			$('#others').css("display", "block");
		}
	});
	$("#submit").click(function() {
		var reg = new RegExp("\n", "g");
		var type= $('#logType').val();
		var receive = $("#receive").val();
		if(type == null || type.trim() == "" || type == 0) {
			alert("请选择日志类型");
			return false;
		}
		if(receive == null || receive.trim() == "" || receive == 0) {
			alert("请选择发给谁!");
			return false;
		}
		var todayWork = $("#todayWork").val();
		var todaySummary = $("#todaySummary").val();
		var tomorrowWork = $("#tomorrowWork").val();
		if(type == 1) {
			if(todayWork == null || todayWork.trim() == "") {
				alert("今日完成工作不能为空!");
				return false;
			}
			if(todaySummary == null || todaySummary.trim() == "") {
				alert("今日工作总结不能为空!");
				return false;
			}
			if(tomorrowWork == null || tomorrowWork.trim() == "") {
				alert("明日工作计划不能为空!");
				return false;
			}
			var tw = $("#todayWork").val().replace(reg,"<br/>");
			$("#todayWork").val(tw);
			var ts = $("#todaySummary").val().replace(reg,"<br/>");
			$("#todaySummary").val(ts);
			var trw = $("#tomorrowWork").val().replace(reg,"<br/>");
			$("#tomorrowWork").val(trw);
		}
		if(type == 2) {
			var thisWeekWork = $("#thisWeekWork").val();
			var thisWeekSummary = $("#thisWeekSummary").val();
			var nextWeekWork = $("#nextWeekWork").val();
			if(thisWeekWork == null || thisWeekWork.trim() == "") {
				alert("本周完成工作不能为空!");
				return false;
			}
			if(thisWeekSummary == null || thisWeekSummary.trim() == "") {
				alert("本周工作总结不能为空!");
				return false;
			}
			if(nextWeekWork == null || nextWeekWork.trim() == "") {
				alert("下周工作计划不能为空!");
				return false;
			}
			var tww = $("#thisWeekWork").val().replace(reg,"<br/>");
			$("#thisWeekWork").val(tww);
			var tws = $("#thisWeekSummary").val().replace(reg,"<br/>");
			$("#thisWeekSummary").val(tws);
			var nww = $("#nextWeekWork").val().replace(reg,"<br/>");
			$("#nextWeekWork").val(nww);
		} 
		if(type == 3) {
			var thisMonthWork = $("#thisMonthWork").val();
			var thisMonthSummary = $("#thisMonthSummary").val();
			var nextMonthWork = $("#nextMonthWork").val();
			if(thisMonthWork == null || thisMonthWork.trim() == "") {
				alert("本月完成工作不能为空!");
				return false;
			}
			if(thisMonthSummary == null || thisMonthSummary.trim() == "") {
				alert("本月工作总结不能为空!");
				return false;
			}
			if(nextMonthWork == null || nextMonthWork.trim() == "") {
				alert("下月工作计划不能为空!");
				return false;
			}
			var tmw = $("#thisMonthWork").val().replace(reg,"<br/>");
			$("#thisMonthWork").val(tmw);
			var tms = $("#thisMonthSummary").val().replace(reg,"<br/>");
			$("#thisMonthSummary").val(tms);
			var nmw = $("#nextMonthWork").val().replace(reg,"<br/>");
			$("#nextMonthWork").val(nmw);
		} 
		var r = $("#require").val().replace(reg,"<br/>");
		$("#require").val(r);
		var re = $("#remark").val().replace(reg,"<br/>");
		$("#remark").val(re);
	});
});


		
		
		
		