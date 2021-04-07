<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
</style>

</head>

<body>
    <%@ include file="/WEB-INF/views/mainMap/mainHeader.jsp"%>

    <!-- Banner -->
    <section style="background-color: #222222">
     <div class="container-fluid px-0 ">
            <!-- <div class="container-fluid px-0"> 은 왼쪽여백 아예 없게 하는것-->
            <div class="row">
                <div class="col-12">
                   <div class="charity-banner" style="overflow: hidden; zoom: 1; position: relative; z-index: 1">
 
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
                                        <a href="#">Donate Now</a>
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
                                        <a href="#">Donate Now</a>
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
                                        <a href="#">Learn More</a> <a href="#">Donate Now</a>
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
                                        <a href="#">Learn More</a> <a href="#">Donate Now</a>
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
                                <c:forEach var="result" items="${daymoney}">
                                  <c:set var="total" value="${total + result.dntprice}" />
                                </c:forEach>
                                <li class="col-md-3">
                                    <i class="icon-donation2 charity-bgcolor"></i>
                                    <span class="counter-value" data-count="${total}"></span>
                                    <small>Donators</small>
                                </li>
                                <li class="col-md-3">
                                    <i class="icon-ribbon charity-bgcolor"></i>
                                    <span class="counter-value" data-count="60574">0</span>
                                    <small>Causes Solved</small>
                                </li>
                                <li class="col-md-3">
                                    <i class="icon-mortarboard charity-bgcolor"></i>
                                    <span class="counter-value" data-count="30047">0</span>
                                    <small>Volunteer</small>
                                </li>
                                <li class="col-md-3">
                                    <i class="icon-help charity-bgcolor"></i>
                                    <span class="counter-value" data-count="7814">0</span>
                                    <small>Child Saved</small>
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
                            <c:import url="kakaomap2.jsp"/> </div>
                        </div>

                        <div class="charity-post-tags">
                            <div class="charity-tags">
                                <span>Tags:</span>
                                <a href="404.html">charity </a>
                                <a href="404.html">/ donation</a>
                                <a href="404.html"> / needy</a>
                            </div>
                            <div class="charity-blog-social">
                                <span>Share:</span>
                                <ul>
                                    <li>
                                        <a href="https://www.facebook.com/" class="fab fa-facebook"></a>
                                    </li>
                                    <li>
                                        <a href="https://www.twitter.com/" class="fab fa-twitter"></a>
                                    </li>
                                    <li>
                                        <a href="https://www.linkedin.com/" class="fab fa-linkedin"></a>
                                    </li>
                                    <li>
                                        <a href="https://www.youtube.com/" class="fab fa-youtube"></a>
                                    </li>
                                    <li>
                                        <a href="https://www.vimeo.com/" class="fab fa-vimeo"></a>
                                    </li>
                                </ul>
                            </div>
                        </div>

                    </div>
                    <aside class="col-md-3">
                        
                        <!-- Widget Search -->
                        <div class="widget widget_search">
                            <div class="widget_title"><h2>Search Here</h2></div>
                            <form>
                                <input type="text" placeholder="Search Here">
                                <input type="submit" value="">
                                <i class="fa fa-search"></i>
                            </form>
                        </div>
                        <!-- Widget Search -->
                     
                        <!-- Widget Archive -->
                        <div class="widget widget_archive">
                            <div class="widget_title"><h2>Current ShareBox</h2></div>
                            <c:forEach items="${mapvm}" var="cat">
                            <span style="font-size: 18px;" class="branches" data-lng="${cat.lng}" data-lat="${cat.lat}">
                            	<i class="fa fa-map-marker-alt"></i>&nbsp; ${cat.branch}</span><br><br>
                           </c:forEach>
                           
                        </div>
                        <!-- Widget Archive -->
                        
                          <!-- Widget Event -->
                        <div class="widget widget_events">
                            <div class="widget_title"><h2>Upcoming ShareBox</h2></div>
                            <ul>
                                <li>
                                    <time datetime="2008-02-14 20:00">22 Jun</time>
                                    <div class="charity-events">
                                       <h6>강남역점</h6>
                                       <p style="font-size: 11px; color: #696969;"><i class="fa fa-map-marker-alt"></i> 서울 서초구 서초동 1318-10</p>
                                    </div>
                                </li>
                                <li>
                                    <time datetime="2008-02-14 20:00">13 July</time>
                                    <div class="charity-events">
                                       <h6>용산역점</h6>
                                       <p style="font-size: 11px; color: #696969;"><i class="fa fa-map-marker-alt"></i> 서울 용산구 한강대로 23길 55</p>
                                    </div>
                                </li>
                                <li>
                                    <time datetime="2008-02-14 20:00">20 July</time>
                                    <div class="charity-events">
                                       <h6>시청역점</h6>
                                      <p style="font-size: 11px; color: #696969;"><i class="fa fa-map-marker-alt"></i> 서울 중구 태평로 1가 54-3</p>
                                    </div>
                                </li>
                             </ul>
                        </div>
                        <!-- Widget Event -->
                    </aside>
                </div>
            </div>
        </div>
        <!-- Main Section -->
      
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
    <script src="/resources/charity/script/functions-main.js"></script> <!-- fuctions 복붙해서 사용 -->
</body>

</html>