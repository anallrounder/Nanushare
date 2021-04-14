<!-- 혜선_ 물품기부 신청서 작성, 전송 뷰 페이지 부트스트랩 적용 작성 시작 03.25-->

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!doctype html>
<html lang="ko">

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


    <!--  date ui test 아마도 안쓸듯.  -->
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="/resources/demos/style.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>

	<!-- 웹페이지 탭 로고이미지 삽입  -->
	<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/nanulogo_ico_convert.ico"> 
	
    <!-- jquery validation cdn-->
    <!-- jquery 플러그인 이기때문에 jquery가 있어야 한다. -->
    <script type="text/javascript" src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>

    <!-- jquery validation method cdn -->
    <script type="text/javascript" src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/additional-methods.min.js">
    </script>

    <%-- <sec:csrfMetaTags/> --%>
    <!-- 헤더 안에 추가  -->
    <!-- csrf 관련이슈 해결방법 : jsp에 meta 태그추가(csrf값 얻기위해) -->
    <!-- js에서 csrf 토큰, 헤더등록 -->
    <%--     <meta name="_csrf" content="${_csrf.token}">
    <meta name="_csrf_header" content="${_csrf.headerName}"> --%>

    <!-- 데이트픽커 test -->
    <!-- <script> 
		$( function() {
		  $( "#datepicker" ).datepicker();
		} );
	</script> -->

    <!-- 현재 날짜를 받아오기 위한 작업 test -->
    <!-- 	<script>
	/*  document.getElementById('#currentDate').valueAsDate = new Date(); */
	/*  또 다른 방법:  document.getElementById('currentDate').value = new Date().toISOString().substring(0, 10); */
	</script> -->

    <!-- 인풋박스에 신청 날짜가 오늘 날짜로 입력되도록 하는 자바스크립트 코드 -->
    <script type="text/javascript">
        /* This script and many more are available free online at
	The JavaScript Source!! http://javascript.internet.com
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
                    }                    func();
                }
            }
        }

        addLoadEvent(function() {
            autoDate();
        });
    </script>

    <!-- 물품수량 셀렉트 박스에서 직접입력 및 인풋박스에 셀렉트한 수량이 입력되어 넘어가도록 하는 자바스크립트 코드 -->
    <script type="text/javascript">
        function changeSelection() {
            if (document.sendForm.amount.options[document.sendForm.amount.selectedIndex].value == '0') {
                document.sendForm.donaamount.disabled = true;
                document.sendForm.donaamount.value = "";
            }
            if (document.sendForm.amount.options[document.sendForm.amount.selectedIndex].value == '9') {
                document.sendForm.donaamount.disabled = false;
                document.sendForm.donaamount.value = "";
                document.sendForm.donaamount.focus();
            } else {
                document.sendForm.donaamount.disabled = true;
                document.sendForm.donaamount.value = document.sendForm.amount.options[document.sendForm.amount.selectedIndex].value;
            }
        }



        $(document).ready(function() {
         /*    isCertification = false;

            $('#selectBox').validate({
                rules: {
                    agree: "required",
                    icat_num: "required"
                }
            });

            $("#btnSend").click(function submitCheck() { //폼에서 submit을 진행했을대 메일인증이 되어있지 않다면 페이지전환을 할 수 없다.
                if (isCertification == false) {
                    alert("빠짐없이 입력해주세요.");
                    return false;
                } else
                    true;
            }); */

            $('#selectDirect').attr('disabled', 'disabled');
            // submit으로 form 전송시 disabled된 input box값은 전달되지 않아 'submit'버튼 클릭시 해당 컨트롤의 disabled 속성을 제거하도록 해야한다.
            $('#btnSend').click(function() {
                $('#selectDirect').removeAttr('disabled');
            });

        });
    </script>


    <!-- date picker에서 선택한 값 인풋박스에 넣기
		참고:  https://blog.jaeyoon.io/2017/10/js-datepicker.html -->
    <!-- <style>
	/* 	body {
			display: flex; justify-content: center; padding: 3em 0
		} */ 
		
		/* input {
			padding: 1em 1.5em; font-size:1.2em
		} */
		input[type="date"]::-webkit-calendar-picker-indicator,
		input[type="date"]::-webkit-inner-spin-button {
		    display: none;
	    	appearance: none;
		}
	</style>
	
	date picker input에 넣기
	<script>
	var picker = new Pikaday({ 
		  field: document.getElementById('datepicker'),
		  format: 'yyyy-MM-dd',
		  
		  /* datepicker 라이브러리에 따라 다르지만 string 타입으로 리턴, date type input이 인식할 수 있는 string 형태로 변환 */
		  toString(date, format) {
		    let day = ("0" + date.getDate()).slice(-2);
		    let month = ("0" + (date.getMonth() + 1)).slice(-2);
		    let year = date.getFullYear();
		    return `${year}-${month}-${day}`;
		  }
	});	
	</script> -->
    <style type="text/css">
        .error {
            color: red;
        }
    </style>
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
                    <h1>물품나눔 신청서 작성</h1>
                    <p>Product donation: Application Form</p>
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
                            <span class="mb-3">Product donation _ Application Form</span>
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

                        </div>
                        <!--// company-timeline \\-->

                        
                      <!--   희재씨 mypage.jsp 참고 -->
                      <!-- 로그인한 회원의 글 정보만 받아오기 -->
					<%-- 	<c:forEach items="${list1}" var="list1">
							<sec:authentication property="principal" var="pinfo" />
							<sec:authorize access="isAuthenticated()">
								<c:if test="${pinfo.username eq list1.member_id}">
									<tr>
										<td>${list1.member_id}</td>
		
										<td><c:if test="${sessionScope.member_id = principal.member_id}"></c:if></td>
										<td>${list1.btitle}</td>
										<!-- 제목누르면 해당 글내용으로 이동링크 -->
										<td>${list1.bhit}</td>
										<td>${list1.bdate}</td>
		
									</tr>
								</c:if>
							</sec:authorize>
						</c:forEach> --%>
						
					<!-- 수정하기 전 부분 복사 해둠 -->
                     <%--   
                      <li>
                           <label>아이디(Email): </label>
                           <input type="text" value="${memberInfo.member_id}" readonly > <!-- readonly 작성시 수정은 불가하고 읽기만 가능하다. -->
                            
                       </li>
                       <li>
                           <label>이름:</label>
                           <input type="text" value="${memberInfo.name}" readonly>
                       </li>
                       <li class="chrity-full-form">
                           <label>연락처:</label>
                           <input type="text" value="${memberInfo.phone}" readonly >
                       </li>
		               --%> 

                        <!--// volunteer-form \\-->
                        <div class="widget_title mt-4">
                            <h2>물품 나눔 신청서</h2>
                        </div>

                        <div class="charity-volunteer-form">
                            <!-- .charity-volunteer-form > form > ul > li > #text-calendar -->
                            <form id="sendForm" name="sendForm" method="post" action="formAction" onsubmit="return submitCheck();" novalidate>
                                <!-- novalidate -->
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                <input type="hidden" name="member_id" value="${memberInfo.member_id}">
                                <ul class="mt-4">
									
									<c:forEach items="${list1}" var="list1">
										<sec:authentication property="principal" var="minfo" />
										<sec:authorize access="isAuthenticated()">
											<c:if test="${minfo.username eq list1.member_id}">
			                                    <li>
			                                        <label>아이디(Email): </label>
													<c:if test="${sessionScope.member_id = principal.member_id}">
			                                        <input type="text" value="${list1.member_id}"  readonly >
			                                        </c:if>
			                                    </li>
			                                    <li>
			                                        <label>이름:</label>
			                                        <input type="text" value="${list1.name}" onblur="if(this.value == '') { this.value ='Enter name*'; }" onfocus="if(this.value =='Enter name*') { this.value = ''; }" readonly>
			                                    </li>
			                                    <li class="chrity-full-form">
			                                        <label>연락처:</label>
			                                        <input type="text" value="${list1.phone}" onblur="if(this.value == '') { this.value ='Enter address line*'; }" onfocus="if(this.value =='Enter address line*') { this.value = ''; }">
			                                    </li>
		                                    </c:if>
										</sec:authorize>	
                                    </c:forEach> 


                                    <li>
                                        <label>신청 날짜:</label>
                                        <div class="chrity-full-form">
                                            <!-- class="charity-select-date" -->
                                            <!-- readonly 작성시 수정은 불가하고 읽기만 가능하다. -->
                                            <input type="text" id="tDate" readonly><!-- name="idntdate" -->

                                            <!-- 실패 <input id="datepicker" type="date"> -->
                                            <!-- 오늘날짜 받아오기 test <input type="date" id="currentDate" name="idntdate"> -->
                                            <!-- jQuery-UI test1: <input type="date" id="datepicker" name="idntdate"> -->
                                            <!-- jQuery-UI test2: <input class="chrity-full-form" type="text" id="datepicker1" class="calendar" /> -->
                                        </div>
                                    </li>

                                    <li class="charity-select-form">
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

                                    <li>
                                        <!-- class="chrity-full-form" -->
                                        <label for="donaamount">수량선택:</label>
                                        <input type="text" name="donaamount" id="selectDirect" disabled  />
                                    </li>
                                    <!-- disabled는 기본으로 인풋박스가 비활성화 되는 기능이다. 동시에 셀렉트 박스에서 입력한 값이 input box로 입력된다.
											자바스크립트 jQuery 함수를 사용해 셀렉트 박스의 value가 9일 경우(숫자는 임의로 설정함) disabled를 해제하고 수량을 입력할 수 있도록 했다.
											결국 input box에 입력된 값이 form을 넘길 때 수량값으로 넘어가게 된다. -->

                                    <li class="charity-select-form">
                                        <label for="amount">(select)</label>
                                        <div class="charity-select-two">
                                            <select id="selectBox" name="amount" onchange="changeSelection()">
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
                                <div class="charity-team-contactus mt-3">
                                    <button type="submit" class="charity-sub-btn" id="btnSend"><i class="fa fa-save"> 신청서 전송</i></button>
                                    <!-- 각각의 inputbox초기화하는 방법: https://codepen.io/eond/pen/epYpMw \
	                                	date는 초기화 되지 않도록 만들고 싶어서 일부만 초기화를 제외하는 방법 찾는중
	                                	$(input박스가 있는 곳을 감싸고 있는 객체의 ID).find('input[type=text]').each(function(){ $(this).val(''); });
									   참고: https://alwayslifegoseon.tistory.com/119 -->
                                    <button type="reset" class="charity-sub-btn"><i class="fa fa-undo"> 다시선택하기</i></button>
                                    <button type="button" class="charity-sub-btn" onclick="location.href='${pageContext.request.contextPath}/donation/item/main'"><i class="fa fa-arrow-left"> 이전화면으로</i></button><!-- 확인필요 -->
                                </div>
                            </form>

                            <script>
                                $("#sendForm").validate({

                                    rules: {
                                        /* 각 태그의 규칙을 설정 */
                                        /* 함수 정의 https://offbyone.tistory.com/50 참고주소 */
                                        /* 비밀번호 특수문자 https://yoo-hyeok.tistory.com/82  */
                                        /* 공식 문서 https://jqueryvalidation.org/ */
                                        /* html의 input태그의 name=""에 설정한 값과 같아야한다.  */

                                        icat_num: { 	// 품목 selet
                                            required: true
                                        },
                                        amount: { 		// 수량 select
                                            required: true 			/* 필수인가? true는 yes를 의미 */
                                        },
                                        donaamount: { 	// 수량input
                                            required: true,			/* 필수인가? true는 yes를 의미 */
                                            /* digits: true, */
                                            number : true, 			/* (양수)숫자만 입력가능 -number와 다른점은 소수와 음수일 경우 false*/
                                            spaceCheck: true,		/* 내가 추가한 validate 메소드 */
                                            minlength: 1,			/* 최소글자 수*/
                                            min: 1 					/* 최소 값 */
                                        }
                                    },
                                    messages: {
                                        /* rules에서 설정한 규칙을 위배할시 나오는 메세지 */
                                        icat_num: {	 // 품목 selet
                                            required: '보내실 물품을 선택하세요.'
                                        }, 
                                        amount: { 	// 수량 select
                                            required: '수량을 선택해 주세요.'
                                        },
                                        donaamount: { 	// 수량input
                                            required: '수량을 입력해 주세요.',
                                            /* digits: '숫자만 입력 가능합니다.', */
                                            number : '숫자만',
                                            spaceCheck: '공백없이 입력해주세요.',
                                            minlength: '1개 이상으로 입력해 주세요.',
                                            min: '1개 이상으로 입력해 주세요.'
                                        }
                                    },
                                    errorElement: 'span',		 /* 디폴트는 lable 태그 lable->span 으로 수정 */
                                    errorClass: 'error',		/* 디폴트 클래스 이름은 error, 클래스 이름을 변경할 수 있다.*/

                                    errorPlacement: function(error, element) {
                                        if (element.is(":text") /*  || element.is(":password")	*/ ) {
                                            element.parent().after(error);
                                        } else {
                                            element.after(error);
                                        }
                                    }

                                });

                                /* $.validator.addMethod("passwordCK",  function( value, element ) { //어째서인지 ?는 특수문자 취급을 못 하고있다.
                                	   return this.optional(element) ||  /^.*(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/.test(value);
                                	}); */

                                /* 공백 체크 함수 만든 것 */
                                $.validator.addMethod("spaceCheck" /* validate명 */ , function(value, element) {
                                    //검사하는 name태그의 value 중 공백이 없으면 true, 있으면 false리턴
                                    //false 리턴 시 messages에 선언된 내용들 띄워줌
                                    return $(element).val().indexOf(" ") = -1 ? true : false;
                                });
                                //출처: https://devhong.tistory.com/3 [주니어를 탈출하고 싶은 개발자의 블로그]
                            </script>


                        </div>
                        <!--// volunteer-form \\-->
                        <div class="charity-team-contactus">
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
                        </div>
                    </div>
                    
	                <!-- aside -->
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

    <!-- Search Modal -->
<!--     <div class="modal fade searchmodal" id="searchModal" tabindex="-1" role="dialog">
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
    </div> -->

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