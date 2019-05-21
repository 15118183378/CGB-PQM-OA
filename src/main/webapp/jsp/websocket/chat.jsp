<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html style="height: 100%;">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<head>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>办公聊天室</title>
<head>
<style type="text/css">
input#chat {
	width: 410px;
}

#console-container {
	width: 400px;
}

#console {
	border: 1px solid #CCCCCC;
	border-right-color: #999999;
	border-bottom-color: #999999;
	height: 320px;
	overflow-y: scroll;
	padding: 5px;
	width: 100%;
}

#console p {
	padding: 0;
	margin: 0;
}
p {
	font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
	font-size: 14px;
	color: #999999;
	line-height: 25px;
	letter-spacing: 1px;
}
</style>
<link href="${pageContext.request.contextPath }/css/styles.css"
	rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/css/chat.css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/jquery-3.1.1.min.js"></script>
<script type="application/javascript">
        "use strict";  
        var Chat = {};  
        Chat.socket = null;  
        Chat.connect = (function(host) {  
            if ('WebSocket' in window) {  
                Chat.socket = new WebSocket(host);  
            } else if ('MozWebSocket' in window) {  
                Chat.socket = new MozWebSocket(host);  
            } else {  
                Console.log('Error: WebSocket is not supported by this browser.');  
                return;  
            }  
  
            Chat.socket.onopen = function () {  
            	Console.log("------------------以上内容为历史记录------------------");
            	Console.log('欢迎进入办公聊天室!'); 
                $('#sendMsg').click(function() {
                	Chat.sendMessage();
                });
            };  
  
            Chat.socket.onclose = function () {  
                $('#sendMsg') = null;
                Console.log('Info: WebSocket closed.');  
            };  
  
            Chat.socket.onmessage = function (message) {  
                Console.log(message.data);  
            };  
        });  
  
        Chat.initialize = function() {  
            if (window.location.protocol == 'http:') {  
                Chat.connect('ws://' + window.location.host + '/CGB-PQM-OA/chat');  
            } else {  
                Chat.connect('wss://' + window.location.host + '/CGB-PQM-OA/chat');  
            }  
        };  
  
        Chat.sendMessage = (function() {  
            var message = $("#textarea").val();
            if (message != '') {
            	$.ajax({
            		url : "/CGB-PQM-OA/chat/sendMessage/" + message,
            		method : "post",
            		dataType : "json",
            		success : function(data) {
            			console.log(data.result); 
            		}
            	});
            	message = $('#staffName').val() + ":" + message + "<span style='float:right;'>" + Format(new Date,"yyyy-MM-dd HH:mm:ss") + "</span>";
                Chat.socket.send(message);  
                $("#textarea").val("");
            }  
        });  
  
        var Console = {};  
  
        Console.log = (function(message) {  
            var console = document.getElementById('console');  
            var p = document.createElement('p');  
            p.innerHTML = message;  
            console.appendChild(p);  
            while (console.childNodes.length > 25) {  
                console.removeChild(console.firstChild);  
            }  
            console.scrollTop = console.scrollHeight;  
        });  
  
        Chat.initialize();  
  
        document.addEventListener("DOMContentLoaded", function() {  
            // Remove elements with "noscript" class - <noscript> is not allowed in XHTML  
            var noscripts = document.getElementsByClassName("noscript");  
            for (var i = 0; i < noscripts.length; i++) {  
                noscripts[i].parentNode.removeChild(noscripts[i]);  
            }  
        }, false);  
        
        function Format(now,mask)
        {
            var d = now;
            var zeroize = function (value, length)
            {
                if (!length) length = 2;
                value = String(value);
                for (var i = 0, zeros = ''; i < (length - value.length); i++)
                {
                    zeros += '0';
                }
                return zeros + value;
            };
         
            return mask.replace(/"[^"]*"|'[^']*'|\b(?:d{1,4}|m{1,4}|yy(?:yy)?|([hHMstT])\1?|[lLZ])\b/g, function ($0)
            {
                switch ($0)
                {
                    case 'd': return d.getDate();
                    case 'dd': return zeroize(d.getDate());
                    case 'ddd': return ['Sun', 'Mon', 'Tue', 'Wed', 'Thr', 'Fri', 'Sat'][d.getDay()];
                    case 'dddd': return ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'][d.getDay()];
                    case 'M': return d.getMonth() + 1;
                    case 'MM': return zeroize(d.getMonth() + 1);
                    case 'MMM': return ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'][d.getMonth()];
                    case 'MMMM': return ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'][d.getMonth()];
                    case 'yy': return String(d.getFullYear()).substr(2);
                    case 'yyyy': return d.getFullYear();
                    case 'h': return d.getHours() % 12 || 12;
                    case 'hh': return zeroize(d.getHours() % 12 || 12);
                    case 'H': return d.getHours();
                    case 'HH': return zeroize(d.getHours());
                    case 'm': return d.getMinutes();
                    case 'mm': return zeroize(d.getMinutes());
                    case 's': return d.getSeconds();
                    case 'ss': return zeroize(d.getSeconds());
                    case 'l': return zeroize(d.getMilliseconds(), 3);
                    case 'L': var m = d.getMilliseconds();
                        if (m > 99) m = Math.round(m / 10);
                        return zeroize(m);
                    case 'tt': return d.getHours() < 12 ? 'am' : 'pm';
                    case 'TT': return d.getHours() < 12 ? 'AM' : 'PM';
                    case 'Z': return d.toUTCString().match(/[A-Z]+$/);
                    // Return quoted strings with the surrounding quotes removed
                    default: return $0.substr(1, $0.length - 2);
                }
            });
        };

