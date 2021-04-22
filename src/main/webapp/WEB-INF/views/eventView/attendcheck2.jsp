<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<!doctype html>
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








<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<script type='text/javascript'
	src='https://www.jestina.co.kr/content/js/swiper.3.4.1/swiper.jquery.min.js'></script>
<link rel="stylesheet" type="text/css"
	href="https://www.jestina.co.kr/content/css/reset2.css">
<link rel="stylesheet" type="text/css"
	href="https://www.jestina.co.kr/content/ux/content/css/common.css">
<link rel="stylesheet" type="text/css"
	href="https://www.jestina.co.kr/content/css/swiper.min.css">
<!--이벤트/기획 공통-->
<script type="text/javascript"
	src="https://webimg.jestina.co.kr/UpData/jestina/event/@assets/sub.common.version.02.js"></script>
<link rel="stylesheet"
	href="https://webimg.jestina.co.kr/UpData/jestina/event/@assets/sub.common.version.01.css">


<script type="text/javascript">
	$(document)
			.ready(
					function() {
						var prize = 'product03';
						// roulette_product_end = 이벤트 종료 : 룰렛엔 없어용

						// product01 = 조엘 컬러바
						// product02 = 크리스피기프티콘
						// product03 = 스타벅스 기프티콘
						// product04 = 더블 5,000원 쿠폰번호 1397
						// product05 = 더블 3,000원 쿠폰번호 1396
						// product06 = 더블 1,000원 쿠폰번호 1395

						// product07 = 이미참여하셨습니다

						$('#start-rotate')
								.click(
										function() {
											if (prize == 'product01') {
												var degrees = 65;
												rotate(degrees);
												$('#resultImg')
														.attr(
																'src',
																'http://webimg.jestina.co.kr/UpData/jestina/event/201201_jWeek/roulette_product_01.png');
												window.setTimeout(resultLayer,
														5400);
											} else if (prize == 'product02') {
												var degrees = 120;
												rotate(degrees);
												$('#resultImg')
														.attr(
																'src',
																'http://webimg.jestina.co.kr/UpData/jestina/event/201201_jWeek/roulette_product_02.png');
												window.setTimeout(resultLayer,
														5400);
											} else if (prize == 'product03') {
												var degrees = 0;
												rotate(degrees);
												$('#resultImg')
														.attr(
																'src',
																'http://webimg.jestina.co.kr/UpData/jestina/event/201201_jWeek/roulette_product_03.png');
												window.setTimeout(resultLayer,
														5400);
											} else if (prize == 'product04') {
												var degrees = 220;
												rotate(degrees);
												$('#resultImg')
														.attr(
																'src',
																'http://webimg.jestina.co.kr/UpData/jestina/event/201201_jWeek/roulette_product_04.png');
												window.setTimeout(resultLayer,
														5400);
											} else if (prize == 'product05') {
												var degrees = 290;
												rotate(degrees);
												$('#resultImg')
														.attr(
																'src',
																'http://webimg.jestina.co.kr/UpData/jestina/event/201201_jWeek/roulette_product_05.png');
												window.setTimeout(resultLayer,
														5400);
											} else if (prize == 'product06') {
												var degrees = 160;
												rotate(degrees);
												$('#resultImg')
														.attr(
																'src',
																'http://webimg.jestina.co.kr/UpData/jestina/event/201201_jWeek/roulette_product_06.png');
												window.setTimeout(resultLayer,
														5400);
											}
										});

						function rotate(degrees) {
							$("#roulette-gift").rotate({
								angle : 0,
								animateTo : 360 * 5 + degrees,
								easing : $.easing.easeInOutElastic,
								duration : 5000
							});
						}
						;

						function resultLayer() {
							$('.resultLayer').css('display', 'block');
						}
						;

						$('#closeLayer').click(function() {
							$('.resultLayer').css('display', 'none');

							$("#roulette-gift").rotate({
								angle : 0,
								duration : 0
							});
						});
					});
</script>
<style type="text/css">

/*룰렛*/
.roulette-wrapper {
	position: absolute;
	left: 0;
	right: 0;
	top: 38%;
	margin: 0 auto;
	width: 100%;
	max-width: 669px;
}

.resultLayer {
	position: absolute;
	width: 100%;
	height: 100%;
	display: none;
	z-index: 10;
	box-sizing: border-box;
	max-width: 456px;
	left: 0;
	right: 0;
	top: 10rem;
	margin: 0 auto;
}

.resultLayer #closeLayer {
	position: absolute;
	top: -2rem;
	right: -2rem;
	margin: 0 auto;
	width: 18.5%;
	box-sizing: border-box;
}

.roulette-wrapper #roulette-bg {
	position: relative;
	z-index: 2;
}

.roulette-wrapper #roulette-gift {
	position: absolute;
	z-index: 2;
	top: 40px;
	bottom: 0;
	left: 0;
	right: 0;
	margin: 0 auto;
	max-width: 600px;
	width: 100%;
}

.roulette-wrapper #roulette-niddle {
	position: absolute;
	z-index: 3;
	width: 6.2%;
	top: 0;
	left: 0;
	right: 0;
	margin: 0 auto;
}

.roulette-wrapper #roulette-startBtn {
	position: absolute;
	z-index: 3;
	width: 36.7%;
	top: 31.5%;
	left: 0;
	right: 0;
	margin: 0 auto;
	left: -9px;
}
</style>

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
	<div class="charity-main-content">

		<!-- Main Section -->
		<div class="charity-main-section">

			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<div class="jestina-sub-project__wrap">
							<section class="jestina-sub-project-02" id="02">
								<div class="jestina-sub-project__inner">
									<div class="roulette-wrapper">
										<!--룰렛 맨뒷판  -->
										<img id="roulette-bg"
											src="http://webimg.jestina.co.kr/UpData/jestina/event/201201_jWeek/roulette_bg.png">
										<!-- 포인트 종류 -->
										<img id="roulette-gift"
											src="/resources/menu/roulette_product.png">
										<!-- 룰렛핀 -->
										<img id="roulette-niddle"
											src="http://webimg.jestina.co.kr/UpData/jestina/event/201201_jWeek/roulette_niddle.png">
										<!-- 버튼 -->
										<button id="start-rotate">
											<img id="roulette-startBtn"
												src="/resources/menu/roulette_btn.png">
										</button>
									</div>
								</div>
							</section>
						</div>
						<!-- 룰렛끝 -->
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Footer -->
	<%@ include file="/WEB-INF/views/mainMap/mainFooter.jsp"%>
	<!-- Footer -->
	<script type='text/javascript'
		src='http://php-jestina2.azurewebsites.net/scripts/jQueryRotate.js'></script>
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