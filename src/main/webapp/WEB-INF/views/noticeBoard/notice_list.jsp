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
<link rel="stylesheet"
	href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
	integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p"
	crossorigin="anonymous" />
	
<!-- 상단 로그인버튼 위치 -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">



</head>

<style>
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

<body style="background-color: f9f9fb">
	<!-- Header -->
	<%@ include file="/WEB-INF/views/mainMap/mainHeader.jsp"%>
	<!-- Header -->
	<!-- Banner -->
	<div id="forimg" class="charity-subheader">
		<span class="black-transparent"></span>
		<div class="container">
			<div class="row">
				<div class="col-md-12"></div>
			</div>
		</div>
	</div>
	<!-- Banner -->

	<!-- Main Section -->
	<!-- Content -->
	<div class="charity-fancy-title "
		style="margin-top: 70px; margin-bottom: 20px;">
		<h2>공지사항</h2>
	</div>

	<div id="container">
		<div class="row">

			<div class="container" style="height: 90%">

				<div class="col-12">

					<form id="boardForm" class="charity-volunteer-form"
						name="boardForm" style="margin-bottom: 0px; padding-bottom: 10px;">
						<table class="table taWWble-striped projects">
							<!-- <table class="table table-light table-hover " > -->
							<colgroup>
								<col width="10%" />
								<col width="45%" />
								<col width="15%" />
								<col width="20%" />
								<col width="10%" />
							</colgroup>

							<thead>

								<tr bgcolor="a5a5a5">

									<th style="border-left: none;">글번호</th>
									<th>제목</th>
									<th>작성자</th>
									<th>날짜</th>
									<th style="border-right: none;">조회수</th>


								</tr>
							</thead>
							<!-- 공지 -->
							<tbody>
								<c:forEach items="${list}" var="dto">
								 <c:if test="${dto.b_index == 258}"> 
									<tr style=" font-weight:bold;">
										<td style="border-left: none;"><i class="fas fa-bell" style="color: red; line-height: 40px; vertical-align: middle;"></i></td>
										<td style="text-align:left;  line-height: 40px; vertical-align: middle; padding: 0 0 0 25px;"><a
											href="${pageContext.request.contextPath}/board/notice/${dto.b_index}">${dto.btitle}</a></td>
										<td>관리자</td>
										<td>${dto.bdate}</td>
										<td style="border-right: none;">${dto.bhit}</td>
									</tr>
									</c:if>
								</c:forEach>
							</tbody>
							<tbody>
								<c:forEach items="${list}" var="dto">
								 <c:if test="${dto.b_index == 260}"> 
									<tr style=" font-weight:bold;">
										<td style="border-left: none;"><i class="fas fa-bell" style="color: red; line-height: 40px; vertical-align: middle;"></i></td>
										<td style="text-align:left;  line-height: 40px; vertical-align: middle; padding: 0 0 0 25px;"><a
											href="${pageContext.request.contextPath}/board/notice/${dto.b_index}">${dto.btitle}</a></td>
										<td>관리자</td>
										<td>${dto.bdate}</td>
										<td style="border-right: none;">${dto.bhit}</td>
									</tr>
									</c:if>
								</c:forEach>
							</tbody>
							<!-- 공지 -->
							<tbody>
								<c:forEach items="${list}" var="dto">
									<tr>
										<td style="border-left: none;">${dto.b_index}</td>
										<td style="text-align:left;  line-height: 40px; vertical-align: middle; padding: 0 0 0 25px;"><a
											href="${pageContext.request.contextPath}/board/notice/${dto.b_index}">${dto.btitle}</a></td>
										<td>관리자</td>
										<td>${dto.bdate}</td>
										<td style="border-right: none;">${dto.bhit}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>

					</form>

					<!-- Pagination -->
					<!-- <div > -->
					<div style="margin: 10px;">
						<div class="charity-pagination">
							<ul class="page-numbers">
								<li><c:if test="${pageMaker.prev}">
										<a class="previous page-numbers"
											href="${pageContext.request.contextPath}/board/notice${pageMaker.makeQuery(pageMaker.startPage - 1) }"><i
											class="fa fa-angle-left"></i>prev</a>
									</c:if></li>

								<li><c:forEach begin="${pageMaker.startPage }"
										end="${pageMaker.endPage }" var="idx">
										<c:out value="${pageMaker.cri.pageNum == idx?'':''}" />
										<a
											href="${pageContext.request.contextPath}/board/notice${pageMaker.makeQuery(idx)}">${idx}</a>
									</c:forEach></li>

								<li><c:if test="${pageMaker.next && pageMaker.endPage > 0}">
										<a class="next page-numbers"
											href="${pageContext.request.contextPath}/board/notice${pageMaker.makeQuery(pageMaker.endPage +1) }">next<i
											class="fa fa-angle-right"></i></a>
									</c:if></li>
							</ul>
						</div>
					</div>
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