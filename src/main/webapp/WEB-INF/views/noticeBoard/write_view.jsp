<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html >
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- ckeditor -->
<script
	src="${pageContext.request.contextPath}/resources/ckeditor/ckeditor.js"></script>

<!-- meta tags -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- csrf -->
<meta name="_csrf" content="${_csrf.token}">
<meta id="_csrf_header" name="_csrf_header"
	content="${_csrf.headerName}">

<title>나누셰어 - 문의하기</title>

<!-- CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/charity/css/bootstrap.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/charity/css/fontawesome-all.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/charity/css/flaticon.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/charity/css/slick-slider.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/charity/css/fancybox.css">
<link
	href="${pageContext.request.contextPath}/resources/charity/css/jplayer.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/charity/css/style.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/charity/css/color.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/charity/css/responsive.css">

<!-- 웹페이지 탭 로고이미지 삽입  -->
<link rel="shortcut icon" type="image/x-icon"
	href="${pageContext.request.contextPath}/resources/nanulogo_ico_convert.ico">

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

<body style="background-color: #f9f9fb">
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

	<div class="charity-main-content">

		<!-- Main Section -->
		<div class="charity-main-section">
			<div class="container">
				<div class="row">
					<div class="col-md-9">
						<form
							action="${pageContext.request.contextPath}/board/notice/write"
							method="post">
							<div class="charity-contact-form">
								<h4>
									<span>ID</span>
								</h4>
								<h6>
									<sec:authentication property="principal.member.member_id" />
								</h6>
								<br />
								<h4>
									<span>Title</span>
								</h4>
								<input type="text" id="btitle" name="btitle"
									placeholder="제목을 작성하세요."> <br> <br> <br>
								<br>

								<h4>Content</h4>
								<p>
									<textarea id="bcontent" name="bcontent"
										placeholder="내용을 작성하세요."></textarea>
								</p>

								<!-- ck에디터 -->
								<script type="text/javascript">
									var ckeditor_config = {
										resize_enaleb : false, //에디터 크기조절 x
										height : "450",
										enterMode : CKEDITOR.ENTER_BR,
										shiftEnterMode : CKEDITOR.ENTER_P,
										filebrowserUploadUrl : '<c:url value="${pageContext.request.contextPath}/my/board/shows/imageUpload"/>?${_csrf.parameterName}=${_csrf.token}'
									};
									CKEDITOR.replace('bcontent',
											ckeditor_config);
								</script>

								<button type="submit" class="charity-sub-btn">
									<i class="fa fa-save"> 작성완료</i>
								</button>
								<button type="reset" class="charity-sub-btn">
									<i class="fa fa-undo"> 다시쓰기</i>
								</button>
								<!-- charity-main-btn -->
								<!-- 버튼에 링크걸기 https://m.blog.naver.com/rain483/220529222723 -->
							</div>
							<input type="hidden" name="${_csrf.parameterName}"
								value="${_csrf.token}" /> <input type="hidden"
								id="_csrf_header" name="_csrf_header"
								value="${_csrf.headerName}" />
						</form>

						<!--   a href="plist" -->
						<div style="float: right; margin-right: 5px; text-color: 2a786b;">
							<a href="${pageContext.request.contextPath}/board/notice"
								class="fa fa-list-alt" style="color: black"> 공지 게시판 돌아가기 </a>
						</div>
						<br> <br>
					</div>

					<!-- aside -->
					<%@ include file="/WEB-INF/views/board_show/aside.jsp"%>
					<!-- aside -->
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
	<script
		src="${pageContext.request.contextPath}/resources/charity/script/jquery.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/charity/script/popper.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/charity/script/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/charity/script/slick.slider.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/charity/script/progressbar.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/charity/script/fancybox.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/charity/script/jquery.countdown.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/charity/script/jquery.jplayer.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/charity/script/jplayer.playlist.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/charity/script/functions.js"></script>
</body>
</html>