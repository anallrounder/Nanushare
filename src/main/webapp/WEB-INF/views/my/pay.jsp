<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<!DOCTYPE html>
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

<!-- sweet alert cdn : https://sweetalert.js.org/guides/ -->
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>


<!-- 탭처리 -->
<link rel="stylesheet"
	href="//unpkg.com/bootstrap@4/dist/css/bootstrap.min.css">
<script src='//unpkg.com/jquery@3/dist/jquery.min.js'></script>
<script src='//unpkg.com/popper.js@1/dist/umd/popper.min.js'></script>
<script src='//unpkg.com/bootstrap@4/dist/js/bootstrap.min.js'></script>

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

<link rel="stylesheet" href="/resources/charity/css/style_mypage_hj.css">


<!-- 부트스트랩 아이콘 -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<link rel="stylesheet"
	href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
	integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p"
	crossorigin="anonymous" />

<script type="text/javascript">
	//결제취소 
	function cancle(paynum, price) {
	
	/* 	if (swal("결제를 취소하시겠습니까?","","warning") == true) {//결제 취소여부 다시 확인 - 보류 */

			var token = $("meta[name='_csrf']").attr("content");
			var header = $("meta[name='_csrf_header']").attr("content");
			$(document).ajaxSend(function(e, xhr, options) {
				xhr.setRequestHeader(header, token);
			});

			console.log(paynum);
			console.log(price);

			jQuery.ajax({// 클라이언트가 가맹점 서버(Nanushare)로 환불 요청
				url : "${pageContext.request.contextPath}/my/payments/cancel",
				type : "POST",
				contentType : "application/json",
				data : JSON.stringify({

					merchant_uid : paynum, // 주문번호
					cancel_request_amount : price, // 환불금액
					reason : "후원금 결제 취소" // 환불사유

				}),
				dataType : "text", //데이터 타입을 제이슨 으로 지정시 statusText: "parsererror" 발생

				success : function(result) {
					console.log(result);

					if (result == "SUCCESS") {
						swal({
							title : "결제가 취소 되었습니다." , 
							icon : "success" , 
							timer : 2000,
							button : true 
						});
						//alert("결제가 취소 되었습니다.");
						$(location).attr('href',
								"${pageContext.request.contextPath}/my/pay");
					}
				},// success end
				error : function(e) {
					console.log(e);
					console.log("실패");
				}
			});// ajax end
		/* } else { //결제 취소 여부 확인 end - 보류
			return;
		} */
	}//cancle function end
</script>


<style>
li {
	list-style: none;
}

/* 취소버튼 */
.charity-simple-blog-butn {
	display: inline-block;
	padding: 10px 20px 12px;
	border-radius: 4px;
	line-height: 1;
	color: #78665A; /* #272625; */
	font-weight: 500;
	-webkit-transition: all 0.4s ease-in-out;
	-moz-transition: all 0.4s ease-in-out;
	-ms-transition: all 0.4s ease-in-out;
	-o-transition: all 0.4s ease-in-out;
	transition: all 0.4s ease-in-out;
}

.charity-simple-blog-butn:hover, ul li:hover .charity-simple-blog-btn {
	color: #ffffff;
	background-color: #272625; /* #78665A; */ /* 222 */
}

a:hover { 
    text-decoration: none;
}
</style>

<style>
#forimg {
	background-color: white;
	background-image: url('/resources/charity/qna/mypage2.png');
	background-size: 1600px;
	background-repeat: repeat;
	background-position: center;
}

.black-transparent {
	opacity: 50%;
}

.charity-volunteer-form {
	background-color: #f9f9fb;
}
</style>

<!-- header -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
</head>

