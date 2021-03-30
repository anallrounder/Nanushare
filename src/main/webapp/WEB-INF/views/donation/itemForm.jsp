<!-- 혜선_ 물품기부 신청서 작성, 전송 뷰 페이지 부트스트랩 적용 작성 시작 03.25-->

<%@ page language="java" contentType="text/html; charset=UTF8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!doctype html>
<html lang="en">

<head>

    <!-- meta tags -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <title>물품나눔 신청서</title>

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
    
    <!--  date  -->
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<link rel="stylesheet" href="/resources/demos/style.css">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<!-- <script>
		$( function() {
		  $( "#datepicker" ).datepicker();
		} );
	</script> -->
	<!-- 	<script>
	 /* 현재 날짜를 받아오기 위한 작업 */
	 document.getElementById('#currentDate').valueAsDate = new Date();
	 /*  또 다른 방법:  document.getElementById('currentDate').value = new Date().toISOString().substring(0, 10); */
	</script> -->
	<script>
/* 		$(function() {
		    $('.charity-volunteer-form > form > ul > li > #text-calenda').pignoseCalendar({/*  .charity-volunteer-form > form > ul > li > #text-calenda *//*  input.calendar */
				format: 'YYYY-MM-DD' // date format string. (2017-02-02)
				init : function ( context )  { 
			        / ** 
			         * @params context PignoseCalendarContext 
			         * @returns void 
			         * /

			         // 이것은 연결 요소이며 $ ( '. calendar')의 각 요소와 정확히 동일합니다. 
			         var  $ this  =  $ ( this ) ;

			         //`context` 변수에서 대상 요소를 얻을 수 있습니다. 
			         var  $ element  =  context . 요소 ;

			         // 달력 요소도 얻을 수 있습니다. 달력보기 DOM입니다. 
			         var  $ calendar  =  context . 달력 ; 
			    } 
			});
		}); */
	</script>
	 <script>
	 $.datepicker.setDefaults({
	        dateFormat: 'yy-mm-dd',	//날짜 포맷이다. 보통 yy-mm-dd 를 많이 사용하는것 같다.
	        prevText: '이전 달',	// 마우스 오버시 이전달 텍스트
	        nextText: '다음 달',	// 마우스 오버시 다음달 텍스트
	        closeText: '닫기', // 닫기 버튼 텍스트 변경
	        currentText: '오늘', // 오늘 텍스트 변경
	        monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],	//한글 캘린더중 월 표시를 위한 부분
	        monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],	//한글 캘린더 중 월 표시를 위한 부분
	        dayNames: ['일', '월', '화', '수', '목', '금', '토'],	//한글 캘린더 요일 표시 부분
	        dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],	//한글 요일 표시 부분
	        dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],	// 한글 요일 표시 부분
	        showMonthAfterYear: true,	// true : 년 월  false : 월 년 순으로 보여줌
	        yearSuffix: '년',	//
	        showButtonPanel: true,	// 오늘로 가는 버튼과 달력 닫기 버튼 보기 옵션
