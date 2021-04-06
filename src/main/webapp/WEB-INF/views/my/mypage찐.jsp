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

<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" />



<style type="text/css">
//
CSS의 position 속성을 이용하여 두개의 DIV 레이아웃을 겹친다 . .u.i-progressbar {
	position: relative;
}

.progress-label {
	position: absolute;
	left: 50%;
	top: 8px;
	font-weight: bold;
	margin-left: -40px;
}
</style>
<style>
li {
	list-style: none;
}
</style>

<script type="text/JavaScript"
	src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/JavaScript"
	src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">

var imag = 
	
	if(0<=)


$.ajax({ 
	url:"${pageContext.request.contextPath}/my/myprofile",
	//dataType: "image/jpeg",
	contentType: "image/png",
	success: function(data) {
	$("#maxmax").attr("src", "/resources/my/그림1.png");
	}
	}); 
</script>
</head>
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
					<h1>mypage</h1>

				</div>
			</div>
		</div>
	</div>
	<!-- Banner -->
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
						<div class="side-bar">
							<div class="user-info">
								<img class="img-profile img-circle img-responsive center-block"
									src="https://bootdey.com/img/Content/avatar/avatar1.png" alt="">
								<ul class="meta list list-unstyled">
									<li class="name"><h2>
											<sec:authentication property="principal.member.name" />
										</h2></li>
									<li class="email"><sec:authentication
											property="principal.member.member_id" /></a></li>
									<li class="activity">Last logged in: Today at 2:18pm</li>
								</ul>
							</div>
							<nav class="side-menu">
							<ul class="nav">
								<li class="active"><a href="mypage"><span
										class="fa fa-user"></span> Profile</a></li>
								<li><a href="ask"><span class="fa fa-cog"> </span>나의문의내역</a></li>
								<li><a href="content"><span class="fa fa-credit-card">
									</span>나의인증내역</a></li>
								<li><a href="give"><span class="fa fa-envelope">
									</span>나의나눔내역</a></li>
								<li><a href="mypage_4"><span class="fa fa-th"> </span>나의댓글내역</a></li>
								<!-- <li><a href="#"><span class="fa fa-clock-o"></span>
								Reminders</a></li> -->
							</ul>
							</nav>
						</div>
						<div class="content-panel">
							<h2 class="title">
								Profile<span class="pro-label label label-warning">PRO</span>
							</h2>
							<form class="form-horizontal">
								<fieldset class="fieldset">
									<h3 class="fieldset-title">Personal Info</h3>
									<!-- <div class="form-group avatar">
										<figure class="figure col-md-2 col-sm-3 col-xs-12"> <img
											class="img-rounded img-responsive"
											src="https://bootdey.com/img/Content/avatar/avatar1.png"
											alt=""> </figure>
										<div class="form-inline col-md-10 col-sm-9 col-xs-12">
											<input type="file" class="file-uploader pull-left">
											<button type="submit"
												class="btn btn-sm btn-default-alt pull-left">Update
												Image</button>
										</div>
									</div> -->

									<div class="container2 mt-5 d-flex justify-content-right">
										<div class="card p-3">
											<div class="d-flex align-items-center">
												<div class="ml-2 auto">

													<span>나의 포인트</span>
													<h4 class="mb-2 mt-3">
														<sec:authentication property="principal.member.dntcnt" />
													</h4>
													<!-- <div
												class="p-2 mt-2 bg-primary d-flex justify-content-between rounded text-white stats"> -->
												</div>
											</div>
										</div>
									</div>
									<div class="button mt-2 d-flex flex-row align-items-center">
										<button class="charity-simple-blog-btn w-30 text-white stats"
											onclick="${pageContext.request.contextPath}/donation/money/point">
											기부하기</button>

									</div>
									<div
										class="p-2 mt-2 bg d-flex justify-content-between rounded text-black stats">
										<div class="d-flex flex-column">
											<span class="articles">나눔횟수</span> <span class="number1"><sec:authentication
													property="principal.member.itemdntcnt" /></span>
										</div>
										<div class="d-flex flex-column">
											<span class="followers">기부횟수</span> <span class="number2"><sec:authentication
													property="principal.member.dntcnt" /></span>
										</div>
										<div class="d-flex flex-column">
											<span class="rating">Rating</span> <span class="number3">8.9</span>
										</div>
									</div>

									<div class="charity-cause-donate">
										<div class="skillst" id="maxmax">
											<!-- 수정필요 -->
											<!-- <h6>
										data-width를 바꾸면 %가 달라짐 그림추가<span>해야함</span>
									</h6> -->
											<img src="/resources/my/그림1.png" height="80" width="80">
											<img src="/resources/my/그림2.png" height="80" width="80">
											<img src="/resources/my/그림3.png" height="80" width="80">
											<img src="/resources/my/그림4.png" height="80" width="80">
											<img src="/resources/my/그림5.png" height="80" width="80">
											<img src="/resources/my/그림6.png" height="80" width="80">
											
											<!-- <h6 class="skillst-right">
										막대바가 <span>올곳</span>
									</h6> -->

											<div data-width='11' max='100'
												class="charity-cause-progressbar"></div>
										</div>
									</div>






								</fieldset>

								<hr>

							</form>

							<div class="button mt-2 d-flex flex-row align-items-center">
								<button class="charity-simple-blog-btn w-100 text-white stats"
									type="submit"
									onclick="location.href ='${pageContext.request.contextPath}/my/myprofile'">
									프로필수정</button>
								<button
									class="charity-simple-blog-btn w-100 ml-2 text-white stats">기부영수증</button>
							</div>
						</div>
					</div>
					</section>
				</div>
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
	</div>

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
	<script src="/resources/charity/script/progressbar-my.js"></script>
	<script src="/resources/charity/script/fancybox.min.js"></script>
	<script src="/resources/charity/script/jquery.countdown.min.js"></script>
	<script src="https://maps.googleapis.com/maps/api/js"></script>
	<script src="/resources/charity/script/jquery.jplayer.js"></script>
	<script src="/resources/charity/script/jplayer.playlist.js"></script>
	<script src="/resources/charity/script/functions.js"></script>
</body>
</html>
