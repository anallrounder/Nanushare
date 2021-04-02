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


<!--탭처리2  -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<style>
p {
	margin: 20px 0px;
}

li {
	list-style: none;
}

li:nth-child(2) {
	color: lime;
}
</style>


<!--탭처리2  -->


</head>
<style>
.charity-simple-blog-text:nth-child(1) {
	height: 170px;
	width: 400px;
	float: left;
	border-color: lightgray;
}

.charity-simple-blog-text:nth-child(2) {
	height: 80px;
	width: 320px;
	float: right;
	border-color: lightgray;
}
</style>
<body>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>




	<table>
												<div>
													<br>
												</div>
												<tr>
													<th>물품이름</th>
													<th>날짜</th>

													<th>수량</th>
													<!-- <th>아이디</th> -->

												</tr>
												<!-- 나의나눔내역 -->
												<c:set var="list3" value="${list3}" />
												<c:forEach items="${list3}" var="dao3" varStatus="status">
													<c:forEach items="${dao3.dona}" var="dto3"
														varStatus="status">
														<sec:authentication property="principal" var="pinfo" />
														<sec:authorize access="isAuthenticated()">
															<c:if test="${pinfo.username eq dto3.member_id}">
																<tr>

																	<td>${dao3.iname}</td>
																	<td>${dto3.idntdate}</td>

																	<!-- 제목누르면 해당 글내용으로 이동링크 -->
																	<td>${dto3.donaamount}</td>
																	<%-- <td>${dto3.member_id}</td> --%>

																</tr>
															</c:if>
														</sec:authorize>
													</c:forEach>
												</c:forEach>
											</table>
											
											 	<div class="container">
												<div class="row">
													<div class="col">
														<ul class="pagination justify-content-center">
															<li class="page-item"><c:if test="${pageMaker.prev}">
																	<a class="page-link"
																		href="_3${pageMaker.makeQuery(pageMaker.startPage - 1) }">prev</a>
																</c:if></li>

															<li class="page-item"><c:forEach
																	begin="${pageMaker.startPage }"
																	end="${pageMaker.endPage }" var="idx">
																	<c:out value="${pageMaker.cri.pageNum == idx?'':''}" />
																	<a href="_3${pageMaker.makeQuery(idx)}">${idx}</a>
																</c:forEach></li>


															<li class="page-item"><c:if
																	test="${pageMaker.next && pageMaker.endPage > 0}">
																	<a class="page-link"
																		href="_3${pageMaker.makeQuery(pageMaker.endPage +1) }">next
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