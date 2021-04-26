<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<!-- meta tags -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">


<meta name="_csrf" content="${_csrf.token}">
<meta id="_csrf_header" name="_csrf_header"	content="${_csrf.headerName}">

<title>NanuShare</title>

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
<link rel="stylesheet"	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

<!-- 상단 로그인버튼 위치 -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">


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
.charity-blog-social ul {
   margin:0px;
}
.charity-simple-blog-btn {
	border: 0;
}

​h3 {
	text-align: center;
}

#forimg {
	background-color: #eaf3fa;
	background-image: url('/resources/charity/qna/notice_banner2.jpg');
	background-size: 500px;
	background-repeat: no-repeat;
	background-position: center;	
}

.black-transparent {
	opacity: 50%;
}

.charity-volunteer-form {
	background-color: #f9f9fb;
}
</style>

<body style="background-color: #f9f9fb">
	<!-- Header -->
	<%@ include file="/WEB-INF/views/mainMap/mainHeader.jsp"%>
	<!-- Header -->
	
	<!-- Banner -->
	<div id="forimg" class="charity-subheader">
       <span class="black-transparent"></span>
        <div class="container">
            <div class="row">
                <div class="col-md-12"> 
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
					<div class="col-md-12">
						<div class="widget_title">
							<h2>공지사항</h2>
						</div>
						
						<div class="charity-rich-editor charity-cause-detail">
							<div class="charity-rich-editor">
								<h1><input type="hidden" id="b_index" value="${content_view.btitle}"> ${content_view.btitle}</h1>
								<hr>
								<div class="charity-blog-options">
									<ul style="float: right">
										<li><i class="fa fa-folder-open"></i> No. ${content_view.b_index}</li>
										<li style="text-indent: 0.3em"><i class="fa fa-calendar"></i><time datetime="2008-02-14 20:00">	${content_view.bdate}</time></li>
										<li style="text-indent: 0.3em"><i class="fa fa-mouse-pointer"></i> 조회수<input type="hidden" id="b_index" value="${content_view.bhit}">${content_view.bhit}</li>
									</ul>
								</div>
								<input type="hidden" id="b_index" value="${content_view.bcontent}">${content_view.bcontent}
							
								<br>
								<div class="charity-post-tags mt-5">
									<div class="charity-blog-social">
										<span></span>
										<ul>
											<li><a href="${pageContext.request.contextPath}/board/notice" class="fa fa-list-alt"> 목록</a></li>
											<sec:authorize access="hasRole('ADMIN')">
											<li><a href="${pageContext.request.contextPath}/board/notice/modify/${content_view.b_index}" class="fa fa-edit">수정</a></li>
											<li><a id="del_btn" href="${pageContext.request.contextPath}/board/notice/delete/${content_view.b_index}" class="fa fa-eraser">삭제</a></li>
											</sec:authorize>
										</ul>
									</div>
								</div>
							</div>
							
							<input type="hidden" name="${_csrf.parameterName}"	value="${_csrf.token}" /> 
							<input type="hidden" id="_csrf_header" name="_csrf_header" value="${_csrf.headerName}" />
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
	<script type="text/javascript"	src="/resources/faq/js/jquery-1.10.2.min.js"></script>
	<script type="text/javascript"	src="/resources/faq/bootstrap/js/bootstrap.min.js"></script>

</body>
</html>