<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<!-- meta tags -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>myprofile_edit</title>

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

<!-- font-awesome 부트스트랩 이모티콘 -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
</head>

<style>
.charity-simple-blog-btn {
	border: 0;
}
</style>
<body>
	<!-- Header -->
	<header id="charity-header" class="charity-header-one"
		style="position:relative;z-index:2"> <!-- Top Strip -->
	<div class="charity-top-strip">
		<aside> <a href="${pageContext.request.contextPath}/main"
			class="charity-logo"
			style="width: 200px; height: 100px; margin: 0px 0px 0px 20px;"><img
			src="/resources/nanulogo.png" alt=""></a></aside>
		<div class="container">
			<div class="row">
				<aside class="col-12">
				<div class="float-center">
					<a href="#menu" class="menu-link active"><span></span></a>
					<nav id="menu" class="menu charity-navigation">

					<ul>
						<!-- <li class="active"><a href="index.html">Home</a></li> -->
						<li style="padding: 0px 40px 0px 70px"><a href="#"
							style="font-size: 20px;">나누셰어란?</a>
							<ul class="children">
								<li><a href="${pageContext.request.contextPath}/menu/about">나누셰어
										소개</a></li>
								<li><a href="${pageContext.request.contextPath}/menu/way">찾아오셰어</a></li>
								<!--     <li><a href="event-detail.html">Event Detail</a></li> -->
							</ul></li>
						<li style="padding: 0px 40px 0px 30px"><a href="#"
							style="font-size: 20px;">나눔함 안내</a> <!--  <ul class="children">
                                            <li><a href="cause-list.html">Cause List</a></li>
                                            <li><a href="cause-grid.html">Cause Grid</a></li>
                                            <li><a href="cause-detail.html">Cause Detail</a></li>
                                        </ul> --></li>
						<li style="padding: 0px 40px 0px 30px"><a href="#"
							style="font-size: 20px;">나누기</a>
							<ul class="children">
								<li><a href="blog-large.html">물품 나누기</a></li>
								<li><a href="blog-medium.html">돈기부여하기</a></li>
								<!-- <li><a href="blog-detail.html">Cause Detail</a></li> -->
							</ul></li>
						<li style="padding: 0px 40px 0px 30px"><a href="#"
							style="font-size: 20px;">나눔 인증</a> <!--  <ul class="children">
                                            <li><a href="team-grid.html">Team Grid</a></li>
                                            <li><a href="team-classic.html">Team Classic</a></li>
                                            <li><a href="team-detail.html">Team Detail</a></li>
                                        </ul> --></li>
						<li style="padding: 0px 40px 0px 30px"><a href="#"
							style="font-size: 20px;">이벤트</a>
							<ul class="children">
								<li><a href="about.html">출석체크</a></li>
								<li><a href="prayer-list.html">테스트</a></li>
								<li><a href="prayer-grid.html">게임</a></li>
								<!--  <li><a href="prayer-detail.html">Prayer De1tail</a></li>
                                            <li><a href="404.html">404 Error</a></li>
                                            <li><a href="search-result.html">Search Result</a></li> -->
							</ul></li>
						<li style="padding: 0px 40px 0px 30px"><a
							href="contact-us.html" style="font-size: 20px;">더하기</a>
							<ul class="children">
								<li><a href="about.html">공지사항</a></li>
								<li><a href="prayer-list.html">문의하기</a></li>
							</ul></li>


					</ul>
					<!--  <span class="float-right">
                                    <a href="#" class="charity-strip-btn charity-bgcolor" style="width:100px;height:30px;">Sign up</a>
                          			<a href="#" class="charity-strip-btn charity-bgcolor" style="width:100px;height:30px;">Sign in</a>
                                </span> --> </nav>

					<!--    <ul class="charity-header-options" style="text-align: center">
                                <li><a href="#" data-toggle="modal" data-target="#searchModal"><i class="fas fa-search"></i></a></li>
                                <li><a href="#"><i class="fab fa-opencart"></i></a> <div class="charity-cart-box"> <p>No products in the cart.</p> </div> </li>
             
                                <li> <a href="#" class="charity-strip-btn charity-bgcolor" style="width:100px;height:30px;">Sign up</a></li>
                          		<li><a href="#" class="charity-strip-btn charity-bgcolor" style="width:100px;height:30px;">Sign in</a></li>
                                
                            </ul>
                             -->

				</div>

				</aside>


				<!--     <aside class="col-12"> 
                        <div class="float-right">
                          <ul class="charity-social-network">
                              <li><a href="#" class="fab fa-facebook-f"></a></li>
                              <li><a href="#" class="fab fa-google"></a></li>
                              <li><a href="#" class="fab fa-pinterest-p"></a></li>
                              <li><a href="#" class="fab fa-linkedin-in"></a></li>
                              <li><a href="#" class="fab fa-twitter"></a></li>
                          </ul>
                          <a href="#" class="charity-strip-btn charity-bgcolor" >Sign up</a>
                          <a href="#" class="charity-strip-btn charity-bgcolor">Sign in</a>
                         
                        </div>
                    </aside> -->
			</div>
		</div>
		<aside> <a href="#" class="charity-strip-btn charity-bgcolor"
			style="width: 70px; height: 40px; white-space: nowrap; padding: 10px 0px 0px 6px; margin: -75px 50px 0px 0px;">Sign
			up</a> <a href="#" class="charity-strip-btn charity-bgcolor"
			style="width: 70px; height: 40px; white-space: nowrap; padding: 10px 5px 0px 10px; margin: -75px 140px 0px 0px;">Sign
			in</a> </aside>
	</div>
	<!-- Top Strip --> </header>


	<!-- Banner -->
	<div class="charity-subheader">
		<span class="black-transparent"></span>
		<div class="container">
			<div class="row">
				<div class="col-md-12"></div>
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
					<div class="col-md-12">
						<div class="charity-fancy-title">
							<h2>찾아오셰어</h2>
						</div>
						<!-- Main Section -->
						<div class="charity-main-section charity-aboutus-text-full">
							<div class="container">
								<div class="row">

									<div class="col-md-12">
										<div class="charity-aboutus-text">
											<i class="fas fa-phone fa-2x"> 연락처</i>

											<h6>
												<br>대표전화 02-722-1481 <br><br><br>
											</h6>
											<br> <br> <i class="fas fa-clock fa-2x"> 영업시간</i>
											<h6>
												<br>월-금 10:00 ~ 17:00 | 주말 및 공휴일 휴무 | 점심시간 오후 12:00 ~
												13:00<br><br><br>
											</h6>
											<br> <br> <i class="fas fa-map-marker-alt fa-2x">
												주소</i>
											<h6>
												<br> 도로명 주소 : (우)03164 서울특별시 종로구 종로 2가 종로69<br>
											</h6>
											<p>
												<img src="/resources/my/찾아오셰어지도.PNG" height="2727"
													width="1680.75">
											</p>
										</div>
									</div>

								</div>
							</div>
						</div>
						<!-- Main Section -->





					</div>
				</div>

			</div>
		</div>
	</div>
	<!-- Main Section -->

	<!-- Main Section -->
	<div class="charity-main-section map-full">
		<div class="container-fluid">
			<div class="row">
				<div id="map"></div>
			</div>
		</div>
	</div>
	<!-- Main Section -->

	</div>
	<!-- Content -->


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
						<input type="submit" value=""> <input type="button"
							value="취소" onClick="history.go(-2)"
							class="charity-simple-blog-btn"> <a
							href="${pageContext.request.contextPath}/my/mypage"
							class="charity-simple-blog-btn">저장</a> <i class="fa fa-search"></i>
					</form>
				</div>

			</div>
		</div>
	</div>


	<!-- Footer -->
	<footer id="charity-footer" class="charity-footer-one"> <!-- Footer Widget -->
	<div class="charity-footer-widget">
		<div class="container">

			<!-- CopyRight -->
			<div class="charity-copyright">
				<a href="/resources/charity/#" class="back-top charity-bgcolor"><i
					class="fa fa-angle-up"></i></a>
				<p>© 2021, All Right Reserved - by</p>
				<ul>
					<li><a href="/resources/charity/404.html">Terms and
							conditions</a></li>
					<li><a href="/resources/charity/404.html">Privacy policy</a></li>
				</ul>
			</div>
			<!-- CopyRight -->
		</div>
	</div>
	<!-- Footer Widget --> </footer>
	<!-- Footer -->




	<!-- jQuery -->
	<script src="/resources/charity/script/jquery.js"></script>
	<script src="/resources/charity/script/popper.min.js"></script>
	<script src="/resources/charity/script/bootstrap.min.js"></script>
	<script src="/resources/charity/script/slick.slider.min.js"></script>
	<script src="/resources/charity/script/progressbar.js"></script>
	<script src="/resources/charity/script/fancybox.min.js"></script>
	<script src="/resources/charity/script/jquery.countdown.min.js"></script>
	<script
		src="/resources/charity/https://maps.googleapis.com/maps/api/js"></script>
	<script src="/resources/charity/script/jquery.jplayer.js"></script>
</body>
</html>