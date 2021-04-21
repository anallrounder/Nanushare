<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<!DOCTYPE>
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
<link rel="stylesheet" type="text/css"
	href="/resources/charity/css/imgblink_hj.css">

<link rel="stylesheet" href="/resources/charity/css/style_mypage_hj.css">

<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" />

<!--  -->
<link rel="stylesheet"
	href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
	integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p"
	crossorigin="anonymous" />

<style>
.maxmax {
	position: relative;
}

li {
	list-style: none;
}

.number2 {
	text-align: center;
	color: 585858;
	font-weight: bold;
}

.threebox {
	color: white;
	width: 190px;
	height: 190px;
	border-radius: 95px;
	text-align: center;
	margin: auto;
	font-size: 14px;
	vertical-align: middle;
	line-height: 150px;
	border-style: double;
	border: white 10px padding;
}

.twobox {
	text-color: 424242;
	width: 190px;
	height: 100px;
	border-radius: 95px;
	text-align: center;
	margin: 0 auto;
	font-size: 14px;
	vertical-align: middle;
	line-height: 150px;
}
</style>

<script type="text/JavaScript"
	src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/JavaScript"
	src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						var barbar = jQuery('.progressbar');
						var barProgress = <sec:authentication property="principal.member.dntcnt"/>;
						var test = Number(barProgress + 0);
						getresource(test);

						//console.log(pg);
						console.log(typeof (test));

						function getresource(test) {

							console.log(test);
							if (test >= 0 && test <= 20) {
								$(".maxmax").attr('src',
										'/resources/my/그림1.png').css("left",
										"0%");
								console.log(barProgress);
							}
							if (test > 20 && test <= 40) {

								$(".maxmax").attr("src",
										"/resources/my/그림2.png").css("left",
										"17%");
							}
							if (test > 40 && test <= 60) {

								$(".maxmax").attr("src",
										"/resources/my/그림3.png").css("left",
										"47%");

							}
							if (test > 60 && test <= 80) {

								$(".maxmax").attr("src",
										"/resources/my/그림4.png").css("left",
										"67%");

							}
							if (test > 80 && test <= 100) {

								$(".maxmax").attr("src",
										"/resources/my/그림5.png").css("left",
										"87%");
							}
						}
					});
</script>
<script type="text/javascript">
	 $(function(){
	    	$('.usre_img').each(function (index, item) {	        	
	        	var imgUrl = '${pageContext.request.contextPath}/resources/users/user0' + Math.floor((Math.random() * 5) + 1) + '_sm.png';
	        	console.log(imgUrl);
	        	console.log($(item).attr("src"));
	        	$(item).attr("src", imgUrl);
			});
		});
</script>

