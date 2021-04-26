<!-- 혜선_ 물품기부 신청서 작성, 전송 뷰 페이지 부트스트랩 적용 작성 시작 03.25-->

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!doctype html>
<html lang="ko">

<head>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- meta tags -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>나누셰어 - 돈기부여</title>

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

<!-- header -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">

<!-- new korean font from google -->
<!-- NotoSansKR, Gothic A1 -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Gothic+A1:wght@100;200;300;400;500;600;700;800;900&family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">

<style type="text/css">
/*  validation 경고문구 스타일 */
.error {
    color: red;
}

/*  a 태그 후버시 밑줄 속성 제거 */
a:hover { 
 	text-decoration: none;
}

#forimg {
	background-color: #eaf0fe;
	background-image: url('/resources/banner_imgs/donation_banner.jpg');
	background-repeat:no-repeat;
	background-position: center;
	background-height:100%;
}
.black-transparent {
	opacity:50%;
}
</style>

<!-- 셀렉트 박스에서 직접입력 및 인풋박스에 셀렉트한 값이 입력되어 넘어가도록 하는 자바스크립트 코드 -->
<script type="text/javascript"> 
	function changeSelection(){
		if(document.donatePoint.amount.options[document.donatePoint.amount.selectedIndex].value == '0'){
			 document.donatePoint.dntpnt.disabled = true;
			 document.donatePoint.dntpnt.value = "";
		}
		if(document.donatePoint.amount.options[document.donatePoint.amount.selectedIndex].value == '9'){
			 document.donatePoint.dntpnt.disabled = false;
			 document.donatePoint.dntpnt.value = "";
			 document.donatePoint.dntpnt.focus();
		} else{
			 document.donatePoint.dntpnt.disabled = true;
			 document.donatePoint.dntpnt.value = document.donatePoint.amount.options[document.donatePoint.amount.selectedIndex].value;
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
    <div id="forimg" class="charity-subheader">
       <span class="black-transparent"></span>
        <div class="container">
            <div class="row">
                <div class="col-md-12"> 
              <!--       <h1>포인트 나눔</h1>
                    <p>Point donation: Application Form</p> -->
                </div>
            </div>
        </div>
    </div>

    <!-- Content -->
    <div class="charity-fancy-title " style="margin-top:70px; margin-bottom:20px;">
		<h2> 포인트 나눔하기 </h2>
	</div> 

    <div class="charity-main-content">

        <!-- Main Section -->
        <div class="charity-main-section">
            <div class="container">
                <div class="row">
                    <div class="col-md-9">
                    
                    	<!--// company-timeLine \\-->
                        <div class="charity-team-warp">
                           
                            <h3>포인트 나눔하기</h3>
                            <span class="mb-3">Point donation_ Application Form</span>
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
                        <div class="widget_title mt-4"><h2 style="font-size:22px;">포인트 나눔 신청서</h2></div>
                       
                        <div class="charity-volunteer-form"> <!-- .charity-volunteer-form > form > ul > li > #text-calendar -->
						<form id="donatePoint" name="donatePoint" method="post" action="${pageContext.request.contextPath}/my/donation/money/point/pointAction">
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
                                       <input type="text" name="nowpnt" value="${vo2.nowpnt}" readonly > 
                                       <input type="hidden" name="totalpnt" value="${vo2.totalpnt}" readonly > <!-- 누적포인트는 받아서 전송만 한다. -->
                                   </li>
                                </c:forEach> 
								<%-- </c:if>
								</sec:authorize>  --%>
								<c:forEach var="vo2" items="${vo1.pointList}">
								<c:if test="${vo2.nowpnt > 999}">  <!-- 보유포인트가 1000이상일때만 보임 -->
                              		<li>
	                                   	<label>나눌 포인트:</label>
	                                  	<input type="text" name="dntpnt" id="selectDirect" disabled />                                 			
                                    </li>
                                   <!-- disabled는 기본으로 인풋박스가 비활성화 되는 기능이다. 동시에 셀렉트 박스에서 입력한 값이 input box로 입력된다.
										자바스크립트 jQuery 함수를 사용해 셀렉트 박스의 value가 9일 경우(숫자는 임의로 설정함) disabled를 해제하고 수량을 입력할 수 있도록 했다.
										결국 input box에 입력된 값이 form을 넘길 때 수량값으로 넘어가게 된다. -->
                                   
                                   <li class="charity-select-form" style="width:50%;">   
                                   	<label>(select)</label>
									<div class="charity-select-two"> 
										<select id="selectBox" name="amount"  onchange="changeSelection()">
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
                                </c:if>  
                                </c:forEach>   
							</c:forEach>
							
                               </ul>
                               
                                <div class="charity-team-contactus mt-3">
                               		 *1000포인트 이상부터 나눔할 수 있습니다.
                               		<c:forEach var="vo1" items="${memberInfo}">
                               		<c:forEach var="vo2" items="${vo1.pointList}">
									<c:if test="${vo2.nowpnt > 999}"> 
									<!-- 보유포인트가 1000이상일때만 보임 -->
	                                <button type="submit" class="charity-sub-btn" id="btnSend" ><i class="fa fa-save"> 포인트 나눔하기</i></button>
	                               	</c:if>
	                               	</c:forEach>
	                               	</c:forEach>
									<button type="button" class="charity-sub-btn" onclick="location.href='${pageContext.request.contextPath}/donation/money/main'"><i class="fa fa-arrow-left"> 이전화면으로</i></button>
                           		</div>
                           	
                            </form>
                        </div>
                         
	                    <!--  지침: 확인 사항 리스트 -->
	                   <!--  내용 참고 : https://www.donorpoints.com/ -->
	                    <div class="widget_title mt-5"><h2 style="font-size:22px;">포인트 나눔 전 반드시 확인해 주세요!</h2></div>
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
	                    
					<!-- jQuery validation CDN form validation : form 태그 아래에 위치해야 작동한다. (왜 인지는 잘 모름) -->
					<!-- jQuery 플러그인 이기때문에 jQuery가 있어야 한다. -->
					<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
					<!-- jQuery validation method CDN -->
					<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/additional-methods.min.js"></script>
					<!-- jQuery validation CDN form validation end-->
                         
                    <!-- form validation - 성일씨 회원가입 validation 코드 참고로 작성함 -->
                    <script>
                        $("#donatePoint").validate({
                            rules: {
                                /* 각 태그의 규칙을 설정 */
                                /* 함수 정의 https://offbyone.tistory.com/50 참고주소 */
                                /* 공식 문서 https://jqueryvalidation.org/ */
                                /* html의 input태그의 name=""에 설정한 값과 같아야한다.  */
                                amount: { 					// 수량 select
                                    required: true			/* 필수인가? true는 yes를 의미 */
                                },
                                dntpnt: { 				// 수량input
                                    required: true,			/* 필수인가? true는 yes를 의미 */
                                    digits: true,			/* (양수)숫자만 입력가능 -number와 다른점은 소수와 음수일 경우 false 작동함 */
                                    spaceCheck: true,		/* 내가 추가한 validate 메소드 */
                                    minlength: 1,			/* 최소글자 수 */
                                    min: 1					/* 최소 값 */
                                    //minlength: 4,			/* 최소글자 수*/
                                    //min: 1000				/* 최소 값 */
                                }
                            },
                            messages: {
                                // rules에서 설정한 규칙을 위배할시 나오는 메세지
                                amount: { 		// 기부 포인트 select
                                    required: '기부할 포인트를 선택해 주세요.'
                                },
                                dntpnt: { 		// 기부 포인트  input
                                    required: '기부할 포인트를 입력해 주세요.',
                                    digits: '숫자만 입력 가능합니다.',
                                    spaceCheck: '공백없이 입력해주세요.',
                                    minlength: '1000포인트 부터 기부가 가능합니다.',
                                    min: '1000포인트 부터 기부가 가능합니다.'
                                }
                            },
                            errorElement: 'span',			// 디폴트는 lable 태그 lable->span 으로 수정 
                            errorClass: 'error',			// 디폴트 클래스 이름은 error, 클래스 이름을 변경할 수 있다.

                            errorPlacement: function(error, element) {
                                if (element.is(":text")  ) {
                                    element.parent().parent().after(error);
                                } else {
                                    element.after(error);
                                }
                            }
                        });

                        /* 공백 체크 함수 추가함 */
                        $.validator.addMethod("spaceCheck" /* validate명 */ , function(value, element) {
                            //검사하는 name태그의 value 중 공백이 없으면 true, 있으면 false리턴
                            //false 리턴 시 messages에 선언된 내용들 띄워줌
                            return $(element).val().indexOf(" ") = -1 ? true : false;
                        });
                        //출처: https://devhong.tistory.com/3 
                    </script> 
					<!-- form validation end -->
	                    
	                    
	                    <!--// 연락처 이메일 \\-->
                        <!-- <div class="charity-team-contactus">
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
                        </div> -->
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
    <script src="${pageContext.request.contextPath}/resources/charity/script/functions-main.js"></script>
</body>

</html>