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

<title>chat</title>

<style>
	body {
		padding: 0;
	}
	
	#chating .me{
		text-align: right;
	}
	
	#chating .others{
		text-align: left;
	}
	
	#chating {
		height: 500px;
		overflow: scroll;
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
			$("#chating").append("<p class='others'>▶ 나누셰어의 상담운영시간</p>");
			$("#chating").append("<p class='others'>평일/ 10:00~18:00</p>");
			$("#chating").append("<p class='others'>점심/ 12:00~13:00</p>");
			$("#chating").append("<p class='others'>※상담은 주말, 공휴일에는 운영되지 않습니다</p>");
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
						$("#chating").append("<p class='others'>관리자 :" + d.msg + "</p>");
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

<div class="container">
		<input type="hidden" id="sessionId" value="">
		<input type="hidden" id="username" value="${username}">
		<div class="row">
			<div class="col-md-12 header">
				<img class="nav-logo-img" src="/resources/nanulogo_ico_convert.ico">
				<h5 class="" style="font-family:yg-jalnan;">나누셰어</h5>
				<button type="button"><i class="fas fa-times"></i></button>
			</div>
			<div class="col-md-12" id="chating"></div>
			<div class="col-md-12" id="yourMsg">
				<table class="inputTable">
					<tr>
						<th>메시지</th>
						<th><input id="chatting" placeholder="보내실 메시지를 입력하세요."></th>
						<th><button onclick="send()" id="sendBtn">보내기</button></th>
					</tr>
				</table>
			</div>
		</div>
	</div>

	
</body>
</html>