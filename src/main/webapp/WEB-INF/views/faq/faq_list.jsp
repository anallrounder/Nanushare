<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<!-- meta tags -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>myprofile_edit</title>

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

<!-- 부트스트랩 아이콘 -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

<!-- 자주묻는질문 -->
<script>
	document.getElementsByTagName("html")[0].className += " js";
</script>
<link rel="stylesheet" href="/resources/faq/assets/css/style.css">
<link rel="stylesheet" href="/resources/faq/assets/css/style.scss">

<style>
.charity-simple-blog-btn {
	border: 0;
}

​h3 {
	text-align: center;
}
</style>

</head>

<body>
	<!-- Header -->
	<%@ include file="/WEB-INF/views/mainMap/mainHeader.jsp"%>
	<!-- Header -->

	<!-- Main Section -->
	
	<!-- Bootstrap FAQ - START -->
	
	<section
		class="cd-faq js-cd-faq container max-width-md margin-top-lg margin-bottom-lg"">
	
	<ul class="cd-faq__categories">
		<li><a
			class="cd-faq__category cd-faq__category-selected truncate"
			href="#basics"> 자주 묻는 질문 </a></li>
		<li><a class="cd-faq__category truncate" href="#mobile">물품 관련</a></li>
		<li><a class="cd-faq__category truncate" href="#account">기부
				관련</a></li>
		<li><a class="cd-faq__category truncate" href="#payments">나눔함
				관련</a></li>
		<li><a class="cd-faq__category truncate" href="#privacy">회원
				정보</a></li>
		<li><a class="cd-faq__category truncate" href="#delivery">기타</a></li>
	</ul>
	<div class="cd-faq__items">
		<ul id="basics" class="cd-faq__group">
			<li class="cd-faq__title"><h2> 자주 묻는 질문 </h2></li>
			<li class="cd-faq__item"><a class="cd-faq__trigger" href="#0"><span>나누셰어는
						어떤 기업인가요?</span></a>
				<div class="cd-faq__content">
					<div class="text-component">
						<p>나누셰어는</p>
					</div>
				</div></li>
			<li class="cd-faq__item"><a class="cd-faq__trigger" href="#0"><span>질문이 있습니다</span></a>
				<div class="cd-faq__content">
					<div class="text-component">
						<p>d</p>
					</div>
				</div></li>
			<li class="cd-faq__item"><a class="cd-faq__trigger" href="#0"><span>있습니다 질문</span></a>
				<div class="cd-faq__content">
					<div class="text-component">
						<p>dd.</p>
					</div>
				</div></li>
		</ul>
		<ul id="mobile" class="cd-faq__group">
			<li class="cd-faq__title"><h2>물품 관련</h2></li>
			<li class="cd-faq__item"><a class="cd-faq__trigger" href="#0"><span>
						물품 항목은 더 추가 되나요? </span></a>
				<div class="cd-faq__content">
					<div class="text-component">
						<p>추후에 업데이트될 예정입니다.</p>
					</div>
				</div></li>
			<li class="cd-faq__item"><a class="cd-faq__trigger" href="#0"><span>
						기부한 물품의 배송현황이 궁금합니다. </span></a>
				<div class="cd-faq__content">
					<div class="text-component">
						<p>택배사에 운송장번호로 문의하세요</p>
					</div>
				</div></li>
			<li class="cd-faq__item"><a class="cd-faq__trigger" href="#0"><span>
						받은 물품 상태가 이상합니다 </span></a>
				<div class="cd-faq__content">
					<div class="text-component">
						<p>담당자가 확인한 후 처리 도와 드리겠습니다.</p>
					</div>
				</div></li>
		</ul>
		<ul id="account" class="cd-faq__group">
			<li class="cd-faq__title"><h2>기부금 관련</h2></li>
			<li class="cd-faq__item"><a class="cd-faq__trigger" href="#0"><span>
						기부한 내역은 어디서 확인하나요? </span></a>
				<div class="cd-faq__content">
					<div class="text-component">
						<p>마이페이지에서 확인하실 수 있습니다.</p>
					</div>
				</div></li>
			<li class="cd-faq__item"><a class="cd-faq__trigger" href="#0"><span>
						기부금에 대한 영수증 발급 문의 </span></a>
				<div class="cd-faq__content">
					<div class="text-component">
						<p>사무실로 연락 주세요</p>
					</div>
				</div></li>
			<li class="cd-faq__item"><a class="cd-faq__trigger" href="#0"><span>
						기부금이 사용된 내역은 어디서 확인하나요? </span></a>
				<div class="cd-faq__content">
					<div class="text-component">
						<p>홈페이지에서 확인 하세요</p>
					</div>
				</div></li>
		</ul>
		<ul id="payments" class="cd-faq__group">
			<li class="cd-faq__title"><h2>나눔함 관련</h2></li>
			<li class="cd-faq__item"><a class="cd-faq__trigger" href="#0"><span>
						나눔함에서 어떻게 물건 수령하나요? </span></a>
				<div class="cd-faq__content">
					<div class="text-component">
						<p>.</p>
					</div>
				</div></li>
			<li class="cd-faq__item"><a class="cd-faq__trigger" href="#0"><span>
						나눔함 비밀번호는 어떻게 확인하나요? </span></a>
				<div class="cd-faq__content">
					<div class="text-component">
						<p>.</p>
					</div>
				</div></li>
			<li class="cd-faq__item"><a class="cd-faq__trigger" href="#0"><span>
						서울 외 지역 나눔함은 언제 들어오나요? </span></a>
				<div class="cd-faq__content">
					<div class="text-component">
						<p>.</p>
					</div>
				</div></li>
		</ul>
		<ul id="privacy" class="cd-faq__group">
			<li class="cd-faq__title"><h2>회원 정보 관련</h2></li>
			<li class="cd-faq__item"><a class="cd-faq__trigger" href="#0"><span>
						개인별 기부 내역은 어떻게 확인하나요? </span></a>
				<div class="cd-faq__content">
					<div class="text-component">
						<p>.</p>
					</div>
				</div></li>
			<li class="cd-faq__item"><a class="cd-faq__trigger" href="#0"><span>
						소셜 로그인도 가능한가요? </span></a>
				<div class="cd-faq__content">
					<div class="text-component">
						<p>.</p>
					</div>
				</div></li>
			<li class="cd-faq__item"><a class="cd-faq__trigger" href="#0"><span>
						비밀번호는 어디서 변경하나요? </span></a>
				<div class="cd-faq__content">
					<div class="text-component">
						<p>.</p>
					</div>
				</div></li>
		</ul>
		<ul id="delivery" class="cd-faq__group">
			<li class="cd-faq__title"><h2>일반</h2></li>
			<li class="cd-faq__item"><a class="cd-faq__trigger" href="#0"><span>
						업무 협약은 어디로 문의하나요?</span></a>
				<div class="cd-faq__content">
					<div class="text-component">
						<p>.</p>
					</div>
				</div></li>
			<li class="cd-faq__item"><a class="cd-faq__trigger" href="#0"><span>?</span></a>
				<div class="cd-faq__content">
					<div class="text-component">
						<p>t.</p>
					</div>
				</div></li>
			<li class="cd-faq__item"><a class="cd-faq__trigger" href="#0"><span>?</span></a>
				<div class="cd-faq__content">
					<div class="text-component">
						<p>.</p>
					</div>
				</div></li>
			<a href="#0" class="cd-faq__close-panel text-replace">Close</a>
			<div class="cd-faq__overlay" aria-hidden="true"></div>

			<style>
