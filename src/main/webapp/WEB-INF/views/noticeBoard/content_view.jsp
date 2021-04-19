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


<meta name="_csrf" content="${_csrf.token}">
<meta id="_csrf_header" name="_csrf_header"
	content="${_csrf.headerName}">

<title>myprofile_content</title>

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

<style>
.faqHeader {
	font-size: 27px;
	margin: 20px;
}

.panel-heading [data-toggle="collapse"]:after {
	font-family: 'Glyphicons Halflings';
	content: "\e072"; /* "play" icon */
	float: right;
	color: #F58723;
	font-size: 18px;
	line-height: 22px;
	/* rotate "play" icon from > (right arrow) to down arrow */
	-webkit-transform: rotate(-90deg);
	-moz-transform: rotate(-90deg);
	-ms-transform: rotate(-90deg);
	-o-transform: rotate(-90deg);
	transform: rotate(-90deg);
}

.panel-heading [data-toggle="collapse"].collapsed:after {
	/* rotate "play" icon from > (right arrow) to ^ (up arrow) */
	-webkit-transform: rotate(90deg);
	-moz-transform: rotate(90deg);
	-ms-transform: rotate(90deg);
	-o-transform: rotate(90deg);
	transform: rotate(90deg);
	color: #454444;
}
</style>

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


	<!-- Content -->
	<div class="charity-main-content">

		<!-- Main Section -->
		<div class="charity-main-section">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<div class="widget_title">
							<h2>공지사항</h2>
						</div>
						<div class="charity-rich-editor charity-cause-detail">
							<div class="charity-volunteer-form">

								<form>
									<ul class="charity-cause-options">
										<li><i class="fa fa-map-marker-alt"></i>
											<h6>
												글번호 <input type="hidden" id="b_index"
													value="${content_view.b_index}">
												${content_view.b_index}
											</h6></li>
									</ul>
									<div>&nbsp;</div>
									<div>&nbsp;</div>
									<h3>
										<input type="hidden" id="b_index"
											value="${content_view.btitle}">
										${content_view.btitle}
									</h3>
									<ul class="charity-cause-options">
										<li><i class="fa fa-map-marker-alt"></i>
											<h6>
												작성자 : <input type="hidden" id="b_index"
													value="${content_view.member_id}">관리자
											</h6></li>
										<li><i class="fa fa-clock"></i>
											<h6>작성날짜 : ${content_view.bdate}</h6></li>
										<li><i class="fa fa-heart"></i>
											<h6>
												조회수 : <input type="hidden" id="b_index"
													value="${content_view.bhit}"> ${content_view.bhit}
											</h6></li>

									</ul>
									<div>&nbsp;</div>
									<div>&nbsp;</div>
									<div>&nbsp;</div>			
									<div>&nbsp;</div>
									<p style="height: auto;">
										<input type="hidden" id="b_index"
											value="${content_view.bcontent}">
										${content_view.bcontent}
									</p>
								</form>
							</div>

							<sec:authorize access="hasRole('ADMIN')">
								<!-- 관리자버튼권한 -->
								<button type="button" class="btn btn-primary"
									onclick="location.href='${pageContext.request.contextPath}/board/notice/modify/${content_view.b_index}'">수정</button>
								<!-- <input type="submit" class="btn btn-primary" value="수정">&nbsp;&nbsp;
							 -->
								<button type="button" class="btn btn-primary"
									onclick="location.href='delete?b_index=${content_view.b_index}'">삭제</button>&nbsp;&nbsp;					
						</sec:authorize>
							<button type="button" class="btn btn-primary"
								onclick="location.href='${pageContext.request.contextPath}/board/notice'">목록</button>


							<input type="hidden" name="${_csrf.parameterName}"
								value="${_csrf.token}" /> <input type="hidden"
								id="_csrf_header" name="_csrf_header"
								value="${_csrf.headerName}" />
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

	<!-- 자주묻는질문 -->
	<script type="text/javascript"
		src="/resources/faq/js/jquery-1.10.2.min.js"></script>
	<script type="text/javascript"
		src="/resources/faq/bootstrap/js/bootstrap.min.js"></script>

</body>
</html>