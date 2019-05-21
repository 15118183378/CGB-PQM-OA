var navs = [ {
	"title" : "我的办公",
	"icon" : "fa-cubes",
	"spread" : true,
	"children" : [ {
		"title" : "我的考勤",
		"icon" : "&#xe641;",
		"href" : "jsp/work/main.jsp"
	}, {
		"title" : "通讯录",
		"icon" : "&#xe63c;",
		"href" : "/CGB-PQM-OA/user/getTel"
	}, ]
}, {
	"title" : "日志管理",
	"icon" : "&#xe609",
	"spread" : false,
	"children" : [ {
		"title" : "发日志",
		"icon" : "fa-table",
		"href" : "/CGB-PQM-OA/log/toSendLog"
	}, {
		"title" : "我发出的",
		"icon" : "fa-navicon",
		"href" : "/CGB-PQM-OA/log/toMyLog"
	}, {
		"title" : "我收到的",
		"icon" : "&#xe62a;",
		"href" : "/CGB-PQM-OA/log/receiveLog"
	} ]
}, {
	"title" : "组织管理",
	"icon" : "fa-cogs",
	"spread" : false,
	"children" : [ {
		"title" : "邀请成员",
		"icon" : "&#xe62a;",
		"href" : "/CGB-PQM-OA/staff/toInviteMember"
	}, {
		"title" : "权限管理",
		"icon" : "&#xe628;",
		"href" : "/CGB-PQM-OA/power/powerManager"
	}, {
		"title" : "发送公告",
		"icon" : "&#xe628;",
		"href" : "/CGB-PQM-OA/announcement/toAddAnnouncement"
	}, {
		"title" : "考勤统计",
		"icon" : "&#xe628;",
		"href" : "/CGB-PQM-OA/sign/toSignList"
	} ]
}, {
	"title" : "审批管理",
	"icon" : "&#x1002;",
	"spread" : false,
	"children" : [ {
		"title" : "发起审批",
		"icon" : "fa-check-square-o",
		"href" : "/CGB-PQM-OA/request/toSendRequest"
	}, {
		"title" : "待我审批的",
		"icon" : "fa-check-square-o",
		"href" : "/CGB-PQM-OA/request/waitRequest"
	}, {
		"title" : "我已审批的",
		"icon" : "fa-check-square-o",
		"href" : "/CGB-PQM-OA/request/dealedRequest"
	}, {
		"title" : "我发起的",
		"icon" : "fa-check-square-o",
		"href" : "/CGB-PQM-OA/request/toMyRequest"
	} ]
}, {
	"title" : "人际交流",
	"icon" : "&#xe63c;",
	"spread" : false,
	"children" : [ {
		"title" : "聊天室",
		"icon" : "fa-qq",
		"href" : "/CGB-PQM-OA/organize/toOrganizeChat"
	}, {
		"title" : "QQ",
		"icon" : "fa-qq",
		"href" : "http://www.qq.com/"
	}, {
		"title" : "Fly社区",
		"icon" : "&#xe609;",
		"href" : "http://fly.layui.com/"
	}, {
		"title" : "新浪微博",
		"icon" : "fa-weibo",
		"href" : "http://weibo.com/"
	} ]
} ];