.cd-faq__categories {
	list-style: none;
	list-style-type: none;
}
</style>
	</section>
	<script src="/resources/faq/assets/js/util.js"></script>
	<script src="/resources/faq/assets/js/main.js"></script>

	<div class="demo-avd demo-avd-cf demo-avd--dark js-demo-avd"
		style="top: 30px; right: 30px; bottom: auto;"></div>
	<script src="../../assets/js/demo-avd.js?v=5"></script>
	<script>
		(function(i, s, o, g, r, a, m) {
			i['GoogleAnalyticsObject'] = r;
			i[r] = i[r] || function() {
				(i[r].q = i[r].q || []).push(arguments)
			}, i[r].l = 1 * new Date();
			a = s.createElement(o), m = s.getElementsByTagName(o)[0];
			a.async = 1;
			a.src = g;
			m.parentNode.insertBefore(a, m)
		})(window, document, 'script',
				'//www.google-analytics.com/analytics.js', 'ga');

		ga('create', 'UA-48014931-1', 'codyhouse.co');
		ga('set', 'anonymizeIp', true);
		ga('send', 'pageview');
	</script>
	<!-- Bootstrap FAQ - END -->

	<aside class="col-md-3">
		<div style="height:30px"></div>
	    <!-- Widget Search -->
	    <!-- <div class="widget widget_search">
	        <div class="widget_title"><h2>검색</h2></div>
	        <form>
	            <input type="text" placeholder="Search Here">
	            <input type="submit" value="">
	            <i class="fa fa-search"></i>
	        </form>
	    </div> -->
	    <!-- Widget Search -->
	    
	    <!-- Widget Archive 퀵링크 연결 -->
	    <div class="widget widget_archive">
	        <div class="widget_title"><h2>바로가기</h2></div>
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
	        <div class="widget_title"> <h2>인증게시판</h2> </div>
	        <c:if test="${! empty list}">
            <c:set var="listComment" value="${list}" />
            <c:forEach var="vo" items="${list}">
	        
		        <ul>
		            <li><a data-fancybox="gallery" href="${pageContext.request.contextPath}/board/shows/content_view/${vo.b_index}"><img src="${pageContext.request.contextPath}/resources/users/user01_sm.png" alt=""> <i class="fa fa-plus"></i> </a></li>
		       <%--      <li><a data-fancybox="gallery" href="${pageContext.request.contextPath}/resources/charity/extra-images/widget-gallery-2.jpg"><img src="${pageContext.request.contextPath}/resources/charity/extra-images/widget-gallery-2.jpg" alt=""> <i class="fa fa-plus"></i> </a></li>
		            <li><a data-fancybox="gallery" href="${pageContext.request.contextPath}/resources/charity/extra-images/widget-gallery-3.jpg"><img src="${pageContext.request.contextPath}/resources/charity/extra-images/widget-gallery-3.jpg" alt=""> <i class="fa fa-plus"></i> </a></li>
		            <li><a data-fancybox="gallery" href="${pageContext.request.contextPath}/resources/charity/extra-images/widget-gallery-4.jpg"><img src="${pageContext.request.contextPath}/resources/charity/extra-images/widget-gallery-4.jpg" alt=""> <i class="fa fa-plus"></i> </a></li>
		            <li><a data-fancybox="gallery" href="${pageContext.request.contextPath}/resources/charity/extra-images/widget-gallery-5.jpg"><img src="${pageContext.request.contextPath}/resources/charity/extra-images/widget-gallery-5.jpg" alt=""> <i class="fa fa-plus"></i> </a></li>
		            <li><a data-fancybox="gallery" href="${pageContext.request.contextPath}/resources/charity/extra-images/widget-gallery-6.jpg"><img src="${pageContext.request.contextPath}/resources/charity/extra-images/widget-gallery-6.jpg" alt=""> <i class="fa fa-plus"></i> </a></li>
		            <li><a data-fancybox="gallery" href="${pageContext.request.contextPath}/resources/charity/extra-images/widget-gallery-7.jpg"><img src="${pageContext.request.contextPath}/resources/charity/extra-images/widget-gallery-7.jpg" alt=""> <i class="fa fa-plus"></i> </a></li>
		            <li><a data-fancybox="gallery" href="${pageContext.request.contextPath}/resources/charity/extra-images/widget-gallery-8.jpg"><img src="${pageContext.request.contextPath}/resources/charity/extra-images/widget-gallery-8.jpg" alt=""> <i class="fa fa-plus"></i> </a></li>
		            <li><a data-fancybox="gallery" href="${pageContext.request.contextPath}/resources/charity/extra-images/widget-gallery-6.jpg"><img src="${pageContext.request.contextPath}/resources/charity/extra-images/widget-gallery-6.jpg" alt=""> <i class="fa fa-plus"></i> </a></li> --%>
		        </ul>
		        
	        </c:forEach>
            </c:if>
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
	
	<!-- Search Modal -->
	<div class="modal fade searchmodal" id="searchModal" tabindex="-1"
		role="dialog">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-body">
					<a href="/resources/charity/#" class="charity-close-btn"
						data-dismiss="modal" aria-label="Close"><span
						aria-hidden="true">&times;</span></a>
					<form>
						<input type="text" value="Type Your Keyword"
							onblur="if(this.value == '') { this.value ='Type Your Keyword'; }"
							onfocus="if(this.value =='Type Your Keyword') { this.value = ''; }">
						<input type="submit" value=""> <input type="button"
							value="취소" onClick="history.go(-2)"
							class="charity-simple-blog-btn"> <a
							href="${pageContext.request.contextPath}/my/mypage"
							class="charity-simple-blog-btn">저장</a> <i class="fa fa-search"></i>
					</form>
				</div>

			</div>
		</div>
	</div>

	<!-- Footer -->
	<%@ include file="/WEB-INF/views/mainMap/mainFooter.jsp"%>
	<!-- Footer -->


	<!-- jQuery -->
	<script src="/resources/charity/script/jquery.js"></script>
	<script src="/resources/charity/script/popper.min.js"></script>
	<script src="/resources/charity/script/bootstrap.min.js"></script>
	<script src="/resources/charity/script/slick.slider.min.js"></script>
	<script src="/resources/charity/script/progressbar.js"></script>
	<script src="/resources/charity/script/fancybox.min.js"></script>
	<script src="/resources/charity/script/jquery.countdown.min.js"></script>
	<script src="https://maps.googleapis.com/maps/api/js"></script>
	<script src="/resources/charity/script/jquery.jplayer.js"></script>
	<script src="/resources/charity/script/jplayer.playlist.js"></script>
	<script src="/resources/charity/script/functions-main.js"></script>



</body>
</html>