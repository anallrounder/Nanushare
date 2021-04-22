<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!doctype html>
<html lang="ko">

<head>

<meta charset="UTF-8">
<title>Insert title here</title>

<!-- new korean font from google -->
<!-- NotoSansKR, Gothic A1 -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Gothic+A1:wght@100;200;300;400;500;600;700;800;900&family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">


<style>
time {
 	/* background-color:#ccc; 이건 안먹는다. */
 	background-image: url('/resources/banner_imgs/people_banner.png');  
}
.charity-events {
	width:200px;
}
.charity-events h6 a{
	color: #464646;
	font-family: 'NotoSansKR', sans-serif;
}
.widget ul li h6 a {
color: #464646;
}
.widget ul li {
margin-bottom:20px;
}
/* p, ul, li, a {
font-family: 'NotoSansKR', sans-serif;
} */
/* body > div.charity-main-content > div > div > div > aside > div.widget.widget_archive > ul > li:nth-child(3) > a {
font-family: 'NotoSansKR', sans-serif;
} */
</style>
</head>


<body>
<aside class="col-md-3" style="padding-left: 30px;">
	<!-- <div style="height:30px"></div> -->
    
    <!-- Widget Archive 퀵링크 연결 -->
    <div class="widget widget_archive">
        <div class="widget_title"><h2>바로가기</h2></div>
        <ul>
            <li><a href="${pageContext.request.contextPath}/donation/item/main">물품나누기</a></li>
            <li><a href="${pageContext.request.contextPath}/donation/money/main">돈기부여하기</a></li>
            <li><a href="${pageContext.request.contextPath}/board/shows/list">나눔인증</a></li>
            <li><a href="${pageContext.request.contextPath}/my/event/check">출석체크</a></li>
            <li><a href="${pageContext.request.contextPath}/restful/notice">공지사항</a></li>
            <li><a href="${pageContext.request.contextPath}/restful/qna">1:1문의</a></li>
        </ul>
    </div>
    <!-- Widget Archive 퀵링크 연결 -->
    
    <!-- Widget Event -->
   	<div class="widget widget_events">
       <div class="widget_title"> <h2>최근 공지사항</h2> </div>
		<ul>
			<c:if test="${empty asidelist}">
				<p id="nothing" align="center">작성된 글이 없습니다</p>
			</c:if>
                        	<c:if test="${! empty asidelist}">
			<c:forEach var="vo" items="${asidelist}" >
            <li>
               <%-- <time datetime="2008-02-14 20:00" style="width:70px;">
               	<img src="${pageContext.request.contextPath}/resources/donation/item/mask_sm.png" alt=""></time> --%>
                <div class="charity-events"> 
					<h6><a href="${pageContext.request.contextPath}/board/shows/content_view/${vo.b_index}">${vo.b_index}. ${vo.btitle}</a></h6> 
				<%-- 	<a href="event-detail.html" style="margin:0px;"><i class="fa fa-calendar"></i>${vo.bdate}</a><br> --%>
					<%-- <a href="event-detail.html" ><i class="fa fa-user-circle"></i>${vo.member_id}</a>&nbsp;  --%>
                   <!-- <a href="event-detail.html"><i class="fa fa-map-marker-alt"></i> 1403 Blackwell Street 9976</a> -->
                </div>
            </li>
            </c:forEach>
            </c:if>
		</ul> 
    </div>  
    <!-- Widget Event -->
	
	<!-- Widget Event -->
   	<div class="widget widget_events">
       <div class="widget_title"> <h2>인증게시판</h2> </div>
			
		<ul>
			<c:if test="${empty asidelist}">
				<p id="nothing" align="center">작성된 글이 없습니다</p>
			</c:if>
                        	<c:if test="${! empty asidelist}">
			<c:forEach var="vo" items="${asidelist}" >
            <li>
               <time datetime="2008-02-14 20:00" style="width:70px;">
               	<img src="${pageContext.request.contextPath}/resources/donation/item/mask_sm.png" alt=""></time>
                <div class="charity-events">
					<h6><a href="${pageContext.request.contextPath}/board/shows/content_view/${vo.b_index}">${vo.btitle}</a></h6> 
					<a href="event-detail.html" style="margin:0px;"><i class="fa fa-calendar"></i>${vo.bdate}</a><br>
                </div>
            </li>
            </c:forEach>
            </c:if>
		</ul> 
    </div>  
    <!-- Widget Event -->
    
    <!-- Widget Gallery -->
<%--     <div class="widget widget_gallery">
        <div class="widget_title"> <h2>인증게시판</h2> </div>
        <c:if test="${! empty list}">
           <c:set var="listComment" value="${list}" />
           <c:forEach var="vo" items="${list}" begin="1" end="12">
        
	        <ul>
	            <li><a data-fancybox="gallery" href="${pageContext.request.contextPath}/board/shows/content_view/${vo.b_index}"><img src="${pageContext.request.contextPath}/resources/users/user01_sm.png" alt=""> <i class="fa fa-plus"></i> </a></li>
	            <li><a data-fancybox="gallery" href="${pageContext.request.contextPath}/resources/charity/extra-images/widget-gallery-2.jpg"><img src="${pageContext.request.contextPath}/resources/charity/extra-images/widget-gallery-2.jpg" alt=""> <i class="fa fa-plus"></i> </a></li>
	            <li><a data-fancybox="gallery" href="${pageContext.request.contextPath}/resources/charity/extra-images/widget-gallery-3.jpg"><img src="${pageContext.request.contextPath}/resources/charity/extra-images/widget-gallery-3.jpg" alt=""> <i class="fa fa-plus"></i> </a></li>
	            <li><a data-fancybox="gallery" href="${pageContext.request.contextPath}/resources/charity/extra-images/widget-gallery-4.jpg"><img src="${pageContext.request.contextPath}/resources/charity/extra-images/widget-gallery-4.jpg" alt=""> <i class="fa fa-plus"></i> </a></li>
	            <li><a data-fancybox="gallery" href="${pageContext.request.contextPath}/resources/charity/extra-images/widget-gallery-5.jpg"><img src="${pageContext.request.contextPath}/resources/charity/extra-images/widget-gallery-5.jpg" alt=""> <i class="fa fa-plus"></i> </a></li>
	            <li><a data-fancybox="gallery" href="${pageContext.request.contextPath}/resources/charity/extra-images/widget-gallery-6.jpg"><img src="${pageContext.request.contextPath}/resources/charity/extra-images/widget-gallery-6.jpg" alt=""> <i class="fa fa-plus"></i> </a></li>
	            <li><a data-fancybox="gallery" href="${pageContext.request.contextPath}/resources/charity/extra-images/widget-gallery-7.jpg"><img src="${pageContext.request.contextPath}/resources/charity/extra-images/widget-gallery-7.jpg" alt=""> <i class="fa fa-plus"></i> </a></li>
	            <li><a data-fancybox="gallery" href="${pageContext.request.contextPath}/resources/charity/extra-images/widget-gallery-8.jpg"><img src="${pageContext.request.contextPath}/resources/charity/extra-images/widget-gallery-8.jpg" alt=""> <i class="fa fa-plus"></i> </a></li>
	            <li><a data-fancybox="gallery" href="${pageContext.request.contextPath}/resources/charity/extra-images/widget-gallery-6.jpg"><img src="${pageContext.request.contextPath}/resources/charity/extra-images/widget-gallery-6.jpg" alt=""> <i class="fa fa-plus"></i> </a></li>
	        </ul>
	        
        </c:forEach>
           </c:if>
    </div> --%>
    <!-- Widget Gallery -->
	
</aside>
<!-- aside end -->

</body>
</html>