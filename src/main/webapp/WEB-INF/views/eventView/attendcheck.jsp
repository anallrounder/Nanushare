<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- 이건무조건 여기있어야함 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- jquery validation cdn 이거 두개 안되면 폼태그 끝나는 시점 바로 밑에 넣기-->
<!-- jquery 플러그인 이기때문에 jquery가 있어야 한다. -->
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>

<!-- jquery validation method cdn -->
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/additional-methods.min.js"></script>


<!-- meta tags -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- 헤더 안에 추가  -->
<!-- csrf 관련이슈 해결방법 : jsp에 meta 태그추가(csrf값 얻기위해) -->
<!-- js에서 csrf 토큰, 헤더등록 -->
<meta name="_csrf" content="${_csrf.token}">
<meta name="_csrf_header" content="${_csrf.headerName}">

<title>Nanushare</title>
<link rel="shortcut icon" type="image/x-icon"
	href="${pageContext.request.contextPath}/resources/nanulogo_ico_convert.ico">
<!-- 웹페이지 탭 로고이미지 삽입  -->


<!-- CSS -->
<link rel="stylesheet" href="/resources/charity/css/bootstrap.css">
<link rel="stylesheet" href="/resources/charity/css/fontawesome-all.css">
<link rel="stylesheet" href="/resources/charity/css/flaticon.css">
<link rel="stylesheet" href="/resources/charity/css/slick-slider.css">
<link rel="stylesheet" href="/resources/charity/css/fancybox.css">
<link href="/resources/charity/css/jplayer.css" rel="stylesheet">
<link rel="stylesheet" href="/resources/charity/css/style.css">
<link rel="stylesheet" href="/resources/charity/css/color.css">
<link rel="stylesheet" href="/resources/charity/css/responsive.css">

<!-- calendar -->
<link href='/resources/calendar/main.css' rel='stylesheet' />
<script src='/resources/calendar/main.js'></script>



</head>


<script type="text/javascript">
 /* https://m.blog.naver.com/sgj4958/221865512339 */ 
 /* prtpnt = 참여포인트 */
 
   $(document).ready(function(){ 
	   
	   var token = $("meta[name='_csrf']").attr("content");
		var header = $("meta[name='_csrf_header']").attr("content");
		$(document).ajaxSend(function(e, xhr, options) {
			xhr.setRequestHeader(header, token);
		});
	   
	   
	    var score = new Array(
	    		{
	     		   name: '1p',
	     		   color: '#F5A9A9'
	     	  	},
	     	  	{
	     	  		name: '10p',
	     	  		color: '#F7BE81'
	     	  	},
	     	  	{
	 	    		name: '20p',
	 	    		color: '#F4FA58'
	 	    	},
	     		{
	 	    		name: '100p',
	 	    		color: '#BEF781'
	 	    	},
	 	    	{
	 	    		name: '♥',
	 	    		color: '#A9E2F3'
	 	    	}    	
	    	);
	    	    
	   var canvas = document.getElementById('canvas');
	   var ctx = canvas.getContext('2d');
	   /* 원점이동 */
	   ctx.translate(500, 500);
	   	
	   score.forEach(function(e, i){
	  		ctx.beginPath(); 	
	  		/* 원크기, false=시계방향 */
	   	   	ctx.arc(0, 0, 360, 0, (360/score.length)*(Math.PI/180), false);
	   	   	ctx.lineTo(0,0);
	   	   	ctx.closePath();
	   	   	ctx.fillStyle=e.color;
	   	   	ctx.fill();
   	   	
	   	   	ctx.fillStyle='black';
	   	   	ctx.textAlign='left';
	   	 	/* 글자크기 */
	   	   	ctx.font='30px YiSunShinDotumM';
	   	   	ctx.fillText(e.name, 150, 105);
	   	   	
	   	   	ctx.rotate((360/score.length) * (Math.PI/180));
		});
		
   	   	ctx.beginPath();
   		 /* (x,y,반지름,시작점,끝점,방향) */
   	   	ctx.arc(0, 0, 100, 0, 2*Math.PI, false);
   	   	ctx.fillStyle = 'lightgray';
   	   	ctx.fill();
   	   	
   	   	ctx.textAlign= 'center';
   	   	ctx.textBaseline = 'middle';
   	   	ctx.font = '40px YiSunShinDotumM';
   	   	
   	   	ctx.strokeStyle = 'black';
   	   	ctx.strokeText('룰렛버튼', 0,0);
   	 
   	var member_id = $("#member_id").val();
   	
   	$('#canvas').click(function(){
  /*  		function update(a,c){
   			var totalpnt = a;
   		var nowpnt = c;
   		console.log(a); 
console.log(c);
   		} */
   		var totalpnt = $('#totalpnt').val();
   		var nowpnt = $('#nowpnt').val();
   		
   		var random = 0;
	   	var clicked = 0;
	   	var prtpnt = 0;
   	  
   	   	console.log("totalpnt = " + totalpnt);
   	   	console.log("nowpnt = "+nowpnt);
   	   	
    	if(clicked <= 0){
    		random += Math.random()*360;
    		$(this).css({'transition-timing-function': 'ease-in-out', 'transition': '7s', 'transform': 'rotate('+random+'deg)'});
 			console.log(random);
	    } /* 'transform': 'rotate('+random+'deg) --원판속도 */
    	
    	//포인트 지정
    	if(random >= -10 && random <= 50){
    		prtpnt = 100;
	   	}else if(random >= 50 && random <= 124){
	   		prtpnt = 20;
    	}else if(random >= 124 && random <= 196){
    		prtpnt = 10;
    	}else if(random >= 196 && random <= 268){	
    		prtpnt = 1;
	   	}else if(random >= 268 && random <= 340){
	   		prtpnt = 0;
	   	}

    	console.log(prtpnt);
    	
    	var memberPoint = {   			
    			"member_id" : member_id,		 
    			"prtpnt" : prtpnt,
    			"totalpnt" : totalpnt,
    			"nowpnt" : nowpnt
    			
    		};
    	
    	//참여 중복 확인 및 포인트 적립
    	$.ajax({
   	        type :"PUT",
   	        url :"/my/event/check/getpoint",
   	    	 contentType: 'application/json',
   	    	 data: JSON.stringify(memberPoint),
   	        /* data : { //"JSON parse error: Unrecognized token" 에러나서 json.stringify씀
   	        	member_id: member_id,
   	        	prtpnt: prtpnt
   	        }, */
   	     async: "false",
   	     datatype : 'json',
   	    
	   	    success: function (result) {
	   	    	if(result == "SUCCESS"){
		    		console.log(result); 
		    		setTimeout(function(){
		    			alert("오늘의 나누셰어 포인트는 "+prtpnt+" point");
				/* 여기에 데이터를 전부 넣어주던지... */		
		  	    
		    		},5000);
		        }else if(result == "FAIL"){
	   	    		console.log(result);
	   	    		alert("1일 1회 참여가 가능합니다.");
	   	    	}
		    },
		    error: function (e) {
		    	console.log(e);
		    }
    	});
   	});//canvas
   	
   });
   </script>

