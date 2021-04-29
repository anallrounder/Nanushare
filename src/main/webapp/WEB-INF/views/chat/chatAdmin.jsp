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
margin: 60px 0px 0px 100px;
}

h5, h3, p, button, input {

font-family: 'Montserrat', 'YiSunShinDotumM', sans-serif;
font-style: normal;
}

h5 {
float: right;

}

h3 {
float: left;
margin: -40px 0px 0px 150px;
color: #333333;
}

</style>
<script type="text/javascript">
	var ws;
	
	function wsOpen(){
		//웹소켓 전송시 현재 방의 번호를 넘겨서 보낸다.
		ws = new WebSocket("ws://" + location.host + "/chatting/"+$("#username").val());
		wsEvt();
	}
		
	function wsEvt() {
		ws.onopen = function(data){
			//소켓이 열리면 동작
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
					}
				}else if(d.type == "message"){
					if(d.sessionId == $("#sessionId").val()){
						$("#chating").append("<p class='me'>나 :" + d.msg + "</p>");	
					}else{
						$("#chating").append("<p class='others'>" + d.username + " :" + d.msg + "</p>");
					}
						
				}else{
					console.warn("unknown type!")
				}
			}
		}
	
		document.addEventListener("keypress", function(e){
			if(e.keyCode == 13){ //enter press
				send();
			}
		});
	}
	
	function send() {
		var option ={
			type: "message",
			sessionId : $("#sessionId").val(),
			username : "${username}",
			msg : $("#chatting").val()
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
	<div id="container" class="container-fluid">
	<div id="chat">
		<input type="hidden" id="sessionId" value="">
		<input type="hidden" id="username" value="${username}">
		<div class="row">
			<div class="col-md-12 header">
				<div class="chat_header">
					<img class="nav-logo-img" src="/resources/nanulogo_ico_convert.ico">
					<h5 class="">나누셰어</h5>
					<h3>${username}의 채팅방</h3>
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