<body>

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
	<!-- Content -->
	<!-- Content와 MainSection은 무조건 있어야함 -->
	<div class="charity-main-content">
		<!-- Main Section -->
		<div class="charity-main-section">

			<!-- https://www.bootdey.com/snippets/view/Update-user-profile#preview -->
			<!--  col-md-10 으로 넓이 넓힘 -->
			<div class="container col-md-10">
				<div class="view-account">
					<section class="module">
						<div class="module-inner">

							<!-- sidebar -->
							<div class="side-bar">
								<!-- profile -->


								<div class="user-info">
									<figure>
										<img id="introImg" class="usre_img"
											src="${pageContext.request.contextPath}/resources/users/user01_sm.png">
									</figure>
									<ul class="meta list list-unstyled">
										<li class="name"><h2>
												<sec:authentication property="principal.member.name" />
											</h2></li>
										<li class="email"><sec:authentication
												property="principal.member.member_id" /></a></li>
										<li class="activity"><sec:authentication
												property="principal.member" var="buttonhidden" /> <sec:authorize
												access="isAuthenticated()">

												<c:if test="${buttonhidden.signuppath == 'home'}">

													<button
														class="charity-simple-blog-btn w-100 text-white stats"
														type="submit"
														onclick="location.href ='${pageContext.request.contextPath}/my/myprofile'">
														프로필수정</button>

												</c:if>
											</sec:authorize> <sec:authentication property="principal.member"
												var="buttonhidden" /> <sec:authorize
												access="isAuthenticated()">

												<c:if test="${buttonhidden.signuppath != 'home'}">

													<button
														class="charity-simple-blog-btn w-100 text-white stats"
														type="submit"
														onclick="location.href ='${pageContext.request.contextPath}/my/drop'">
														회원탈퇴</button>

												</c:if>
											</sec:authorize></li>
									</ul>
								</div>
								<!-- profile -->
								<nav class="side-menu">
									<ul class="nav">
										<li><a href="mypage"><span class="fa fa-user"></span>&nbsp;&nbsp;Profile</a></li>
										<li><a href="ask"><span class="fa fa-question">
											</span>&nbsp;&nbsp;나의문의내역</a></li>
										<li><a href="content"><span class="fa fa-file">
											</span>&nbsp;&nbsp;나의인증내역</a></li>
										<li><a href="give"><span class="fa fa-handshake">
											</span>&nbsp;&nbsp;나의나눔내역</a></li>
										<li><a href="reply"><span class="fa fa-reply">
											</span>&nbsp;&nbsp;나의댓글내역</a></li>
										<li class="active"><a href="pay"><span
												class="fa fa-credit-card"></span>&nbsp;&nbsp;나의결제내역</a></li>
										<li><a href="point"><span
												class="fa fa-parking-circle"></span>&nbsp;&nbsp;나의포인트내역</a></li>


									</ul>
								</nav>
							</div>
							<div class="content-panel">
								<script
									src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
								<div>&nbsp;</div>
								<div>&nbsp;</div>
								<div class="charity-fancy-title">
									<h2>나의 결제 내역</h2>
								</div>

								<form id="boardForm" class="charity-volunteer-form"
									name="boardForm"
									style="margin-bottom: 0px; padding-bottom: 10px; background-color: white;">

									<table class="table taWWble-striped projects">

										<thead>
											<tr bgcolor="a5a5a5">
												<th>결제 날짜</th>
												<th>결제 번호</th>
												<th>금액</th>
												<th>결제 수단</th>
												<th>처리 상태</th>
												<th></th>
											</tr>
										</thead>
										<tbody>

											<c:if test="${empty list5}">
												<tr>
													<td colspan="6" align="center">결제 내역이 없습니다</td>
												</tr>

											</c:if>


											<!-- 로그인한 회원의 글 정보만 받아오기 -->
											<!-- 나의문의내역 -->
											<c:if test="${! empty list5}">
												<c:forEach items="${list5}" var="list5" varStatus="status">
													<tr>
														<td>${list5.dntdate}</td>
														<td>${list5.dnt_paynum}</td>
														<td>￦${list5.dntprice}</td>
														<td><c:if test="${list5.paymethod == 'card'}">카드
														</c:if> <c:if test="${list5.paymethod == 'trans'}">계좌이체
														</c:if> <c:if test="${list5.paymethod == 'vbank'}">가상계좌
														</c:if> <c:if test="${list5.paymethod == 'phone'}">휴대폰결제
														</c:if> <c:if test="${list5.paymethod == 'point'}">페이코
														</c:if> <c:if test="${list5.paymethod == 'pay'}">카카오페이
														</c:if></td>
														<td><c:if test="${list5.dntstat == 'cancelled'}">
																<span style="color: #FF3636;">취소완료</span>
															</c:if> <c:if test="${list5.dntstat == 'paid'}">
																<span style="color: #5586EB;">정상</span>
															</c:if></td>
														<td><c:if test="${list5.dntstat == 'cancelled'}">
																<button class="charity-simple-blog-butn" class="paycc"
																	type="button" onclick="swal('이미 취소된 결제 건입니다.','','error')">취소완료</button>
															</c:if> <c:if test="${list5.dntstat == 'paid'}">
																<button class="charity-simple-blog-btn" class="paycc"
																	type="button"
																	onclick="cancle('${list5.dnt_paynum}','${list5.dntprice}')">결제취소</button>
															</c:if></td>
													</tr>
												</c:forEach>
											</c:if>
										</tbody>
									</table>
								</form>


								<!-- Pagination -->
								<c:if test="${! empty list5}">
									<div class="charity-pagination">
										<ul class="page-numbers">

											<!-- 이전페이지 버튼 -->
											<c:if test="${pageMaker.prev}">
												<li><a class="previous page-umbers"
													href="${pageContext.request.contextPath}/my/pay${pageMaker.makeQuery(pageMaker.startPage-1)}"><span
														aria-label="Next"><i class="fa fa-angle-left"></i>Previous
															Post</span></a></li>
											</c:if>

											<!-- 페이지 숫자 버튼들 -->
											<c:forEach begin="${pageMaker.startPage}"
												end="${pageMaker.endPage}" var="idx">
												<c:out value="${pageMaker.cri.pageNum == idx?'':''}" />
												<li><a class="page-umbers"
													href="${pageContext.request.contextPath}/my/pay${pageMaker.makeQuery(idx)}">${idx}</a></li>
											</c:forEach>


											<!-- 다음페이지 버튼 -->
											<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
												<li><a class="next page-umbers"
													href="${pageContext.request.contextPath}/my/pay${pageMaker.makeQuery(pageMaker.endPage+1)}"><span
														aria-label="Next">Next Post<i
															class="fa fa-angle-right"></i></span></a></li>
											</c:if>
										</ul>
									</div>
								</c:if>
								<!-- End of Pagination -->




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