<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
   uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<!-- 이건무조건 여기있어야함 -->
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- jquery validation cdn 이거 두개 안되면 폼태그 끝나는 시점 바로 밑에 넣기-->
<!-- jquery 플러그인 이기때문에 jquery가 있어야 한다. -->
<script type="text/javascript"
   src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>

<!-- jquery validation method cdn -->
<script type="text/javascript"
   src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/additional-methods.min.js"></script>


<!-- meta tags -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<%-- <meta id="_csrf" name="_csrf" th:content="${_csrf.token}" />  에러 주범??  --%>

<!-- 헤더 안에 추가  -->
<!-- csrf 관련이슈 해결방법 : jsp에 meta 태그추가(csrf값 얻기위해) -->
<!-- js에서 csrf 토큰, 헤더등록 -->
<meta name="_csrf" content="${_csrf.token}">
<meta name="_csrf_header" content="${_csrf.headerName}">

<title>Nanushare</title>
<link rel="shortcut icon" type="image/x-icon"
   href="${pageContext.request.contextPath}/resources/nanulogo_ico_convert.ico">
<!-- 웹페이지 탭 로고이미지 삽입  -->



<!-- 탭처리 -->
<link rel="stylesheet"
   href="//unpkg.com/bootstrap@4/dist/css/bootstrap.min.css">
<script src='//unpkg.com/jquery@3/dist/jquery.min.js'></script>
<script src='//unpkg.com/popper.js@1/dist/umd/popper.min.js'></script>
<script src='//unpkg.com/bootstrap@4/dist/js/bootstrap.min.js'></script>

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


	<script type="text/javascript"> 
	
	
		function cancle(paynum,price) {
			
			var token = $("meta[name='_csrf']").attr("content");
			var header = $("meta[name='_csrf_header']").attr("content");
			$(document).ajaxSend(function(e, xhr, options) {
			    xhr.setRequestHeader(header, token);
			});
			
			console.log(paynum);
			console.log(price);
			
			$.ajax({// 클라이언트가 가맹점 서버(Nanushare)로 환불 요청
		        url: "${pageContext.request.contextPath}/my/payments/cancel",
		        type: "POST",
		        contentType: "application/json",		       
		        data: JSON.stringify({
		          merchant_uid: paynum, // 주문번호
		          cancel_request_amount: price, // 환불금액
		          reason: "후원금 결제 취소" // 환불사유
		         
		        }),
		        dataType: "text", //데이터 타입을 제이슨 으로 지정시 statusText: "parsererror" 발생
		        success : function(result) {
		        	console.log(result);
					if(result == "SUCCESS"){
						console.log("성공");
						
						
						$.ajax({
							url : "https://api.iamport.kr/users/getToken",
							type: "POST",
							contentType: "application/json",
							dataType: 'jsonp',							
							//jsonpCallback: "callback",
							data: { //키들은 개발자 모드에서 확인할 수 있기때문에 서버단에서 처리해줘야한다. 수정해야할 부분
							      imp_key: "4277055072256012", // REST API키
							      imp_secret: "33wvwXxYcfLhMimvBD5fDeteJBRCiPjlSQQpOoo1D9iqsEW3i1iVfL9Zn1BFRV1JMS9AgxBUHUk9ygdQ" // REST API Secret
							    },
							success : function(data) {
								console.log(data);
								console.log("토큰");
								
								
							},
							error : function(e){
								console.log(e);
								console.log("토큰 실패");
								
							}
							
						});//2. ajax end
						
						
					} //if end
				},//1. success end
				error : function(e) {
					console.log(e);
					console.log("실패");
				}
		      }); //1. ajax end			
		}//cancle function end
	 
	</script>
	
