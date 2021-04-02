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
<!-- meta tags -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Charity Cause Detail</title>


<!-- 탭처리 -->
<!-- <link rel="stylesheet"
	href="http://unpkg.com/bootstrap@4/dist/css/bootstrap.min.css">
<script src='http://unpkg.com/jquery@3/dist/jquery.min.js'></script>
<script src='http://unpkg.com/popper.js@1/dist/umd/popper.min.js'></script>
<script src='http://unpkg.com/bootstrap@4/dist/js/bootstrap.min.js'></script>
 -->
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



<body>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>




	<table>

		<div>
			<br>
		</div>
		<tr>

			<!-- <th>아이디</th> -->
			<th>나눔제목-링크아직X</th>
			<th>조회수</th>
			<th>날짜</th>

		</tr>
		<!-- 로그인한 회원의 글 정보만 받아오기 -->
		<!-- 나의문의내역 -->
		<c:forEach items="${list1}" var="list1">
			<sec:authentication property="principal" var="pinfo" />
			<sec:authorize access="isAuthenticated()">
				<c:if test="${pinfo.username eq list1.member_id}">
					<tr>
						<%-- <td>${list1.member_id}</td> --%>
						<%-- <td><c:if test="${sessionScope.member_id = principal.member_id}"></c:if></td> --%>
						<td><a id="a-content"
						href="${pageContext.request.contextPath}/board/shows/content_view?b_index=${list1.b_index}">${list1.btitle}</a></td>
				<!-- 제목누르면 해당 글내용으로 이동링크 -->
						<!-- 제목누르면 해당 글내용으로 이동링크 -->
						<td>${list1.bhit}</td>
						<td>${list1.bdate}</td>

					</tr>
				</c:if>
			</sec:authorize>
		</c:forEach>
	</table>

	<!-- 페이징 -->
	<div class="container">
		<div class="row">
			<div class="col">
				<ul class="pagination justify-content-center">
					<li class="page-item"><c:if test="${pageMaker.prev}">
							<a class="page-link"
								href="my/mypage/_1${pageMaker.makeQuery(pageMaker.startPage - 1) }">prev</a>
						</c:if></li>

					<li class="page-item"><c:forEach
							begin="${pageMaker.startPage }" end="${pageMaker.endPage }"
							var="idx">
							<c:out value="${pageMaker.cri.pageNum == idx?'':''}" />
							<a href="_1${pageMaker.makeQuery(idx)}">${idx}</a>
						</c:forEach></li>


					<li class="page-item"><c:if
							test="${pageMaker.next && pageMaker.endPage > 0}">
							<a class="page-link"
								href="_1${pageMaker.makeQuery(pageMaker.endPage +1) }">next
							</a>
						</c:if></li>
				</ul>
			</div>

		</div>

	</div>


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
	<script src="/resources/charity/script/functions.js"></script>
</body>

</html>