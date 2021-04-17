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
    <meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}">
 
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
		<form id="updateForm"
			action="${pageContext.request.contextPath}/board/notice/${content_view.b_index}/modify_view"
			method="get">
			<table class="table">
				<input type="hidden" id="b_index" value="${content_view.b_index}">
				<input type="hidden" id="b_index" value="${content_view.bhit}">
				<input type="hidden" id="b_index" value="${content_view.member_id}">
				<input type="hidden" id="b_index" value="${content_view.btitle}">
				<input type="hidden" id="b_index" value="${content_view.bcontent}">
				
				<tr>
					<td>번호</td>
					<td>${content_view.b_index}</td>
				</tr>
				<tr>
					<td>조회수</td>
					<td>${content_view.bhit}</td>
				</tr>
				<tr>
					<td>이름</td>
					<td>${content_view.member_id}</td>
				</tr>
				<tr>
					<td>제목</td>
					<td>${content_view.btitle}</td>
				</tr>
				<tr>
					<td>내용</td>
					<td>${content_view.bcontent}</td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" class="btn btn-primary" 
						value="수정">&nbsp;&nbsp;
						<button type="button" class="btn btn-primary"
							onclick="location.href='delete?b_index=${content_view.b_index}'">삭제</button>&nbsp;&nbsp;
						<button type="button" class="btn btn-primary"
							onclick="location.href='${pageContext.request.contextPath}/board/notice'">목록</button>
					</td>
				</tr>
			</table>
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	                        <input type="hidden" id="_csrf_header" name="_csrf_header" value="${_csrf.headerName}" />
                        </form>

		<!-- Main Section -->
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

	<!-- 자주묻는질문 -->
	<script type="text/javascript"
		src="/resources/faq/js/jquery-1.10.2.min.js"></script>
	<script type="text/javascript"
		src="/resources/faq/bootstrap/js/bootstrap.min.js"></script>

</body>
</html>