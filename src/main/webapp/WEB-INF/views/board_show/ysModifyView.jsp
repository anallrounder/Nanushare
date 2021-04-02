<!-- blog detail 사용 css style도 여기서 찾을 것  .charity-form-btn 생성함 color에도 추가함-->

<%@ page language="java" contentType="text/html; charset=UTF8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!doctype html>
<html lang="ko">

<head>

    <!-- meta tags -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
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