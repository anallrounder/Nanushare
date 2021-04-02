<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
                    <h1>인증게시판</h1>
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
						<div class="charity-rich-editor">
                            
							<h1>${content_view.btitle}</h1><hr>
							<figure class="charity-postthumb"><img src="${pageContext.request.contextPath}/resources/charity/extra-images/blog-detail-img.png" alt=""></figure>
							<div class="charity-blog-options">
                                <ul style="float:right">
                                	<li><i class="fa fa-folder-open"></i>  No. ${content_view.b_index}</li> 
                                    <li style="text-indent: 0.3em"><i class="fa fa-calendar"></i><time datetime="2008-02-14 20:00">  ${content_view.bdate}</time></li>
                                    <li style="text-indent: 0.3em"><i class="fa fa-comments"></i><a href="404.html">  23 comments</a></li>
                                    <li style="text-indent: 0.3em"><i class="fa fa-mouse-pointer"></i> 조회수 ${content_view.bhit}</li>
                                </ul>
                            </div>
                            <p>${content_view.bcontent}</p><br>
                           
							<hr>
                            
                            <div class="charity-post-tags">
                                <div class="charity-tags">
                                    <span>Tags:</span>
                                    <a href="#">charity </a>
                                    <a href="#">/ donation</a>
                                    <a href="#"> / needy</a>
                                </div>
                                <div class="charity-blog-social">
                                 	<span>edit:</span>
                                    <ul>
                                    	<li><a href="plist" class="fa fa-list-alt"> 목록</a></li>
                                        <li><a href="modify_view?b_index=${content_view.b_index}" class="fa fa-edit"> 수정</a></li>
                                        <li><a href="modify_view?b_index=${content_view.b_index}" class="fa fa-eraser"> 삭제</a></li>
                                    </ul>
                                
                                </div>
                            </div>
                        </div>
                        
                        
                        <!-- 이전, 다음글 보기 -->
                        <div class="charity-prenxt-post">
                            <ul>
                            	<!-- 이전글 -->
                                <li class="charity-prev-post">
                                    <figure>
                                        <a href="404.html"><img src="${pageContext.request.contextPath}/resources/charity/extra-images/post-img1.png" alt=""></a>
                                    </figure>
                                    <div class="charity-prev-artical">
                                        <a href="404.html" class="charity-post-arrow"><i class="fa fa-angle-double-left"></i> Previous Article</a>
                                        <h3><a href="404.html">Duis arcu lectus, interdum quisi sodales</a></h3>
                                    </div>
                                </li>
                                <!-- 다음글 -->
                                <li class="charity-next-post">
                                    <figure>
                                        <a href="404.html"><img src="${pageContext.request.contextPath}/resources/charity/extra-images/post-img2.png" alt=""></a>
                                    </figure>
                                    <div class="charity-next-artical">
                                        <a href="404.html" class="charity-post-arrow">Next Article <i class="fa fa-angle-double-right"></i></a>
                                        <h3><a href="404.html">Duis arcu lectus, interdum quisi sodales</a></h3>
                                    </div>
                                </li>
                            </ul>
                        </div>
                        <!-- 이전, 다음글 보기 -->
                       
                        <!-- 댓글 -->
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
                                          <!--   <a class="comment-reply-link" href="#"><i class="fa fa-share"></i> Reply</a> -->
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
                                    
                                   <%-- 대댓글 영역  
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
                                    <!-- .children --> --%>
                                    
                                </li>
                                <!-- #comment-## -->
                            </ul>
                            <!--// coments \\-->
                            
                        </div>
                        
                        <!--// 댓글 작성 영역 comment-respond \\-->
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
                        <!--// 댓글 작성 영역 comment-respond \\-->
                        
                    </div>
 					<!-- aside 제외한 왼쪽 컨텐츠 div 끝 -->

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