<style>
#판 {
	width: 1000px;
	height: 1000px;
	/* width: 1200px;
	height: 1150px; */
	overflow: hidden;
	position: relative;
	top: 70px;
}

#핀 {
	width: 0;
	height: 0;
	top: 90px;
	left: calc(50% - 16px);
	position: absolute;
	border-radius: 32px 32px 0 0;
	border-top: 70px solid crimson;
	border-left: 16px solid transparent;
	border-right: 16px solid transparent;
	border-bottom: 0;
	z-index: 1;
}
</style>

<body>
	<!-- Header -->
	<%@ include file="/WEB-INF/views/mainMap/mainHeader.jsp"%>
	<!-- Header -->
	<!-- Sub Header -->
	<div class="charity-subheader">
		<!--  style="background-image: url(/resources/loginform/images/bg.jpg);"  -->
		<span class="black-transparent"></span>
		<div class="container">
			<div class="row">
				<div class="col-md-12"></div>
			</div>
		</div>
	</div>
	<!-- Sub Header -->

	<!-- Content -->
	<div class="charity-main-content">

		<!-- Main Section -->
		<div class="charity-main-section">
			<div class="container">
				<div class="row">
					<div class="col-md-9 bottom-spacer">

						<div class="charity-event-rich-editor">
							<h1 style="text-align: center;">
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								매일 나눔 룰렛 돌리고 포인트를 적립하세요!</h1>
						</div>
						
						<!-- 전에있던 totalpnt를 넘겨주기 위해 -->
				<input type="hidden" id="totalpnt" name="totalpnt" value="${pointvo.totalpnt}">
				<input type="hidden" id="nowpnt" name="nowpnt" value="${pointvo.nowpnt}">
				

						<div id="판">
							<div id="핀"></div>
							<canvas id="canvas" width="1000px" height="1000px" ></canvas>
							
						</div>
						<!-- <button type="button" class="btn btn-success">룰렛 돌리기</button> -->
					</div>
				</div>
			</div>
		</div>
			<button id='button' type="button" onClick="location.href='/event/check3'">출석하기</button>
				
		<!-- Main Section -->
	</div>
	<!-- Content -->


	<!-- Footer -->
	<%@ include file="/WEB-INF/views/mainMap/mainFooter.jsp"%>
	<!-- Footer -->

	

	<!-- jQuery -->
	<script src="/resources/charity/script/jquery.js"></script>
	<script src="/resources/charity/script/popper.min.js"></script>
	<script src="/resources/charity/script/bootstrap.min.js"></script>
	<script src="/resources/charity/script/slick.slider.min.js"></script>
	<script src="/resources/charity/script/progressbar.js"></script>
	<script src="/resources/charity/script/fancybox.min.js"></script>
	<script src="/resources/charity/script/jquery.countdown.min.js"></script>
	<script src="https://maps.googleapis.com/maps/api/js"></script>
	<script src="/resources/charity/script/jquery.jplayer.js"></script>
	<script src="/resources/charity/script/jplayer.playlist.js"></script>
	<script src="/resources/charity/script/functions-main.js"></script>


</body>
</html>
