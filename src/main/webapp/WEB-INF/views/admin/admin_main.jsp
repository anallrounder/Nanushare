<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<html>
<head>
<title>Admin Page</title>

 <!-- meta tags -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <title>Charity Team Detail</title>

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

  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome Icons -->
  <link rel="stylesheet" href="/resources/AdminLTE-master/plugins/fontawesome-free/css/all.min.css">
  <!-- IonIcons -->
  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="/resources/AdminLTE-master/dist/css/adminlte.min.css">
  
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

</head>
<body>
    <!-- Header -->
    <header id="charity-header" class="charity-header-one" style="position:relative;z-index:2">
     
        <!-- Top Strip -->
        <div class="charity-top-strip">
        <aside ><a href="${pageContext.request.contextPath}/main" class="charity-logo" style="width:200px;height:100px; margin: 0px 0px 0px 20px;"><img src="/resources/nanulogo.png" alt=""></a></aside>
            <div class="container">
                <div class="row">
                    <aside class="col-12">
                        <div class="float-center">
                            <a href="#menu" class="menu-link active"><span></span></a>
                            <nav id="menu" class="menu charity-navigation">
                            
                                <ul>
                                    <!-- <li class="active"><a href="index.html">Home</a></li> -->
                                    <li style="padding: 0px 40px 0px 70px"><a href="${pageContext.request.contextPath}/menu/about" style="font-size: 20px;">나누셰어란?</a>
                                        <ul class="children">
                                            <li><a href="${pageContext.request.contextPath}/menu/about">나누셰어 소개</a></li>
                                            <li><a href="${pageContext.request.contextPath}/menu/way">찾아오셰어</a></li>
                                        <!--     <li><a href="event-detail.html">Event Detail</a></li> -->
                                        </ul>
                                    </li>
                                    <li style="padding: 0px 40px 0px 30px"><a href="#" style="font-size: 20px;">나눔함 안내</a>
                                       <!--  <ul class="children">
                                            <li><a href="cause-list.html">Cause List</a></li>
                                            <li><a href="cause-grid.html">Cause Grid</a></li>
                                            <li><a href="cause-detail.html">Cause Detail</a></li>
                                        </ul> -->
                                    </li>
                                    <li style="padding: 0px 40px 0px 30px"><a href="${pageContext.request.contextPath}/donation/item/main" style="font-size: 20px;">나누기</a>
                                        <ul class="children">
                                            <li><a href="${pageContext.request.contextPath}/donation/item/main">물품 나누기</a></li>
                                            <li><a href="${pageContext.request.contextPath}/donation/money/main">돈기부여하기</a></li>
                                            <!-- <li><a href="blog-detail.html">Cause Detail</a></li> -->
                                        </ul>
                                    </li>
                                    <li style="padding: 0px 40px 0px 30px"><a href="${pageContext.request.contextPath}/board/shows/list" style="font-size: 20px;">나눔 인증</a>
                                       <!--  <ul class="children">
                                            <li><a href="team-grid.html">Team Grid</a></li>
                                            <li><a href="team-classic.html">Team Classic</a></li>
                                            <li><a href="team-detail.html">Team Detail</a></li>
                                        </ul> -->
                                    </li>
                                    <li style="padding: 0px 40px 0px 30px"><a href="${pageContext.request.contextPath}/event/check"style="font-size: 20px;">이벤트</a>
                                        <ul class="children">
                                            <li><a href="${pageContext.request.contextPath}/event/check">출석체크</a></li>
                                            <li><a href="${pageContext.request.contextPath}/event/test">테스트</a></li>
                                            <li><a href="${pageContext.request.contextPath}/event/game">게임</a></li>
                                           <!--  <li><a href="prayer-detail.html">Prayer De1tail</a></li>
                                            <li><a href="404.html">404 Error</a></li>
                                            <li><a href="search-result.html">Search Result</a></li> -->
                                        </ul>
                                    </li>
                                    <li style="padding: 0px 40px 0px 30px"><a href="${pageContext.request.contextPath}/restful/notice" style="font-size: 20px;">더하기</a>
                                     	<ul class="children">
                                            <li><a href="${pageContext.request.contextPath}/restful/notice">공지사항</a></li>
                                            <li><a href="${pageContext.request.contextPath}/restful/qna">문의하기</a></li>
                                    	</ul>
                                    </li>	
                              
                         
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
			
			<sec:authorize access="hasRole('ADMIN')"> <!-- 관리자 버튼 header -->
				<a href="${pageContext.request.contextPath}/member/logout" class="charity-strip-btn charity-bgcolor" style="width:70px;height:40px; white-space: nowrap; padding: 10px 0px 0px 6px; margin: -75px 50px 0px 0px;">로그아웃</a>
				<a href="${pageContext.request.contextPath}/admin/Donation" class="charity-strip-btn charity-bgcolor" style="width:75px;height:40px; white-space: nowrap; padding: 10px 5px 0px 10px; margin: -75px 140px 0px 0px;">관리자 페이지</a>
			</sec:authorize>

		</div>
        <!-- Top Strip -->
    </header>
    <!-- Header -->
    
    <!-- Banner -->
	<div class="charity-subheader">
		<span class="black-transparent"></span>
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<h1>관리자 페이지</h1>
	                <p>Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero</p>
				</div>
			</div>
			
		</div>
	</div>
	<!-- Banner -->
	
	
    <!-- Content -->
    <div class="charity-main-content">

        <!-- Main Section -->
        <div class="charity-main-section">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        
                        <!--// volunteer-form \\-->
                        <div class="widget_title"><h2>회원 관리</h2></div>
                        <div class="charity-volunteer-form" >
                         
									<ul class="nav nav-tabs" style="text-align: center;">
										<li class="nav-item"><a class="nav-link active"
											data-toggle="tab" href="#abc">기본 정보</a></li>
										<li class="nav-item"><a class="nav-link"
											data-toggle="tab" href="#def">물품 기부</a></li>
										<li class="nav-item"><a class="nav-link"
											data-toggle="tab" href="#ghi">돈기부여</a></li>
										<li class="nav-item"><a class="nav-link"
											data-toggle="tab" href="#jkl">포인트</a></li>
											<li class="nav-item"><a class="nav-link"
											data-toggle="tab" href="#jkl">문의 내역</a></li>
									</ul>
									<div class="tab-content">
										<div class="tab-pane fade show active" id="abc">
										
											<table>
												<div>
													<br>
												</div>
												 <!--// volunteer-form \\-->
						                            <form>
							                            <tr>
							                               <th>아이디</th>
							                               <th>이름</th>
							                               <th>가입경로</th>
							                               <th>후원금기부횟수</th>
							                               <th>물품기부횟수</th>
							                               <th>블랙리스트 여부</th>
						                               	</tr>
						                                
						                                <c:forEach items="${memberControl}" var="member">
						                                 <tr>
							                               <th><a href="member_view?member_id=${member.member_id}">${member.member_id}</a></th>
							                               <th>${member.name}</th>
							                               <th>${member.signuppath}</th>
							                               <th>${member.dntcnt}</th>
							                               <th>${member.itemdntcnt}</th>
							                               <th>${member.bklist}</th>
						                               	</tr>
						                                </c:forEach>
						                            </form>
						                                   
						                        <!--// volunteer-form \\-->
											</table>
											<button type="submit">회원 정보 수정</button>
											<!-- 페이징 -->
											<div id="nav">
												<a href="#" rel="0" class="active">1</a>
											</div>
											

										</div>
										<div class="tab-pane fade" id="def">
											<table>

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
											
										</div>
									</div>
						

                        </div>
                        <!--// volunteer-form \\-->
                        <div class="charity-team-contactus">
                       
                            <ul>
                                <li>
                                    <i class="fa fa-envelope"></i>
                                    <h5>돌아가기</h5>
                                <!--     <a href="mailto:name@email.com">info@example.com</a> -->
                                </li>
                                <li>
                                    <i class="fa fa-phone"></i>
                                    <h5>회원 삭제</h5>
                                    <!-- <span>+(091)61 3146 8728</span> -->
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Main Section -->

    </div>
    <!-- Content -->
