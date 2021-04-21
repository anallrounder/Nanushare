<!-- 혜선_ 물품기부 신청서 작성, 전송 뷰 페이지 부트스트랩 적용 작성 시작 03.25-->

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!doctype html>
<html lang="en">

<head>
	<!-- jQuery -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	
    <!-- meta tags -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	
	<!-- new korean font from google -->
	<!-- NotoSansKR, Gothic A1 -->
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Gothic+A1:wght@100;200;300;400;500;600;700;800;900&family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
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
    
    <!-- 웹페이지 탭 로고이미지 삽입  -->
	<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/nanulogo_ico_convert.ico"> 
	
    <!-- 인풋박스에 신청 날짜가 오늘 날짜로 입력되도록 하는 자바스크립트 코드 -->
    <script type="text/javascript">
        /* This script and many more are available free online at The JavaScript Source!! http://javascript.internet.com
		Created by: Jean P. May, Jr. | http://www.wideopenwest.com/~thebearmay */
        function autoDate() {
            var tDay = new Date();
            var tMonth = tDay.getMonth() + 1;
            var tDate = tDay.getDate();
            if (tMonth < 10) tMonth = "0" + tMonth;
            if (tDate < 10) tDate = "0" + tDate;
            document.getElementById("tDate").value = tDay.getFullYear() + "년 " + tMonth + "월 " + tDate + "일";
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
    
    	<!-- 물품수량 셀렉트 박스에서 직접입력 및 인풋박스에 셀렉트한 수량이 입력되어 넘어가도록 하는 자바스크립트 코드 -->
        function changeSelection() { 
        	// 셀렉트 옵션 value가 ""이면 <option value=""> 물품 수량 선택</option> 인풋박스 설정 못하게 되어있고 value 0.
            if (document.sendForm.amount.options[document.sendForm.amount.selectedIndex].value == '0') { 
                document.sendForm.donaamount.disabled = true;
                document.sendForm.donaamount.value = "";
            }
         	// 셀렉트 옵션 value가 '9'이면  <option value="9">*직접입력*</option> disabled를 해제하고, input박스 입력되게 함.
            if (document.sendForm.amount.options[document.sendForm.amount.selectedIndex].value == '9') {
                document.sendForm.donaamount.disabled = false;
                document.sendForm.donaamount.value = "";
                document.sendForm.donaamount.focus();
            } 
            // 아니면 셀렉트 박스에서 선택한 값을 value로 넘긴다.
            else {
                document.sendForm.donaamount.disabled = true;
                document.sendForm.donaamount.value = document.sendForm.amount.options[document.sendForm.amount.selectedIndex].value;
            }
        }
        
        $(document).ready(function(){ // -> 이걸 안쓰면 직접선택이 아닌 셀렉트 박스로 선택시에 수량이 안넘어감.
        	// 수량선택 input박스를 속성을 disabled로 설정함
            $('#selectDirect').attr('disabled', 'disabled');
            // submit으로 form 전송시 disabled된 input box값은 전달되지 않아 'submit'버튼 클릭시 해당 컨트롤의 disabled 속성을 제거하도록 해야한다.
            $('#btnSend').click(function() {
                $('#selectDirect').removeAttr('disabled');
            });
        });
    </script>
    
	<!-- validation 경고문구 스타일 -->
<style type="text/css">
.error {
    color: red;
}
#forimg {
	/* background-color: #db7a7c; */
	background-color: #dfebe9;
	background-image: url('/resources/banner_imgs/show_banner.png');
	background-repeat:no-repeat;
	background-position: center;
	/* background-size: 1500px; 
	width:100%;  */
}
.black-transparent {
	opacity:50%;
}
</style>
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
                   <!--  <h1>물품나눔 신청서 작성</h1>
                    <p>Product donation: Application Form</p> -->
                </div>
            </div>
        </div>
    </div>
    <!-- Banner -->
