<!-- 혜선_ 물품기부 메인페이지_사용예정 뷰 페이지 _ 수정필요함, 테스트중 03.18-->

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!doctype html>
<html lang="en">

<head>
    <!-- meta tags -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <title>Charity Cause Detail</title>

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
    
    <!-- 웹페이지 탭 로고이미지 삽입  -->
	<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/nanulogo_ico_convert.ico"> 
	
</head>

<body>
    <!-- Header -->
    <%@ include file="/WEB-INF/views/mainMap/mainHeader.jsp"%>
    <!-- Header -->

    <!-- Banner -->
    <div class="charity-subheader">
        <span class="black-transparent"></span>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h1>돈기부여하기</h1>
                    <p>작은 나눔은 큰 힘이 됩니다.</p>
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
                    <div class="col-md-9">
                        <div class="charity-rich-editor charity-cause-detail">
                            <figure class="charity-cause-thumb"><img src="/resources/extra-images/cause-detail-img.png" alt=""></figure>
                            <h3>돈기부여</h3>
                           
                            <hr>
                            
                            <figure>
								<img id="introImg" class="money_img" src="${pageContext.request.contextPath}/resources/donation/money_community.jpg">
							</figure><br>
                            
                         <!--    <ul class="charity-cause-options">
                                <li>
                                    <i class="fa fa-clock"></i>
                                    <h6>Remaining Time:</h6>
                                    <span>19 days left</span>
                                </li>
                                <li>
                                    <i class="fa fa-heart"></i>
                                    <h6>Donors:</h6>
                                    <span>23</span>
                                </li>
                                <li>
                                    <i class="fa fa-map-marker-alt"></i>
                                    <h6>Location:</h6>
                                    <span>Cairo,Africa</span>
                                </li>
                                <li></li>
                            </ul> -->
                            <h5>회원 여러분들의 후원은 지속 가능한 나눔 활동을 가능케 하여 도움이 필요한 이웃들의 삶에 의미있는 변화를 가져옵니다. <br>지금, 그 변화의 시작에 함께하세요.</h5>
                            
                            
                             <!-- 버튼 -->
                            <div class="charity-cause-donate">
                  			   <div class="skillst">
                                <a href="/my/donation/moneyDonationForm" class="charity-plan-btn m-3">후원금 기부하기<i class="fa fa-heart"></i></a> 
                                <a href="/my/donation/money/point" class="charity-plan-btn m-3">포인트 기부하기<i class="fa fa-heart"></i></a>
                               </div>
                            </div> 
                            
                       		<br>
                           <!--  <blockquote>한 손은 나 자신을 돕는 손이고 다른 한 손은 다른 사람을 돕는 손이다. <br>_오드리 햅번</blockquote> -->
                            
                            <p>누구나 한 걸음부터 시작합니다. 후원자분들의 작은 정성이 모여 수많은 구호 활동을 펼쳤습니다. <br> 나누셰어와 함께하는 나눔의 첫걸음, 모이면 기적이 만들어집니다.</p>
                        </div> <!-- charity-rich-edito -->
                        
                        
                         
                        <!-- <div class="widget_title"><h2>Admin Post</h2></div>
                        <div class="charity-admin-post">
                            <figure>
                                <a href="404.html"><img src="/resources/extra-images/admin-post-img.png" alt=""></a>
                                <figcaption>
                                    <h6><a href="404.html">Mickey Ror</a></h6>
                                    <span>Founder</span>
                                </figcaption>
                            </figure>
                            <div class="charity-admin-post-text">
                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas ultricies dolor libero, eu fermentum ante tristique fermentum. Vestibulum maximus ornare facilisis. Etiam id vulp utate dolor. Class aptent taciti sociosqu ad litor.</p>
                                <ul class="charity-admin-social">
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
                                        <a href="https://www.vimeo.com/" class="fab fa-vine"></a>
                                    </li>
                                </ul>
                            </div>
                        </div> -->
                       
                        <div class="widget_title"><h2>돈기부여 안내</h2></div>
                        <div class="charity-campaign-content">
                            <div class="row">
                                <div class="col-md-12">
                                    <ul class="charity-list-style-one">
                                        <li>후원금은 나누셰어의 모든 활동 중 가장 긴급하게 필요한 곳에 사용됩니다.</li>
                                        <li>후원금 기부방법은 카드결제, 계좌이체가 가능합니다.</li>
                                        <li>이벤트를 통해 모은 포인트는 포인트 기부하기 탭을 통해 1,000포인트부터 기부하실 수 있습니다.</li>
                                       <!--  <li>Aliquam ex lorem, feugiat eget dolor in, iaculis ullamc</li>
                                        <li>Nullam rhoncus, nisl id ultrices tristique.</li> -->
                                    </ul>
                                </div> <!-- col-md-7 -->
                                <div class="col-md-5">
                                    <img src="/resources/extra-images/Campaign-img1.png" alt="" class="charity-campaing-image">
                                </div> <!-- col-md-5 -->
                            </div> <!-- row -->
                        </div> <!-- charity-campaign-content -->
                        
                        <!-- <div class="widget_title"><h2>Cause Progress</h2></div>
                        <div class="charity-progress-wrap">
                            <div class="row">
                                <div class="col-md-5">
                                    <p>Nullam sollicitudin orci id velit dapibus preti um. Cras elementum arcu ac neque iaculisid consequat nunc condimentum.</p>
                                    <p>Etiam pharetra diam et sapien ullamcorperw eget porta tortor pulvinar. Nam lobortis, velit in commodo mattis.</p>
                                </div> col-md-5
                            </div> row
                        </div> --><!--  charity-progress-wrap  -->
                        
                        
                        <div class="charity-rich-editor">
                            <div class="charity-post-tags">
                              
                                <div class="charity-tags">
                                    <span>Tags:</span>
                                    <a href="404.html">charity </a>
                                    <a href="404.html">/ donation</a>
                                    <a href="404.html"> / needy</a>
                                </div> <!-- charity-tags -->
                               
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
                                </div> <!-- charity-blog-social -->
                                
                            </div> <!-- charity-post-tags -->
                        </div> <!--charity-rich-editor -->
                        
                        
                    </div><!-- col-md-9 -->
                    
                    <!-- 우측 배너  aside -->
			    	<%@ include file="/WEB-INF/views/board_show/aside.jsp"%>
			    	<!-- aside end -->
			    	
                </div> <!-- row -->
            </div> <!-- container -->
        </div> <!-- Main Section -->
    </div> <!-- Content -->


    <!-- Footer -->
    <%@ include file="/WEB-INF/views/mainMap/mainFooter.jsp"%>
    <!-- Footer -->

    <!-- jQuery -->
    <script src="${pageContext.request.contextPath}/resources/charity/script/jquery.js"></script>
    <script src="${pageContext.request.contextPath}/resources/charity/script/popper.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/charity/script/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/charity/script/slick.slider.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/charity/script/progressbar.js"></script>
    <script src="${pageContext.request.contextPath}/resources/charity/script/fancybox.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/charity/script/jquery.countdown.min.js"></script>
    <script src="https://maps.googleapis.com/maps/api/js"></script>
    <script src="${pageContext.request.contextPath}/resources/charity/script/jquery.jplayer.js"></script>
    <script src="${pageContext.request.contextPath}/resources/charity/script/jplayer.playlist.js"></script>
    <script src="${pageContext.request.contextPath}/resources/charity/script/functions.js"></script>
</body>

</html>