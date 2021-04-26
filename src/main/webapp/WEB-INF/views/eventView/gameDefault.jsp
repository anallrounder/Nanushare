<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">

<head>

<!-- meta tags -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Charity</title>

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
<!-- header -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
 
<!-- 웹페이지 탭 로고이미지 삽입  -->
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/nanulogo_ico_convert.ico"> 
<style type="text/css">
/*  a 태그 후버시 밑줄 속성 제거 */
a:hover { 
 	text-decoration: none;
}

#forimg {
	/* background-color: #eaf0fe; */
	background-image: url('/resources/banner_imgs/game_banner.png');
	background-repeat:no-repeat;
	background-position: center;
	background-height:100%;
}
.black-transparent {
	opacity:50%;
}
</style>
</head>

<body>
	<!-- Header -->
	<%@ include file="/WEB-INF/views/mainMap/mainHeader.jsp"%>
	<!-- Header -->

	    <!-- Banner -->
    <div id="forimg" class="charity-subheader">
       <span class="black-transparent"></span>
        <div class="container">
            <div class="row">
                <div class="col-md-12"> 
          <!--         <h1>나눔 인증</h1>
                    <p>show your support</p> -->
                </div>
            </div>
        </div>
    </div>
    <!-- Banner -->

    <!-- Content -->
    <div class="charity-fancy-title " style="margin-top:70px; margin-bottom:20px;">
		<h2> 재밌는 게임 하고 나눔 포인트 획득하세요. </h2>
	</div> 
	<div class="charity-main-content">

		<!-- Main Section -->
		<div class="charity-main-section">
			<div class="container">
				<div class="row">
					<div class="col-md-12">

						<!-- Team -->
						<div class="charity-prayer charity-grid-prayer">
							<ul class="row">
								<li class="col-md-4">
									<div class="charity-grid-prayer-wrap">
										<figure>
											<a href="#"><img
												src="/resources/charity/extra-images/puzzle.png" alt=""></a>
											<figcaption>
												<a href="/event/puzzle/play"
													class="charity-grid-prayer-hover"><i
													class="fa fa-share"></i></a>
											</figcaption>
										</figure>
										<div class="charity-grid-prayer-text">
											<h2>
												<a href="#"> 2048 퍼즐 게임 </a>
											</h2>
											<p>내 시간 단축의 한계는 어디까지인가</p>
											<a href="/event/puzzle/play" class="charity-grid-prayer-btn">
												게임 시작 </a>
											<ul class="charity-sermon-social">
												<li><a href="#" data-toggle="tooltip"
													data-placement="top" title="Notes"><i
														class="fa fa-sticky-note"></i></a></li>
												<li><a href="#" data-toggle="tooltip"
													data-placement="top" title="Download"><i
														class="fa fa-download"></i></a></li>
												<li><a href="#" data-toggle="tooltip"
													data-placement="top" title="Listening"><i
														class="fa fa-headphones"></i></a></li>
												<li><a href="#" data-toggle="tooltip"
													data-placement="top" title="Share"><i
														class="fa fa-share-alt"></i></a></li>
											</ul>
										</div>
									</div>
								</li>
								<li class="col-md-4">
									<div class="charity-grid-prayer-wrap">
										<figure>
											<a href="#"><img
												src="/resources/charity/extra-images/tetris.png" alt=""></a>
											<figcaption>
												<a href="/event/tetris/play"
													class="charity-grid-prayer-hover"><i
													class="fa fa-share"></i></a>
											</figcaption>
										</figure>
										<div class="charity-grid-prayer-text">
											<h2>
												<a href="#"> 모두가 아는 그 테트리스! </a>
											</h2>
											<p>
												스트레스 뿌셔뿌셔! 포인트 받고 기쁘셔! <br>꼬박꼬박 모아 기부하셔!
											</p>
											<a href="/event/tetris/play" class="charity-grid-prayer-btn">
												게임 시작 </a>
											<ul class="charity-sermon-social">
												<li><a href="#" data-toggle="tooltip"
													data-placement="top" title="Notes"><i
														class="fa fa-sticky-note"></i></a></li>
												<li><a href="#" data-toggle="tooltip"
													data-placement="top" title="Download"><i
														class="fa fa-download"></i></a></li>
												<li><a href="#" data-toggle="tooltip"
													data-placement="top" title="Listening"><i
														class="fa fa-headphones"></i></a></li>
												<li><a href="#" data-toggle="tooltip"
													data-placement="top" title="Share"><i
														class="fa fa-share-alt"></i></a></li>
											</ul>
										</div>
									</div>
								</li>
								<li class="col-md-4">
									<div class="charity-grid-prayer-wrap">
										<figure>
											<a href="#"><img
												src="/resources/charity/extra-images/lotto.png" alt=""></a>
											<figcaption>
												<a href="/event/lotto/play" class="charity-grid-prayer-hover"><i
													class="fa fa-share"></i></a>
											</figcaption>
										</figure>
										<div class="charity-grid-prayer-text">
											<h2>
												<a href="#"> 행운의 포인트 로또! </a>
											</h2>
											<p>
												여기가 바로 포인트 득템 명당! <br> 여러분의 행운 점수는 과연?
											</p>
											<a href="/event/lotto/play" class="charity-grid-prayer-btn"> 게임 시작 </a>
											<ul class="charity-sermon-social">
												<li><a href="#" data-toggle="tooltip"
													data-placement="top" title="Notes"><i
														class="fa fa-sticky-note"></i></a></li>
												<li><a href="#" data-toggle="tooltip"
													data-placement="top" title="Download"><i
														class="fa fa-download"></i></a></li>
												<li><a href="#" data-toggle="tooltip"
													data-placement="top" title="Listening"><i
														class="fa fa-headphones"></i></a></li>
												<li><a href="#" data-toggle="tooltip"
													data-placement="top" title="Share"><i
														class="fa fa-share-alt"></i></a></li>
											</ul>
										</div>
									</div>
								</li>
								<li class="col-md-4">
									<div class="charity-grid-prayer-wrap">
										<figure>
											<a href="#"><img
												src="/resources/charity/extra-images/freeze.png" alt=""></a>
											<figcaption>
												<a href="#" class="charity-grid-prayer-hover"><i
													class="fa fa-share"></i></a>
											</figcaption>
										</figure>
										<div class="charity-grid-prayer-text">
											<h2>
												<a href="#"> 서비스 준비중입니다 </a>
											</h2>
											<ul class="charity-grid-prayer-location">
											</ul>
											<p>👉👈...</p>
											<!-- <a href="#" class="charity-grid-prayer-btn">Read More</a> -->
											<!-- <ul class="charity-sermon-social">
                                                <li><a href="#" data-toggle="tooltip" data-placement="top" title="Notes"><i class="fa fa-sticky-note"></i></a></li>
                                                <li><a href="#" data-toggle="tooltip" data-placement="top" title="Download"><i class="fa fa-download"></i></a></li>
                                                <li><a href="#" data-toggle="tooltip" data-placement="top" title="Listening"><i class="fa fa-headphones"></i></a></li>
                                                <li><a href="#" data-toggle="tooltip" data-placement="top" title="Share"><i class="fa fa-share-alt"></i></a></li>
                                            </ul> -->
										</div>
									</div>
								</li>
								<li class="col-md-4">
									<div class="charity-grid-prayer-wrap">
										<figure>
											<a href="#"><img
												src="/resources/charity/extra-images/freeze.png" alt=""></a>
											<figcaption>
												<a href="#" class="charity-grid-prayer-hover"><i
													class="fa fa-share"></i></a>
											</figcaption>
										</figure>
										<div class="charity-grid-prayer-text">
											<h2>
												<a href="#"> 서비스 준비중입니다 </a>
											</h2>
											<ul class="charity-grid-prayer-location">
											</ul>
											<p>👉👈...</p>
											<!--   <a href="#" class="charity-grid-prayer-btn">Read More</a> -->
											<!-- <ul class="charity-sermon-social">
                                                <li><a href="#" data-toggle="tooltip" data-placement="top" title="Notes"><i class="fa fa-sticky-note"></i></a></li>
                                                <li><a href="#" data-toggle="tooltip" data-placement="top" title="Download"><i class="fa fa-download"></i></a></li>
                                                <li><a href="#" data-toggle="tooltip" data-placement="top" title="Listening"><i class="fa fa-headphones"></i></a></li>
                                                <li><a href="#" data-toggle="tooltip" data-placement="top" title="Share"><i class="fa fa-share-alt"></i></a></li>
                                            </ul> -->
										</div>
									</div>
								</li>
								<li class="col-md-4">
									<div class="charity-grid-prayer-wrap">
										<figure>
											<a href="#"><img
												src="/resources/charity/extra-images/comingsoon.png" alt=""></a>
											<figcaption>
												<a href="#" class="charity-grid-prayer-hover"><i
													class="fa fa-share"></i></a>
											</figcaption>
										</figure>
										<div class="charity-grid-prayer-text">
											<h2>
												<a href="#"> 서비스 준비중입니다 </a>
											</h2>
											<ul class="charity-grid-prayer-location">
											</ul>
											<p>👉👈...</p>
											<!--  <a href="#" class="charity-grid-prayer-btn">Read More</a> -->
											<!-- <ul class="charity-sermon-social">
                                                <li><a href="#" data-toggle="tooltip" data-placement="top" title="Notes"><i class="fa fa-sticky-note"></i></a></li>
                                                <li><a href="#" data-toggle="tooltip" data-placement="top" title="Download"><i class="fa fa-download"></i></a></li>
                                                <li><a href="#" data-toggle="tooltip" data-placement="top" title="Listening"><i class="fa fa-headphones"></i></a></li>
                                                <li><a href="#" data-toggle="tooltip" data-placement="top" title="Share"><i class="fa fa-share-alt"></i></a></li>
                                            </ul> -->
										</div>
									</div>
								</li>
							</ul>
						</div>
						<!-- Team -->

						<!-- Pagination -->
						<div class="charity-pagination">
							<ul class="page-numbers">
								<li><a class="previous page-numbers" href="/event/game"><span
										aria-label="Next"><i class="fa fa-angle-left"></i> 처음
											페이지로 </span></a></li>
								<li><span class="page-numbers current">01</span></li>
								<li><a class="page-numbers" href="404.html">02</a></li>
								<li><a class="page-numbers" href="404.html">03</a></li>
								<li><a class="page-numbers" href="404.html">...</a></li>
								<li><a class="page-numbers" href="404.html">10</a></li>
								<li><a class="next page-numbers" href="404.html"><span
										aria-label="Next"> 다음 페이지로 <i class="fa fa-angle-right"></i></span></a></li>
							</ul>
						</div>
						<!-- Pagination -->
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

	<!-- jQuery -->
	<script src="/resources/charity/script/jquery.js"></script>
	<script src="/resources/charity/script/popper.min.js"></script>
	<script src="/resources/charity/script/bootstrap.min.js"></script>
	<script src="/resources/charity/script/slick.slider.min.js"></script>
	<script src="/resources/charity/script/progressbar-main.js"></script>
	<!-- progressbar 복붙해서 사용  -->
	<script src="/resources/charity/script/fancybox.min.js"></script>
	<script src="/resources/charity/script/jquery.countdown.min.js"></script>
	<script src="https://maps.googleapis.com/maps/api/js"></script>
	<script src="/resources/charity/script/jquery.jplayer.js"></script>
	<script src="/resources/charity/script/jplayer.playlist.js"></script>
	<script src="/resources/charity/script/functions-main.js"></script>
	<!-- fuctions 복붙해서 사용 -->

	<!-- IONICONS -->
	<script src="https://unpkg.com/ionicons@5.2.3/dist/ionicons.js"></script>

	<!-- JS -->
	<script src="/resources/sidebar/js/main.js"></script>


</body>

</html>