//	        buttonImageOnly: true,	// input 옆에 조그만한 아이콘으로 캘린더 선택가능하게 하기
//	        buttonImage: "images/calendar.gif",	// 조그만한 아이콘 이미지
//	        buttonText: "Select date"	// 조그만한 아이콘 툴팁
	    });
	 $( "#datepicker1" ).datepicker( "setDate", "2020-02-01" );	//날짜 변경
	 $( "#datepicker1" ).datepicker( "getDate" );	//현재 선택되어 있는 날짜 가져오기 (Date 형으로 반환)
	 </script>
	<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script> 
	<script type="text/javascript">
		function changeSelection(){
			if(document.sendForm.amount.options[document.sendForm.amount.selectedIndex].value == '0'){
				 document.sendForm.donaamount.disabled = true;
				 document.sendForm.donaamount.value = "";
			}
			if(document.sendForm.amount.options[document.sendForm.amount.selectedIndex].value == '9'){
				 document.sendForm.donaamount.disabled = false;
				 document.sendForm.donaamount.value = "";
				 document.sendForm.donaamount.focus();
			} else{
				 document.sendForm.donaamount.disabled = true;
				 document.sendForm.donaamount.value = document.sendForm.amount.options[document.sendForm.amount.selectedIndex].value;
			}
		} 
		
		$(document).ready(function() {
			$('#selectDirect').attr('disabled', 'disabled');
			// submit으로 form 전송시 disabled된 input box값은 전달되지 않아 'submit'버튼 클릭시 해당 컨트롤의 disabled 속성을 제거하도록 해야한다.
			$('#btnSend').click(function(){
				$('#selectDirect').removeAttr('disabled');
			});
		});
	</script>


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
                    <h1>물품나눔 신청서 작성</h1>
                    <p>Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero</p>
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
                        <div class="charity-team-warp">
                           
                            <h3>물품 나누기 신청</h3>
                            <span class="mb-3">Product donation form</span>
                            <figure><img src="${pageContext.request.contextPath}/resources/charity/donation-images/heart.jpg" alt=""></figure><!-- 788x355 -->
                             
                            <p>후원 회원 여러분, 나누셰어 프로젝트의 물품 나누기에 동참해주셔서 감사합니다. <br>이전 페이지의 물품 나누기 안내사항을 다시 한 번 꼭 확인해 주시고 신청서 작성 부탁드립니다. <br>
                            감사합니다.</p>
                            <div class="charity-team-contact">
                                <ul class="chaity-contact-info">
                                    <li>
                                        <h6>물품 후원 관련:</h6>
                                        <span>+123 45 678</span>
                                    </li>
                                    <li>
                                        <h6>Email:</h6>
                                        <a href="mailto:name@email.com">info@example.com</a>
                                    </li>
                                </ul>
                             
                            </div>
                           <!--  <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque maximus felis ut ullamcorper condimentu m. Ut imperdiet lobortis ex, vitae tempor dolor viverra quis. Aliquam sodales eu leo id molestie. Maecenasu llamcorper malesuada arcu, in lobortis mauris feugiat sed. Duis placerat maximus felis, et mollis neque pl acerat non. </p>
                            <blockquote>Curabitur lacus dui, convallis quis arcu vel, sagittis vulputate elit. Nullam ex libero, imp rdiet  lib ndit ac, tempor ac magna. In finibus libero vitae ex tincidunt pharetr.</blockquote>
                            <p>Nulla molestie leo non arcu porta, in dictum dui rutrum. Cras ipsum lectus, ullamcorper vel lacus et, condim entum rhoncus felis. Sed vulputate augue id malesuada maximus.</p> -->
                        </div>
                        <!--// company-timeline \\-->
                        
                        
                        <!--// volunteer-form \\-->
                        <div class="widget_title mt-4"><h2>물품 나눔 신청서</h2></div>
                       
                        <div class="charity-volunteer-form"> <!-- .charity-volunteer-form > form > ul > li > #text-calendar -->
                           <form name="sendForm" method="post" action="formAction">
                           <input type="hidden" name="member_id" value="${memberInfo.member_id}">
                                <ul>
                                    <li>
                                        <label>아이디(Email): </label>
                                        <input type="text" value="${memberInfo.member_id}"  readonly ></li>
                                    <li>
                                        <label>이름:</label>
                                        <input type="text" value="${memberInfo.name}" onblur="if(this.value == '') { this.value ='Enter name*'; }" onfocus="if(this.value =='Enter name*') { this.value = ''; }" readonly></li>
                                    
                                    <li class="chrity-full-form">
                                        <label>연락처:</label>
                                        <input type="text" value="${memberInfo.phone}" onblur="if(this.value == '') { this.value ='Enter address line*'; }" onfocus="if(this.value =='Enter address line*') { this.value = ''; }"></li>
                                   
                                    <li>
                                        <label>신청 날짜:</label>    
                                        <!-- <div class="chrity-full-form"> --><!-- class="charity-select-date" -->
	                                   		<!--   Date1_current:<input type="date" id="currentDate" name="idntdate"> -->
	                                   		<!--   Date2_ui: <input type="date" id="datepicker" name="idntdate"> -->
                                  			<input class="chrity-full-form" type="text" id="datepicker1" class="calendar" />
                                    	<!-- </div> -->
                                    </li>
                                    
                                    <li class="charity-select-form">
                                        <label>믈품선택:</label>
                                        <div class="charity-select-two"> 
                                            <select name="icat_num">
                                                <option value="">물품 종류 선택</option>
                                                <option value="1">마스크</option>
                                                <option value="2">기저귀</option>
                                                <option value="3">생리대</option>
                                                <option value="4">문구류</option>
                                                <option value="4">손세정제</option>
                                            </select>
                                         </div> 
                                    </li>
                                    
                                    <li class="chrity-full-form" >
                                    	<label>수량선택:</label>
                                   		<input type="text" name="donaamount" id="selectDirect" disabled />
                                    </li>
                                    <li class="charity-select-form">   
                                        <!-- disabled는 기본으로 인풋박스가 비활성화 되는 기능이다. 동시에 셀렉트 박스에서 입력한 값이 input box로 입력된다.
											자바스크립트 jQuery 함수를 사용해 셀렉트 박스의 value가 9일 경우(숫자는 임의로 설정함) disabled를 해제하고 수량을 입력할 수 있도록 했다.
											결국 input box에 입력된 값이 form을 넘길 때 수량값으로 넘어가게 된다. -->
										<div class="charity-select-two"> 
											<select class="charity-select-two" id="selectBox" name="amount" onchange="changeSelection()">
												<option value="0"> 물품 수량 선택</option>
												<option value="9">*직접입력*</option>
												<option value="10">10</option>
												<option value="20">20</option>
												<option value="30">30</option>
												<option value="40">40</option>
												<option value="50">50</option>
												<option value="100">100</option>
											</select>
										</div>
                                    </li>
                                    
                                </ul>
                                
                                <button type="submit" class="charity-sub-btn" id="btnSend" ><i class="fa fa-save"> 신청서 전송</i></button>
                                <button type="reset" class="charity-sub-btn"><i class="fa fa-undo"> 다시선택하기</i></button>
								<button type="button" class="charity-sub-btn" onclick="location.href='${pageContext.request.contextPath}/donation/item/main"><i class="fa fa-arrow-left"> 이전화면으로</i></button><!-- 확인필요 -->
                            </form>
                        </div>
                        <!--// volunteer-form \\-->
                        <div class="charity-team-contactus">
                            <ul>
                                <li>
                                    <i class="fa fa-envelope"></i>
                                    <h5>Email:</h5>
                                    <a href="mailto:name@email.com">info@example.com</a>
                                </li>
                                <li>
                                    <i class="fa fa-phone"></i>
                                    <h5>물품 후원 관련:</h5>
                                    <span>+(091)61 3146 8728</span>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <aside class="col-md-3">
                        
                        
                        <!-- 여기서부터 우측 배너 손 안댔음! -->
                        
                        
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
                                <figure><a href="#"><img src="${pageContext.request.contextPath}/resources/extra-images/recent-news-widget-2.jpg" alt=""></a></figure>
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