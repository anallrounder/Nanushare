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
 <link rel="shortcut icon" type="image/x-icon" 
    	href="${pageContext.request.contextPath}/resources/nanulogo_ico_convert.ico"> <!-- 웹페이지 탭 로고이미지 삽입  -->
    	

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

#maxmax {
	max-width: 100%;
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

	<!-- <script type="text/javascript">
	/* 페이징 ajax */
		$(document).ready(function() {
			// 표시하는 글 수를 바꾸면 이벤트 처리를 해서 다시 리스트를 불러온다.

			$("#startPage").change(function() {

				// 		alert("select change!");

				location = "my/mypage?"

				+ "page=1" // 페이지 전달한다.

				+ "&startPage=" + $("#startPage").val() // 페이지 당 글수 전달

			});

		});
	</script> -->


	<!-- Header -->
	<%@ include file="/WEB-INF/views/mainMap/mainHeader.jsp"%>

	<!-- Banner -->
	<div class="charity-subheader">
		<span class="black-transparent"></span>
		<div class="container">
			<div class="row">
				<div class="col-md-12"></div>
			</div>
		</div>
	</div>
	<!-- Banner -->

	<%
	String path = request.getContextPath();
	%>
	<%=path%>



	<!-- Content -->
	<div class="charity-main-content">

		<!-- Main Section -->
		<div class="charity-main-section">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<div class="charity-rich-editor charity-cause-detail">

							<div class="charity-simple-blog-text">
								<ul class="charity-simple-blog-options">

									<table>
										<tr>
											<td
												style="border-top: none; border-bottom: none; border-left: none; border-right: none;"
												rowspan="3"><img src="/resources/my/프로필사진.PNG"
												border="0" height="150" width="60"></td>
										</tr>

										<tr>
											<td
												style="border-top: none; border-bottom: none; border-left: none; border-right: none;"></td>

											<td
												style="border-top: none; border-bottom: none; border-left: none; border-right: none; text-align: left;">아이디
												: <sec:authentication property="principal.member.member_id" />

											</td>
										</tr>
										<tr>
											<td
												style="border-top: none; border-bottom: none; border-left: none; border-right: none;"></td>
											<td
												style="border-top: none; border-bottom: none; border-left: none; border-right: none; text-align: left;">이름
												: <sec:authentication property="principal.member.name" />
											</td>
										</tr>
									</table>
								</ul>
<!-- https://zgundam.tistory.com/51 네이버랑카카오는 ROLE_USER2로 권한을 주고 <sec:authorize access="hasAnyRole('ROLE_USER','ROLE_ADMIN')"으로 주는거 어떨지 의논-->
								<a href="${pageContext.request.contextPath}/my/myprofile"
									class="charity-simple-blog-btn">프로필 관리</a> <a href="#"
									class="charity-simple-blog-btn">기부영수증</a>
							</div>
							<div class="charity-simple-blog-text"
								style="background-color: lightgrey;">
								<ul class="charity-simple-blog-options">

									<table>
										<tr>
											<td
												style="border-top: none; border-bottom: none; border-left: none; border-right: none; text-align: left;">
												나의 포인트 : <sec:authentication
													property="principal.member.dntcnt" /> <a
												href="${pageContext.request.contextPath}/donation/money/point"
												class="charity-simple-blog-btn" style="float: right;">기부하기</a>
											</td>
										</tr>
									</table>
								</ul>
							</div>
							<!-- 여기까지 -->
							<div class="charity-cause-donate">
								<div class="skillst" id="maxmax">
									<!-- 수정필요 -->
									<!-- <h6>
										data-width를 바꾸면 %가 달라짐 그림추가<span>해야함</span>
									</h6> -->
									<img src="/resources/my/그림1.png" height="80" width="80">
									<img src="/resources/my/그림2.png" height="80" width="80">
									<img src="/resources/my/그림3.png" height="80" width="80">
									<img src="/resources/my/그림4.png" height="80" width="80">
									<img src="/resources/my/그림5.png" height="80" width="80">
									<img src="/resources/my/그림6.png" height="80" width="80">
									<!-- <h6 class="skillst-right">
										막대바가 <span>올곳</span>
									</h6> -->

									<div data-width='13' max='100'
										class="charity-cause-progressbar"></div>
								</div>


							</div>
						</div>

						<!-- 나의 ~~ 내역 -->

						<div class="container">
							<div class="row">
								<div class="col">

									<ul class="nav nav-tabs">
										<li class="nav-item"><a class="nav-link active"
											data-toggle="tab" href="#abc" data-load="false"
											data-url="${pageContext.request.contextPath}/my/mypage">나의
												문의내역</a></li>
										<li class="nav-item"><a class="nav-link"
											data-toggle="tab" href="#def" data-load="true"
											data-url="http://localhost:8282/my/mypage/_2">나의 인증내역</a></li>
										<li class="nav-item"><a class="nav-link"
											data-toggle="tab" href="#ghi">나의 나눔내역</a></li>
										<li class="nav-item"><a class="nav-link"
											data-toggle="tab" href="#jkl">나의 댓글내역</a></li>
									</ul>
									<div class="tab-content">
										<div class="tab-pane fade show active" id="abc">
											<jsp:include page="/WEB-INF/views/my/mypage_1.jsp"
												flush="true">
												<jsp:param name="list1" value="list1" />
												<jsp:param name="pinfo" value="pinfo" />
											</jsp:include>

										</div>
										<div class="tab-pane fade" id="def">
											<%-- <jsp:include page="mypage_2.jsp">
												<jsp:param name="pinfo" value="pinfo"></jsp:param>
												<jsp:param name="list2" value="list2"></jsp:param>
											</jsp:include> --%>
											 <c:import url = "mypage_2.jsp"></c:import>
											<%-- <%@ include file="/WEB-INF/views/my/mypage_2.jsp"%> --%>
										</div>
										<div class="tab-pane fade" id="ghi">
											<%@ include file="/WEB-INF/views/my/mypage_3.jsp"%>
										</div>
										<div class="tab-pane fade" id="jkl">
											<%@ include file="/WEB-INF/views/my/mypage_4.jsp"%>
										</div>
									</div>
								</div>
							</div>
						</div>

						<script>
						
						/* 탭부분 ajax */
							// 위 ajax를 통한 data.load는 따로 bootstrap에 정의된 기능이 아니기 때문에 구현해야한다.
							// 메뉴가 선택되기 전의 이벤틀르 가져온다.
						/* 	$('a[data-toggle="tab"]').on('show.bs.tab',
									function(e) {
										// 선택되는 요소를 오브젝트화 한다.
										$this = $(e.target);
										// data-load가 false의 경우는 content에 data-load를 한다.
										if (!$this.data("load")) {
											// tab-content의 id를 취득한다.
											var id = $this.attr("href");
											// 페이지 로드를 한다.
											$(id).load($this.data("url"));
											// data-load를 true로 변환하여 중복 로딩이 없게 한다.
											$this.data("load", true);
										}
									}); */
						</script>


						<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
						<script
							src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
						<script
							src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>



					</div>
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
	<script src="/resources/charity/script/progressbar.js"></script>
	<script src="/resources/charity/script/fancybox.min.js"></script>
	<script src="/resources/charity/script/jquery.countdown.min.js"></script>
	<script src="https://maps.googleapis.com/maps/api/js"></script>
	<script src="/resources/charity/script/jquery.jplayer.js"></script>
	<script src="/resources/charity/script/jplayer.playlist.js"></script>
	<script src="/resources/charity/script/functions.js"></script>
</body>

</html>