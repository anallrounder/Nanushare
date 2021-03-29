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
    <link href="css/jplayer.css" rel="/resources/charity/stylesheet">
    <link rel="stylesheet" href="/resources/charity/style.css">
    <link rel="stylesheet" href="/resources/charity/css/color.css">
    <link rel="stylesheet" href="/resources/charity/css/responsive.css">


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
                                    <li style="padding: 0px 40px 0px 70px"><a href="#" style="font-size: 20px;">나누셰어란?</a>
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
                                    <li style="padding: 0px 40px 0px 30px"><a href="#" style="font-size: 20px;">나누기</a>
                                        <ul class="children">
                                            <li><a href="${pageContext.request.contextPath}/donation/item/main">물품 나누기</a></li>
                                            <li><a href="${pageContext.request.contextPath}/donation/money/main">돈기부여하기</a></li>
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
                            </nav>
                        </div>
                    </aside>
                </div>
            </div>

			<sec:authorize access="isAnonymous()"> <!-- all 버튼 header -->
				<aside>
            	<a href="${pageContext.request.contextPath}/signUpForm" class="charity-strip-btn charity-bgcolor" style="width:70px;height:40px; white-space: nowrap; padding: 10px 0px 0px 6px; margin: -75px 50px 0px 0px;">회원가입</a>
				<a href="${pageContext.request.contextPath}/loginPage" class="charity-strip-btn charity-bgcolor" style="width:75px;height:40px; white-space: nowrap; padding: 10px 5px 0px 15px; margin: -75px 140px 0px 0px;">로그인</a>
			</aside>
			</sec:authorize>

			<sec:authorize access="isAuthenticated()"> <!-- 로그인됐을때 버튼 header -->
				<a href="${pageContext.request.contextPath}/member/logout"class="charity-strip-btn charity-bgcolor" style="width:70px;height:40px; white-space: nowrap; padding: 10px 0px 0px 6px; margin: -75px 50px 0px 0px;">로그아웃</a>
				<a href="${pageContext.request.contextPath}/my/mypage" class="charity-strip-btn charity-bgcolor" style="width:75px;height:40px; white-space: nowrap; padding: 10px 5px 0px 0px; margin: -75px 140px 0px 0px;">마이페이지</a>
			</sec:authorize>
			
			<sec:authorize access="hasRole('ADMIN')"> <!-- 관리자 버튼 header -->
				<a href="${pageContext.request.contextPath}/member/logout" class="charity-strip-btn charity-bgcolor" style="width:70px;height:40px; white-space: nowrap; padding: 10px 0px 0px 6px; margin: -75px 50px 0px 0px;">로그아웃</a>
				<a href="${pageContext.request.contextPath}/admin/Donation" class="charity-strip-btn charity-bgcolor" style="width:75px;height:40px; white-space: nowrap; padding: 10px 5px 0px 10px; margin: -75px 140px 0px 0px;">관리자 페이지</a>
			</sec:authorize>

		</div>
        <!-- Top Strip -->
    </header>
    <!-- Header -->
    
      <!-- Content -->
    <div class="charity-main-content">

        <!-- Main Section -->
        <div class="charity-main-section">
            <div class="container">
                <div class="row">
                    <div class="col-md-9">
                        <div class="charity-team-warp">
                            <figure><img src="extra-images/team-detail-img.png" alt=""></figure>
                            <h3>Julai Martyn</h3>
                            <span>Co-Director</span>
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque maximus felis ut ullamcorper condime ntum Ut imperdiet lobortis et mollis neque placerat non. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. </p>
                            <div class="charity-team-contact">
                                <ul class="chaity-contact-info">
                                    <li>
                                        <h6>Phone:</h6>
                                        <span>+123 45 678</span>
                                    </li>
                                    <li>
                                        <h6>Email:</h6>
                                        <a href="mailto:name@email.com">info@example.com</a>
                                    </li>
                                </ul>
                                <div class="charity-blog-social">
                                 <ul>
                                    <li><a href="https://www.facebook.com/" class="fab fa-facebook"></a></li>
                                    <li><a href="https://twitter.com/login" class="fab fa-twitter"></a></li>
                                    <li><a href="https://www.linkedin.com/uas/login" class="fab fa-linkedin"></a></li>
                                    <li><a href="https://www.youtube.com/" class="fab fa-youtube"></a></li>
                                    <li><a href="https://vine.co/" class="fab fa-vine"></a></li>
                                 </ul>
                              </div>
                            </div>
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque maximus felis ut ullamcorper condimentu m. Ut imperdiet lobortis ex, vitae tempor dolor viverra quis. Aliquam sodales eu leo id molestie. Maecenasu llamcorper malesuada arcu, in lobortis mauris feugiat sed. Duis placerat maximus felis, et mollis neque pl acerat non. </p>
                            <blockquote>Curabitur lacus dui, convallis quis arcu vel, sagittis vulputate elit. Nullam ex libero, imp rdiet  lib ndit ac, tempor ac magna. In finibus libero vitae ex tincidunt pharetr.</blockquote>
                            <p>Nulla molestie leo non arcu porta, in dictum dui rutrum. Cras ipsum lectus, ullamcorper vel lacus et, condim entum rhoncus felis. Sed vulputate augue id malesuada maximus.</p>
                        </div>
                        <!--// company-timeline \\-->
                        <div class="charity-team-timeline">
                          <div class="widget_title"><h2>We Need Your Help</h2></div>
                          <ul>
                             <li>
                                <div class="charity-image">
                                   <i class="icon-users-group"></i>
                                   <span></span>
                                </div>
                                <div class="charity-team-timeline-text">
                                   <h6>We want to help as many as we can</h6>
                                   <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque maximus felis ut ullamc entum. Ut imperdiet lobortis ex.</p>
                                </div>
                             </li>
                             <li>
                                <div class="charity-image">
                                   <i class="icon-donation"></i>
                                   <span></span>
                                </div>
                                <div class="charity-team-timeline-text">
                                   <h6>We want to help as many as we can</h6>
                                   <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque maximus felis ut ullamc entum. Ut imperdiet lobortis ex.</p>
                                </div>
                             </li>
                             <li>
                                <div class="charity-image">
                                   <i class="icon-books-stack-of-three"></i>
                                   <span></span>
                                </div>
                                <div class="charity-team-timeline-text">
                                   <h6>We want to help as many as we can</h6>
                                   <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque maximus felis ut ullamc entum. Ut imperdiet lobortis ex.</p>
                                </div>
                             </li>
                             <li>
                                <div class="charity-image">
                                   <i class="icon-heart"></i>
                                   <span></span>
                                </div>
                                <div class="charity-team-timeline-text">
                                   <h6>We want to help as many as we can</h6>
                                   <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque maximus felis ut ullamc entum. Ut imperdiet lobortis ex.</p>
                                </div>
                             </li>
                          </ul>
                        </div>
                        <!--// company-timeline \\-->
                        <!--// volunteer-form \\-->
                        <div class="widget_title"><h2>Become a Volunteer</h2></div>
                        <div class="charity-volunteer-form">
                            <form>
                                <ul>
                                    <li>
                                        <label>Name:</label>
                                        <input type="text" value="Enter name*" onblur="if(this.value == '') { this.value ='Enter name*'; }" onfocus="if(this.value =='Enter name*') { this.value = ''; }"></li>
                                    <li>
                                        <label>Email:</label>
                                        <input type="text" value="Enter email*" onblur="if(this.value == '') { this.value ='Enter email*'; }" onfocus="if(this.value =='Enter email*') { this.value = ''; }"></li>
                                    <li class="charity-select-form">
                                        <label>Country:</label>
                                        <div class="charity-select-two">
                                            <select>
                                                <option value="">Enter country*</option>
                                                <option value="pakistan">counter name</option>
                                                <option value="india">counter name</option>
                                                <option value="usa">counter name</option>
                                                <option value="student">counter name</option>
                                            </select>
                                        </div>
                                    </li>
                                    <li class="charity-select-form">
                                        <label>State / Region:</label>
                                        <div class="charity-select-two">
                                            <select>
                                                <option value="">Enter State*</option>
                                                <option value="pakistan">state name</option>
                                                <option value="india">state name</option>
                                                <option value="usa">state name</option>
                                                <option value="student">state name</option>
                                            </select>
                                        </div>
                                    </li>
                                    <li class="charity-select-form">
                                        <label>City:</label>
                                        <div class="charity-select-two">
                                            <select>
                                                <option value="">Enter city*</option>
                                                <option value="pakistan">city name</option>
                                                <option value="india">city name</option>
                                                <option value="usa">city name</option>
                                                <option value="student">city name</option>
                                            </select>
                                        </div>
                                    </li>
                                    <li class="chrity-full-form">
                                        <label>Address:</label>
                                        <input type="text" value="Enter address line*" onblur="if(this.value == '') { this.value ='Enter address line*'; }" onfocus="if(this.value =='Enter address line*') { this.value = ''; }"></li>
                                    <li>
                                        <label>Zip / Postal Code:</label>
                                        <input type="text" value="Enter code*" onblur="if(this.value == '') { this.value ='Enter code*'; }" onfocus="if(this.value =='Enter code*') { this.value = ''; }"></li>
                                    <li>
                                        <label>Phone:</label>
                                        <input type="text" value="Enter number*" onblur="if(this.value == '') { this.value ='Enter number*'; }" onfocus="if(this.value =='Enter number*') { this.value = ''; }"></li>
                                    <li class="chrity-full-form">
                                        <label>Describe Your Self:</label>
                                        <textarea placeholder="Type here*" ></textarea></li>
                                    <li><input type="submit" value="Send Inquiry"></li>
                                </ul>
                            </form>
                        </div>
                        <!--// volunteer-form \\-->
                        <div class="charity-team-contactus">
                            <ul>
                                <li>
                                    <i class="fa fa-envelope"></i>
                                    <h5>Email Us At:</h5>
                                    <a href="mailto:name@email.com">info@example.com</a>
                                </li>
                                <li>
                                    <i class="fa fa-phone"></i>
                                    <h5>Call Us At:</h5>
                                    <span>+(091)61 3146 8728</span>
                                </li>
                            </ul>
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
                            <ul>
                                <li><a href="404.html">13 August 2017</a></li>
                                <li><a href="404.html">28 September 2017</a></li>
                                <li><a href="404.html">19 May 2017</a></li>
                                <li><a href="404.html">03 March 2017</a></li>
                                <li><a href="404.html">28 February 2017</a></li>
                            </ul>
                        </div>
                        <!-- Widget Archive -->
                        <!-- Widget Event -->
                        <div class="widget widget_events">
                            <div class="widget_title"><h2>Upcoming Events</h2></div>
                            <ul>
                                <li>
                                    <time datetime="2008-02-14 20:00">22 Aug</time>
                                    <div class="charity-events">
                                       <h6><a href="event-detail.html">Fusce fibus purus cos vulputate</a></h6>
                                       <a href="event-detail.html"><i class="fa fa-map-marker-alt"></i> 1403 Blackwell Street 9976</a>
                                    </div>
                                </li>
                                <li>
                                    <time datetime="2008-02-14 20:00">13 Sep</time>
                                    <div class="charity-events">
                                       <h6><a href="event-detail.html">Fusce fibus purus cos vulputate</a></h6>
                                       <a href="event-detail.html"><i class="fa fa-map-marker-alt"></i> 1403 Blackwell Street 9976</a>
                                    </div>
                                </li>
                                <li>
                                    <time datetime="2008-02-14 20:00">07 Dec</time>
                                    <div class="charity-events">
                                       <h6><a href="event-detail.html">Fusce fibus purus cos vulputate</a></h6>
                                       <a href="event-detail.html"><i class="fa fa-map-marker-alt"></i> 1403 Blackwell Street 9976</a>
                                    </div>
                                </li>
                             </ul>
                        </div>
                        <!-- Widget Event -->
                        <!-- Widget Gallery -->
                        <div class="widget widget_gallery">
                            <div class="widget_title"> <h2>Our Gallery</h2> </div>
                            <ul>
                                <li><a data-fancybox="gallery" href="extra-images/widget-gallery-1.jpg"><img src="extra-images/widget-gallery-1.jpg" alt=""> <i class="fa fa-plus"></i> </a></li>
                                <li><a data-fancybox="gallery" href="extra-images/widget-gallery-2.jpg"><img src="extra-images/widget-gallery-2.jpg" alt=""> <i class="fa fa-plus"></i> </a></li>
                                <li><a data-fancybox="gallery" href="extra-images/widget-gallery-3.jpg"><img src="extra-images/widget-gallery-3.jpg" alt=""> <i class="fa fa-plus"></i> </a></li>
                                <li><a data-fancybox="gallery" href="extra-images/widget-gallery-4.jpg"><img src="extra-images/widget-gallery-4.jpg" alt=""> <i class="fa fa-plus"></i> </a></li>
                                <li><a data-fancybox="gallery" href="extra-images/widget-gallery-5.jpg"><img src="extra-images/widget-gallery-5.jpg" alt=""> <i class="fa fa-plus"></i> </a></li>
                                <li><a data-fancybox="gallery" href="extra-images/widget-gallery-6.jpg"><img src="extra-images/widget-gallery-6.jpg" alt=""> <i class="fa fa-plus"></i> </a></li>
                                <li><a data-fancybox="gallery" href="extra-images/widget-gallery-7.jpg"><img src="extra-images/widget-gallery-7.jpg" alt=""> <i class="fa fa-plus"></i> </a></li>
                                <li><a data-fancybox="gallery" href="extra-images/widget-gallery-8.jpg"><img src="extra-images/widget-gallery-8.jpg" alt=""> <i class="fa fa-plus"></i> </a></li>
                                <li><a data-fancybox="gallery" href="extra-images/widget-gallery-6.jpg"><img src="extra-images/widget-gallery-6.jpg" alt=""> <i class="fa fa-plus"></i> </a></li>
                            </ul>
                        </div>
                        <!-- Widget Gallery -->

                    </aside>
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
