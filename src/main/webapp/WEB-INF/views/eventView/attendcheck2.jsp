<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>



 <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome Icons -->
  <link rel="stylesheet" href="/resources/AdminLTE-master/plugins/fontawesome-free/css/all.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="/resources/AdminLTE-master/dist/css/adminlte.min.css">

<html>
<head>

	<meta name="_csrf" content="${_csrf.token}">
	<meta name="_csrf_header" content="${_csrf.headerName}">
	
<title>출석체크</title>

 <!-- meta tags -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <title>Charity Team Detail</title>

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

	<!-- Google Font: Source Sans Pro -->
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
	<!-- Font Awesome Icons -->
	<link rel="stylesheet" href="/resources/AdminLTE-master/plugins/fontawesome-free/css/all.min.css">
	<!-- IonIcons -->
	<link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
	<!-- Theme style -->
	<link rel="stylesheet" href="/resources/AdminLTE-master/dist/css/adminlte.min.css">
	  
  	<!--탭처리2  -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
	<!-- Admin style -->
  	<link rel="stylesheet" href="/resources/admin/admin_style.css">


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
	     		   color: 'red'
	     	  	},
	     	  	{
	     	  		name: '10p',
	     	  		color: '#ff7f00'
	     	  	},
	     	  	{
	 	    		name: '20p',
	 	    		color: 'yellow'
	 	    	},
	     		{
	 	    		name: '100p',
	 	    		color: 'lightgreen'
	 	    	},
	 	    	{
	 	    		name: '♥',
	 	    		color: 'skyblue'
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
	   	   	ctx.font='30px sanserif';
	   	   	ctx.fillText(e.name, 150, 105);
	   	   	
	   	   	ctx.rotate((360/score.length) * (Math.PI/180));
		});
		//내부 원 설정
   	   	ctx.beginPath();
   		 /* (x,y,반지름,시작점,끝점,방향) */
   	   	ctx.arc(0, 0, 0, 0, 0*Math.PI, false);
   	   	ctx.fillStyle = 'white';
   	   	ctx.fill();
   	   	
   	   	ctx.textAlign= 'center';
   	   	ctx.textBaseline = 'middle';
   	   	ctx.font = '25px sanserif';
   	   	
   	   	ctx.strokeStyle = 'black';
   	   	ctx.strokeText('출첵버튼', 0,0);
   	 
   	var member_id = $("#member_id").val();
   	 
		var random = 0;
	   	var clicked = 0;
	   	var prtpnt = 0;
   	$('#canvas').click(function(){
   		
   		/* var random = 0;
	   	var clicked = 0;
	   	var prtpnt = 0; */
   	  
   	   	
    	if(clicked <= 0){
    		random += Math.random()*360;
    		$(this).css({'transition-timing-function': 'ease-in-out', 'transition': '6s', 'transform': 'rotate('+random+'deg)'});
 			console.log(random);
	    } 
    	
    	//포인트 지정
    	if(random >= -10 && random <= 60){
    		prtpnt = 100;
	   	}else if(random >= 60 && random <= 134){
	   		prtpnt = 20;
    	}else if(random >= 134 && random <= 206){
    		prtpnt = 10;
    	}else if(random >= 206 && random <= 278){	
    		prtpnt = 1;
	   	}else if(random >= 278 && random <= 350){
	   		prtpnt = 0;
	   	}

    	
    	console.log(member_id);
    	console.log(prtpnt);
    	
    	var memberPoint = {   			
    			"member_id" : member_id,		 
    			"prtpnt" : prtpnt
    			/* "phone" : phone */
    		};
    	
    	//참여 중복 확인 및 포인트 적립
    	$.ajax({
   	        type :"PUT",
   	        url :"/event/check/getpoint",
   	    	 contentType: 'application/json',
   	    	 data: JSON.stringify(memberPoint),
   	        /* data : { //"JSON parse error: Unrecognized token" 에러나서 json.stringify씀
   	        	member_id: member_id,
   	        	prtpnt: prtpnt
   	        }, */
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
   	
   	console.log("확인"+prtpnt);
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
	<div class="charity-subheader" >
		  <!--  style="background-image: url(/resources/loginform/images/bg.jpg);"  -->
		<span class="black-transparent" ></span>
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					
				</div>
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
								매일 나눔 룰렛 돌리고 포인트를 적립하세요!
							</h1>
						</div>


						<div id="판">
							<div id="핀"></div>
							<canvas id="canvas" width="1000px" height="1000px"></canvas>
						</div>
				
							<div class="datepicker"></div>



						<div class="charity-post-tags">
							<div class="charity-tags">
								<span>Tags:</span> <a href="404.html">charity </a> <a
									href="404.html">/ donation</a> <a href="404.html"> / needy</a>
							</div>

							<div class="charity-blog-social">
								<span>Share:</span>
								<ul>
									<li><a href="https://www.facebook.com/"
										class="fab fa-facebook"></a></li>
									<li><a href="https://www.twitter.com/"
										class="fab fa-twitter"></a></li>
									<li><a href="https://www.linkedin.com/"
										class="fab fa-linkedin"></a></li>
									<li><a href="https://www.youtube.com/"
										class="fab fa-youtube"></a></li>
									<li><a href="https://www.vimeo.com/" class="fab fa-vimeo"></a>
									</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Main Section -->
	</div>
	<!-- Content -->


	
	   <%@ include file="/WEB-INF/views/mainMap/mainFooter.jsp"%>

 <!-- jQuery -->
   <!--  <script src="/resources/charity/script/jquery.js"></script>
    <script src="/resources/charity/script/popper.min.js"></script> -->
    <script src="/resources/charity/script/bootstrap.min.js"></script>
    <script src="/resources/charity/script/slick.slider.min.js"></script>
    <script src="/resources/charity/script/progressbar-main.js"></script> <!-- progressbar 복붙해서 사용  -->
    <script src="/resources/charity/script/fancybox.min.js"></script>
    <script src="/resources/charity/script/jquery.countdown.min.js"></script>
    <script src="https://maps.googleapis.com/maps/api/js"></script>
    <script src="/resources/charity/script/jquery.jplayer.js"></script>
    <script src="/resources/charity/script/jplayer.playlist.js"></script>
    <script src="/resources/charity/script/functions-main.js"></script> <!-- fuctions 복붙해서 사용 -->
    
 
<!-- Bootstrap -->
<script src="/resources/AdminLTE-master/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- AdminLTE App -->
<script src="/resources/AdminLTE-master/dist/js/adminlte.min.js"></script>

<!-- <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"> -->
<!-- 위에 script를 추가하면 덮여져서인지 datepicker가 팝업이 아예 안됨 
https://stackoverflow.com/questions/36207203/uncaught-typeerror-datepicker-is-not-a-functionanonymous-function-->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>  
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script>

$(document).ready(function() { 
	$('.datepicker').datepicker({

		/*beforeShowDay: function (date){

			  var year = date.getFullYear();
			var month = makePadNumber(date.getMonth() + 1);
			var day = makePadNumber(date.getDate());
			var dateString = month + "/" + day + "/" + year;

			if(appDate.indexOf(dateString) >= 0) {
				return [true, "app"];  //- 포인트
			}
			if(webDate.indexOf(dateString) >= 0) {
				return [true, "web"]; //- 포인트
			}					

			return [true, ""]; */
		} 
		
		
	});//.datepicker("setDate" , getToday());
	
	
  });
  
  
/* $(document).ready(function() { 
$("#datepicker").datepicker({

	beforeShowDay: function (date){

		var year = date.getFullYear();
		var month = makePadNumber(date.getMonth() + 1);
		var day = makePadNumber(date.getDate());
		var dateString = month + "/" + day + "/" + year;

		if(appDate.indexOf(dateString) >= 0) {
			return [true, "app"];  //- 포인트
		}
		if(webDate.indexOf(dateString) >= 0) {
			return [true, "web"]; //- 포인트
		}					

		return [true, ""];
	}

}).datepicker("setDate" , getToday());
}); */
</script>

</body>
</html>