<%-- 	
	<%
	if(session.getAttribute("userID") == null) {
		session.setAttribute("loginMsg", "게시물 작성은<br>로그인이 필요합니다.");
		response.sendRedirect("/login");
		return;
	}
	%> --%>
	
    <!-- Content -->
	<div class="charity-fancy-title " style="margin-top:70px; margin-bottom:20px;">
		<h2> 물품 나누기 </h2>
	</div> 
	
    <div class="charity-main-content">

        <!-- Main Section -->
        <div class="charity-main-section">
            <div class="container">
                <div class="row">
                
					<!-- aside 제외한 왼쪽 컨텐츠 div -->                
                    <div class="col-md-9">
                        
                        <!--// 신청서 안내사항 \\ -->
                        <div class="charity-team-warp">

                            <h3>물품 나누기 신청서 작성</h3>
                            <span class="mb-3">Product donation_ Application Form</span>
                            <figure><img src="${pageContext.request.contextPath}/resources/charity/donation-images/heart.jpg" alt=""></figure><!-- 788x355 -->

                            <p>후원 회원 여러분, 나누셰어 프로젝트의 물품 나누기에 동참해주셔서 감사합니다.<br>
                            이전 페이지의 물품 나누기 안내사항을 다시 한 번 꼭 확인해 주시고 신청서 작성 부탁드립니다. <br>
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

                        </div>
                        <!--// 신청서 안내사항 \\-->

                        <!--// 신청서 양식 \\-->
                        <div class="widget_title mt-4">
                            <h2 style="font-size:22px;">물품 나눔 신청서</h2>
                        </div>

                        <div class="charity-volunteer-form">
                            <form id="sendForm" name="sendForm" method="post" action="formAction" onsubmit="return submitCheck();" novalidate> <!-- novalidate -->
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                            <%--     <input type="hidden" name="member_id" value="${memberInfo.member_id}"> --%>
                                <ul class="mt-4">
								
								<!-- 로그인한 사용자 정보 받아오기 희재씨 mypage.jsp 참고 -->
								<c:forEach items="${list1}" var="list1">
								<sec:authentication property="principal" var="pinfo" />
									<sec:authorize access="isAuthenticated()">
										<c:if test="${pinfo.username eq list1.member_id}">
		                                    <%-- <c:if test="${sessionScope.member_id = principal.member_id}"> --%>
		                                    <li>
		                                        <!-- readonly 작성시 수정은 불가하고 읽기만 가능하다. -->
		                                        <label>아이디(Email): </label>
		                                        <input type="text" name="member_id" value="${list1.member_id}" readonly>
		                                        <!-- onblur="if(this.value == '') { this.value ='Enter name*'; }" onfocus="if(this.value =='Enter name*') { this.value = ''; }" -->
		                                    </li>
		                                    <%-- </c:if> --%>
		                                    <li>
		                                        <label>이름:</label>
		                                        <input type="text" name="name" value="${list1.name}" readonly>
		                                    </li>
		                                   <%--  <li class="chrity-full-form">
		                                        <label>연락처:</label>
		                                        <input type="text" name="phone" value="${list1.phone}" readonly>
											</li> --%>
	                                    </c:if>
									</sec:authorize>	
								</c:forEach>
                                   	
									<!-- 날짜: 당일 날짜를 불러오게 되어있고, DB에는 값이 넘어가지 않고 SYSDATE로 입력된다. -->
                                    <li>
                                        <label>신청 날짜:</label>
                                        <div class="chrity-full-form">
                                            <input type="text" id="tDate" disabled >	<!-- name="idntdate" 입력방식이 다르게 되어있다. 여기서 안넘기고  -->
                                        </div>
                                    </li>
                                    
                                    <!-- 물품선택 셀렉트 박스 -->
                                    <li class="charity-select-form">
                                        <!-- <label for="itemSelect">믈품선택:</label> -->
                                        <label for="icat_num">믈품선택:</label>
                                        <div class="charity-select-two">
                                            <select  id="itemSelect" name="icat_num">
                                                <option value="">물품 종류 선택</option>
                                                <option value="1">마스크</option>
                                                <option value="2">기저귀</option>
                                                <option value="3">생리대</option>
                                                <option value="4">문구류</option>
                                                <option value="5">손세정제</option>
                                            </select>
                                        </div>
                                    </li>

									<!-- 수량선택 input 과 select 연동되어있음 -->
                                    <li>
                                        <!-- class="chrity-full-form" -->
                                      	<!--  <label for="selectDirect">수량선택:</label> -->
                                        <label for="donaamount">수량선택:</label>
                                        <input type="text" name="donaamount" id="selectDirect" disabled  />
                                    </li>
                                    <!-- disabled는 기본으로 인풋박스가 비활성화 되는 기능이다. 동시에 셀렉트 박스에서 입력한 값이 input box로 입력된다.
										자바스크립트 jQuery 함수를 사용해 셀렉트 박스의 value가 9일 경우(숫자는 임의로 설정함) disabled를 해제하고 수량을 입력할 수 있도록 했다.
										결국 input box에 입력된 값이 form을 넘길 때 수량값으로 넘어가게 된다. -->
                                    <li class="charity-select-form">
                                        <label for="selectBox">(select)</label>
                                        <div class="charity-select-two">
                                            <select id="selectBox" name="amount" onchange="changeSelection()">
                                                <option value=""> 물품 수량 선택</option>
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
                                <div class="charity-team-contactus mt-3">
                                    <button type="submit" class="charity-sub-btn" id="btnSend"><i class="fa fa-save"> 신청서 전송</i></button>
                                    <!--   각각의 input box초기화하는 방법: https://codepen.io/eond/pen/epYpMw \
	                                	date는 초기화 되지 않도록 만들고 싶어서 일부만 초기화를 제외하는 방법 찾는중
	                                	$(input박스가 있는 곳을 감싸고 있는 객체의 ID).find('input[type=text]').each(function(){ $(this).val(''); });
									   참고: https://alwayslifegoseon.tistory.com/119 -->
                                   <!--  <button type="reset" class="charity-sub-btn"><i class="fa fa-undo"> 다시선택하기</i></button> -->
                                    <button type="button" class="charity-sub-btn" onclick="location.href='${pageContext.request.contextPath}/donation/item/main'"><i class="fa fa-arrow-left"> 이전화면으로</i></button><!-- 확인필요 -->
                                </div>
                            </form>
                            <!--// 신청서 양식 끝 \\-->
                            
							<!-- jQuery validation CDN form validation : form 태그 아래에 위치해야 작동한다. (왜 인지는 잘 모름) -->
								<!-- jQuery 플러그인 이기때문에 jQuery가 있어야 한다. -->
								<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
								<!-- jQuery validation method CDN -->
								<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/additional-methods.min.js"></script>
	                        <!-- jQuery validation CDN form validation end-->
                            
                            <!-- form validation - 성일씨 회원가입 validation 코드 참고로 작성함 -->
                            <script>
                                $("#sendForm").validate({

                                    rules: {
                                        /* 각 태그의 규칙을 설정 */
                                        /* 함수 정의 https://offbyone.tistory.com/50 참고주소 */
                                        /* 비밀번호 특수문자 https://yoo-hyeok.tistory.com/82  */
                                        /* 공식 문서 https://jqueryvalidation.org/ */
                                        /* html의 input태그의 name=""에 설정한 값과 같아야한다.  */

                                        icat_num: { 				// 품목 selet
                                            required: true
                                        },
                                        amount: { 					// 수량 select
                                            required: true			/* 필수인가? true는 yes를 의미 */
                                        },
                                        donaamount: { 				// 수량input
                                            required: true,			/* 필수인가? true는 yes를 의미 */
                                            /* number : true, */	
                                            digits: true,			/* (양수)숫자만 입력가능 -number와 다른점은 소수와 음수일 경우 false*/
                                            spaceCheck: true,		/* 내가 추가한 validate 메소드 */
                                            minlength: 1,			/* 최소글자 수*/
                                            min: 1					/* 최소 값 */
                                        }
                                    },
                                    messages: {
                                        /* rules에서 설정한 규칙을 위배할시 나오는 메세지 */
                                        icat_num: { 		// 품목 selet
                                            required: '보내실 물품을 선택하세요.'
                                        }, 
                                        amount: { 		// 수량 select
                                            required: '수량을 선택해 주세요.'
                                        },
                                        donaamount: { 		// 수량input
                                            required: '수량을 입력해 주세요.',
                                            digits: '숫자만 입력 가능합니다.',
                                            /* number : '숫자만', */
                                            spaceCheck: '공백없이 입력해주세요.',
                                            minlength: '1개 이상으로 입력해 주세요.',
                                            min: '1개 이상으로 입력해 주세요.'
                                        }
                                    },
                                    errorElement: 'span',			/* 디폴트는 lable 태그 lable->span 으로 수정 */
                                    errorClass: 'error',			/* 디폴트 클래스 이름은 error, 클래스 이름을 변경할 수 있다.*/

                                    errorPlacement: function(error, element) {
                                        if (element.is(":text") ) {
                                            element.parent().after(error);
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
                                //출처: https://devhong.tistory.com/3 [주니어를 탈출하고 싶은 개발자의 블로그]
                            </script>
							<!-- form validation end -->
							
                        </div>
                        
                        <!--// 연락처 이메일 \\-->
                        <!-- <div class="charity-team-contactus">
                            <ul>
                                <li>
                                    <i class="fa fa-phone"></i>
                                    <h5>물품 후원 관련:</h5>
                                    <span>+(091)61 3146 8728</span>
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