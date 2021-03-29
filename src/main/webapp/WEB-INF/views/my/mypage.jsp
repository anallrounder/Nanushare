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
	<script>
		/* 페이징 */
		var $setRows = $('#setRows');

		$setRows
				.submit(function(e) {
					e.preventDefault();
					var rowPerPage = $('[name="rowPerPage"]').val() * 1;// 1 을  곱하여 문자열을 숫자형로 변환

					//		console.log(typeof rowPerPage);

					var zeroWarning = 'Sorry, but we cat\'t display "0" rows page. + \nPlease try again.'
					if (!rowPerPage) {
						alert(zeroWarning);
						return;
					}
					$('#nav').remove();
					var $ghi = $('#ghi');

					$asd.after('<div id="nav">');

					var $tr = $($ghi).find('tbody tr');
					var rowTotals = $tr.length;
					//	console.log(rowTotals);

					var pageTotal = Math.ceil(rowTotals / rowPerPage);
					var i = 0;

					for (; i < pageTotal; i++) {
						$('<a href="#"></a>').attr('rel', i).html(i + 1)
								.appendTo('#nav');
					}

					$tr.addClass('off-screen').slice(0, rowPerPage)
							.removeClass('off-screen');

					var $pagingLink = $('#nav a');
					$pagingLink.on('click', function(evt) {
						evt.preventDefault();
						var $this = $(this);
						if ($this.hasClass('active')) {
							return;
						}
						$pagingLink.removeClass('active');
						$this.addClass('active');

						// 0 => 0(0*4), 4(0*4+4)
						// 1 => 4(1*4), 8(1*4+4)
						// 2 => 8(2*4), 12(2*4+4)
						// 시작 행 = 페이지 번호 * 페이지당 행수
						// 끝 행 = 시작 행 + 페이지당 행수

						var currPage = $this.attr('rel');
						var startItem = currPage * rowPerPage;
						var endItem = startItem + rowPerPage;

						$tr.css('opacity', '0.0').addClass('off-screen').slice(
								startItem, endItem).removeClass('off-screen')
								.animate({
									opacity : 1
								}, 300);

					});

					$pagingLink.filter(':first').addClass('active');

				});

		$setRows.submit();
	</script>




	<!-- Header -->
	<header id="charity-header" class="charity-header-one"
		style="position:relative;z-index:2"> <!-- Top Strip -->
	<div class="charity-top-strip">
		<aside> <a href="${pageContext.request.contextPath}/main"
			class="charity-logo"
			style="width: 200px; height: 100px; margin: 0px 0px 0px 20px;"><img
			src="/resources/nanulogo.png" alt=""></a></aside>
		<div class="container">
			<div class="row">
				<aside class="col-12">
				<div class="float-center">
					<a href="#menu" class="menu-link active"><span></span></a>
					<nav id="menu" class="menu charity-navigation">

					<ul>
						<!-- <li class="active"><a href="index.html">Home</a></li> -->
						<li style="padding: 0px 40px 0px 70px"><a href="#"
							style="font-size: 20px;">나누셰어란?</a>
							<ul class="children">
								<li><a href="${pageContext.request.contextPath}/menu/about">나누셰어
										소개</a></li>
								<li><a href="${pageContext.request.contextPath}/menu/way">찾아오셰어</a></li>
								<!--     <li><a href="event-detail.html">Event Detail</a></li> -->
							</ul></li>
						<li style="padding: 0px 40px 0px 30px"><a href="#"
							style="font-size: 20px;">나눔함 안내</a> <!--  <ul class="children">
                                            <li><a href="cause-list.html">Cause List</a></li>
                                            <li><a href="cause-grid.html">Cause Grid</a></li>
                                            <li><a href="cause-detail.html">Cause Detail</a></li>
                                        </ul> --></li>
						<li style="padding: 0px 40px 0px 30px"><a href="#"
							style="font-size: 20px;">나누기</a>
							<ul class="children">
								<li><a href="blog-large.html">물품 나누기</a></li>
								<li><a href="blog-medium.html">돈기부여하기</a></li>
								<!-- <li><a href="blog-detail.html">Cause Detail</a></li> -->
							</ul></li>
						<li style="padding: 0px 40px 0px 30px"><a href="#"
							style="font-size: 20px;">나눔 인증</a> <!--  <ul class="children">
                                            <li><a href="team-grid.html">Team Grid</a></li>
                                            <li><a href="team-classic.html">Team Classic</a></li>
                                            <li><a href="team-detail.html">Team Detail</a></li>
                                        </ul> --></li>
						<li style="padding: 0px 40px 0px 30px"><a href="#"
							style="font-size: 20px;">이벤트</a>
							<ul class="children">
								<li><a href="about.html">출석체크</a></li>
								<li><a href="prayer-list.html">테스트</a></li>
								<li><a href="prayer-grid.html">게임</a></li>
								<!--  <li><a href="prayer-detail.html">Prayer De1tail</a></li>
                                            <li><a href="404.html">404 Error</a></li>
                                            <li><a href="search-result.html">Search Result</a></li> -->
							</ul></li>
						<li style="padding: 0px 40px 0px 30px"><a
							href="contact-us.html" style="font-size: 20px;">더하기</a>
							<ul class="children">
								<li><a href="about.html">공지사항</a></li>
								<li><a href="prayer-list.html">문의하기</a></li>
							</ul></li>


					</ul>
					<!--  <span class="float-right">
                                    <a href="#" class="charity-strip-btn charity-bgcolor" style="width:100px;height:30px;">Sign up</a>
                          			<a href="#" class="charity-strip-btn charity-bgcolor" style="width:100px;height:30px;">Sign in</a>
                                </span> --> </nav>

					<!--    <ul class="charity-header-options" style="text-align: center">
                                <li><a href="#" data-toggle="modal" data-target="#searchModal"><i class="fas fa-search"></i></a></li>
                                <li><a href="#"><i class="fab fa-opencart"></i></a> <div class="charity-cart-box"> <p>No products in the cart.</p> </div> </li>
             
                                <li> <a href="#" class="charity-strip-btn charity-bgcolor" style="width:100px;height:30px;">Sign up</a></li>
                          		<li><a href="#" class="charity-strip-btn charity-bgcolor" style="width:100px;height:30px;">Sign in</a></li>
                                
                            </ul>
                             -->

				</div>

				</aside>


				<!--     <aside class="col-12"> 
                        <div class="float-right">
                          <ul class="charity-social-network">
                              <li><a href="#" class="fab fa-facebook-f"></a></li>
                              <li><a href="#" class="fab fa-google"></a></li>
                              <li><a href="#" class="fab fa-pinterest-p"></a></li>
                              <li><a href="#" class="fab fa-linkedin-in"></a></li>
                              <li><a href="#" class="fab fa-twitter"></a></li>
                          </ul>
                          <a href="#" class="charity-strip-btn charity-bgcolor" >Sign up</a>
                          <a href="#" class="charity-strip-btn charity-bgcolor">Sign in</a>
                         
                        </div>
                    </aside> -->
			</div>
		</div>
		<aside> <a href="#" class="charity-strip-btn charity-bgcolor"
			style="width: 70px; height: 40px; white-space: nowrap; padding: 10px 0px 0px 6px; margin: -75px 50px 0px 0px;">Sign
			up</a> <a href="#" class="charity-strip-btn charity-bgcolor"
			style="width: 70px; height: 40px; white-space: nowrap; padding: 10px 5px 0px 10px; margin: -75px 140px 0px 0px;">Sign
			in</a> </aside>
	</div>
	<!-- Top Strip --> </header>

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


	<!-- sessionScope.id 안될때 -->
	<%-- 	<%
	request.setCharacterEncoding("UTF-8");

	session = request.getSession(true);

	String member_id = request.getParameter("member_id");

	request.getSession().setAttribute("member_id", member_id);
	%> --%>
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
												style="border-top: none; border-bottom: none; border-left: none; border-right: none; text-align: left;">

												회원아이디:${user.member_id}</td>
										</tr>
										<tr>
											<td
												style="border-top: none; border-bottom: none; border-left: none; border-right: none;"></td>
											<td
												style="border-top: none; border-bottom: none; border-left: none; border-right: none; text-align: left;">이름:${user.name}</td>
										</tr>
									</table>
								</ul>

								<a href="${pageContext.request.contextPath}/my/myprofile"
									class="charity-simple-blog-btn">프로필 관리</a> <a href="#"
									class="charity-simple-blog-btn">기부영수증</a>
							</div>
							<div class="charity-simple-blog-text" style="background-color:lightgrey;">
								<ul class="charity-simple-blog-options">

									<table>
										<tr>
											<td
												style="border-top: none; border-bottom: none; border-left: none; border-right: none; text-align: left;">
												나의 포인트 : 수정중     <a href="#" class="charity-simple-blog-btn" style="float : right;">기부하기</a></td>
										</tr>										
									</table>
								</ul>
							</div>
							<!-- 여기까지 -->
							<div class="charity-cause-donate">
								<div class="skillst">
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
									<div data-width='60' max='100'
										class="charity-cause-progressbar"></div>
								</div>


							</div>
						</div>




						<div class="container">
							<div class="row">
								<div class="col">

									<ul class="nav nav-tabs">
										<li class="nav-item"><a class="nav-link active"
											data-toggle="tab" href="#abc">나의 문의내역</a></li>
										<li class="nav-item"><a class="nav-link"
											data-toggle="tab" href="#def">나의 인증내역</a></li>
										<li class="nav-item"><a class="nav-link"
											data-toggle="tab" href="#ghi">나의 나눔내역</a></li>
										<li class="nav-item"><a class="nav-link"
											data-toggle="tab" href="#jkl">나의 댓글내역</a></li>
									</ul>
									<div class="tab-content">
										<div class="tab-pane fade show active" id="abc">
											<table>
												<form action="" id="setRows">
													<p>
														showing <input type="text" name="rowPerPage" value="3">
														item per page
													</p>
												</form>
												<div>
													<br>
												</div>
												<tr>

													<th>아이디</th>
													<th>나눔제목</th>
													<th>조회수</th>
													<th>날짜</th>

												</tr>
												<c:forEach items="${list1}" var="list1">
													<tr>

														<td>${list1.member_id}</td>
														<td>${list1.btitle}</td>
														<!-- 제목누르면 해당 글내용으로 이동링크 -->
														<td>${list1.bhit}</td>
														<td>${list1.bdate}</td>

													</tr>
												</c:forEach>
											</table>
											<!-- 페이징 -->
											<div id="nav">
												<a href="#" rel="0" class="active">1</a>
											</div>
											<%-- <!-- 페이징 -->
											<div class="container">
												<div class="row">
													<div class="col">
														<ul class="pagination justify-content-center">
															<li class="page-item"><c:if test="${pageMaker.prev}">
																	<a class="page-link"
																		href="mypage${pageMaker.makeQuery(pageMaker.startPage - 1) }">prev</a>
																</c:if></li>

															<li class="page-item"><c:forEach
																	begin="${pageMaker.startPage }"
																	end="${pageMaker.endPage }" var="idx">
																	<c:out value="${pageMaker.cri.pageNum == idx?'':''}" />
																	<a href="mypage${pageMaker.makeQuery(idx)}">${idx}</a>
																</c:forEach></li>


															<li class="page-item"><c:if
																	test="${pageMaker.next && pageMaker.endPage > 0}">
																	<a class="page-link"
																		href="mypage${pageMaker.makeQuery(pageMaker.endPage +1) }">next
																	</a>
																</c:if></li>
														</ul>
													</div>

												</div>

											</div> --%>

										</div>
										<div class="tab-pane fade" id="def">
											<table>

												<form action="" id="setRows">
													<p>
														showing <input type="text" name="rowPerPage" value="3">
														item per page
													</p>
												</form>
												<div>
													<br>
												</div>
												<tr>

													<th>아이디</th>
													<th>인증제목</th>
													<th>조회수</th>
													<th>날짜</th>
													<th>분류번호</th>
												</tr>


												<c:forEach items="${list2}" var="list2">
													<tr>

														<td>${list2.member_id}</td>
														<td>${list2.btitle}</td>
														<!-- 제목누르면 해당 글내용으로 이동링크 -->
														<td>${list2.bhit}</td>
														<td>${list2.bdate}</td>
														<td>${list2.bcat_num}</td>
													</tr>
												</c:forEach>
											</table>
											<!-- 페이징 -->
											<div id="nav">
												<ul class="startItem">

													<li class="active"><a><<</a></li>

													<li class="active"><a><</a></li>

													<li class="active"><a>1</a></li>

													<li class="currPage" data-page="2"><a>2</a></li>

													<li class="currPage" data-page="3"><a>3</a></li>

													<li class="active"><a>></a></li>

													<li class="active"><a>>></a></li>

												</ul>
											</div>
											<%-- <!-- 페이징 -->
											<div class="container">
												<div class="row">
													<div class="col">
														<ul class="pagination justify-content-center">
															<li class="page-item"><c:if test="${pageMaker.prev}">
																	<a class="page-link"
																		href="mypage${pageMaker.makeQuery(pageMaker.startPage - 1) }">prev</a>
																</c:if></li>

															<li class="page-item"><c:forEach
																	begin="${pageMaker.startPage }"
																	end="${pageMaker.endPage }" var="idx">
																	<c:out value="${pageMaker.cri.pageNum == idx?'':''}" />
																	<a href="mypage${pageMaker.makeQuery(idx)}">${idx}</a>
																</c:forEach></li>


															<li class="page-item"><c:if
																	test="${pageMaker.next && pageMaker.endPage > 0}">
																	<a class="page-link"
																		href="mypage${pageMaker.makeQuery(pageMaker.endPage +1) }">next
																	</a>
																</c:if></li>
														</ul>
													</div>

												</div>

											</div> --%>
										</div>
										<div class="tab-pane fade" id="ghi">
											<table>
												<div>
													<br>
												</div>
												<tr>
													<th>물품이름</th>
													<th>날짜</th>

													<th>수량</th>
													<th>아이디</th>

												</tr>


												<c:set var="list3" value="${list3}" />
												<c:forEach items="${list3}" var="dao3" varStatus="status">
													<c:forEach items="${dao3.dona}" var="dto3"
														varStatus="status">
														<tr>

															<td>${dao3.iname}</td>
															<td>${dto3.idntdate}</td>

															<!-- 제목누르면 해당 글내용으로 이동링크 -->
															<td>${dto3.donaamount}</td>
															<td>${dto3.member_id}</td>
														</tr>
													</c:forEach>
												</c:forEach>
											</table>
											<div id="nav">
												<a href="#" rel="0" class="active">1</a>
											</div>
											<%-- 	<div class="container">
												<div class="row">
													<div class="col">
														<ul class="pagination justify-content-center">
															<li class="page-item"><c:if test="${pageMaker.prev}">
																	<a class="page-link"
																		href="mypage${pageMaker.makeQuery(pageMaker.startPage - 1) }">prev</a>
																</c:if></li>

															<li class="page-item"><c:forEach
																	begin="${pageMaker.startPage }"
																	end="${pageMaker.endPage }" var="idx">
																	<c:out value="${pageMaker.cri.pageNum == idx?'':''}" />
																	<a href="mypage${pageMaker.makeQuery(idx)}">${idx}</a>
																</c:forEach></li>


															<li class="page-item"><c:if
																	test="${pageMaker.next && pageMaker.endPage > 0}">
																	<a class="page-link"
																		href="mypage${pageMaker.makeQuery(pageMaker.endPage +1) }">next
																	</a>
																</c:if></li>
														</ul>
													</div>

												</div>

											</div> --%>
										</div>
										<div class="tab-pane fade" id="jkl">
											<table>
												<div>
													<br>
												</div>
												<tr>

													<th>번호</th>
													<th>댓글내용</th>
													<th>날짜</th>
													<th>아이디</th>
													<th>분류번호</th>
												</tr>
												<c:set var="list4" value="${list4}" />
												<c:forEach items="${list4}" var="dao4" varStatus="status">
													<c:forEach items="${dao4.reply}" var="dto4"
														varStatus="status">
														<tr>
															<td>${dto4.r_num}</td>
															<td>${dto4.rcontent}</td>
															<!-- 제목누르면 해당 글내용으로 이동링크 -->
															<td>${dto4.rdate}</td>
															<td>${dto4.rid}</td>
															<td>${dao4.b_index}</td>
														</tr>
													</c:forEach>
												</c:forEach>
											</table>
											<div id="nav">
												<a href="#" rel="0" class="active">1</a>
											</div>
											<%-- 	<div class="container">
												<div class="row">
													<div class="col">
														<ul class="pagination justify-content-center">
															<li class="page-item"><c:if test="${pageMaker.prev}">
																	<a class="page-link"
																		href="mypage${pageMaker.makeQuery(pageMaker.startPage - 1) }">prev</a>
																</c:if></li>

															<li class="page-item"><c:forEach
																	begin="${pageMaker.startPage }"
																	end="${pageMaker.endPage }" var="idx">
																	<c:out value="${pageMaker.cri.pageNum == idx?'':''}" />
																	<a href="mypage${pageMaker.makeQuery(idx)}">${idx}</a>
																</c:forEach></li>


															<li class="page-item"><c:if
																	test="${pageMaker.next && pageMaker.endPage > 0}">
																	<a class="page-link"
																		href="mypage${pageMaker.makeQuery(pageMaker.endPage +1) }">next
																	</a>
																</c:if></li>
														</ul>
													</div>

												</div>

											</div> --%>

										</div>
									</div>
								</div>
							</div>
						</div>

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
	<footer id="charity-footer" class="charity-footer-one"> <!-- Footer Widget -->
	<div class="charity-footer-widget">
		<div class="container">

			<!-- CopyRight -->
			<div class="charity-copyright">
				<a href="/resources/charity/#" class="back-top charity-bgcolor"><i
					class="fa fa-angle-up"></i></a>
				<p>© 2018, All Right Reserved - by</p>
				<ul>
					<li><a href="/resources/charity/404.html">Terms and
							conditions</a></li>
					<li><a href="/resources/charity/404.html">Privacy policy</a></li>
				</ul>
			</div>
			<!-- CopyRight -->
		</div>
	</div>
	<!-- Footer Widget --> </footer>
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