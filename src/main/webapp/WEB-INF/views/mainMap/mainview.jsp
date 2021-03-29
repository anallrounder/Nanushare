<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="ko">

<head>

    <!-- meta tags -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
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
   	/* 	.bar-move {
   		transform: translateY(-150px);
   		transition-duration: 2s;
   		transition-timing-function: linear;
   		}
     */
    </style>
  

</head>

<body class="home">
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
                                    <li style="padding: 0px 40px 0px 70px"><a href="#" style="font-size: 20px;">나누셰어란?</a>
                                        <ul class="children">
                                            <li><a href="event-list.html">나누셰어 소개</a></li>
                                            <li><a href="event-grid.html">찾아오셰어</a></li>
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
                                    <li style="padding: 0px 40px 0px 30px"><a href="#" style="font-size: 20px;">나누기</a>
                                        <ul class="children">
                                            <li><a href="blog-large.html">물품 나누기</a></li>
                                            <li><a href="blog-medium.html">돈기부여하기</a></li>
                                            <!-- <li><a href="blog-detail.html">Cause Detail</a></li> -->
                                        </ul>
                                    </li>
                                    <li style="padding: 0px 40px 0px 30px"><a href="#" style="font-size: 20px;">나눔 인증</a>
                                       <!--  <ul class="children">
                                            <li><a href="team-grid.html">Team Grid</a></li>
                                            <li><a href="team-classic.html">Team Classic</a></li>
                                            <li><a href="team-detail.html">Team Detail</a></li>
                                        </ul> -->
                                    </li>
                                    <li style="padding: 0px 40px 0px 30px"><a href="#" style="font-size: 20px;">이벤트</a>
                                        <ul class="children">
                                            <li><a href="about.html">출석체크</a></li>
                                            <li><a href="prayer-list.html">테스트</a></li>
                                            <li><a href="prayer-grid.html">게임</a></li>
                                           <!--  <li><a href="prayer-detail.html">Prayer De1tail</a></li>
                                            <li><a href="404.html">404 Error</a></li>
                                            <li><a href="search-result.html">Search Result</a></li> -->
                                        </ul>
                                    </li>
                                    <li style="padding: 0px 40px 0px 30px"><a href="contact-us.html" style="font-size: 20px;">더하기</a>
                                     	<ul class="children">
                                            <li><a href="about.html">공지사항</a></li>
                                            <li><a href="prayer-list.html">문의하기</a></li>
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
            <aside>
            	<a href="#" class="charity-strip-btn charity-bgcolor" style="width:70px;height:40px; white-space: nowrap; padding: 10px 0px 0px 6px; margin: -75px 50px 0px 0px;">Sign up</a>
				<a href="#" class="charity-strip-btn charity-bgcolor" style="width:70px;height:40px; white-space: nowrap; padding: 10px 5px 0px 10px; margin: -75px 140px 0px 0px;">Sign in</a>
			</aside>
        </div>
        <!-- Top Strip -->
    </header>
    <!-- Header -->

    <!-- Banner -->
    <section style="background-color: #222222">
    <div class="container-fluid px-0 ">  <!-- <div class="container-fluid px-0"> 은 왼쪽여백 아예 없게 하는것-->
	    <div class="row" >
		   <aside class="col-9">
		   
			    <div class="charity-banner" style="overflow: hidden;zoom: 1;position:relative;z-index:1">
			        
			        <div class="charity-banner-layer" >
			            <span class="charity-banner-transparent"></span>
			           <img src="/resources/picture/donation.jpg" alt="">
			            <div class="charity-banner-caption align-left-caption">
			                <div class="container">
			                    <h1><span class="charity-color ">함께할수록 </span><br>커지는 기쁨 </h1>
			                    <div class="clearfix"></div>
			                    <p>같이할수록 커지는 가치 <br>함께하실래요?</p>
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
			                    <h1>세상을 바꾸는<span class="charity-color"><br>따뜻한 온기</span></h1>
			                    <div class="clearfix"></div>
			                    <p>여러분의 작은 관심과 따뜻한 온기가 누군가에게는 <br>따뜻한 희망이 됩니다</p>
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
			                    <h1>누군가에게 도움이 된다는<span class="charity-color"><br>작은 행복</span></h1>
			                    <div class="clearfix"></div>
			                    <p>큰 돈을 기부하지않아도 많은 물건을 주지 않아도 <br> 누군가에게 도움이 된다는 일이 행복한 일임을 새삼 알았습니다</p>
			                    <div class="clearfix"></div>
			                    <a href="#">Learn More</a>
			                    <a href="#">Donate Now</a>
			                </div>
			            </div>
			        </div>
			        <div class="charity-banner-layer">
			            <span class="charity-banner-transparent"></span>
			            <img src="/resources/picture/smile.jpg" alt="">
			            <div class="charity-banner-caption align-left-caption">
			                <div class="container">
			                    <h1>나누셰어의 <span class="charity-color"><br>선한 바람 </span></h1>
			                    <div class="clearfix"></div>
			                    <p>다른 후원사이트에 비해서 나누셰어는 정말 믿을 수 있는 것 같아요</p>
			                    <div class="clearfix"></div>
			                    <a href="#">Learn More</a>
			                    <a href="#">Donate Now</a>
			                </div>
			            </div>
			        </div>
			    </div>
			    
		    </aside>
		    		<aside class="col-3">
						<div class="row" >
						   <div class="charity-main-section charity_counter_full" style="left: -20px; height: 563px;">
					            
					            <span class="black-transparent"  style="/* background-color: white;  */ border: 1px solid white;">
					           	 <div class="container">
					                <div class="row">
					                    <div class="col-md-12">
							             <ul class="nav nav-pills" role="tablist" style="font-size: 16px; padding-left: 60px;">
							            	 
										    <li class="nav-item">
										      <a class="nav-link active" data-toggle="pill" href="#day">Day</a>
										    </li>
										    <li class="nav-item">
										      <a class="nav-link" data-toggle="pill" href="#week">Week</a>
										    </li>
										    <li class="nav-item">
										      <a class="nav-link" data-toggle="pill" href="#month">Month</a>
										    </li>
										    <li class="nav-item">
										      <a class="nav-link" data-toggle="pill" href="#years">Year</a>
										    </li>
										  </ul>
									</div>	  
										    <!-- Tab panes -->
										  <div class="col-md-12">
										  <div class="tab-content">
										    <div id="day" class="container tab-pane active">
										      <div class="charity-counter" id="counter">
					                         <!-- 1안: 수직! -->
					                            <!-- <ul class="row" > style="transform: translateY(30px);
					                                <li> class="bar-move" style=" " 
					                                    <i class="icon-donation2 charity-bgcolor" style="font-size: 20px; top: 180px; left: 255px;"></i>transform: translateY(150px); transition-duration: 2s; transition-timing-function: linear;
					                                    <i class="counter-value" data-count="3250" style="content: none; top: 250px; left: 150px; color: white;">0</i>
					                                    <small>Donators</small>
					                                </li>
					                        
					                                <li>
					                                	<div class="charity-donation-parallex" >
						                            	<div class="clearfix"></div>
						                            	<div class="charity-causestrip-section" style="transform: rotate(-90deg);">
							                                <span class="charity-left-section">Raised: <small>3250₩</small></span>
							                                <span class="charity-right-section">Goal: <small>5000₩</small></span>
							                                <div data-width= '80' class="charity-cause-progressbar"  style=" writing-mode: vertical; text-orientation: upright; position:relative;"></div>
						                           		</div>
						                            	<div class="clearfix"></div>
						                          		  <a href="#" class="charity-donation-parallex-btn" style="position: absolute; top: 350px; left: 120px;">Make Donation</a>
						                        		<span class="charity-center-section" style="font-size: 50px; visibility: hidden;">오늘의 온기: 3250₩</span>
						                        		</div>
						                        		
					                                </li>
					                                <li>
					                                	<span class="charity-color" style="font-size: 30px; margin-left: 70px;">"오늘의 기부액 : 3250"</span>
					                                </li>
					                        	</ul> -->
					                        	
					                        	<!-- 2. 수평! -->
					                        	<ul> <!-- style="transform: translateY(30px); -->
					                        		<c:forEach var="result" items="${daymoney}">
	 													<c:set var="total" value= "${total + result.dntprice}"/>
	 												</c:forEach>
						                                <li> <!-- class="bar-move" style=" "  -->
						                                    <i class="icon-donation2 charity-bgcolor" style="font-size: 25px; top: 55px; left: 65px;"></i><!-- transform: translateY(150px); transition-duration: 2s; transition-timing-function: linear; -->
						                                    <i class="counter-value" data-count="${total}" style="content: none; top: 125px; left: -15px; color: white;"></i>
						                                    <!-- <small>Donators</small> -->
						                                </li>
						                        
						                                <li>
						                                	<div class="charity-donation-parallex" >
							                            	<div class="clearfix"></div>
							                            	<div class="charity-causestrip-section"  style="padding-top: 80px; margin-left: 60px;">
								                              <!--   <span class="charity-left-section">Raised: <small>3250₩</small></span>
								                                <span class="charity-right-section">Goal: <small>5000₩</small></span> -->
								                                <div data-width= '80' class="charity-cause-progressbar"></div>
							                           		</div>
							                            	<div class="clearfix"></div>
							                          		 <!--  <a href="#" class="charity-donation-parallex-btn" style="position: absolute; top: 350px; left: 120px;">Make Donation</a> -->
							                        		<span class="charity-center-section" style="font-size: 50px; visibility: hidden;">오늘의 온기: 3250₩</span>
							                        		<span class="charity-color" style="font-size: 25px; margin-left: 60px; margin-top: -70px;">"오늘의 기부액 :
							                        			<c:choose>
							                        				<c:when test="${total > 0}">
							                        					<c:out value="${total}"></c:out>
							                        				</c:when>
							                        				<c:otherwise>
							                        					<c:out value="0"></c:out>
							                        				</c:otherwise>
							                        			</c:choose>"</span>
							                        		</div>
						                                </li>
						                               
					                        	</ul>
											</div>
										      
										    </div>
										    <div id="week" class="container tab-pane fade">
										        <div class="charity-counter" id="counter">
										        <ul> <!-- style="transform: translateY(30px); -->
					                                <li> <!-- class="bar-move" style=" "  -->
					                                    <i class="icon-donation2 charity-bgcolor" style="font-size: 25px; top: 55px; left: 65px"></i><!-- transform: translateY(150px); transition-duration: 2s; transition-timing-function: linear; -->
					                                    <i class="counter-value" data-count="100500" style="content: none; top: 125px; left: -15px; color: white;">0</i>
					                                    <!-- <small>Donators</small> -->
					                                </li>
					                        
					                                <li>
					                                	<div class="charity-donation-parallex" >
						                            	<div class="clearfix"></div>
						                            	<div class="charity-causestrip-section"  style="padding-top: 80px; margin-left: 60px;">
							                              <!--   <span class="charity-left-section">Raised: <small>3250₩</small></span>
							                                <span class="charity-right-section">Goal: <small>5000₩</small></span> -->
							                                <div data-width= "${total}" class="charity-cause-progressbar"></div>
						                           		</div>
						                            	<div class="clearfix"></div>
						                          		 <!--  <a href="#" class="charity-donation-parallex-btn" style="position: absolute; top: 350px; left: 120px;">Make Donation</a> -->
						                        		<span class="charity-center-section" style="font-size: 50px; visibility: hidden;">오늘의 온기: 3250₩</span>
						                        		<span class="charity-color" style="font-size: 25px; margin-left: 60px; margin-top: -70px;">"이번주 기부액 : 100500"</span>
						                        		</div>
					                                </li>
					                        	</ul>
											</div>
										    </div>
										    <div id="month" class="container tab-pane fade">
										       <div class="charity-counter" id="counter">
										        <ul> <!-- style="transform: translateY(30px); -->
					                                <li> <!-- class="bar-move" style=" "  -->
					                                    <i class="icon-donation2 charity-bgcolor" style="font-size: 25px; top: 55px; left: 65px"></i><!-- transform: translateY(150px); transition-duration: 2s; transition-timing-function: linear; -->
					                                    <i class="counter-value" data-count="500500" style="content: none; top: 125px; left: -15px; color: white;">0</i>
					                                    <!-- <small>Donators</small> -->
					                                </li>
					                        
					                                <li>
					                                	<div class="charity-donation-parallex" >
						                            	<div class="clearfix"></div>
						                            	<div class="charity-causestrip-section"  style="padding-top: 80px; margin-left: 60px;">
							                              <!--   <span class="charity-left-section">Raised: <small>3250₩</small></span>
							                                <span class="charity-right-section">Goal: <small>5000₩</small></span> -->
							                                <div data-width= '80' class="charity-cause-progressbar"></div>
						                           		</div>
						                            	<div class="clearfix"></div>
						                          		 <!--  <a href="#" class="charity-donation-parallex-btn" style="position: absolute; top: 350px; left: 120px;">Make Donation</a> -->
						                        		<span class="charity-center-section" style="font-size: 50px; visibility: hidden;">오늘의 온기: 3250₩</span>
						                        		<span class="charity-color" style="font-size: 25px; margin-left: 60px; margin-top: -70px;">"이번달 기부액 : 500500"</span>
						                        		</div>
						                        		
					                                </li>
					                        	</ul>
											</div>
										  </div>
										  <div id="years" class="container tab-pane fade">
										       <div class="charity-counter" id="counter">
										        <ul> <!-- style="transform: translateY(30px); -->
					                                <li> <!-- class="bar-move" style=" "  -->
					                                    <i class="icon-donation2 charity-bgcolor" style="font-size: 25px; top: 55px; left: 65px"></i><!-- transform: translateY(150px); transition-duration: 2s; transition-timing-function: linear; -->
					                                    <i class="counter-value" data-count="1500500" style="content: none; top: 125px; left: -15px; color: white;">0</i>
					                                    <!-- <small>Donators</small> -->
					                                </li>
					                        
					                                <li>
					                                	<div class="charity-donation-parallex" >
						                            	<div class="clearfix"></div>
						                            	<div class="charity-causestrip-section"  style="padding-top: 80px; margin-left: 60px;">
							                              <!--   <span class="charity-left-section">Raised: <small>3250₩</small></span>
							                                <span class="charity-right-section">Goal: <small>5000₩</small></span> -->
							                                <div data-width= '80' class="charity-cause-progressbar"></div>
						                           		</div>
						                            	<div class="clearfix"></div>
						                          		 <!--  <a href="#" class="charity-donation-parallex-btn" style="position: absolute; top: 350px; left: 120px;">Make Donation</a> -->
						                        		<span class="charity-center-section" style="font-size: 50px; visibility: hidden;">오늘의 온기: 3250₩</span>
						                        		<span class="charity-color"  style="font-size: 25px; margin-left: 60px; margin-top: -70px;">"올해 기부액 : 1500500"</span>
						                        		</div>
						                        		
					                                </li>
					                        	</ul>
											</div>
										  </div>
					                </div>
					             </div>
								</div>
							</div>
							</span>
		    			</div>
		    		</div>
		    		</aside>
				</div>
			</div>
	</section>
	<!-- Banner -->
	
    <!-- Content -->
    <div class="charity-main-content">
        
        <!-- Main Section -->
        <!-- <div class="charity-main-section charity-modren-services-full">
            <div class="container-fluid">
                <div class="charity-services charity-modren-services">
                    <ul class="row">
                        <li class="col px-0">
                            <div class="charity-modren-services-wrap">
                              <i class="fas fa-users"></i>
                              <h2>Protect Children</h2>
                              <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.Etiam dui velit, posuere a volutpat amet. dolor sit amet.</p>
                            </div>
                        </li>
                        <li class="col px-0">
                            <div class="charity-modren-services-wrap">
                              <i class="fas fa-book"></i>
                              <h2>Free Education</h2>
                              <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.Etiam dui velit, posuere a volutpat amet. dolor sit amet.</p>
                            </div>
                        </li>
                        <li class="col px-0">
                            <div class="charity-modren-services-wrap">
                              <i class="fas fa-handshake"></i>
                              <h2>Give Shelter</h2>
                              <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.Etiam dui velit, posuere a volutpat amet. dolor sit amet.</p>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div> -->
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
                            <div class="widget_title"><h2>Calender Archives</h2></div>
                            <c:forEach items="${mapvm}" var="cat">
                            <span style="font-size: 18px;" class="branches" data-lng="${cat.lng}" data-lat="${cat.lat}">
                            	<i class="fa fa-map-marker-alt"></i>&nbsp; ${cat.branch}</span><br><br>
                           </c:forEach>
                           <!--  <ul>
                                <li><a href="404.html"><i class="fa fa-map-marker-alt"></i>종각점</a></li>
                                <li><a href="404.html">을지로입구역점</a></li>
                                <li><a href="404.html">광화문점</a></li>
                            </ul> -->
                        </div>
                        <!-- Widget Archive -->
                        
                          <!-- Widget Event -->
                        <div class="widget widget_events">
                            <div class="widget_title"><h2>Upcoming ShareBox</h2></div>
                            <ul>
                                <li>
                                    <time datetime="2008-02-14 20:00">22 Jun</time>
                                    <div class="charity-events">
                                       <h6><a href="event-detail.html">강남역점</a></h6>
                                       <a href="event-detail.html"><i class="fa fa-map-marker-alt"></i> 서울 서초구 서초동 1318-10</a>
                                    </div>
                                </li>
                                <li>
                                    <time datetime="2008-02-14 20:00">13 July</time>
                                    <div class="charity-events">
                                       <h6><a href="event-detail.html">용산역점</a></h6>
                                       <a href="event-detail.html"><i class="fa fa-map-marker-alt"></i> 서울 용산구 한강대로 23길 55</a>
                                    </div>
                                </li>
                                <li>
                                    <time datetime="2008-02-14 20:00">20 July</time>
                                    <div class="charity-events">
                                       <h6><a href="event-detail.html">시청역점</a></h6>
                                       <a href="event-detail.html"><i class="fa fa-map-marker-alt"></i> 서울 중구 태평로 1가 54-3</a>
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

        <!-- Main Section -->
       <!--  <div class="charity-main-section latest_causes_full">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="charity-fancy-title">
                            <h2>Latest Causes</h2>
                        </div>
                        <div class="charity-causes charity-cause-grid">
                            <ul class="row">
                                <li class="col-md-4">
                                    <figure><a href="#"><img src="/resources/charity/extra-images/cause-grid-1.jpg" alt=""></a>
                                        <figcaption><a href="#" class="charity-cause-grid-hover"><i class="fa fa-users"></i> 21 Donors</a></figcaption>
                                    </figure>
                                    <div data-width='90' data-target='95' class="charity-cause-progressbar"></div>
                                    <div class="charity-cause-grid-text">
                                        <span class="charity-cause-raised">Raised <br> <strong>$2000</strong></span>
                                        <small class="charity-cause-raised">Goal <br> <strong>$5000</strong></small>
                                        <div class="clearfix"></div>
                                        <h2><a href="#">Hunger in nigeria</a></h2>
                                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras fringilla lectus ac dui feugiat magna dapibus.</p>
                                        <a href="#" class="charity-more-btn"><i class="fas fa-arrow-right"></i> Donate Now</a>
                                    </div>
                                </li>
                                <li class="col-md-4">
                                    <figure><a href="#"><img src="/resources/charity/extra-images/cause-grid-2.jpg" alt=""></a>
                                        <figcaption><a href="#" class="charity-cause-grid-hover"><i class="fa fa-users"></i> 21 Donors</a></figcaption>
                                    </figure>
                                    <div data-width='60' data-target='60' class="charity-cause-progressbar"></div>
                                    <div class="charity-cause-grid-text">
                                        <span class="charity-cause-raised">Raised <br> <strong>$1000</strong></span>
                                        <small class="charity-cause-raised">Goal <br> <strong>$3000</strong></small>
                                        <div class="clearfix"></div>
                                        <h2><a href="#">New School for children</a></h2>
                                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras fringilla lectus ac dui feugiat magna dapibus.</p>
                                        <a href="#" class="charity-more-btn"><i class="fas fa-arrow-right"></i> Donate Now</a>
                                    </div>
                                </li>
                                <li class="col-md-4">
                                    <figure><a href="#"><img src="/resources/charity/extra-images/cause-grid-3.jpg" alt=""></a>
                                        <figcaption><a href="#" class="charity-cause-grid-hover"><i class="fa fa-users"></i> 21 Donors</a></figcaption>
                                    </figure>
                                    <div data-width='45' data-target='45' class="charity-cause-progressbar"></div>
                                    <div class="charity-cause-grid-text">
                                        <span class="charity-cause-raised">Raised <br> <strong>$7000</strong></span>
                                        <small class="charity-cause-raised">Goal <br> <strong>$9000</strong></small>
                                        <div class="clearfix"></div>
                                        <h2><a href="#">Provide Treatment</a></h2>
                                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras fringilla lectus ac dui feugiat magna dapibus.</p>
                                        <a href="#" class="charity-more-btn"><i class="fas fa-arrow-right"></i> Donate Now</a>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div> -->
        <!-- Main Section -->

        <!-- Main Section -->
       <!--  <div class="charity-main-section charity_counter_full">
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
        </div> -->
        <!-- Main Section -->

        <!-- Main Section -->
        <!-- <div class="charity-main-section charity-event-grid-full">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="charity-fancy-title">
                            <h2>Latest Events</h2>
                        </div>
                        <div class="charity-event charity-event-grid">
                            <ul class="row">
                                <li class="col-md-4">
                                    <figure><a href="#"><img src="/resources/charity/extra-images/event-grid-1.jpg" alt=""></a>
                                        <figcaption>
                                            15 <span>Jan</span>
                                        </figcaption>
                                        <a href="#" class="charity-caption-btn"><span>View Detail</span></a>
                                    </figure>
                                    <div class="charity-event-grid-text">
                                        <h2><a href="#">Fundraising as a team in the workplace</a></h2>
                                        <p>Lorem ipsum dolor sit amet consectetur adipiscing elit sed do eiusmod tempor incididunt ut labore.</p>
                                        <ul class="charity-event-grid-option">
                                            <li><span>Start Time :</span> 01 December 2018</li>
                                            <li><span>Ending Time :</span> 22 December 2018</li>
                                        </ul>
                                    </div>
                                </li>
                                <li class="col-md-4">
                                    <figure><a href="#"><img src="/resources/charity/extra-images/event-grid-2.jpg" alt=""></a>
                                        <figcaption>
                                            19 <span>Dec</span>
                                        </figcaption>
                                        <a href="#" class="charity-caption-btn"><span>View Detail</span></a>
                                    </figure>
                                    <div class="charity-event-grid-text">
                                        <h2><a href="#">Trinity trash bas water way cleanup</a></h2>
                                        <p>Lorem ipsum dolor sit amet consectetur adipiscing elit sed do eiusmod tempor incididunt ut labore.</p>
                                        <ul class="charity-event-grid-option">
                                            <li><span>Start Time :</span> 04 November 2018</li>
                                            <li><span>Ending Time :</span> 28 November 2018</li>
                                        </ul>
                                    </div>
                                </li>
                                <li class="col-md-4">
                                    <figure><a href="#"><img src="/resources/charity/extra-images/event-grid-3.jpg" alt=""></a>
                                        <figcaption>
                                            23 <span>NOV</span>
                                        </figcaption>
                                        <a href="#" class="charity-caption-btn"><span>View Detail</span></a>
                                    </figure>
                                    <div class="charity-event-grid-text">
                                        <h2><a href="#">Helping the children from Zimbabwe</a></h2>
                                        <p>Lorem ipsum dolor sit amet consectetur adipiscing elit sed do eiusmod tempor incididunt ut labore.</p>
                                        <ul class="charity-event-grid-option">
                                            <li><span>Start Time :</span> 07 April 2018</li>
                                            <li><span>Ending Time :</span> 20 April 2018</li>
                                        </ul>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div> -->
        <!-- Main Section -->

        <!-- Main Section -->
       <!--  <div class="charity-main-section charity-simple-gallery-full"> -->
       <!--      <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">
                        <div class="charity-fancy-title">
                            <h2>Our Gallery</h2>
                        </div>
                        <div class="charity-gallery charity-simple-gallery">
                            <ul class="row">
                                <li class="col-md-2 px-0">
                                    <figure><a href="#"><img src="/resources/charity/extra-images/home-gallery-1.jpg" alt=""></a>
                                        <figcaption>
                                            <span></span>
                                            <a data-fancybox="gallery" href="/resources/charity/extra-images/home-gallery-1.jpg"><i class="fa fa-search-plus"></i></a>
                                        </figcaption>
                                    </figure>
                                </li>
                                <li class="col-md-4 px-0">
                                    <figure><a href="#"><img src="/resources/charity/extra-images/home-gallery-5.jpg" alt=""></a>
                                        <figcaption>
                                            <span></span>
                                            <a data-fancybox="gallery" href="/resources/charity/extra-images/home-gallery-5.jpg"><i class="fa fa-search-plus"></i></a>
                                        </figcaption>
                                    </figure>
                                </li>
                                <li class="col-md-2 px-0">
                                    <figure><a href="#"><img src="/resources/charity/extra-images/home-gallery-2.jpg" alt=""></a>
                                        <figcaption>
                                            <span></span>
                                            <a data-fancybox="gallery" href="/resources/charity/extra-images/home-gallery-2.jpg"><i class="fa fa-search-plus"></i></a>
                                        </figcaption>
                                    </figure>
                                </li>
                                <li class="col-md-4 px-0">
                                    <figure><a href="#"><img src="/resources/charity/extra-images/home-gallery-6.jpg" alt=""></a>
                                        <figcaption>
                                            <span></span>
                                            <a data-fancybox="gallery" href="/resources/charity/cextra-images/home-gallery-6.jpg"><i class="fa fa-search-plus"></i></a>
                                        </figcaption>
                                    </figure>
                                </li>
                                <li class="col-md-4 px-0">
                                    <figure><a href="#"><img src="/resources/charity/extra-images/home-gallery-7.jpg" alt=""></a>
                                        <figcaption>
                                            <span></span>
                                            <a data-fancybox="gallery" href="/resources/charity/extra-images/home-gallery-7.jpg"><i class="fa fa-search-plus"></i></a>
                                        </figcaption>
                                    </figure>
                                </li>
                                <li class="col-md-2 px-0">
                                    <figure><a href="#"><img src="/resources/charity/extra-images/home-gallery-3.jpg" alt=""></a>
                                        <figcaption>
                                            <span></span>
                                            <a data-fancybox="gallery" href="/resources/charity/extra-images/home-gallery-3.jpg"><i class="fa fa-search-plus"></i></a>
                                        </figcaption>
                                    </figure>
                                </li>
                                <li class="col-md-2 px-0">
                                    <figure><a href="#"><img src="/resources/charity/extra-images/home-gallery-4.jpg" alt=""></a>
                                        <figcaption>
                                            <span></span>
                                            <a data-fancybox="gallery" href="/resources/charity/extra-images/home-gallery-4.jpg"><i class="fa fa-search-plus"></i></a>
                                        </figcaption>
                                    </figure>
                                </li>
                                <li class="col-md-4 px-0">
                                    <figure><a href="#"><img src="/resources/charity/extra-images/home-gallery-8.jpg" alt=""></a>
                                        <figcaption>
                                            <span></span>
                                            <a data-fancybox="gallery" href="/resources/charity/extra-images/home-gallery-8.jpg"><i class="fa fa-search-plus"></i></a>
                                        </figcaption>
                                    </figure>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div> -->
        <!-- Main Section -->

        <!-- Main Section -->
       <!--  <div class="charity-main-section charity-simple-team-full">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="charity-fancy-title">
                            <h2>Our Volunteers</h2>
                        </div>
                        <div class="charity-team charity-simple-team">
                            <ul class="row">
                                <li class="col-md-4">
                                    <figure><a href="#"><img src="/resources/charity/extra-images/simple-team-1.jpg" alt=""></a>
                                        <figcaption>
                                            <div class="charity-simple-team-media">
                                                <a href="#"><i class="fab fa-facebook-f"></i></a>
                                                <a href="#"><i class="fab fa-twitter"></i></a>
                                                <a href="#"><i class="fab fa-instagram"></i></a>
                                                <a href="#"><i class="fab fa-linkedin-in"></i></a>
                                            </div>
                                            <div class="charity-simple-team-text">
                                                <h2><a href="#">Jhon Elexander</a></h2>
                                                <span>Co-director</span>
                                                <p>Lorem ipsum dolor sit amet consectetur adipiscing elit sed do eiusmod.</p>
                                            </div>
                                        </figcaption>
                                    </figure>
                                </li>
                                <li class="col-md-4">
                                    <figure><a href="#"><img src="/resources/charity/extra-images/simple-team-2.jpg" alt=""></a>
                                        <figcaption>
                                            <div class="charity-simple-team-media">
                                                <a href="#"><i class="fab fa-facebook-f"></i></a>
                                                <a href="#"><i class="fab fa-twitter"></i></a>
                                                <a href="#"><i class="fab fa-instagram"></i></a>
                                                <a href="#"><i class="fab fa-linkedin-in"></i></a>
                                            </div>
                                            <div class="charity-simple-team-text">
                                                <h2><a href="#">Brian Smith</a></h2>
                                                <span>Co-director</span>
                                                <p>Lorem ipsum dolor sit amet consectetur adipiscing elit sed do eiusmod.</p>
                                            </div>
                                        </figcaption>
                                    </figure>
                                </li>
                                <li class="col-md-4">
                                    <figure><a href="#"><img src="/resources/charity/extra-images/simple-team-3.jpg" alt=""></a>
                                        <figcaption>
                                            <div class="charity-simple-team-media">
                                                <a href="#"><i class="fab fa-facebook-f"></i></a>
                                                <a href="#"><i class="fab fa-twitter"></i></a>
                                                <a href="#"><i class="fab fa-instagram"></i></a>
                                                <a href="#"><i class="fab fa-linkedin-in"></i></a>
                                            </div>
                                            <div class="charity-simple-team-text">
                                                <h2><a href="#">Billy Hopkins</a></h2>
                                                <span>Co-director</span>
                                                <p>Lorem ipsum dolor sit amet consectetur adipiscing elit sed do eiusmod.</p>
                                            </div>
                                        </figcaption>
                                    </figure>
                                </li>
                            </ul>
                        </div>
                        <div class="charity-loadbtn"><a href="#">Load More</a></div>
                    </div>
                </div>
            </div>
        </div> -->
        <!-- Main Section -->

        <!-- Main Section -->
       <!--  <div class="charity-main-section charity-donation-parallex-full">
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
        </div> -->
        <!-- Main Section -->

        <!-- Main Section -->
       <!--  <div class="charity-main-section charity-simple-blog-full">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="charity-fancy-title">
                            <h2>Our Blogs</h2>
                        </div>
                        <div class="charity-blog charity-simple-blog">
                            <ul class="row">
                                <li class="col-md-6">
                                    <figure><a href="#"><img src="/resources/charity/extra-images/blog-simple-1.jpg" alt=""></a>
                                        <figcaption>
                                            <time datetime="2008-02-14 20:00" class="charity-bgcolor">18 <span>AUG</span></time>
                                            <a href="#" class="blog-link-hover"><i class="fa fa-link"></i></a>
                                        </figcaption>
                                    </figure>
                                    <div class="charity-simple-blog-text">
                                        <ul class="charity-simple-blog-options">
                                            <li><i class="fa fa-map-marker-alt"></i> George Street, London United</li>
                                            <li><i class="fa fa-comments"></i> <a href="#">5 Comments</a></li>
                                            <li><i class="far fa-heart"></i> <a href="#">Like</a></li>
                                        </ul>
                                        <h2><a href="#">Monsoon floods world vision warns of spkie in child</a></h2>
                                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed urna nibh, fringilla.</p>
                                        <a href="#" class="charity-simple-blog-btn">Read More</a>
                                    </div>
                                </li>
                                <li class="col-md-6">
                                    <figure><a href="#"><img src="/resources/charity/extra-images/blog-simple-2.jpg" alt=""></a>
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
                                </li>
                            </ul>
                        </div>
                        <div class="charity-loadbtn"><a href="#">See All</a></div>
                    </div>
                </div>
            </div>
        </div> -->
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
</body>

</html>