<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!doctype html>
<html lang="ko">

<head>

    <!-- meta tags -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!--initial-scale: 페이지 처음 접속 시 보여질 배율  -->
    
    <title>Charity</title>

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

<style>



li {
	list-style: none;
	
}

.widget_events li {
width: 270px;
}
	
.charity-events p {

	font-size: 11px; 
	color: #696969;
}
	
</style>

</head>

<body>
   
    <!-- Header -->
    <header id="charity-header" class="charity-header-one">
        <!-- Top Strip -->
        <div class="charity-top-strip">
			
			<a href="${pageContext.request.contextPath}/main" class="charity-logo"><img src="/resources/nanulogoRe.ico" alt=""></a>
			
			<div>
				<a href="#menu" class="menu-link active"><span></span></a>
				<nav id="menu" class="menu charity-navigation">
					<ul>
						<li><a href="${pageContext.request.contextPath}/menu/about">나누셰어란?</a>
							<ul class="children">
								<li><a href="${pageContext.request.contextPath}/menu/about">나누셰어 소개</a></li>
								<li><a href="${pageContext.request.contextPath}/menu/way">찾아오셰어</a></li>
							</ul>
						</li>
						<li><a class="mainMap-top" href="#" style="display: scroll;">나눔함 안내</a></li>
						<li>
							<a href="${pageContext.request.contextPath}/donation/item/main">나누기</a>
							<ul class="children">
								<li><a href="${pageContext.request.contextPath}/donation/item/main">물품 나누기</a></li>
								<li><a href="${pageContext.request.contextPath}/donation/money/main">돈기부여하기</a></li>
							</ul>
						</li>
						<li><a href="${pageContext.request.contextPath}/board/shows/list">나눔 인증</a></li>
						<li><a href="${pageContext.request.contextPath}/my/event/check">이벤트</a>
							<ul class="children">
								<li><a href="${pageContext.request.contextPath}/my/event/check">출석체크</a></li>
								<li><a href="${pageContext.request.contextPath}/event/test">테스트</a></li>
								<li><a href="${pageContext.request.contextPath}/event/game">게임</a></li>
							</ul>
						</li>
						<li><a href="${pageContext.request.contextPath}/board/notice">더하기</a>
							<ul class="children">
								<li><a href="${pageContext.request.contextPath}/board/notice">공지사항</a></li>
								<li><a href="${pageContext.request.contextPath}/board/qna">문의하기</a></li>
							</ul>
						</li>	
					</ul>
				</nav>
			</div>
            
            <div class="float-right">
				<!-- all 버튼 header -->
				<sec:authorize access="isAnonymous()"> 
					<div class="all-header">
					<a href="${pageContext.request.contextPath}/loginPage" class="charity-strip-btn charity-bgcolor" >로그인</a>
					
					<form id="signUp">
						<a href="${pageContext.request.contextPath}/signUpForm" class="charity-strip-btn charity-bgcolor">회원가입</a>
					</form>
					
					</div>
					
				</sec:authorize>	
																																			
				<!-- 로그인됐을때 버튼 header -->
				<div class="user-header">
				<sec:authorize access="hasRole('USER')">
					<c:forEach items="${username}" var="username">
	                   <span>${username}님</span>
	                </c:forEach> 
					
					<a href="${pageContext.request.contextPath}/my/mypage" class="charity-strip-btn charity-bgcolor">마이페이지</a>

					<form action="/member/logout" method="post" id="mlogout">
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
						<a href="#" class="charity-strip-btn charity-bgcolor" onclick="document.getElementById('mlogout').submit();">로그아웃</a>
					</form>
				</sec:authorize>
				</div>
							
				<!-- 관리자 버튼 header -->	
				<div class="admin-header">		
				<sec:authorize access="hasRole('ADMIN')"> 
					<c:forEach items="${username}" var="username">
                    	<span>${username}님</span>
                    </c:forEach>
                   
					<a href="${pageContext.request.contextPath}/admin/stat" class="charity-strip-btn charity-bgcolor">관리자페이지</a>
					<form action="/member/logout" method="post" id="mlogout">
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
						<a href="#" class="charity-strip-btn charity-bgcolor" onclick="document.getElementById('mlogout').submit();">로그아웃</a>
					</form>
					
				</sec:authorize>
				</div>
			</div>
		</div>
         
        <!-- Top Strip -->
    </header>
    <!-- Banner -->
    <section style="background-color: #222222">
     <div class="container-fluid">
            <!-- <div class="container-fluid px-0"> 은 왼쪽여백 아예 없게 하는것-->
            <div class="row">
                <div class="col-12">
                   <div class="charity-banner">
 
                            <div class="charity-banner-layer">
                                <span class="charity-banner-transparent"></span> 
                                <img src="/resources/picture/donation.jpg" alt="">
                                <div class="charity-banner-caption align-left-caption">
                                    <div class="container">
                                        <h1>
                                            <span class="charity-color">함께할수록 </span><br>커지는 기쁨
                                        </h1>
                                        <div class="clearfix"></div>
                                        <p>
                                            같이할수록 커지는 가치 <br>함께하실래요?
                                        </p>
                                        <div class="clearfix"></div>
                                        <!--  <a href="#">Learn More</a> -->
                                        <a href="/donation/item/main">Donate Now</a>
                                    </div>
                                </div>
                            </div>


                            <div class="charity-banner-layer">
                                <span class="charity-banner-transparent"></span> 
                                <img src="/resources/picture/love.jpg" alt="" height="auto">
                                <div class="charity-banner-caption align-left-caption">
                                    <div class="container">
                                        <h1>
                                            세상을 바꾸는<span class="charity-color"><br>따뜻한 온기</span>
                                        </h1>
                                        <div class="clearfix"></div>
                                        <p>
                                            여러분의 작은 관심과 따뜻한 온기가 누군가에게는 <br>따뜻한 희망이 됩니다
                                        </p>
                                        <div class="clearfix"></div>
                                        <!--  <a href="#">Learn More</a> -->
                                        <a href="/donation/money/main">Donate Now</a>
                                    </div>
                                </div>
                            </div>
                            <div class="charity-banner-layer">
                                <span class="charity-banner-transparent"></span> 
                                <img src="/resources/picture/mask.jpg" alt="">
                                <div class="charity-banner-caption align-left-caption">
                                    <div class="container">
                                        <h1>
                                            누군가에게 도움이 된다는<span class="charity-color"><br>작은
                                                행복</span>
                                        </h1>
                                        <div class="clearfix"></div>
                                        <p>
                                            큰 돈을 기부하지않아도 많은 물건을 주지 않아도 <br> 누군가에게 도움이 된다는 일이 행복한 일임을
                                            새삼 알았습니다
                                        </p>
                                        <div class="clearfix"></div>
                                        <a href="/board/shows/list">Learn More</a> <a href="/donation/item/main">Donate Now</a>
                                    </div>
                                </div>
                            </div>
                            <div class="charity-banner-layer">
                                <span class="charity-banner-transparent"></span> 
                                <img src="/resources/picture/smile.jpg" alt="">
                                <div class="charity-banner-caption align-left-caption">
                                    <div class="container">
                                        <h1>
                                            나누셰어의 <span class="charity-color"><br>선한 바람 </span>
                                        </h1>
                                        <div class="clearfix"></div>
                                        <p>다른 후원사이트에 비해서 나누셰어는 정말 믿을 수 있는 것 같아요</p>
                                        <div class="clearfix"></div>
                                        <a href="/board/shows/list">Learn More</a> <a href="/donation/money/main">Donate Now</a>
                                    </div>
                                </div>
                            </div>
                        </div>
				</div>
			</div>
		</div>
	</section>
	<!-- Banner -->
	
    <!-- Content-count -->
    <div class="charity-main-content" style="padding: 0px 0 40px;">
        <!-- Main Section -->
        <div class="charity-main-section charity_counter_full">
            <span class="black-transparent"></span>
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="charity-counter" id="counter">
                            <ul class="row">
                            
                                <!-- style="transform: translateY(30px); -->
                                <li class="col-md-4">
                                    <i class="icon-donation2 charity-bgcolor"></i>
                                    <span class="counter-value" data-count="${dailySale}">0</span>
                                    <small>오늘의 온도</small>
                                </li>
                                <li class="col-md-4">
                                    <i class="fas fa-heart charity-bgcolor"></i>
                                    <span class="counter-value" data-count="${monthSale}">0</span>
                                    <small>이번 달 온도</small>
                                </li>
                                <li class="col-md-4">
                                    <i class="icon-help charity-bgcolor"></i>
                                    <span class="counter-value" data-count="${yearSale}">0</span>
                                    <small>올해 온도</small>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Main Section -->
        
        <!-- Main Section -->
        <div class="charity-main-section">
            <div class="container">
                <div class="row">
                    <div class="col-md-9 bottom-spacer">
                    
                        <div class="charity-event-map">
                            <div class="widget_title"><h2><i class="fa fa-inbox"></i>&nbsp; NanuShare Box Location</h2></div>
                            <div id="map" style="height: 600px;">
                            <c:import url="kakaomap.jsp"/> </div>
                        </div>

                       
                    </div>
                    <aside class="col-md-3">
                        
                        <!-- Widget Archive -->
                        <div class="widget widget_archive">
                            <div class="widget_title"><h2>Current ShareBox</h2></div>
                            <c:forEach items="${mapvm}" var="cat">
                            	<span class="branches" data-lng="${cat.lng}" data-lat="${cat.lat}">
                            	<h5><i class="fa fa-map-marker-alt"></i>&nbsp;${cat.branch}</h5></span>
                           </c:forEach>
                           
                        </div>
                        <!-- Widget Archive -->
                        
                    </aside>
                </div>
            </div>
        </div>
        <!-- Main Section -->
      <%@ include file="/WEB-INF/views/chat/chatIcon.jsp" %>
    </div> 
    <!-- Content -->

     <%@ include file="/WEB-INF/views/mainMap/mainFooter.jsp"%>
            

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
    <script src="/resources/charity/script/functions-main.js"></script>
    <!-- <script src="/resources/charity/script/functions-main.js"></script>  --><!-- fuctions 복붙해서 사용 -->
</body>

</html>