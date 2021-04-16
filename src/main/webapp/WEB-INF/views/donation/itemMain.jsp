<!-- 혜선_ 물품기부 메인페이지_사용예정 뷰 페이지 _ 수정필요함, 테스트중 03.18-->

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!doctype html>
<html lang="ko">

<head>

    <!-- meta tags -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <title>물품 나누기</title>

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
    <link rel="preconnect" href="https://fonts.gstatic.com">
	
	<!-- 웹페이지 탭 로고이미지 삽입  -->
	<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/nanulogo_ico_convert.ico"> 
	
	<!-- new korean font from google -->
	<!-- NotoSansKR, Gothic A1 -->
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Gothic+A1:wght@100;200;300;400;500;600;700;800;900&family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
	
	<!-- FONT AWSOME -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

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
	                <h1>물품 나누기</h1>
	                <p>Product Donation Guidelines and Application</p>
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
                
                	<!-- aside제외 좌측 콘텐츠  -->
                    <div class="col-md-9">
                       
                       	<!-- 물품나누기 소개 안내 + 상단 신청 버튼 start -->
						<div class="charity-rich-editor charity-cause-detail">
                            
                            <figure class="charity-cause-thumb"><img src="/resources/extra-images/cause-detail-img.png" alt=""></figure>
                            <h3>물품 나누기 소개 및 신청 방법 안내</h3>
                           
                           <!-- 수정필요한 부분 -->
                            <ul class="charity-cause-options">
                                <li>
                                    <i class="fa fa-clock"></i>
                                    <h6>이번 달:</h6>
                                    <span>19 days left</span>
                                </li>
                                <li>
                                    <i class="fa fa-heart"></i>
                                    <h6>나눔 횟수:</h6>
                                    <span>23</span>
                                </li>
                            </ul>
                            <!-- 수정필요한 부분 -->
                           
                          	<!-- 물품 나누기 소개글 -->
							<p>나누셰어의 물품 나눔에 관심을 갖고 찾아와 주셔서 감사합니다.</p>
                            <p>나누셰어는 우리 사회에 따뜻한 온기를 불어 넣고 더불어 사는 사회를 실현하고자 합니다. <br>
                           	따뜻한 마음을 소외계층에게 전달하고 싶으나 방법을 몰라 망설이는 분들을 위해 나눔 박스를 마련했습니다. <br>
                           	이를 통해 금전적 기부를 넘어 물품 나누기 프로젝트를 통해 지역 사회를 지원하려 합니다.<!-- <br>
							또한 후원금을 통해 파트너, 등록 및 미등록 자선 단체, 비영리 단체 및 지역 사회 단체에 기부금을 제공합니다. --></p>
							
							<p>후원 회원 관리를 위해 로그인 한 회원만 물품 기부 신청을 하실 수 있는 점 양해부탁드립니다. <br>
							모두 어려운 코로나 상황 속에서도 지속적인 여러분의 참여에 감사드립니다. </p>
							
							<!-- <p>회원가입은 홈페이지 오른쪽 상단 '회원가입' 버튼을 통해서 하실 수 있으며, <br>
							이미 가입하신 회원님은 물품 나눔을 위해  오른쪽 상단 '로그인' 버튼을 통해 로그인 후 이용해 주시면 감사하겠습니다.</p> -->
							<!-- 물품 나누기 소개글 -->
							
							<!-- 상단 신청서 작성 버튼 -->
                            <div class="charity-cause-donate">
                                <div class="skillst charity-item-text">
                                    <h5 style="color:orangered;">물품 신청을 하시기 전에 아래 정보를 꼭 확인해주세요!</h5>
                                </div>
                               <!--  <a href="/donation/item/form" class="charity-plan-btn">신청서 작성하기<i class="fa fa-heart"></i></a> -->
                            </div>
                          	<!-- <p> <blockquote></blockquote></p> -->
                          	<!-- 상단 신청서 작성 버튼 -->
                          	
						</div>
                        <!-- 물품나누기 소개 안내 + 상단 신청 버튼 end -->
                        
                        
						<!-- 물품 나눔 항목 소개 start -->
						<!-- responsive.css -> .charity-team-timeline { width: 100%; } 반응형 지워야할지 수정해야할지... -->
						<!--// company-timeline \\--><!-- charity-team-timeline-text -->
						<div class="charity-team-timeline">
							<div class="widget_title"><h2>이 품목들에 대해 나눔이 필요해요!</h2></div>
							<h6><b>신청 가능 물품 종류: </b> <span> 마스크 | 기저귀 | 생리대 | 문구류 | 손세정제 </span></h6><br>
								<ul>
									<li>
		                                <div class="charity-image">
		                                   <i><img src="${pageContext.request.contextPath}/resources/donation/item/mask_sm.png" alt="" style="width:35px;"></i><!-- fas fa-head-side-mask --> <!-- icon-donation -->
		                                   <!-- <div>Icons made by <a href="https://www.flaticon.com/authors/srip" title="srip">srip</a> from <a href="https://www.flaticon.com/" title="Flaticon">www.flaticon.com</a></div> -->
		                                   <span></span>
		                                </div>
		                                <div class="charity-item-text">
		                                   <h6>마스크: 함께 나눠 써요. </h6>
		                                   <p>감기인 듯 스쳐 지나갈 술 알았던 코로나바이러스는 우리의 일상을 참 많이도 바꿔 버렸습니다.
											사회적 거리두기와 마스크 착용이 의무화되면서 일상적이던 이웃과의 만남과 소통은 자연스레 멀어지고 있습니다.</p>
		                                </div>
									</li>
									<li>
		                                <div class="charity-image">
		                                   <i><img src="${pageContext.request.contextPath}/resources/donation/item/diaper_sm.png" alt="" style="width:35px"></i>
		                                   <span></span>
		                                </div>
		                                <div class="charity-item-text">
		                                   <h6>기저귀: 모든 아기는 특별합니다. </h6>
		                                   <p>아기가 태어나서 사용해야하는 기저귀 구매비용은 월 평균 약 8~10만원대입니다. 
		                                   복지 사각지대에 있어 어려움을 겪고 있는 미혼모 및 한 부모가정에게는 부담이 되는 금액입니다. 
		                                   영유아들이 행복하게 자라날 수 있는데 조금이나마 보탬이 될 수 있도록 더 많은 사랑 나눔을 실천해 주세요. </p>
		                                </div>
									</li>
									<li>
		                                <div class="charity-image">
		                                  <!--  <i class="icon-heart"></i> --><!-- icon-books-stack-of-three -->
		                                  <i><img src="${pageContext.request.contextPath}/resources/donation/item/sanitarypad_sm.png" alt="" style="width:35px;"></i>
		                                   <span></span>
		                                </div>
		                                <div class="charity-item-text">
		                                   <h6>생리대: 생리가 찾아올 때마다 홀로 고민하는 아이들이 있습니다.</h6>
		                                   <p>더 이상 생리대 때문에 걱정하는 여학생들이 없었으면 좋겠습니다. 
		                                	 누군가에게는 어느 마트에서나 손쉽게 구매할 수 있는 아이템이지만 조금이라도 더 싸게 파는 곳을 찾아 헤매는 여정을 거쳐야 합니다. 
		                                	 매달 생리를 맞이하는 여성 청소년이 고민 없이 행복하게 청소년기를 보낼 수 있도록, 몸의 변화에 대해 긍정적으로 느끼고, 이로써 그들의 자존감을 지킬 수 있도록 여러분의 작은 관심으로 이를 실현할 수 있습니다.</p>
		                                </div>
									</li>
									<li>
		                                <div class="charity-image">
		                                   <i><img src="${pageContext.request.contextPath}/resources/donation/item/stationery_sm.png" alt="" style="width:35px"></i>
		                                   <span></span>
		                                </div>
		                                <div class="charity-item-text">
		                                   <h6>문구류: 아이들에게 희망을 선물해 주세요.</h6>
		                                   <p>온라인 수업으로 집에서 홀로 생활하는 아이들! 저소득 가정의 아이들은 보호자 없이  하루를 보냅니다. 
		                                   그리고 고립되어 어떻게 시간을 보내야 할지 몰라 우울감과 무력감을 갖는 아이들이 있습니다.
		                                   <!-- 고립된 생활로 우울감과 무력감으로 생활하는 저소득가정이 건강하고 행복한 세상에서 가장 아름다운 “오늘”을 만들 수 있도록 응원해 주세요. -->
		                                   가정 내에서 시공간의 제약을 받지 않고 학습에 참여할 수 있도록, 또한 아이들이 행복한 오늘을 만들어 나갈 수 있도록 응원해주세요.</p>
		                                </div>
									</li>
									<li>
		                                <div class="charity-image">
		                                  <i><img src="${pageContext.request.contextPath}/resources/donation/item/handsanitizer_sm.png" alt="" style="width:37px"></i>
		                                   <span></span>
		                                </div>
		                                <div class="charity-item-text">
		                                   <h6>손 세정제: </h6>
		                                   <p>코로나19 감염 확산에 따른 국가적 재난 극복에 동참하고, 지역 주민들의 어려움을 함께 나누기 위해 </p>
		                                </div>
									</li>
								</ul>
	                        </div>
	                        <!--// company-timeline \\-->
	                        <!-- 물품 나눔 항목 소개 end  -->
                
	                       	<!--  지침: 확인 사항 리스트 start -->
	                        <div class="widget_title mt-5"><h2>물품 신청 전 반드시 확인해 주세요!</h2></div>
	                        <div class="charity-campaign-content">
	                            <div class="row">
	                                <div class="col-md-12">
	                                    <ul class="charity-item-text"><!-- charity-list-style-one -->
	                                       	<li class="mt-3">다음 내용은 2021년 3월 17일 기준으로 작성되었습니다.</li>
	                                        <li class="mt-3">마스크, 기저귀, 생리대, 문구류, 손세정제 품목에 한해서 물품 나눔이 가능합니다.</li>
	                                        <li class="mt-3">제출된 신청서를 검토한 후 승인된 건에 한하여 나눔이 진행됩니다.</li>
	                                        <li class="mt-3">제휴 택배사 외 다른 업체를 통해 발송할 시 입출고가 원활하지 않을 수 있습니다.</li>
	                                        <li class="mt-3">포장이 심하게 훼손되거나 그 외 정상적인 사용이 불가한 제품은 추후 반려될 수 있습니다. </li>
	                                    </ul>
	                                </div>
	                            </div>
	                        </div>
	                        <!--  지침: 확인 사항 리스트 end -->
	                        
	                        <!-- 신청 절차 안내  start  -->   
	                        <div class="widget_title"><h2>물품 나눔 신청 후 절차</h2></div>
	                        <div class="charity-progress-wrap">
	                            <div class="row">
	                                <div class="charity-item-text col-md-12 mb-2">
	                                    <h6>신청서가 승인되는 데 얼마나 걸립니까?</h6>
	 									<p>매월 제품 기부 신청서를 검토합니다. 또한 귀하의 요청을 처리하고 배송을 보장하려면 이벤트 날짜로부터 최소 3 주가 필요합니다.</p>
										<h6 class="mt-3">신청서가 승인되면 다음 단계는 무엇입니까?</h6>
										<p class="mb-4">신청이 성공하면 '나누셰어'팀에서 환영 이메일을 받게됩니다. 그런 다음 제공되는 제품, 배송 정보 및 기타 특별 고려 사항을 확인하여 기부 요청을 완료합니다.</p>
	                                </div>
	                            </div>
	                        </div>
	                       <!-- 신청 절차 안내  end  -->   
	                         
	                       <!-- 하단 물품 나눔 신청하기 버튼 start-->
	                       <div class="charity-progress-wrap">
	                            <div class="charity-item-text">
	                            <h6>후원자 여러분~!</h6>
								<p class="mb-5">일상의 기본인 생필품이 부족하여 어렵게 생활하고 있는 이웃을 위해 따뜻한 관심과 마음을 표현해주세요 :)</p>
							</div>
	                              <a href="/donation/item/form" class="charity-plan-btn">신청서 작성하기<i class="fa fa-heart"></i></a>
                        </div>
                        <!-- 하단 물품 나눔 신청하기 버튼  end-->
                    </div> 
                    <!-- aside제외 좌측 콘텐츠  end -->
                  
	                <!-- aside -->
			    	<%@ include file="/WEB-INF/views/board_show/aside.jsp"%>
			    	<!-- aside end -->
				    	
                </div>
            </div>
        </div>
        <!-- Main Section _end -->
    </div>
    <!-- Content _end -->

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