</div>
<!-- ./wrapper -->	
	
	  <!-- Footer -->
    <footer id="charity-footer" class="charity-footer-one">

        <!-- Footer Newslatter -->
        <div class="charity-newslatter">
            <div class="container">
                <div class="row">
                    <aside class="col-md-6">
                        <h2>고액 기부 & 정기 기부 문의</h2><!-- <h3 style="margin-left: 325px; margin-top: -30px;">"Donate Contact"</h3> -->
                        <p>고액으로 기부하시거나 정기 기부를 문의하실 분은<br> 나누셰어 공식 번호로 연락 또는 메일을 남겨주세요:D</p>
                    </aside>
                    <aside class="col-md-6">
                        <form>
                            <input type="text" placeholder="e-mail을 남겨주시면 기부 관련 메일을 보내드립니다" style="width: 400px; margin-left: -30px;">
                            <label>
                                <input type="submit" value="e-mail 전송">
                                <i class="far fa-paper-plane"></i>
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
                    
                        <div class="charity-footer-title"> <h2>Quick Links</h2> 
                        </div>
                        <ul>
                            <li><a href="#">나누셰어란</a></li>
                            <li><a href="#">나눔함 안내</a></li>
                            <li><a href="#">물품 나누기</a></li>
                            <li><a href="#">돈기부여하기</a></li>
                            <li><a href="#">나눔인증</a></li>
                            <li><a href="#">이벤트</a></li>
                            <li><a href="#">공지사항</a></li>
                            <li><a href="#">문의하기</a></li>
                        </ul>
                    </aside>
                    <aside class="col-md-4 widget widget_recent_news">
                        <div class="charity-footer-title"> <h2>Recent News</h2> </div>
                        <ul>
                            <li>
                                <figure><a href="#"><img src="/resources/nanulogo.png" alt=""></a></figure>
                                <div class="widget_recent_news_text">
                                    <h6><a href="https://www.ytn.co.kr/_ln/0103_202103202243071761">점점 줄어드는 현금 기부...<br>'QR 기부'까지 등장</a></h6>
                                    <span>20 March, 2021</span>
                                </div>
                            </li>
                            <li>
                                <figure><a href="#"><img src="/resources/nanulogo.png" alt=""></a></figure>
                                <div class="widget_recent_news_text">
                                    <h6><a href="https://www.donga.com/news/Economy/article/all/20210317/105918758/1">기업이익 사회에 환원하는<br> 기부천사</a></h6>
                                    <span>18 March, 2021</span>
                                </div>
                            </li>
                        </ul>
                    </aside>
                    <aside class="col-md-4 widget widget_gallery">
                        <div class="charity-footer-title"> <h2>Our Share</h2> </div>
                        <ul>
                           <!--  <li><a data-fancybox="gallery" href="/resources/picture/all.jpg"><img src="/resources/picture/all.jpg" alt=""> <i class="fa fa-plus"></i> </a></li>
                            <li><a data-fancybox="gallery" href="/resources/picture/si.png"><img src="/resources/picture/si.png" alt=""> <i class="fa fa-plus"></i> </a></li>
                            <li><a data-fancybox="gallery" href="/resources/picture/sb.png"><img src="/resources/picture/sb.png" alt=""> <i class="fa fa-plus"></i> </a></li> -->
                            <li><a data-fancybox="gallery" href="/resources/picture/ji.png"> <img src="/resources/picture/ji.png" alt=""><i class="fa fa-plus"></i> </a></li>
                            <li><a data-fancybox="gallery" href="/resources/picture/hj.png"><img src="/resources/picture/hj.png" alt=""> <i class="fa fa-plus"></i> </a></li>
                            <li><a data-fancybox="gallery" href="/resources/picture/hs.png"><img src="/resources/picture/hs.png" alt=""> <i class="fa fa-plus"></i> </a></li>
                        </ul>
                    </aside>
                </div>
                <!-- CopyRight -->
                <div class="charity-copyright">
                    <a href="#" class="back-top charity-bgcolor"><i class="fa fa-angle-up"></i></a>
                    <p><a href="#">이용약관</a> &nbsp; &nbsp;<a href="#">개인정보처리방침</a>&nbsp; &nbsp; <a href="#">이메일집단수집거부</a>&nbsp; &nbsp;<a href="#">오시는길</a>&nbsp; &nbsp;<a href="#">문의</a>&nbsp; &nbsp;<a href="#">사이트맵</a></p><p style="margin-left: 270px;">Â© 2021, All Right Reserved - by NanuShare</p><br>
                    <p style="margin-left: 0px;"> <i class="fa fa-map-marker-alt"></i> &nbsp;(우)03164 서울특별시 종로구 종로2가 종로69</p> <p> &nbsp; &nbsp;<i class="fa fa-phone"  style="transform: rotate(90deg);"></i> &nbsp;대표전화 02-722-1481</p>
                    
                    <!-- <ul>
                    	<li><a href="#">이용약관</a></li>s
                     
                    </ul> -->
                </div>
                <!-- CopyRight -->
            </div>
        </div>
        <!-- Footer Widget -->

    </footer>
    <!-- Footer -->

    <!-- Search Modal -->
    <div class="modal fade searchmodal" id="searchModal" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-body">
                    <a href="#" class="charity-close-btn" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></a>
                    <form>
                        <input type="text" value="Type Your Keyword" onblur="if(this.value == '') { this.value ='Type Your Keyword'; }" onfocus="if(this.value =='Type Your Keyword') { this.value = ''; }">
                        <input type="submit" value="">
                        <i class="fa fa-search"></i>
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
    <script src="/resources/charity/script/progressbar-main.js"></script> <!-- progressbar 복붙해서 사용  -->
    <script src="/resources/charity/script/fancybox.min.js"></script>
    <script src="/resources/charity/script/jquery.countdown.min.js"></script>
    <script src="https://maps.googleapis.com/maps/api/js"></script>
    <script src="/resources/charity/script/jquery.jplayer.js"></script>
    <script src="/resources/charity/script/jplayer.playlist.js"></script>
    <script src="/resources/charity/script/functions-main.js"></script> <!-- fuctions 복붙해서 사용 -->
    
 
<!-- Bootstrap -->
<script src="/resources/AdminLTE-master/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE -->
<script src="/resources/AdminLTE-master/dist/js/adminlte.js"></script>

<!-- OPTIONAL SCRIPTS -->
<script src="/resources/AdminLTE-master/plugins/chart.js/Chart.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="/resources/AdminLTE-master/dist/js/demo.js"></script>
<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
<script src="/resources/AdminLTE-master/dist/js/pages/dashboard3.js"></script>
</body>
</html>
