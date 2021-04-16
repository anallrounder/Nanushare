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
    
    <!-- 웹페이지 탭 로고이미지 삽입  -->
	<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/nanulogo_ico_convert.ico"> 
	
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
                    
                    	<!--// company-timeLine \\-->
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
                            </div> <!-- charity-team-contact -->
                          
                        </div>
                        <!--// company-timeLine \\-->
                        
                        
                        <!--// volunteer-form \\-->
                        <div class="widget_title mt-4"><h2>포인트 나눔하기</h2></div>
                       
                        <div class="charity-volunteer-form"> <!-- .charity-volunteer-form > form > ul > li > #text-calendar -->
						<form name="donatePoint" method="post" action="${pageContext.request.contextPath}/my/donation/money/point/pointAction">
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
							<ul class="mt-4">
							<c:forEach var="vo1" items="${memberInfo}"> 
							<%-- <sec:authentication property="principal" var="pinfo" />
								<sec:authorize access="isAuthenticated()">
								<c:if test="${pinfo.username eq vo1.member_id}">  --%>
                                   
                                   <li>
                                       <label>아이디(Email):</label>
                                       <%-- <input type="text" value="<sec:authentication property="principal.member.member_id"/> "  readonly >  --%>
                                       <input type="text" name="member_id" value="${vo1.member_id}" readonly /> 
                                   </li>
                                   <li>
                                       <label>이름:</label>
									   <input type="text" name="name" value="${vo1.name}" readonly />
								</li>
                                   <li>
                                       <label>신청 날짜:</label>    
                                       <div class="chrity-full-form"> <!-- class="charity-select-date" -->
                                       	<!-- readonly 작성시 수정은 불가하고 읽기만 가능하다. -->
                                   		<input name="tName" type="text" id="tDate" readonly>
                                   		
                                   	</div> 
                                   </li>
                                  <c:forEach var="vo2" items="${vo1.pointList}">
                                
                                   <li>
                                       <label>보유 포인트:</label>
                                       <input type="text" name="totalpnt" value="${vo2.nowpnt}" readonly > 
                                       <input type="hidden" name="totalpnt" value="${vo2.totalpnt}" readonly > 
                                   </li>
                                </c:forEach> 
								<%-- </c:if>
								</sec:authorize>  --%>
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
							</c:forEach>
                               </ul>
                               
                                <div class="charity-team-contactus mt-3">
                               		 *포인트는 1000p 이상부터 100p단위로 나눔할 수 있습니다.
	                                <button type="submit" class="charity-sub-btn" id="btnSend" ><i class="fa fa-save"> 포인트 나눔하기</i></button>
									<button type="button" class="charity-sub-btn" onclick="location.href='${pageContext.request.contextPath}/donation/money/main'"><i class="fa fa-arrow-left"> 이전화면으로</i></button>
                           		</div>
                           	
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
	                    
	                    <!--// 연락처 이메일 \\-->
                        <div class="charity-team-contactus">
                            <ul>
                           		<li>
                                    <i class="fa fa-phone"></i>
                                    <h5>포인트나눔 관련:</h5>
                                    <span>02 1234 5678</span>
                                </li>
                                <li>
                                    <i class="fa fa-envelope"></i>
                                    <h5>Email:</h5>
                                    <a href="mailto:name@email.com">info@example.com</a>
                                </li>
                            </ul>
                        </div>
                        <!--\\ 연락처 이메일 //-->
                    
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