<!-- blog detail 사용 css style도 여기서 찾을 것  .charity-form-btn 생성함 color에도 추가함-->
<%@ page language="java" contentType="text/html; charset=UTF8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!doctype html>
<html lang="en">

<head>

    <!-- meta tags -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/nanulogo_ico_convert.ico">
    <title>나누셰어 - 나눔인증</title>

    <!-- CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/charity/css/bootstrap.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/charity/css/fontawesome-all.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/charity/css/flaticon.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/charity/css/slick-slider.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/charity/css/fancybox.css">
    <link href="${pageContext.request.contextPath}/resources/charity/css/jplayer.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/charity/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/charity/css/color.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/charity/css/responsive.css">

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
    <div class="charity-subheader">
        <span class="black-transparent"></span>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h1>나눔 인증</h1>
                    <p>show your support</p>
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
                <!--         <form method="post" class="myform" action="process-form.php">
                            <div class="charity-contact-form"> charity-rich-editor
                                <ul class="row">
                                    <li class="col-md-6"><input type="text" placeholder="First Name" name="name" required></li>
                                    <li class="col-md-6"><input type="text" placeholder="Last Name" name="name" required></li>
                                    <li class="col-md-6"><input type="text" placeholder="Email" name="email" required></li>
                                    <li class="col-md-6"><input type="text" placeholder="Phone Number" name="number" required></li>
                                    <li class="col-md-12"><textarea placeholder="Messages" name="Message"></textarea></li>
                                    <li class="col-md-12"><input type="submit" value="Submit Request"> <span class="output_message"></span> </li>
                                </ul>
                            </div>
                        </form> -->
                       <form action="modify" method="post" >
                       <input type="hidden" name="b_index" value="${modify_view.b_index}" >
	                       <div class="charity-contact-form">
	                           <h4><span>Title</span><input type="text" name="btitle" value="${modify_view.btitle}"></h4><hr><br>
	                           <h4>Images</h4>
	                           <figure class="charity-postthumb"><img src="${pageContext.request.contextPath}/resources/charity/extra-images/blog-detail-img.png" alt=""></figure>
	                           <div class="charity-blog-options">
	                                <ul style="float:right">
	                                	<li><i class="fa fa-folder-open"></i>  No. ${modify_view.b_index}</li> 
	                                    <li style="text-indent: 0.3em"><i class="fa fa-calendar"></i><time datetime="2008-02-14 20:00">  ${modify_view.bdate}</time></li>
	                                    <li style="text-indent: 0.3em"><i class="fa fa-comments"></i><a href="404.html">  23 comments</a></li>
	                                    <li style="text-indent: 0.3em"><i class="fa fa-mouse-pointer"></i> 조회수 ${modify_view.bhit}</li>
	                                </ul>
	                           </div>
	                           <h4>Content</h4>
	                           <%-- <p><textarea class="form-control" name="bcontent" rows="20" style="width:100%;">${modify_view.bcontent}</textarea></p><br> --%>
	                           <p><textarea name="bcontent">${modify_view.bcontent}</textarea></p><br><br>
							   <br><hr>

	                           <button type="button" class="charity-sub-btn"><i class="fa fa-eraser" onclick="location.href='delete?b_index=${modify_view.b_index}'"> 글삭제</i></button>
							   <button type="submit" class="charity-sub-btn"><i class="fa fa-save"> 수정완료</i></button>
							   <button type="button" class="charity-sub-btn"><i class="fa fa-arrow-left"  onclick="location.href='content_view?b_index=${modify_view.b_index}'"> 수정취소</i></button>
							   <button type="reset" class="charity-sub-btn"><i class="fa fa-undo"> 다시수정하기</i></button>
							   <!-- charity-main-btn -->
							   <!-- 버튼에 링크걸기 https://m.blog.naver.com/rain483/220529222723 -->
	                          
	                        </div>
	                         <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                        </form>
                        
                      <!--   a href="plist" -->
                        <div style="float: right; margin-right:5px; text-color:2a786b;"> <a href="plist" class="fa fa-list-alt" > 나눔 인증 게시판 돌아가기 </a></div>
                        <br><br>
                        
                       <!-- 이전, 다음 글 보기 -->
                        <div class="charity-prenxt-post">
                            <ul>
                                <li class="charity-prev-post">
                                    <figure>
                                        <a href="404.html"><img src="${pageContext.request.contextPath}/resources/charity/extra-images/post-img1.png" alt=""></a>
                                    </figure>
                                    <div class="charity-prev-artical">
                                        <a href="404.html" class="charity-post-arrow"><i class="fa fa-angle-double-left"></i>이전 글</a>
                                        <h3><a href="404.html">Duis arcu lectus, interdum quisi sodales</a></h3>
                                    </div>
                                </li>
                                
                                
                                <li class="charity-next-post">
                                    <figure>
                                        <a href="404.html"><img src="${pageContext.request.contextPath}/resources/charity/extra-images/post-img2.png" alt=""></a>
                                    </figure>
                                    <div class="charity-next-artical">
                                        <a href="404.html" class="charity-post-arrow">다음 글<i class="fa fa-angle-double-right"></i></a>
                                        <h3><a href="404.html">Duis arcu lectus, interdum quisi sodales</a></h3>
                                    </div>
                                </li>
                            </ul>
                        </div>
                       
                        
                    <%--  <div class="widget_title"><h2>Admin Post</h2></div>
                        <div class="charity-admin-post">
                            <figure>
                                <a href="404.html"><img src="${pageContext.request.contextPath}/resources/charity/extra-images/admin-post-img.png" alt=""></a>
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
                        </div> --%>
                        
                        <!-- 댓글  -->
                        <div class="widget_title"><h2>Comments</h2></div>
                        <div class="comments-area">
                            <!--// coments \\-->
                            <ul class="comment-list">
                                <li>
                                    <div class="thumb-list">
                                        <figure><img alt="" src="${pageContext.request.contextPath}/resources/charity/extra-images/comment-img1.png"></figure>
                                        <div class="text-holder">
                                            <h6>Cynthia Sachmidt</h6>
                                            <time class="post-date" datetime="2008-02-14 20:00">June 16, 2017 at 2:10 pm</time>
                                            <a class="comment-reply-link" href="#"><i class="fa fa-share"></i> Reply</a>
                                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras vel consequat tellus augue tortor, vitae volutpat ante. Proin tellus augue, dignissim vel lorem ut, vulpu sit amet, co tate laoreet enim.</p>
                                        </div>
                                    </div>
                                </li>
                                <!-- #comment-## -->
                                <li>
                                    <div class="thumb-list">
                                        <figure><img alt="" src="${pageContext.request.contextPath}/resources/charity/extra-images/comment-img2.png"></figure>
                                        <div class="text-holder">
                                            <h6>George Baily</h6>
                                            <time class="post-date" datetime="2008-02-14 20:00">June 16, 2017 at 2:10 pm</time>
                                            <a class="comment-reply-link" href="#"><i class="fa fa-share"></i> Reply</a>
                                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras vel consequat tellus augue tortor, vitae volutpat ante. Proin tellus augue, dignissim vel lorem ut, vulpu sit amet, co tate laoreet enim.</p>
                                        </div>
                                    </div>
                                    <ul class="children">
                                        <li>
                                            <div class="thumb-list">
                                                <figure><img alt="" src="${pageContext.request.contextPath}/resources/charity/extra-images/comment-img3.png"></figure>
                                                <div class="text-holder">
                                                    <h6>Sareena Marchant</h6>
                                                    <time class="post-date" datetime="2008-02-14 20:00">June 16, 2017 at 2:10 pm</time>
                                                    <a class="comment-reply-link" href="#"><i class="fa fa-share"></i> Reply</a>
                                                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras vel consequat tellus augue tortor, vitae volutpat ante. Proin tellus augue, dignissim vel lorem ut, vulpu sit amet, co tate laoreet enim.</p>
                                                </div>
                                            </div>
                                        </li>
                                        <!-- #comment-## -->
                                    </ul>
                                    <!-- .children -->
                                </li>
                                <!-- #comment-## -->
                            </ul>
                            <!--// coments \\-->
                        </div>
                        <!--// comment-respond \\-->
                        <div class="widget_title"><h2>Leave a Comment</h2></div>
                        <div class="comment-respond">
                            <form>
                                <p>
                                    <label>Name:</label>
                                    <input type="text" value="Enter name*" onblur="if(this.value == '') { this.value ='Enter name*'; }" onfocus="if(this.value =='Enter name*') { this.value = ''; }">
                                </p>
                                <p>
                                    <label>Email:</label>
                                    <input type="text" value="Enter email*" onblur="if(this.value == '') { this.value ='Enter email*'; }" onfocus="if(this.value =='Enter email*') { this.value = ''; }">
                                </p>
                                <p class="charity-respond-full-form">
                                    <label>Comment:</label>
                                    <textarea name="comment" placeholder="Type your comment*" class="commenttextarea"></textarea>
                                </p>
                                <p class="form-submit">
                                    <input name="submit" class="submit" value="Submit" type="submit">
                                    <input name="comment_post_ID" value="99" id="comment_post_ID" type="hidden">
                                </p>
                            </form>
                        </div>
                        <!--// comment-respond \\-->
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
                                <li><a data-fancybox="gallery" href="${pageContext.request.contextPath}/resources/charity/extra-images/widget-gallery-1.jpg"><img src="${pageContext.request.contextPath}/resources/charity/extra-images/widget-gallery-1.jpg" alt=""> <i class="fa fa-plus"></i> </a></li>
                                <li><a data-fancybox="gallery" href="${pageContext.request.contextPath}/resources/charity/extra-images/widget-gallery-2.jpg"><img src="${pageContext.request.contextPath}/resources/charity/extra-images/widget-gallery-2.jpg" alt=""> <i class="fa fa-plus"></i> </a></li>
                                <li><a data-fancybox="gallery" href="${pageContext.request.contextPath}/resources/charity/extra-images/widget-gallery-3.jpg"><img src="${pageContext.request.contextPath}/resources/charity/extra-images/widget-gallery-3.jpg" alt=""> <i class="fa fa-plus"></i> </a></li>
                                <li><a data-fancybox="gallery" href="${pageContext.request.contextPath}/resources/charity/extra-images/widget-gallery-4.jpg"><img src="${pageContext.request.contextPath}/resources/charity/extra-images/widget-gallery-4.jpg" alt=""> <i class="fa fa-plus"></i> </a></li>
                                <li><a data-fancybox="gallery" href="${pageContext.request.contextPath}/resources/charity/extra-images/widget-gallery-5.jpg"><img src="${pageContext.request.contextPath}/resources/charity/extra-images/widget-gallery-5.jpg" alt=""> <i class="fa fa-plus"></i> </a></li>
                                <li><a data-fancybox="gallery" href="${pageContext.request.contextPath}/resources/charity/extra-images/widget-gallery-6.jpg"><img src="${pageContext.request.contextPath}/resources/charity/extra-images/widget-gallery-6.jpg" alt=""> <i class="fa fa-plus"></i> </a></li>
                                <li><a data-fancybox="gallery" href="${pageContext.request.contextPath}/resources/charity/extra-images/widget-gallery-7.jpg"><img src="${pageContext.request.contextPath}/resources/charity/extra-images/widget-gallery-7.jpg" alt=""> <i class="fa fa-plus"></i> </a></li>
                                <li><a data-fancybox="gallery" href="${pageContext.request.contextPath}/resources/charity/extra-images/widget-gallery-8.jpg"><img src="${pageContext.request.contextPath}/resources/charity/extra-images/widget-gallery-8.jpg" alt=""> <i class="fa fa-plus"></i> </a></li>
                                <li><a data-fancybox="gallery" href="${pageContext.request.contextPath}/resources/charity/extra-images/widget-gallery-6.jpg"><img src="${pageContext.request.contextPath}/resources/charity/extra-images/widget-gallery-6.jpg" alt=""> <i class="fa fa-plus"></i> </a></li>
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
                        <h2>Sign up for newslatter</h2>
                        <p>Submit your email and stay in tuch by notify our news and stay with us</p>
                    </aside>
                    <aside class="col-md-6">
                        <form>
                            <input type="text" placeholder="Enter Your Email">
                            <label>
                                <input type="submit" value="Subscribe Now">
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
                        <div class="charity-footer-title"> <h2>Quick Links</h2> </div>
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
                        <div class="charity-footer-title"> <h2>Recent News</h2> </div>
                        <ul>
                            <li>
                                <figure><a href="#"><img src="${pageContext.request.contextPath}/resources/charity/extra-images/recent-news-widget-1.jpg" alt=""></a></figure>
                                <div class="widget_recent_news_text">
                                    <h6><a href="#">Praesent sit amet tellus sed qum biben dum faucus</a></h6>
                                    <span>22 Sept, 2016</span>
                                </div>
                            </li>
                            <li>
                                <figure><a href="#"><img src="${pageContext.request.contextPath}/resources/charity/extra-images/recent-news-widget-2.jpg" alt=""></a></figure>
                                <div class="widget_recent_news_text">
                                    <h6><a href="#">Morbi pulvinar faucibus urna, sit amet euisd nulla.</a></h6>
                                    <span>22 Sept, 2016</span>
                                </div>
                            </li>
                        </ul>
                    </aside>
                    <aside class="col-md-4 widget widget_gallery">
                        <div class="charity-footer-title"> <h2>Our Gallery</h2> </div>
                        <ul>
                            <li><a data-fancybox="gallery" href="${pageContext.request.contextPath}/resources/charity/extra-images/widget-gallery-1.jpg"><img src="${pageContext.request.contextPath}/resources/charity/extra-images/widget-gallery-1.jpg" alt=""> <i class="fa fa-plus"></i> </a></li>
                            <li><a data-fancybox="gallery" href="${pageContext.request.contextPath}/resources/charity/extra-images/widget-gallery-2.jpg"><img src="${pageContext.request.contextPath}/resources/charity/extra-images/widget-gallery-2.jpg" alt=""> <i class="fa fa-plus"></i> </a></li>
                            <li><a data-fancybox="gallery" href="${pageContext.request.contextPath}/resources/charity/extra-images/widget-gallery-3.jpg"><img src="${pageContext.request.contextPath}/resources/charity/extra-images/widget-gallery-3.jpg" alt=""> <i class="fa fa-plus"></i> </a></li>
                            <li><a data-fancybox="gallery" href="${pageContext.request.contextPath}/resources/charity/extra-images/widget-gallery-4.jpg"><img src="${pageContext.request.contextPath}/resources/charity/extra-images/widget-gallery-4.jpg" alt=""> <i class="fa fa-plus"></i> </a></li>
                            <li><a data-fancybox="gallery" href="${pageContext.request.contextPath}/resources/charity/extra-images/widget-gallery-5.jpg"><img src="${pageContext.request.contextPath}/resources/charity/extra-images/widget-gallery-5.jpg" alt=""> <i class="fa fa-plus"></i> </a></li>
                            <li><a data-fancybox="gallery" href="${pageContext.request.contextPath}/resources/charity/extra-images/widget-gallery-6.jpg"><img src="${pageContext.request.contextPath}/resources/charity/extra-images/widget-gallery-6.jpg" alt=""> <i class="fa fa-plus"></i> </a></li>
                            <li><a data-fancybox="gallery" href="${pageContext.request.contextPath}/resources/charity/extra-images/widget-gallery-7.jpg"><img src="${pageContext.request.contextPath}/resources/charity/extra-images/widget-gallery-7.jpg" alt=""> <i class="fa fa-plus"></i> </a></li>
                            <li><a data-fancybox="gallery" href="${pageContext.request.contextPath}/resources/charity/extra-images/widget-gallery-8.jpg"><img src="${pageContext.request.contextPath}/resources/charity/extra-images/widget-gallery-8.jpg" alt=""> <i class="fa fa-plus"></i> </a></li>
                        </ul>
                    </aside>
                </div>
                <!-- CopyRight -->
                <div class="charity-copyright">
                    <a href="#" class="back-top charity-bgcolor"><i class="fa fa-angle-up"></i></a>
                    <p>Â© 2018, All Right Reserved - by </p>
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