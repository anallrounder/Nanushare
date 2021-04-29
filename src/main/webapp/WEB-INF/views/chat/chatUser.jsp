<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

<title>chat</title>

<style>
body, html {
	padding: 0;
}

@font-face {
    font-family: 'YiSunShinDotumM';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_two@1.0/YiSunShinDotumM.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

.chat_header {
	padding: 15px;
	border-bottom: 5px solid #FFAE73;
	color: #FFAE73;
	margin-bottom: 8px;
	font-size: 14px;
	background: #f0f0f0;
}


#chating .others {
	margin: 14px;
	border: 1px solid #FFAE73;
	padding: 8px;
	width: 220px;
	border-radius: 10px 10px 10px 0;
	max-width: calc(100% - 0px);
	font-size: 0.85em;
}

#yourMsg .me {
	position: absolute;
	margin: 20px 0px 0px 300px;
	max-width: calc(100% - 100px);
	font-family: "Montserrat", sans-serif;
	
}
 
 #chating .me {
 	width: 220px;
 	padding: 8px;
 	border-radius: 10px 10px 0 10px;
  	margin-left: calc(100% - 249px);
  	border: 1px solid grey;
  	box-sizing: border-box;
  	text-transform: uppercase;
  	font-size: 0.85em;
  	margin: 20px 0px 0px 300px;;
 }

#chatting .others {
	text-align: left;
	border-radius: 10px 10px 0 10px;
	margin-left: calc(100% - 249px);
	border-color: grey;
}

#chating button {
	background-color : #FFAE73;
	border: 1px solid #FFAE73;
	border-radius: 10px 10px 10px 10px;
	margin-left: 10px;
}

#yourMsg {
margin-top: 10px;
}


#chatting {

width : 220px;
}


.inputTable {
margin: 20px 0px 0px 100px;
}

h1, p, button, input, i {

font-family: 'Montserrat', 'YiSunShinDotumM', sans-serif;
font-style: normal;
}


h1 {
float: right;
margin: 40px 100px 0px 0px;
font-size: 50px;
}

p {
font-size: 1.15em;
}

</style>

<script type="text/javascript">
	var ws;
	
	// jsp 유저 정보를 가져오기 위한 코드 <sec> 태그 이용해도 될 것 같음
	var username = "${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username}";
	
	function wsOpen(){
		ws = new WebSocket("ws://" + location.host + "/chatting/" + username);
		wsEvt();
	}
		
	function wsEvt() {
		ws.onopen = function(data){
			//소켓이 열리면 초기화 세팅하기
			$("#chating").append("<p class='others'>나누셰어입니다</p>");
			$("#chating").append("<p class='others'>▶ 나누셰어의 상담운영시간<br>평일/ 10:00~18:00<br>점심/ 12:00~13:00<br>※상담은 주말, 공휴일에는 운영되지 않습니다</p>");
			$("#chating").append("<p class='others'>문의사항을 선택하시거나 번호를 입력해주세요.</p>");
			$("#chating").append("<button type='button' onclick='typing(this)'>1.기부 문의</button>");
			$("#chating").append("<button type='button' onclick='typing(this)'>2.결제 문의</button>");
			$("#chating").append("<button type='button' onclick='typing(this);connect();'>3.상담원 연결</button>");
		}
		
		ws.onmessage = function(data) {
			//메시지를 받으면 동작
			var msg = data.data;
			if(msg != null && msg.trim() != ''){
				var d = JSON.parse(msg);
				if(d.type == "getId"){
					var si = d.sessionId != null ? d.sessionId : "";
					if(si != ''){
						$("#sessionId").val(si); 
						console.log(si);
					}
				}else if(d.type == "message"){
					if(d.sessionId == $("#sessionId").val()){
						$("#chating").append("<p class='me'>나 :" + d.msg + "</p>");	
					}else{
						$("#chating").append("<p class='others'>관리자 : " + d.msg + "</p>");
					}
						
				}else{
					console.warn("unknown type!")
				}
				$("#chating").scrollTop($("#chating")[0].scrollHeight);
			}
		}
	
		document.addEventListener("keypress", function(e) {
			if (e.keyCode == 13) { //enter press
				send();
			}
		});
	}
	
	function send() {
		var option ={
			type: "message",
			sessionId : $("#sessionId").val(),
			username : username,
			msg : $("#chatting").val()
		}
		ws.send(JSON.stringify(option))
		$('#chatting').val("");
	}
	
	function connect() {
		$.ajax({
			url: "/room",
			type: "POST",
			cache: false,
			beforeSend : function(xhr){
		            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
			success : function(result) {
				
			},
			error : function(e) {
				console.log(e);
			}
		});
		
		var data = {
				type : "alert",
				sessionId : $("#sessionId").val(),
				username : username,
				msg : "enter"
		}
		ws.send(JSON.stringify(data));
	}
	
	function typing(obj) {
		var text = $(obj).text();
		var option = {
				type : "message",
				sessionId : $("#sessionId").val(),
				username : username,
				msg : text
			}
		ws.send(JSON.stringify(option))
		$('#chatting').val("");
	}
	
	$(document).ready(function() {
		wsOpen();
	})

</script>


</head>
<body>

<div class="container-fluid">
<div id="chat">
		<input type="hidden" id="sessionId" value="">
		<input type="hidden" id="username" value="${username}">
		<div class="row">
			<div class="col-md-12 header">
				<div class="chat_header">
					<img class="nav-logo-img" src="/resources/nanulogo_ico_convert.ico">
					<h1>나누셰어</h1>
				</div>
			</div>
			<div class="col-md-12" id="chating"></div>
			<div class="col-md-12" id="yourMsg">
				<table class="inputTable">
					<tr>
						<th><input type="text" id="chatting" placeholder="보내실 메시지를 입력하세요."></th>
						<th><button onclick="send()" id="sendBtn"><i class="fa fa-send">보내기</i></button></th>
					</tr>
				</table>
			</div>
		</div>
	</div>
</div>


	
</body>
</html>