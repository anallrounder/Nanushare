<!-- 혜선_ 물품기부 메인페이지_사용예정 뷰 페이지 _ 수정필요함, 테스트중 03.18-->

<%@ page language="java" contentType="text/html; charset=UTF8" pageEncoding="UTF-8"%>
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
                    <h1>물품 신청 안내</h1>
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
                    <div class="col-md-9">
                        <div class="charity-rich-editor charity-cause-detail">
                            <figure class="charity-cause-thumb"><img src="/resources/extra-images/cause-detail-img.png" alt=""></figure>
                            <h3>Africa Children Need More Food</h3>
                            <ul class="charity-cause-options">
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
                            </ul>
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus sollicitudin arcu a dolor dapibus convallis Mauris eleifend dapibus blandit.</p>
                            
                            
                            <div class="charity-cause-donate">
                                <div class="skillst">
                                    <h6>Raised: <span>$3788</span></h6>
                                    <h6 class="skillst-right">Goal: <span>$5000</span></h6>
                                    <div data-width='90' data-target='95' class="charity-cause-progressbar"></div>
                                </div>
                                <a href="/donation/money/form" class="charity-plan-btn">후원금 기부하기<i class="fa fa-heart"></i></a>
                                <ul class="charity-cause-social">
                                   <li><a href="https://www.facebook.com/" class="fab fa-facebook"></a></li>
                                    <li><a href="https://www.twitter.com/" class="fab fa-twitter"></a></li>
                                    <li><a href="https://www.linkedin.com/" class="fab fa-linkedin"></a></li>
                                    <li><a href="https://www.youtube.com/" class="fab fa-youtube"></a></li>
                                    <li><a href="https://www.vimeo.com/" class="fab fa-vimeo"></a></li>
                                </ul>
                            </div>
                            <!-- 버튼2 -->
                            <div class="charity-cause-donate">
                                <div class="skillst">
                                <a href="/donation/money/point" class="charity-plan-btn">포인트 기부하기<i class="fa fa-heart"></i></a>
                            </div>
                            
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed iaculis purus nulla, at rhoncus elit non. Ut luct us libero at laore ncus. Praesent fermentum lacus at nulla hendrerit facilisis. Ut ips us, mollis non sollicitu din quis, lacinia a tellus.</p>
                            <p>Phasellus lobortis mattis dolor ac laoreet. Pellentesque feugiat scelerisque libero, et convallis cidunt at. Aen ean inn luctus, felis in, luctus elit. Aenean fringilla consectetur posuere.</p>
                            <blockquote>Curabitur lacus dui, convallis quis arcu vel, sagittis vulputate elit. Nullam ex libero, imp rdiet  lib ndit ac, tempor ac magna. In finibus libero vitae ex tincidunt pharetr.</blockquote>
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed iaculis purus nulla, at rhoncus elit non. Ut luct us libero at laore ncus. Praesent fermentum lacus at nulla hendrerit facilisis. Ut ips us, mollis non sollicitu din quis, lacinia a tellus.</p>
                        </div>
                        <div class="charity-rich-editor">
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
                        <div class="charity-prenxt-post">
                            <ul>
                                <li class="charity-prev-post">
                                    <figure>
                                        <a href="404.html"><img src="/resources/extra-images/post-img1.png" alt=""></a>
                                    </figure>
                                    <div class="charity-prev-artical">
                                        <a href="404.html" class="charity-post-arrow"><i class="fa fa-angle-double-left"></i> Previous Article</a>
                                        <h3><a href="404.html">Duis arcu lectus, interdum quisi sodales</a></h3>
                                    </div>
                                </li>
                                <li class="charity-next-post">
                                    <figure>
                                        <a href="404.html"><img src="/resources/extra-images/post-img2.png" alt=""></a>
                                    </figure>
                                    <div class="charity-next-artical">
                                        <a href="404.html" class="charity-post-arrow">Next Article <i class="fa fa-angle-double-right"></i></a>
                                        <h3><a href="404.html">Duis arcu lectus, interdum quisi sodales</a></h3>
                                    </div>
                                </li>
                            </ul>
                        </div>
                        <div class="widget_title"><h2>Admin Post</h2></div>
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
                        </div>
                       
                        <div class="widget_title"><h2>Campaigns Content</h2></div>
                        <div class="charity-campaign-content">
                            <div class="row">
                                <div class="col-md-7">
                                    <ul class="charity-list-style-one">
                                        <li>Donec eu vehicula eros. Suspendisse convallis augue.</li>
                                        <li>Ut ultricies dignissim venenatis. Mauris nec nibh volu.</li>
                                        <li>Phasellus dapibus, massa ac tempor rutrum</li>
                                        <li>Aliquam ex lorem, feugiat eget dolor in, iaculis ullamc</li>
                                        <li>Nullam rhoncus, nisl id ultrices tristique.</li>
                                    </ul>
                                </div>
                                <div class="col-md-5">
                                    <img src="/resources/extra-images/Campaign-img1.png" alt="" class="charity-campaing-image">
                                </div>
                            </div>
                        </div>
                        
                        <div class="widget_title"><h2>Cause Progress</h2></div>
	                        <div class="charity-progress-wrap">
	                            <div class="row">
	                                <div class="col-md-5">
	                                    <p>Nullam sollicitudin orci id velit dapibus preti um. Cras elementum arcu ac neque iaculisid consequat nunc condimentum.</p>
	                                    <p>Etiam pharetra diam et sapien ullamcorperw eget porta tortor pulvinar. Nam lobortis, velit in commodo mattis.</p>
	                                </div>
	                            </div>
	                        </div>
                    	</div>
                    </div>
                    
           			<!-- 우측 배너  aside -->
			    	<%@ include file="/WEB-INF/views/board_show/aside.jsp"%>
			    	<!-- aside end -->
                </div>
            </div>
        </div>
        <!-- Main Section -->

    </div>
    <!-- Content -->


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