<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!doctype html>
<html lang="ko">

<head>

    <!-- meta tags -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <!-- csrf_meta_tag_for_jsp
    https://stackoverflow.com/questions/37383730/how-to-add-csrf-token-to-ajax-request -->
	<meta name="_csrf" content="${_csrf.token}"/>
	<meta name="_csrf_header" content="${_csrf.headerName}"/>
    
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
	
	
	<!-- 인풋박스에 신청 날짜가 오늘 날짜로 입력되도록 하는 자바스크립트 코드 -->
	<script type="text/javascript">
	/* This script and many more are available free online at
	The JavaScript Source!! http://javascript.internet.com
	Created by: Jean P. May, Jr. | http://www.wideopenwest.com/~thebearmay */
		
	function autoDate () {
		var tDay = new Date();
		var tMonth = tDay.getMonth()+1;
		var tDate = tDay.getDate();
		if ( tMonth < 10) tMonth = "0"+tMonth;
		if ( tDate < 10) tDate = "0"+tDate;
		document.getElementById("rdate").value = tDay.getFullYear()+"년 "+tMonth+"월 "+tDate+"일";
	}
	
	// Multiple onload function created by: Simon Willison
	// http://simonwillison.net/2004/May/26/addLoadEvent/
	function addLoadEvent(func) {
		var oldonload = window.onload;
		if (typeof window.onload != 'function') {
			window.onload = func;
		} else {
			window.onload = function() {
				if (oldonload) {
					oldonload();
				}
				func();
			}
		}
	}
	addLoadEvent(function() {
		autoDate();
	}); 
	</script>
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
                            
                            <!--// comments \\-->
                            <ul id="listComment"  class="comment-list">
                             	<!-- prepend 자리 -->
                            	
                            	<c:if test="${empty list4}">
									<tr>
										<td colspan="5" align="center">작성된 댓글이 없습니다</td>
									</tr>
								</c:if>
                             
                             	<c:if test="${! empty listComment}">
                             	<c:set var="listComment" value="${listComment}" />
                             	<c:forEach var="vo" items="${listComment}">
	                                
	                                <li>
	                                    <div class="thumb-list">
	                                        <figure><img alt="" src="${pageContext.request.contextPath}/resources/charity/extra-images/comment-img1.png"></figure>
	                                        <!-- 랜덤이미지? -->
	                                        <div class="text-holder">
	                                            <h6><c:out value="${vo.rid}"/></h6><!-- 작성자 -->
	                                            <div><c:out value="${vo.rdate}"/></div><!-- 작성일 -->
	                                            <p><c:out value="${vo.rcontent}"/></p><!-- 댓글내용 -->
	                                        </div>
	                                    </div>
	                                </li>
	                                
                                </c:forEach>
                                </c:if>
                            </ul>
                            <!--// comments \\-->
                            
                        </div>
                        
                        
                        <!--// 댓글 작성 영역 comment-respond \\-->
                        <div class="widget_title"><h2>Leave a Comment</h2></div>
                        <div class="comment-respond">
                            <form id="insertForm" action="${pageContext.request.contextPath}/board/shows/reply_insert" method="post">
                                <p>
                                    <label>작성자(아이디)</label>
                                    <input type="text" id="rid" name="rid" value="<sec:authentication property="principal.member.member_id"/>"  readonly >
                                </p>
                                <p>
                                    <label>작성일</label>
                                    <input type="text" id="rdate" disabled >
                                    
                                <p class="charity-respond-full-form">
                                    <label>댓글내용</label>
                                    <textarea id="rcontent" name="rcontent" placeholder="댓글을 작성하세요." class="commenttextarea"></textarea>
                                </p>
                                <p class="form-submit">
                                    <input name="comment_post_ID" value="99" id="comment_post_ID" type="hidden">
                                	<input name="submit" class="submit" value="댓글작성" type="submit">
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


    <script type="text/javascript">
    // 댓글 작성 및 ajax로 댓글 불러오기
    		
    $(function(){
    	 $("#insertForm").submit(function(event){
    		event.preventDefault();
    		
    		var b_index = $("#b_index").val();
    		var rid = $("#rid").val();
    		var rcontent = $("#rcontent").val();
    		console.log(b_index,  rcontent);
    		
    	 	var form = {
    				b_index: b_index,
    				rid : rid,
    				rcontent : rcontent
    		}  
    	 	//var token = $("meta[name='_csrf']").attr("content");
    	    //var header = $("meta[name='_csrf_header']").attr("content");
    	    
     		$.ajax({
    			type:"POST",
    			url:"${pageContext.request.contextPath}/board/shows/reply_insert",
    			cache : false,
    			dataType: 'text',
    			contentType:'application/json; charset=UTF-8',
    			data: JSON.stringify(form),
                beforeSend : function(xhr)
              	{   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
                  xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
              	}, 
    			success : function(result) {
    			 	 if(result == "SUCCESS"){
    					alert(result)
    				
    					$("#listComment").prepend("<div><b>"  + b_index + "</b></div>"
    					+"<div>" + rid + "</div>"
    					+"<div>" + rcontent + "</div>" + "<div><hr>"); // 작성 결과 입력
    					$('#rid').val(''); //인풋박스 초기화
    					$('#rcontent').val(''); //인풋박스 초기화
    					
    				};  
    			}, //ajax 성공 시 end
    			error : function(request, status, error) {
    				alert("code:" + request.status + "\n" + "message:"
    						+ request.responseText + "\n" + "error:" + error);
    			} // ajax 에러 시 end
    		}); //ajax end
    		 
    	});//#insertForm end
    		
    });
    </script>	

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