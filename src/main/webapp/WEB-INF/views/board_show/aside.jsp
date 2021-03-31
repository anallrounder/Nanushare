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
</body>
</html>