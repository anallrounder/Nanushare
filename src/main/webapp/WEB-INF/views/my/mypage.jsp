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
<link rel="stylesheet" type="text/css"
	href="/resources/charity/css/imgblink_hj.css">

<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" />


<style>
.maxmax {
	position: relative;
}

li {
	list-style: none;
}

.threebox {
	border: 1px solid lightgray;
	box-sizing: border-box;
	width: 270px;
	height: 180px;
	margin: 10px auto;
	padding: 10px auto;
	border-radius: 20px 20px 20px 20px;
	text-align: center;
	padding: 10px auto;
}

.number2 {
	text-align: center;
}
</style>

<script type="text/JavaScript"
	src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/JavaScript"
	src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
	jQuery(document)
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
							<div class="user-info">
								<img class="img-profile img-circle img-responsive center-block"
									src="/resources/my/프로필사진.PNG" alt="">
								<!-- 
									src="https://bootdey.com/img/Content/avatar/avatar1.png" alt=""> -->
								<ul class="meta list list-unstyled">
									<li class="name"><h2>
											<sec:authentication property="principal.member.name" />
										</h2></li>
									<li class="email"><sec:authentication property="principal.member.member_id" /></a></li>
									<li class="activity">
									
									<sec:authentication
											property="principal.member" var="buttonhidden" /> <sec:authorize
											access="isAuthenticated()">
											
											<c:if test="${buttonhidden.signuppath == 'home'}">

												<button class="charity-simple-blog-btn w-100 text-white stats"
													type="submit"
													onclick="location.href ='${pageContext.request.contextPath}/my/myprofile'">
													프로필수정</button>
											
											</c:if>
										</sec:authorize>
										
										<sec:authentication
											property="principal.member" var="buttonhidden" /> <sec:authorize
											access="isAuthenticated()">
											
											<c:if test="${buttonhidden.signuppath != 'home'}">

												<button class="charity-simple-blog-btn w-100 text-white stats"
													type="submit"
													onclick="location.href ='${pageContext.request.contextPath}/my/drop'">
													회원탈퇴</button>
											
											</c:if>
										</sec:authorize>
										
										</li>
								</ul>
							</div>
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
								<li><a href="reply"><span class="fa fa-reply"> </span>&nbsp;&nbsp;나의댓글내역</a></li>
								<li><a href="pay"><span class="fa fa-credit-card">
									</span>&nbsp;&nbsp;나의결제내역</a></li>
							</ul>
							</nav>
						</div>
						<!-- sidebar -->

						<div class="content-panel">
							<h2 class="title">My Profile</h2>
							<div>&nbsp;</div>
							<div>&nbsp;</div>
							<div>&nbsp;</div>
							<div class="d-flex align-items-center">

								<div class="charity-team charity-simple-team inner-wrap">
									<div class="row">

										<li class="threebox" class="col-md-4"><div>&nbsp;</div> <span>나의
												포인트</span>
											<h4 class="mb-4 mt-4 col-md-4">
												<form action="${pageContext.request.contextPath}/my/ask"
													method="get">
													<span class="number2"><c:forEach var="vo1"
															items="${memberInfo}">
															<input type="hidden" value="${vo2.member_id} name=" member_id" />
															<c:forEach var="vo2" items="${vo1.pointList}">${vo2.nowpnt}</c:forEach>
														</c:forEach>pt</span>
											</h4>
											<button class="charity-simple-blog-btn w-30 text-white stats"
												type="button"
												onClick="location.href='${pageContext.request.contextPath}/my/donation/money/point'">
												기부하기</button></li>
										<li class="threebox" class="col-md-4"><div>&nbsp;</div> <span
											class="followers">나의 기부횟수</span>
											<h4 class="mb-4 mt-4 col-md-4">
												<span class="number2"><sec:authentication
														property="principal.member.dntcnt" />회</span>
											</h4></li>
										<li class="threebox" class="col-md-4"><div>&nbsp;</div> <span
											class="followers">나의 나눔횟수</span>
											<h4 class="mb-4 mt-4 col-md-4">
												<span class="number1"><sec:authentication
														property="principal.member.itemdntcnt" />회</span>
											</h4></li>
									</div>
								</div>
							</div>
							<div>&nbsp;</div>
							<div>&nbsp;</div>
							<div>&nbsp;</div>
							<div>&nbsp;</div>
							<!-- 프로그래스바 -->
							<div class="charity-cause-donate">
								<h4 align="center">나의 기부 %는?</h4>
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
								class="charity-simple-blog-btn w-30 ml-2 text-white stats" type="button" onClick="location.href='${pageContext.request.contextPath}/board/notice/188'">기부금
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
	<script src="/resources/charity/script/functions-main.js"></script>


</body>
</html>
