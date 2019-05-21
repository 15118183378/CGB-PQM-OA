$(function() {
	$("#submit").click(function() {
		var reg = new RegExp("\n", "g");
		var title = $('#title').val();
		var announcementType = $("#announcementType").val();
		var content = $("#content").val();
		if (title == null || title.trim() == "") {
			alert("请输入公告标题");
			return false;
		}
		if (announcementType == null || announcementType.trim() == "") {
			alert("请输入公告类别");
			return false;
		}
		if (content == null || content.trim() == "") {
			alert("请输入公告内容");
			return false;
		}
		var con = $("#content").val().replace(reg, "<br/>");
		$("#content").val(con);
	});
});