</script>
</head>
<body style="height: 100%;">
	<input type="hidden" name="staffName" id="staffName"
		value="${user.name }" />
	<div class="noscript">
		<h2 style="color: #ff0000">Seems your browser doesn't support
			Javascript! Websockets rely on Javascript being enabled. Please
			enable Javascript and reload this page!</h2>
	</div>
	<div class="content" style="width: 100%; height: 100%;">
		<div class="chatBox" style="float: left;">
			<div class="chatLeft">
				<div class="chat01" style="height: 350px;">
					<div class="chat01_title">
						<ul class="talkTo">
							<li><a href="javascript:;">${user.organize.name }办公聊天室</a></li>
						</ul>
						<a class="close_btn" href="javascript:;"></a>
					</div>
					<div class="chat01_content" style="height: 320px;">
						<div id="console-container"
							style="width: 100%; height: 100%; height: 320px;">
							<div id="console" style="width: 100%; height: 320px;">
								<c:forEach items="${chats }" var="c">
										<li><p>${c.user.name }:${c.content }<span style="float: right;">${fn:substring(c.createTime,0,19) }</span></p></li>
								</c:forEach>
							</div>
						</div>
					</div>
				</div>
				<div class="chat02">
					<div class="chat02_title">
						<div class="wl_faces_box">
							<div class="wl_faces_content">
								<div class="title"></div>
								<div class="wl_faces_main"></div>
							</div>
							<div class="wlf_icon"></div>
						</div>
					</div>
					<div class="chat02_content">
						<textarea id="textarea"></textarea>
					</div>
					<div class="chat02_bar">
						<ul>
							<li style="right: 5px; top: 5px;"><a href="javascript:;"
								id="sendMsg"> <img
									src="${pageContext.request.contextPath }/img/send_btn.jpg"></a></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="chatRight">
				<div class="chat03">
					<div class="chat03_title">
						<label class="chat03_title_t"> 成员列表</label>
					</div>
					<div class="chat03_content">
						<ul>
							<c:forEach items="${users }" var="u">
								<li>
									<p>
										<img
											src="${pageContext.request.contextPath }/img/imagesN/icons/bullet_black.png">
										${u.name }
									</p>
								</li>
							</c:forEach>
						</ul>
					</div>
				</div>
			</div>
			<div style="clear: both;"></div>
		</div>
	</div>
</body>
</html>
