<%@ page language="java" contentType="text/html; charset=UTF8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!doctype html>
<html lang="kr">

<!-- <script>
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
	width: 100px;
	height: 10px; 
</script> -->

<head>

<!-- meta tags -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Charity Blog</title>

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

</head>

<body>
	<!-- Header -->
	<header id="charity-header" class="charity-header-one"
		style="position: relative; z-index: 2">

		<!-- Top Strip -->
		<div class="charity-top-strip">
			<aside>
				<a href="${pageContext.request.contextPath}/main"
					class="charity-logo"
					style="width: 200px; height: 100px; margin: 0px 0px 0px 20px;"><img
					src="/resources/nanulogo.png" alt=""></a>
			</aside>
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
											<li><a href="event-list.html">나누셰어 소개</a></li>
											<li><a href="event-grid.html">찾아오셰어</a></li>
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
                                </span> -->

							</nav>

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
			<aside>
				<a href="#" class="charity-strip-btn charity-bgcolor"
					style="width: 70px; height: 40px; white-space: nowrap; padding: 10px 0px 0px 6px; margin: -75px 50px 0px 0px;">Sign
					up</a> <a href="#" class="charity-strip-btn charity-bgcolor"
					style="width: 70px; height: 40px; white-space: nowrap; padding: 10px 5px 0px 10px; margin: -75px 140px 0px 0px;">Sign
					in</a>
			</aside>
		</div>
		<!-- Top Strip -->
	</header>
	<!-- Header -->


	<!-- Sub Header -->
	<div class="charity-subheader">
		<!--   style="background-image: url(/resources/loginform/images/bg.jpg);" -->
		<span class="light-black-transparent"></span>
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<h1>인증게시판</h1>
					<p>show your support</p>
				</div>
			</div>
		</div>
	</div>
	<!-- Sub Header -->


	<!-- Content -->
	<div class="charity-main-content">

		<!-- Main Section -->
		<div class="charity-main-section">
			<div class="container">
				<div class="row">
				<div class="col-md-12">
					<!-- Widget Search -->
					<!-- 	<div class="widget_title"><h2>Search Here</h2></div> -->
					<div style="float: right;" class="widget widget_search col-md-4">
						<form>
							<input type="text" placeholder="검색어를 입력하세요."> <input type="submit" value=""> <i class="fa fa-search"></i>
						</form>
					</div>
					<!-- Widget Search -->
					<div  style="float: right;" class="col-md-2">
						<button  class="charity-click-btn" onclick="location.href='write_view'">나눔 인증글 작성</button>
					</div>
					<div class="col-md-6" style="float: right;"></div>
				</div>
				</div>
				
				<div class="row">
					<div class="col-md-12">

						<div class="charity-blog charity-simple-blog">
							<ul class="row">

								<c:forEach var="vo" items="${plist}">
									<li class="col-md-6">
										<figure>
											<a href="#"><img
												src="${pageContext.request.contextPath}/resources/charity/extra-images/blog-simple-1.jpg"
												alt=""></a>
											<figcaption>
												<time datetime="2008-02-14 20:00" class="charity-bgcolor">
													나눔<span>인증</span>
												</time>
												<a href="content_view?b_index=${vo.b_index}"
													class="blog-link-hover"><i class="fa fa-link"></i></a>
											</figcaption>
										</figure>

										<div class="charity-simple-blog-text">
											<ul class="charity-simple-blog-options">
												<li><i class="fa fa-folder-open"></i>글번호 ${vo.b_index}</li>
												<li><i class="fa fa-user-circle"></i>작성자
													${vo.member_id}</li>
												<li><i class="fa fa-calendar"></i>작성일 ${vo.bdate}</li>
												<li><i class="fa fa-mouse-pointer"></i>조회수 ${vo.bhit}</li>
												<!-- <li><i class="fa fa-comments"></i><a href="#">5 Comments</a></li> -->
												<!--  <li><i class="far fa-heart"></i> <a href="#">Like</a></li> -->
											</ul>
											<h2>
												<a href="content_view?b_index=${vo.b_index}">제목:
													${vo.btitle}</a>
											</h2>
											<p class="contentclass">${vo.bcontent}생의능히가치를 가지에 커다란 든
												돋고, 이상은 사막이다. 불어 소리다. 이것은 영원히 같은 바이며, 튼튼하며, 긴지라 피고, 돋고, 듣는다.
												예수는 하는 같이 용기가 청춘을 꽃이 간에 때까지 못할 사막이다. 살았으며, 사랑의 곳으로 사는가 간에
												기관과 낙원을 때문이다. 인생을 소금이라 얼마나 바이며, 힘있다. 구하지 아름답고 갑 피부가 끝에 같이,
												사람은 뼈 미인을 이것이다. 얼마나 살았으며, 불어 들어 이상을 그러므로 별과 아니다. 풀이 못할 피가 크고
												그들은 것이다. 내려온 듣기만 그들은 산야에 목숨이 맺어, 갑 것이다. 생의 곳으로 아니한 가슴에 많이
												인생에 어디 아니다. 인간이 것은 싶이 고행을 대한 않는 별과 부패뿐이다. 천자만홍이 인생에 과실이 같이 꽃
												것이다. 두손을 투명하되 낙원을 약동하다. 소금이라 미묘한 청춘의 꽃이 바이며, 쓸쓸하랴? 목숨이 거선의
												관현악이며, 현저하게 피고 보라.</p>
											<a href="content_view?b_index=${vo.b_index}"
												class="charity-simple-blog-btn">더보기</a>
											<script type="text/javascript">
												function truncateText(selector,
														maxLength) {
													var element = document
															.querySelector(selector), truncated = element.innerText;

													if (truncated.length > maxLength) {
														truncated = truncated
																.substr(0,
																		maxLength)
																+ '...';
													}
													return truncated;
												}
												//You can then call the function with something like what i have below.
												document.querySelector('p').innerText = truncateText(
														'p', 100);
											</script>
										</div>
									</li>
								</c:forEach>

								<%-- sample
                              <li class="col-md-6">
                                    <figure><a href="#"><img src="${pageContext.request.contextPath}/resources/charity/extra-images/blog-simple-2.jpg" alt=""></a>
                                        <figcaption>
                                            <time datetime="2008-02-14 20:00" class="charity-bgcolor">12 <span>JAN</span></time>
                                            <a href="#" class="blog-link-hover"><i class="fa fa-link"></i></a>
                                        </figcaption>
                                    </figure>
                                    <div class="charity-simple-blog-text">
                                        <ul class="charity-simple-blog-options">
                                            <li><i class="fa fa-map-marker-alt"></i> George Street, London United</li>
                                            <li><i class="fa fa-comments"></i> <a href="#">7 Comments</a></li>
                                            <li><i class="far fa-heart"></i> <a href="#">Like</a></li>
                                        </ul>
                                        <h2><a href="#">charity fears that soth suda nese refugee children</a></h2>
                                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed urna nibh, fringilla.</p>
                                        <a href="#" class="charity-simple-blog-btn">Read More</a>
                                    </div>
                                </li> --%>

							</ul>
						</div>

						<!-- Pagination -->
						<div class="charity-pagination">
							<ul class="page-numbers">
								<!-- "page-numbers" / pagination -->

								<%-- 	<li class="paginate_button previous"><a class="page-link"previous page-numbers // page-numbers
									href="plist${pageMaker.makeQuery(pageMaker.startPage - 1)}">«</a></li> --%>

								<c:if test="${pageMaker.prev}">
									<li><a class="previous page-umbers"
										href="plist${pageMaker.makeQuery(pageMaker.startPage-1)}"><span
											aria-label="Next"><i class="fa fa-angle-left"></i>Previous
												Post</span></a></li>
								</c:if>
								<!--  <li><span class="page-numbers current">01</span></li> -->

								<c:forEach begin="${pageMaker.startPage}"
									end="${pageMaker.endPage}" var="idx">
									<c:out value="${pageMaker.cri.pageNum == idx?'':''}" />
									<li><a class="page-umbers"
										href="plist${pageMaker.makeQuery(idx)}">${idx}</a></li>
								</c:forEach>

								<!-- 	<li><a class="page-numbers" href="404.html">03</a></li>
	                            	<li><a class="page-numbers" href="404.html">...</a></li>
	                            	<li><a class="page-numbers" href="404.html">10</a></li> -->

								<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
									<li><a class="next page-umbers"
										href="plist${pageMaker.makeQuery(pageMaker.endPage+1)}"><span
											aria-label="Next">Next Post<i
												class="fa fa-angle-right"></i></span></a></li>
								</c:if>

							</ul>
						</div>
						<!-- End of Pagination -->
					</div>
				</div>
			</div>
		</div>
		<!-- Main Section -->



	</div>
	<!-- Content -->

	<!-- Footer -->
	<footer id="charity-footer" class="charity-footer-one">

		<!-- Footer Newslatter -->
		<div class="charity-newslatter">
			<div class="container">
				<div class="row">
					<aside class="col-md-6">
						<h2>Sign up for newslatter</h2>
						<p>Submit your email and stay in tuch by notify our news and
							stay with us</p>
					</aside>
					<aside class="col-md-6">
						<form>
							<input type="text" placeholder="Enter Your Email"> <label>
								<input type="submit" value="Subscribe Now"> <i
								class="far fa-paper-plane"></i>
							</label>
						</form>
					</aside>
				</div>
			</div>
		</div>
		<!-- Footer Newslatter -->

		<!-- Footer Widget -->
		<div class="charity-footer-widget">
			<div class="container">
				<div class="row">
					<aside class="col-md-4 widget widget_usefull_links">
						<div class="charity-footer-title">
							<h2>Quick Links</h2>
						</div>
						<ul>
							<li><a href="#">Causes</a></li>
							<li><a href="#">Donors</a></li>
							<li><a href="#">Blogs</a></li>
							<li><a href="#">Latest News</a></li>
							<li><a href="#">Testimonials</a></li>
							<li><a href="#">Volunteers</a></li>
							<li><a href="#">Gallery</a></li>
							<li><a href="#">Contact us</a></li>
							<li><a href="#">Newsletter</a></li>
							<li><a href="#">Events</a></li>
						</ul>
					</aside>
					<aside class="col-md-4 widget widget_recent_news">
						<div class="charity-footer-title">
							<h2>Recent News</h2>
						</div>
						<ul>
							<li>
								<figure>
									<a href="#"><img
										src="${pageContext.request.contextPath}/resources/charity/extra-images/recent-news-widget-1.jpg"
										alt=""></a>
								</figure>
								<div class="widget_recent_news_text">
									<h6>
										<a href="#">Praesent sit amet tellus sed qum biben dum
											faucus</a>
									</h6>
									<span>22 Sept, 2016</span>
								</div>
							</li>
							<li>
								<figure>
									<a href="#"><img
										src="${pageContext.request.contextPath}/resources/charity/extra-images/recent-news-widget-2.jpg"
										alt=""></a>
								</figure>
								<div class="widget_recent_news_text">
									<h6>
										<a href="#">Morbi pulvinar faucibus urna, sit amet euisd
											nulla.</a>
									</h6>
									<span>22 Sept, 2016</span>
								</div>
							</li>
						</ul>
					</aside>
					<aside class="col-md-4 widget widget_gallery">
						<div class="charity-footer-title">
							<h2>Our Gallery</h2>
						</div>
						<ul>
							<li><a data-fancybox="gallery"
								href="${pageContext.request.contextPath}/resources/charity/extra-images/widget-gallery-1.jpg"><img
									src="${pageContext.request.contextPath}/resources/charity/extra-images/widget-gallery-1.jpg"
									alt=""> <i class="fa fa-plus"></i> </a></li>
							<li><a data-fancybox="gallery"
								href="${pageContext.request.contextPath}/resources/charity/extra-images/widget-gallery-2.jpg"><img
									src="${pageContext.request.contextPath}/resources/charity/extra-images/widget-gallery-2.jpg"
									alt=""> <i class="fa fa-plus"></i> </a></li>
							<li><a data-fancybox="gallery"
								href="${pageContext.request.contextPath}/resources/charity/extra-images/widget-gallery-3.jpg"><img
									src="${pageContext.request.contextPath}/resources/charity/extra-images/widget-gallery-3.jpg"
									alt=""> <i class="fa fa-plus"></i> </a></li>
							<li><a data-fancybox="gallery"
								href="${pageContext.request.contextPath}/resources/charity/extra-images/widget-gallery-4.jpg"><img
									src="${pageContext.request.contextPath}/resources/charity/extra-images/widget-gallery-4.jpg"
									alt=""> <i class="fa fa-plus"></i> </a></li>
							<li><a data-fancybox="gallery"
								href="${pageContext.request.contextPath}/resources/charity/extra-images/widget-gallery-5.jpg"><img
									src="${pageContext.request.contextPath}/resources/charity/extra-images/widget-gallery-5.jpg"
									alt=""> <i class="fa fa-plus"></i> </a></li>
							<li><a data-fancybox="gallery"
								href="${pageContext.request.contextPath}/resources/charity/extra-images/widget-gallery-6.jpg"><img
									src="${pageContext.request.contextPath}/resources/charity/extra-images/widget-gallery-6.jpg"
									alt=""> <i class="fa fa-plus"></i> </a></li>
							<li><a data-fancybox="gallery"
								href="${pageContext.request.contextPath}/resources/charity/extra-images/widget-gallery-7.jpg"><img
									src="${pageContext.request.contextPath}/resources/charity/extra-images/widget-gallery-7.jpg"
									alt=""> <i class="fa fa-plus"></i> </a></li>
							<li><a data-fancybox="gallery"
								href="${pageContext.request.contextPath}/resources/charity/extra-images/widget-gallery-8.jpg"><img
									src="${pageContext.request.contextPath}/resources/charity/extra-images/widget-gallery-8.jpg"
									alt=""> <i class="fa fa-plus"></i> </a></li>
						</ul>
					</aside>
				</div>
				<!-- CopyRight -->
				<div class="charity-copyright">
					<a href="#" class="back-top charity-bgcolor"><i
						class="fa fa-angle-up"></i></a>
					<p>Â© 2018, All Right Reserved - by RiteTags</p>
					<ul>
						<li><a href="404.html">Terms and conditions</a></li>
						<li><a href="404.html">Privacy policy</a></li>
					</ul>
				</div>
				<!-- CopyRight -->
			</div>
		</div>
		<!-- Footer Widget -->

	</footer>
	<!-- Footer -->

	<!-- Search Modal -->
	<div class="modal fade searchmodal" id="searchModal" tabindex="-1"
		role="dialog">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-body">
					<a href="#" class="charity-close-btn" data-dismiss="modal"
						aria-label="Close"><span aria-hidden="true">&times;</span></a>
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
	<script src="https://maps.googleapis.com/maps/api/js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/charity/script/jquery.jplayer.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/charity/script/jplayer.playlist.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/charity/script/functions.js"></script>
</body>
<script type="text/javascript">
	function truncateText(selector, maxLength) {
		var element = document.querySelector(selector), truncated = element.innerText;

		if (truncated.length > maxLength) {
			truncated = truncated.substr(0, maxLength) + '...';
		}
		return truncated;
	}
	//You can then call the function with something like what i have below.
	document.querySelector('p').innerText = truncateText('p', 50);
</script>
</html>