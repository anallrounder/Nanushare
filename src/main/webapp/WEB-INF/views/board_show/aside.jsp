<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!doctype html>
<html lang="ko">

<head>

<meta charset="UTF-8">
<title>Insert title here</title>

</head>


<body>
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
	    
	    <!-- Widget Archive 퀵링크 연결 -->
	    <div class="widget widget_archive">
	        <div class="widget_title"><h2>QUICK LINKS</h2></div>
	        <ul>
		        <li><a href="${pageContext.request.contextPath}/main">나눔함 안내</a></li>
	            <li><a href="${pageContext.request.contextPath}/donation/item/main">물품 나누기</a></li>
	            <li><a href="${pageContext.request.contextPath}/donation/money/main">돈기부여하기</a></li>
	            <li><a href="${pageContext.request.contextPath}/board/shows/list">나눔 인증</a></li>
	            <li><a href="${pageContext.request.contextPath}/restful/notice">공지사항</a></li>
	        </ul>
	    </div>
	    <!-- Widget Archive 퀵링크 연결 -->
	    
	    <!-- Widget Event -->
	   	<div class="widget widget_events">
	        <div class="widget_title"><h2>최근 공지사항</h2></div>
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
	        <div class="widget_title"> <h2>Show your Support</h2> </div>
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
		
		<!-- Widget Event 새로운 지점 정보 넣을지 고민중 -->
<!-- 		<div class="widget widget_events">
		    <div class="widget_title"><h2>Upcoming ShareBox</h2></div>
		    <ul>
		    	<li>
		            <time datetime="2008-02-14 20:00">22 Jun</time>
		            <div class="charity-events">
			            <h6>강남역점</h6>
			            <p style="font-size: 11px; color: #696969;"><i class="fa fa-map-marker-alt"></i> 서울 서초구 서초동 1318-10</p>
		    		</div>
				</li>
				<li>
		    		<time datetime="2008-02-14 20:00">13 July</time>
		    		<div class="charity-events">
		    			<h6>용산역점</h6>
		     			<p style="font-size: 11px; color: #696969;"><i class="fa fa-map-marker-alt"></i> 서울 용산구 한강대로 23길 55</p>
		   			</div>
				</li>
				<li>
					<time datetime="2008-02-14 20:00">20 July</time>
					<div class="charity-events">
						<h6>시청역점</h6>
						<p style="font-size: 11px; color: #696969;"><i class="fa fa-map-marker-alt"></i> 서울 중구 태평로 1가 54-3</p>
					</div>
				</li>
			</ul>
		</div> -->
		<!-- Widget Event -->
		
	</aside>
</body>
</html>