</head>
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
	<!-- Content와 MainSection은 무조건 있어야함 -->
	<div class="charity-main-content">
		<!-- Main Section -->
		<div class="charity-main-section">

			<!-- https://www.bootdey.com/snippets/view/Update-user-profile#preview -->
			<div class="container">
				<div class="view-account">
					<section class="module">
						<div class="module-inner">

							<!-- sidebar -->
							<div class="side-bar">
								<!-- profile -->
							<%@ include file="/WEB-INF/views/my/mypage_profile.jsp"%>
							<!-- profile -->
								<nav class="side-menu">
									<ul class="nav">
										<li class="active"><a href="mypage"><span
												class="fa fa-user"> </span>&nbsp;&nbsp;Profile</a></li>
										<li><a href="ask"><span class="fa fa-question">
											</span>&nbsp;&nbsp;나의문의내역</a></li>
										<li><a href="content"><span class="fa fa-file">
											</span>&nbsp;&nbsp;나의인증내역</a></li>
										<li><a href="give"><span class="fa fa-handshake">
											</span>&nbsp;&nbsp;나의나눔내역</a></li>
										<li><a href="reply"><span class="fa fa-reply">
											</span>&nbsp;&nbsp;나의댓글내역</a></li>
										<li><a href="pay"><span class="fa fa-credit-card">
											</span>&nbsp;&nbsp;나의결제내역</a></li>
										<li><a href="point"><span
												class="fa fa-parking-circle"></span>&nbsp;&nbsp;나의포인트내역</a></li>

									</ul>
								</nav>
							</div>
							<!-- sidebar -->

							<div class="content-panel">
								<!-- <h2 class="title" >My Profile</h2>-->
								<div>&nbsp;</div>
								<div>&nbsp;</div>
								<div>&nbsp;</div>
								<div class="d-flex align-items-center">

									<div class="charity-team charity-simple-team inner-wrap">
										<div class="row">

											<div class="threebox" class="col-md-4"
												style="background-color: #FFDB8E;">
												<h6>&nbsp;</h6>
												<i class="far fa-parking-circle"
													style="color: 424242; font-size: 23px;"></i>
												<h6 style="color: 424242;">N.point</h6>
												<h1>
													<%-- <form action="${pageContext.request.contextPath}/my/ask"
														method="get"> ??--%>
													<span class="number2"><c:forEach var="vo1"
															items="${memberInfo}">
															<input type="hidden" value="${vo2.member_id} name=" member_id" />
															<c:forEach var="vo2" items="${vo1.pointList}">${vo2.nowpnt}pt</c:forEach>
														</c:forEach></span>
												</h1>

											</div>
											<div class="threebox" class="col-md-4"
												style="background-color: #FFAE73;">
												<h6>&nbsp;</h6>
												<i class="fal fa-hand-holding-usd"
													style="color: 424242; font-size: 23px;"></i>
												<h6 style="color: 424242;">나의 기부횟수</h6>
												<h1>
													<span class="number2"><sec:authentication
															property="principal.member.dntcnt" />회</span>
												</h1>
											</div>
											<div class="threebox" class="col-md-4"
												style="background-color: #FFC7A8;">
												<h6>&nbsp;</h6>
												<i class="fal fa-gift-card"
													style="color: 424242; font-size: 23px;"></i>
												<h6 style="color: 424242;">나의 나눔횟수</h6>
												<h1>
													<span class="number2"><sec:authentication
															property="principal.member.itemdntcnt" />회</span>
												</h1>
											</div>
										</div>


										<div>&nbsp;</div>

										<div class="row">

											<div class="twobox" class="col-md-4">

												<button
													class="charity-donation-parallex-btn w-30 text-black stats"
													type="button"
													onClick="location.href='${pageContext.request.contextPath}/my/donation/money/point'">
													포인트 기부하기</button>
											</div>
											<div class="twobox" class="col-md-4">

												<button
													class="charity-donation-parallex-btn w-30 text-black stats"
													type="button"
													onClick="location.href='${pageContext.request.contextPath}/my/donation/moneyDonationForm'">
													후원 기부하기</button>
											</div>
											<div class="twobox" class="col-md-4">

												<button
													class="charity-donation-parallex-btn w-30 text-black stats"
													type="button"
													onClick="location.href='${pageContext.request.contextPath}/donation/item/main'">
													물품 기부하기</button>
											</div>
										</div>
									</div>
								</div>
								<!-- 프로그래스바 -->
								<div class="charity-cause-donate">
									<h2 align="center"
										style="font-weight: bold; /* text-shadow: 1px 1px 3px #424242; */ color: #424242">나의
										기부 %는?</h2>
									<div class="progressbar">
										<img class="maxmax blinking" width="80" height="80">
										<div class="progress-label"></div>
									</div>
									<div
										data-width='<sec:authentication property="principal.member.dntcnt"/>'
										max='100' class="charity-cause-progressbar"></div>
									<h6>*기부횟수 %따라 그림이 바뀌어요.</h6>
								</div>
								<div>&nbsp;</div>
								<div>&nbsp;</div>
								<button
									class="charity-simple-blog-btn w-30 ml-2 text-white stats"
									type="button"
									onClick="location.href='${pageContext.request.contextPath}/board/notice/188'">기부금
									영수증</button>
							</div>
							<hr>
						</div>
				</div>
				</section>
			</div>
			<!-- container -->
		</div>

		<script>
			$("#mytabs>ul>li>a").each(function(i) {
				$(this).attr("href", "#mytab" + i)
			})
			$("#mytabs>div>div").each(function(i) {
				$(this).attr("id", "mytab" + i)
			})
		</script>

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
	<script src="/resources/charity/script/progressbar-my.js"></script>
	<script src="/resources/charity/script/fancybox.min.js"></script>
	<script src="/resources/charity/script/jquery.countdown.min.js"></script>
	<script src="https://maps.googleapis.com/maps/api/js"></script>
	<script src="/resources/charity/script/jquery.jplayer.js"></script>
	<script src="/resources/charity/script/jplayer.playlist.js"></script>
	<script src="/resources/charity/script/functions-main.js"></script>


</body>
</html>
