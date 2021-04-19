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

<!-- 부트스트랩 아이콘 -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />


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
		<div class="container">
			<br /> <br />

			<form id="updateForm"
				action="${pageContext.request.contextPath}/board/notice/modify"
				method="post">
				<table class="table">


					<tr>
						<td>번호</td>
						<td><input type="hidden" id="b_index" name="b_index"
							value="${modify_view.b_index}">${modify_view.b_index}</td>
					</tr>
					<tr>
						<td>조회수</td>
						<td>${modify_view.bhit}</td>
					</tr>
					<tr>
						<td>이름</td>
						<td><input type="hidden" id="member_id" name="member_id"
							value="${modify_view.member_id}">${modify_view.member_id}</td>
					</tr>
					<tr>
						<td>제목</td>
						<td><input type="text" id="btitle" name="btitle"
							value="${modify_view.btitle}"></td>
					</tr>
					<tr>
						<td>내용</td>
						<td><textarea rows="10" id="bcontent" name="bcontent">${modify_view.bcontent}</textarea></td>
					</tr>
					<tr>
						<td colspan="2">
						 <input type="submit" class="btn btn-primary" value="수정완료">
						<!-- <button type="submit" class="btn btn-primary">
								수정</button> -->&nbsp;&nbsp; <input type="hidden"
							name="${_csrf.parameterName}" value="${_csrf.token}" /> 
							<input type="hidden" id="_csrf_header" name="_csrf_header"
							value="${_csrf.headerName}" />
							<button type="button" class="btn btn-primary"
								onclick="location.href='${pageContext.request.contextPath}/board/notice'">목록</button>
						</td>
					</tr>
				</table>

			</form>

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

	<!-- 자주묻는질문 -->
	<script type="text/javascript"
		src="/resources/faq/js/jquery-1.10.2.min.js"></script>
	<script type="text/javascript"
		src="/resources/faq/bootstrap/js/bootstrap.min.js"></script>

</body>
</html>