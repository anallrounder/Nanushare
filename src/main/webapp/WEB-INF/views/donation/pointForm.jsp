<!-- 혜선_ 물품기부 신청서 작성, 전송 뷰 페이지 부트스트랩 적용 작성 시작 03.25-->

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!doctype html>
<html lang="en">

<head>

    <!-- meta tags -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
   	<title>포인트 기부</title>

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
    
	<!-- point input box 입력시 공백일 경우와 1000포인트 미만일 경우 검증 -->
	<!-- <script>
		/* alert띄우는 방법 */
		/* function dd(bool){
			if(boll.value.length==0){
				alert("기부할 포인트를 입력해주세요.")
				return false;
			}
			return true;
		} */
		
		/* 인풋박스 오른쪽에 빨간글씨로 검증 내용 띄우는 방법 */
	/* 	function dd(bool){
			var hlep = document.getElementById("one_help");
			if(bool.value.length==0){
				help.innerHTML = "기부할 포인트를 입력해주세요.";
				return false;
			}
			else{
				help.innerHTML="";
			}
			return true;
		}
		
		/* 4자리 이상 숫자인지 확인 */
	/* 	function(data){
			var hlep = document.getElementById("one_help");
			if(data.value.lenth!=4){
				help.innerHTML = "1000point부터 기부할 수 있습니다.";
				return false;
			}
		
			return true; */
		} */
	</script> -->
	
	<!-- 셀렉트 박스에서 직접입력 및 인풋박스에 셀렉트한 값이 입력되어 넘어가도록 하는 자바스크립트 코드 -->
	<script type="text/javascript"> 
		function changeSelection(){
			if(document.donatePoint.amount.options[document.donatePoint.amount.selectedIndex].value == '0'){
				 document.donatePoint.donaamount.disabled = true;
				 document.donatePoint.donaamount.value = "";
			}
			if(document.donatePoint.amount.options[document.donatePoint.amount.selectedIndex].value == '9'){
				 document.donatePoint.donaamount.disabled = false;
				 document.donatePoint.donaamount.value = "";
				 document.donatePoint.donaamount.focus();
			} else{
				 document.donatePoint.donaamount.disabled = true;
				 document.donatePoint.donaamount.value = document.donatePoint.amount.options[document.donatePoint.amount.selectedIndex].value;
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
			document.getElementById("tDate").value = tDay.getFullYear()+"년 "+tMonth+"월 "+tDate+"일";
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
                    <h1>포인트 나눔</h1>
                    <p>Point donation: Application Form</p>
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
                           
                            <h3>포인트 나눔하기</h3>
                            <span class="mb-3">Point donation _ Application Form</span>
                            <figure><img src="${pageContext.request.contextPath}/resources/charity/donation-images/heart.jpg" alt=""></figure><!-- 788x355 -->
                             
                            <p>후원 회원 여러분, 나누셰어 프로젝트의 나눔 활동에 동참해주셔서 감사합니다. <br>안내 사항을 다시 한 번 꼭 확인해 주시고 신청서 작성 부탁드립니다. <br>
                            감사합니다.</p>
                            <div class="charity-team-contact">
                                <ul class="chaity-contact-info">
                                    <li>
                                        <h6>포인트 나눔 관련:</h6>
                                        <span>+123 45 678</span>
                                    </li>
                                    <li>
                                        <h6>Email:</h6>
                                        <a href="mailto:name@email.com">info@example.com</a>
                                    </li>
                                </ul>
                             
                            </div>
                          
                        </div>
                        <!--// company-timeline \\-->
                        
                        
                        <!--// volunteer-form \\-->
                        <div class="widget_title mt-4"><h2>포인트 나눔하기</h2></div>
                       
                        <div class="charity-volunteer-form"> <!-- .charity-volunteer-form > form > ul > li > #text-calendar -->
						<form name="donatePoint" method="post" action="pointAction">
							<c:forEach var="vo1" items="${memberInfo}"> 
							<input type="hidden" name="member_id" value="${vo1.member_id}">
                                <ul class="mt-4">
                                    <li>
                                        <label>아이디(Email): </label>
                                        <input type="text" value="${vo1.member_id}"  readonly ></li>
                                    <li>
                                        <label>이름:</label>
                                        <input type="text" value="${vo1.name}" onblur="if(this.value == '') { this.value ='Enter name*'; }" onfocus="if(this.value =='Enter name*') { this.value = ''; }" readonly>
                                        </li>
                                    
                                    <%-- <li class="chrity-full-form">
                                        <label>연락처:</label>
                                        <input type="text" value="${vo1.phone}" onblur="if(this.value == '') { this.value ='Enter address line*'; }" onfocus="if(this.value =='Enter address line*') { this.value = ''; }" readonly>
                                    </li> --%>
                                   
                                    <li>
                                        <label>신청 날짜:</label>    
                                        <div class="chrity-full-form"> <!-- class="charity-select-date" -->
                                        	<!-- readonly 작성시 수정은 불가하고 읽기만 가능하다. -->
	                                   		<input name="tName" type="text" id="tDate" readonly>
	                                   		
	                                   		<!-- 실패 <input id="datepicker" type="date"> -->
	                                   		<!-- 오늘날짜 받아오기 test <input type="date" id="currentDate" name="idntdate"> -->
	                                   		<!-- jQuery-UI test1: <input type="date" id="datepicker" name="idntdate"> -->
                                  			<!-- jQuery-UI test2: <input class="chrity-full-form" type="text" id="datepicker1" class="calendar" /> -->
                                    	</div> 
                                    </li>
                                    <c:forEach var="vo2" items="${vo1.pointList}">
                                    <li>
                                        <label>보유 포인트:</label>
                                        <input type="text" name="totalpnt" value="${vo2.totalpnt} point" readonly > 
                                    </li>
                                    </c:forEach> 
                                    
                               		<li>
                                    	<label>나눌 포인트:</label>
                                   		<input type="text" name="donaamount" id="selectDirect" disabled />
                                    </li>
                                    <!-- disabled는 기본으로 인풋박스가 비활성화 되는 기능이다. 동시에 셀렉트 박스에서 입력한 값이 input box로 입력된다.
											자바스크립트 jQuery 함수를 사용해 셀렉트 박스의 value가 9일 경우(숫자는 임의로 설정함) disabled를 해제하고 수량을 입력할 수 있도록 했다.
											결국 input box에 입력된 값이 form을 넘길 때 수량값으로 넘어가게 된다. -->
                                    
                                    <li class="charity-select-form">   
                                    	<label>(select)</label>
										<div class="charity-select-two"> 
											<select id="selectBox" name="amount" onchange="changeSelection()">
												<option value="0"> 나눌 포인트 </option>
												<option value="9">*직접입력*</option>
												<option value="1000"> 1,000 point</option>
												<option value="2000"> 2,000 point</option>
												<option value="3000"> 3,000 point</option>
												<option value="5000"> 5,000 point</option>
												<option value="10000">10,000 point</option>
												<option value="15000">15,000 point</option>
												<option value="20000">20,000 point</option>
												<option value="30000">30,000 point</option>
												<option value="50000">50,000 point</option>
											</select>
										</div>
                                    </li>
                               
                                </ul>
                                
                                <div class="charity-team-contactus mt-3">
                               		 *포인트는 1000p 이상부터 100p단위로 나눔할 수 있습니다.
	                                <button type="submit" class="charity-sub-btn" id="btnSend" ><i class="fa fa-save"> 포인트 나눔하기</i></button>
									<button type="button" class="charity-sub-btn" onclick="location.href='${pageContext.request.contextPath}/donation/money/main'"><i class="fa fa-arrow-left"> 이전화면으로</i></button><!-- 확인필요 -->
                           		</div>
                           	</c:forEach>
                            </form>
                        </div>
                         
	                    <!--  지침: 확인 사항 리스트 -->
	                   <!--  내용 참고 : https://www.donorpoints.com/ -->
	                    <div class="widget_title mt-5"><h2>포인트 나눔 전 반드시 확인해 주세요!</h2></div>
	                    <div class="charity-campaign-content">
	                        <div class="row">
	                            <div class="col-md-12">
	                                <ul class="charity-item-text"><!-- charity-list-style-one -->
	                                   	<li class="mt-3">다음 내용은 2021년 3월 17일 기준으로 작성되었습니다.</li>
	                                    <li class="mt-3">나누셰어 회원이 되시면 이벤트 페이지의 출석체크, 게임, 테스트를 통해 포인트를 획득하실 수 있습니다.</li>
	                                    <li class="mt-3">회원님의 포인트가 1,000포인트 이상이 되면 포인트 나눔 페이지에 방문하여 포인트를 기부할 수 있습니다.</li>
	                                    <li class="mt-3">기부하신 포인트는 반환되지 않습니다. 기부 전 다시 한 번 확인 부탁드립니다.</li>
	                                    <li class="mt-3">기부하신 포인트 내역은 마이페이지에서 확인하실 수 있습니다.</li>
	                                </ul>
	                            </div>
	                            <div class="col-md-5">
	                                <img src="/resources/extra-images/Campaign-img1.png" alt="" class="charity-campaing-image">
	                            </div>
	                        </div>
	                    </div>
	                    
	                    <!--// volunteer-form \\-->
                        <div class="charity-team-contactus">
                            <ul>
                           		<li>
                                    <i class="fa fa-phone"></i>
                                    <h5>포인트나눔 관련:</h5>
                                    <span>+(091)61 3146 8728</span>
                                </li>
                                <li>
                                    <i class="fa fa-envelope"></i>
                                    <h5>Email:</h5>
                                    <a href="mailto:name@email.com">info@example.com</a>
                                </li>
                                
                            </ul>
                        </div>
	                    
                    </div>
                   
                    <!-- 여기서부터 우측 배너 손 안댔음! -->
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