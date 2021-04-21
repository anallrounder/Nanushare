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

<!-- 부트스트랩 아이콘 -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

<!-- SIDE BAR 1 CSS -->
<!-- <link rel="stylesheet" href="/resources/sidebar/css/styles.css"> -->


</head>

<style>
.charity-simple-blog-btn {
	border: 0;
}

​h3 {
	text-align: center;
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
					<div class="col-md-12">
						<!-- <div class="charity-fancy-title">
							<h2>나누셰어란?</h2>
						</div> -->
						<!-- Main Section -->
						<div class="charity-main-section charity-aboutus-text-full">
							<div class="container">
								<div class="row">
									<div class="col-md-12"
										style="background-color: lightgray; text-align: center;">
										<div>&nbsp;</div>
										<div>&nbsp;</div>
										<h3>나누셰어는</h3>
										<h3>함께 나누면서 변화를 만들어가는</h3>
										<h3>공유 플랫폼입니다.</h3>
										<h3>
											<i>"나누셰어와 함께 나누세요"</i>
										</h3>
										<img src="/resources/my/about그림.png" height="559;"
											max-width="100%;">
									</div>
									<div>
										<div class="charity-aboutus-text">
											<br> <br> <br> <br> <i
												class="fas fa-hand-holding-heart" style="color: #FFAE73; font-size: 25px;">나누셰어 의미</i>
											<h6>
												<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;나눔이란 가진 것을 공유하는 것으로 나누면 두 배가 되는 사회를 꿈꾸는 사람들이 모여
												"나누셰어" 프로젝트가 시작되었습니다.</h6>
											<h6>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;나눔과 더불어 사는 것을 더 많은 사람들과 함께 실천해 좀 더 나은
												사회를 만들어 가기를 바랍니다.</h6>
											


										</div>
									</div>
									<div class="col-md-5">
										<div class="charity-aboutus-text">
											<i class="fas fa-hand-holding-heart" style="color: #FFAE73; font-size: 25px;"> 나누셰어 로고</i> <img
												src="/resources/menu/나누셰어 그림.png" alt="">
											</figure>
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