<style>
	li {
	   list-style: none;
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
               <h1>mypage</h1>

            </div>
         </div>
      </div>
   </div>
   <!-- Banner -->
   <!-- Content -->
   <!-- Content와 MainSection은 무조건 있어야함 -->
   <div class="charity-main-content">
      <!-- Main Section -->
      <div class="charity-main-section">

         <!-- https://www.bootdey.com/snippets/view/Update-user-profile#preview -->
         <div class="container">
            <div class="view-account">
               <section class="module">
               <div class="module-inner">
                  <div class="side-bar">
                     <div class="user-info">
                        <img class="img-profile img-circle img-responsive center-block"
                           src="/resources/my/프로필사진.PNG" alt="">
                        <!-- 
                           src="https://bootdey.com/img/Content/avatar/avatar1.png" alt=""> -->
                        <ul class="meta list list-unstyled">
                           <li class="name"><h2>
                                 <sec:authentication property="principal.member.name" />
                              </h2></li>
                           <li class="email"><sec:authentication
                                 property="principal.member.member_id" /></a></li>
                           <li class="activity"><sec:authentication
                                 property="principal.member.signuppath" />회원</li>
                        </ul>
                     </div>
                     <nav class="side-menu">
                     <ul class="nav">
                        <li><a href="mypage"><span class="fa fa-user"></span>
                              Profile</a></li>
                        <li><a href="ask"><span class="fa fa-question">
                           </span>나의문의내역</a></li>
                        <li><a href="content"><span class="fa fa-file">
                           </span>나의인증내역</a></li>
                        <li><a href="give"><span class="fa fa-handshake">
                           </span>나의나눔내역</a></li>
                        <li><a href="reply"><span class="fa fa-reply"> </span>나의댓글내역</a></li>
                        <li class="active"><a href="pay"><span
                              class="fa fa-credit-card"></span>나의결제내역</a></li>
                     </ul>
                     </nav>
                  </div>
                  <div class="content-panel">



                     <script
                        src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

                     <h2 class="title">
                        나의 결제 내역<span class="pro-label label label-warning">PRO</span>
                     </h2>


                     <table>

                        <div>
                           <br>
                        </div>
                        <tr>
                           <!-- <th>아이디</th> -->
                           <th>금액</th>
                           <th>결제날짜</th>
                           <th>결제방법</th>
                           <th>결제번호</th>
                           <th>처리상태</th>
                           <th>결제취소</th>
                        </tr>
                        <c:if test="${empty list5}">
                           <tr>
                              <td colspan="5" align="center">결제 내역이 없습니다</td>
                           </tr>
                        </c:if>


                        <!-- 로그인한 회원의 글 정보만 받아오기 -->
                        <!-- 나의문의내역 -->
                        <c:if test="${! empty list5}">
                           <c:forEach items="${list5}" var="list5" varStatus="status">
                              <tr>
                                 <td><i class="fa fa-krw" aria-hidden="true"></i> ${list5.dntprice}</td>
                                 <td><fmt:formatDate value="${list5.dntdate}" pattern="yy-MM-dd hh:mm:ss"/></td>
                                 <td>${list5.paymethod}</td>
                                 <td> ${list5.dnt_paynum} </td>
                                 <td>${list5.dntstat}</td>
                                 <td><button class="cancelPay" class="paycc" type="button" 
                                 onclick="cancle('${list5.dnt_paynum}','${list5.dntprice}')">결제취소</button></td>
                              </tr>

                           </c:forEach>
                        </c:if>
                     </table>

                     <!-- 페이징 -->
                     <c:if test="${! empty list5}">
                        <div class="charity-pagination">
                           <ul class="page-numbers">
                              <li class="page-item"><c:if test="${pageMaker.prev}">
                                    <a class="page-link"
                                       href="${pageContext.request.contextPath}/my/pay${pageMaker.makeQuery(pageMaker.startPage - 1) }">prev</a>
                                 </c:if></li>

                              <li class="page-item"><c:forEach
                                    begin="${pageMaker.startPage }" end="${pageMaker.endPage }"
                                    var="idx">
                                    <c:out value="${pageMaker.cri.pageNum == idx?'':''}" />
                                    <a
                                       href="${pageContext.request.contextPath}/my/pay${pageMaker.makeQuery(idx)}">${idx}</a>
                           </c:forEach>
                           </li>

                           <li class="page-item"><c:if
                                 test="${pageMaker.next && pageMaker.endPage > 0}">
                                 <a class="page-link"
                                    href="${pageContext.request.contextPath}/my/pay${pageMaker.makeQuery(pageMaker.endPage +1) }">next
                                 </a>
                              </c:if></li>
                           </ul>

                           </div>

                        </c:if>



                        </div>
                        </div>
                        </section>
                        </div>
                        </div>

                        <script>
                           $("#mytabs>ul>li>a").each(function(i) {
                              $(this).attr("href", "#mytab" + i)
                           })
                           $("#mytabs>div>div").each(function(i) {
                              $(this).attr("id", "mytab" + i)
                           })
                        </script>

                        <!-- Main Section -->

                        </div>
                        <!-- Content -->
                        </div>

                        <!-- Footer -->
                        <%@ include file="/WEB-INF/views/mainMap/mainFooter.jsp"%>
                        <!-- Footer -->

                        <!-- Search Modal -->
                        <div class="modal fade searchmodal" id="searchModal"
                           tabindex="-1" role="dialog">
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
                                       <input type="submit" value=""> <i
                                          class="fa fa-search"></i>
                                    </form>
                                 </div>

                              </div>
                           </div>
                        </div>


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