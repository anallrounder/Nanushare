
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!doctype html>
<html lang="en">

<head>

    <!-- meta tags -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <title>Charity About Us</title>

    <!-- CSS -->
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/fontawesome-all.css">
    <link rel="stylesheet" href="css/flaticon.css">
    <link rel="stylesheet" href="css/slick-slider.css">
    <link rel="stylesheet" href="css/fancybox.css">
    <link href="css/jplayer.css" rel="stylesheet">
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="css/color.css">
    <link rel="stylesheet" href="css/responsive.css">

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
                    <h1>About Us</h1>
                    <p>Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero</p>
                </div>
            </div>
        </div>
    </div>
    <!-- Banner -->

    <!-- Content -->
    <div class="charity-main-content">

        <!-- Main Section -->
        <div class="charity-main-section charity-aboutus-text-full">
            <div class="container">
                <div class="row">
                        
                    <div class="col-md-7">
                        <div class="charity-aboutus-text">
                            <h2>We Are Non Profit Team</h2>
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec a lectus interdum lacus rutrum molestie. Vestibulum eu semper ipsum. Duis in libero non dolor rutrm faucibu  eget vitae lacus. Praesent eu pharetra ante. Quisque augue eros, rhoncus tae hendrer it eget, dapibus non diam.</p>
                            <ul class="charity-list-style-one">
                                <li>Phasellus dapibus, massa ac tempor rutrum</li>
                                <li>Aliquam ex lorem, feugiat eget dolor in, iaculis ullamcorpr fringilla soll porttitor.</li>
                                <li>Nullam rhoncus, nisl id ultrices tristique, risus massa ulla mcorper sem, id euism od nisi tortor.</li>
                            </ul>
                            <h6>Donation So Far: <span>$ 6000</span></h6>
                            <a href="#" class="charity-about-btn">Become a Volunteer</a>
                        </div>
                    </div>
                    <div class="col-md-5">
                        <figure class="chrity-thumb-style">
                            <img src="extra-images/aboutus-img.png" alt="">
                        </figure>
                    </div>

                </div>
            </div>
        </div>
        <!-- Main Section -->

        <!-- Main Section -->
        <div class="charity-main-section charity_counter_full">
            <span class="black-transparent"></span>
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="charity-counter" id="counter">
                            <ul class="row">
                                <li class="col-md-3">
                                    <i class="icon-donation2 charity-bgcolor"></i>
                                    <span class="counter-value" data-count="5012">0</span>
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
        <div class="charity-main-section charity-simple-services-full">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="charity-fancy-title">
                            <h2>Our Services</h2>
                        </div>
                        <div class="charity-services charity-simple-services">
                            <ul class="row">
                                <li class="col-md-4">
                                    <i class="fas fa-book charity-color"></i>
                                    <div class="charity-simple-services-text">
                                        <h2>Free Education</h2>
                                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam dui velit posuere a volutpat amet.</p>
                                        <a href="#" class="charity-service-link">Read More</a>
                                    </div>
                                </li>
                                <li class="col-md-4">
                                    <i class="fas fa-handshake charity-color"></i>
                                    <div class="charity-simple-services-text">
                                        <h2>Volunteer</h2>
                                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam dui velit posuere a volutpat amet.</p>
                                        <a href="#" class="charity-service-link">Read More</a>
                                    </div>
                                </li>
                                <li class="col-md-4">
                                    <i class="fas fa-users charity-color"></i>
                                    <div class="charity-simple-services-text">
                                        <h2>Protect Children</h2>
                                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam dui velit posuere a volutpat amet.</p>
                                        <a href="#" class="charity-service-link">Read More</a>
                                    </div>
                                </li>
                                <li class="col-md-4">
                                    <i class="fas fa-book charity-color"></i>
                                    <div class="charity-simple-services-text">
                                        <h2>Free Education</h2>
                                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam dui velit posuere a volutpat amet.</p>
                                        <a href="#" class="charity-service-link">Read More</a>
                                    </div>
                                </li>
                                <li class="col-md-4">
                                    <i class="fas fa-handshake charity-color"></i>
                                    <div class="charity-simple-services-text">
                                        <h2>Volunteer</h2>
                                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam dui velit posuere a volutpat amet.</p>
                                        <a href="#" class="charity-service-link">Read More</a>
                                    </div>
                                </li>
                                <li class="col-md-4">
                                    <i class="fas fa-users charity-color"></i>
                                    <div class="charity-simple-services-text">
                                        <h2>Protect Children</h2>
                                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam dui velit posuere a volutpat amet.</p>
                                        <a href="#" class="charity-service-link">Read More</a>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Main Section -->

        <!-- Main Section -->
        <div class="charity-main-section charity-donation-parallex-full">
            <span class="light-black-transparent"></span>
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="charity-donation-parallex">
                            <h2>Help Africans,Donate For A Cause</h2>
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed urna nibh, fringilla fermentum vulputate Curabitur vel maximus magna at cursus aliquet, arcu ut massa</p>
                            <div class="clearfix"></div>
                            <div class="charity-causestrip-section">
                                <span class="charity-left-section">Raised: <small>3250$</small></span>
                                <span class="charity-right-section">Goal: <small>5000$</small></span>
                                <div data-width='80' class="charity-cause-progressbar"></div>
                            </div>
                            <div class="clearfix"></div>
                            <a href="#" class="charity-donation-parallex-btn">Make Donation</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Main Section -->

        <!-- Main Section -->
        <div class="charity-main-section charity-partner-slider-full">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="charity-fancy-title">
                            <h2>Our Partners</h2>
                        </div>
                        <!--// Partner \\-->
                        <div class="charity-partner-slider">
                            <div> <a href="404.html"><img src="extra-images/partner-logo-1.png" alt=""></a> </div>
                            <div> <a href="404.html"><img src="extra-images/partner-logo-2.png" alt=""></a> </div>
                            <div> <a href="404.html"><img src="extra-images/partner-logo-3.png" alt=""></a> </div>
                            <div> <a href="404.html"><img src="extra-images/partner-logo-4.png" alt=""></a> </div>
                            <div> <a href="404.html"><img src="extra-images/partner-logo-3.png" alt=""></a> </div>
                        </div>
                        <!--// Partner \\-->
                    </div>
                </div>
            </div>
        </div>
        <!-- Main Section -->

    </div>
    <!-- Content -->

 	 <!-- Footer -->
    <%@ include file="/WEB-INF/views/mainMap/mainFooter.jsp"%>
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
    <script src="script/jquery.js"></script>
    <script src="script/popper.min.js"></script>
    <script src="script/bootstrap.min.js"></script>
    <script src="script/slick.slider.min.js"></script>
    <script src="script/progressbar.js"></script>
    <script src="script/fancybox.min.js"></script>
    <script src="script/jquery.countdown.min.js"></script>
    <script src="https://maps.googleapis.com/maps/api/js"></script>
    <script src="script/jquery.jplayer.js"></script>
    <script src="script/jplayer.playlist.js"></script>
    <script src="script/functions.js"></script>
</body>

</html>