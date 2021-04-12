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
<%-- <meta id="_csrf" name="_csrf" th:content="${_csrf.token}" />  에러 주범??  --%>

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



<script> 
 /* https://m.blog.naver.com/sgj4958/221865512339 */ 
 /* prtpnt = 참여포인트 */
 
   $(document).ready(function(){ 
	    var list = new Array(
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
	   	
	   ctx.translate(500, 500);
	   	
		list.forEach(function(e, i){
	  		ctx.beginPath(); 		
	   	   	ctx.arc(0, 0, 370, 0, (360/list.length)*(Math.PI/180), false);
	   	   	ctx.lineTo(0,0);
	   	   	ctx.closePath();
	   	   	ctx.fillStyle=e.color;
	   	   	ctx.fill();
   	   	
	   	   	ctx.fillStyle='white';
	   	   	ctx.textAlign='left';
	   	   	ctx.font='30px sanserif';
	   	   	ctx.fillText(e.name, 210, 105);
	   	   	
	   	   	ctx.rotate((360/list.length) * (Math.PI/180));
		});
		//내부 원 설정
   	   	ctx.beginPath();
   	   	ctx.arc(0, 0, 0, 0, 0*Math.PI, false);
   	   	ctx.fillStyle = 'white';
   	   	ctx.fill();
   	   	
   	   	ctx.textAlign= 'center';
   	   	ctx.textBaseline = 'middle';
   	   	ctx.font = '50px sanserif';
   	   	
   	   	ctx.strokeStyle = '#9197B5';
   	   	ctx.strokeText('', 0,0);
   	 
   	var member_id = $("#member_id").val();
   	 
   	//로그인 여부 체크
/*    	function checkLogin() {
		 if(member_id == undefined){
			 alert("로그인 후 이벤트 참여 가능합니다.");
			 location.href = '/login/login';
		 }
	 } */
    	
   	$('#canvas').click(function(){
   		/* checkLogin(); */
   		
   	  	var random = 0;
   	   	var clicked = 0;
   	   	var prtpnt = 0;
   	   	
    	if(clicked <= 0){
    		random += Math.random()*360 + 720;
    		$(this).css({'transition-timing-function': 'ease-in-out', 'transition': '6s', 'transform': 'rotate('+random+'deg)'});
 			console.log(random);
	    } 
    	//포인트 지정
    	if(random >= 720 && random <= 765){
    		prtpnt = 1;
	   	}else if(random >= 766 && random <= 810){
	   		prtpnt = 10;
    	}else if(random >= 811 && random <= 855){
    		prtpnt = 20;
    	}else if(random >= 856 && random <= 900){
    		prtpnt = 100;
	   	}else if(random >= 901 && random <= 945){
	   		prtpnt = 0;
	   	}/* else if(random >= 946 && random <= 990){
	   		 prtpnt = 100;
	   	}else if(random >= 991 && random <= 1035){
	   		 prtpnt = 0; 
	    }else if(random >= 1036 && random <= 1080){
	    	prtpnt = 5000;
    	} */
    	
    	console.log(member_id);
    	console.log(prtpnt);
    	
    	//참여 중복 확인 및 포인트 적립
    	$.ajax({
   	        type :"PUT",
   	        url :"/store/event",
   	        data : {
   	        	member_id: member_id,
   	        	prtpnt: prtpnt
   	        },
	   	    success: function (result) {
	   	    	if(result == "SUCCESS"){
		    		console.log(result); 
		    		setTimeout(function(){
		    			alert("포인트 " + prtpnt + " 적립 완료!");	    		
		    		},5000);
		        }else if(result == "FAIL"){
	   	    		console.log(result);
	   	    		alert("이벤트에 이미 참여하셨습니다.");
	   	    	}
		    },
		    error: function (e) {
		    	console.log(e);
		    }
    	});//ajax end
   	});//click end
   });
   </script> 

</head>
<style>
#판 {
	width: 1000px;
	height: 1000px;
}
</style>

<body>
	<!-- Header -->
	<%@ include file="/WEB-INF/views/mainMap/mainHeader.jsp"%>
	<!-- Header -->



	<!-- Banner -->
	<div class="charity-subheader">
		<span class="black-transparent"></span>
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<h1>이벤트</h1>

				</div>
			</div>
		</div>
	</div>
	<!-- Banner -->


	<!-- Content -->
	<div class="charity-main-content">

		<!-- Main Section -->
		<div class="charity-main-section">
			<div class="container">
				<div class="row">
					<div class="col-md-9 bottom-spacer">

						<div class="charity-event-rich-editor">
							<h1>
								<b> 매일 나눔 룰렛 돌리고 포인트를 적립하세요!</b>
							</h1>
						</div>
						
						
						<div id="판">
							<div id="핀"></div>
							<canvas id="canvas" width="1000px" height="1000px"></canvas>
						</div>
						<button type="button" class="btn btn-success">룰렛 돌리기</button>















						<!--  -->
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


	<!-- Footer -->
	<%@ include file="/WEB-INF/views/mainMap/mainFooter.jsp"%>
	<!-- Footer -->

	<!-- Search Modal -->
	<div class="modal fade searchmodal" id="searchModal" tabindex="-1"
		role="dialog">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-body">
					<a href="/resources/charity/#" class="charity-close-btn"
						data-dismiss="modal" aria-label="Close"><span
						aria-hidden="true">&times;</span></a>
					<form>
						<input type="text" value="Type Your Keyword"
							onblur="if(this.value == '') { this.value ='Type Your Keyword'; }"
							onfocus="if(this.value =='Type Your Keyword') { this.value = ''; }">
						<input type="submit" value=""> <i class="fa fa-search"></i>
					</form>
				</div>

			</div>
		</div>
	</div>


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
