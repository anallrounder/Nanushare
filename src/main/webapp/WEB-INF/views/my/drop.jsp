<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- 이건무조건 여기있어야함 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>


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

<!-- 상단 로그인버튼 위치 -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">

<style>
li {
	list-style: none;
}

table {
	width: 400px;
}
</style>

<script>
	/* 이용약관 버튼 */
	function Checkform() {
		if (secession.agree.checked != true) {

			alert("개인정보 수집에 동의해 주세요.");
			frm.confirm.focus();
			return false;
		}
	}
</script>

<script type="text/javascript">
	/* 403에러때문에 넣은 코드 */
	$(document)
			.ready(
					function() {

						var token = $("meta[name='_csrf']").attr("content");
						var header = $("meta[name='_csrf_header']").attr(
								"content");
						$(document).ajaxSend(function(e, xhr, options) {
							xhr.setRequestHeader(header, token);
						});

						$('#secession')
								.submit(
										function(event) { //탈퇴 처리
											event.preventDefault();

											var name = $("#name").val();
											var member_id = $("#member_id")
													.val();
											var pw = $("#pw").val();

											var check = {
												name : name,
												member_id : member_id,
												pw : pw
											};
											//패스워드 맞는지 확인 체크
											$.ajax({
														type : 'POST',
														/* 내가 처리할 주소(=현재주소) */
														url : "${pageContext.request.contextPath}/my/drop/check",
														contentType : "application/json", /* charset=utf-8' */
														cache : false,
														data : JSON
																.stringify(check),
														async : "false",
														datatype : 'text',
														success : function(Checkform) {
															console.log(Checkform);

															if (Checkform == true) {
																console.log("success");

																alert("탈퇴되었습니다. 그동안 이용해주셔서 감사합니다. ");

																$(location).attr('href',
																				"${pageContext.request.contextPath}/deleteCooki");
																/* $(location)
																.attr(
																		'href',
																		"${pageContext.request.contextPath}/member/logout"); */

															}else{
																alert("정보를 알맞게 다시 입력해주세요");
																
															}
														},

														error : function(error) {

															alert("필수 사항을 입력해주세요.");

															console.log("에러 : "
																	+ error);
														}

													}); //ajax end
										}); //패스워드 체크 스크립트 end
					});
</script>

</head>

<body>
	<!-- 약관동의때문에 추가 -->
	<!--  <script src='{% static "js/jquery-1.11.3.min.js" %}'></script>
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> -->

	<!-- Header -->
	<%@ include file="/WEB-INF/views/mainMap/mainHeader.jsp"%>
	<!-- Header -->
	<!-- Sub Header -->
	<div class="charity-subheader">
		<!--  style="background-image: url(/resources/loginform/images/bg.jpg);"  -->
		<span class="black-transparent"></span>
		<div class="container">
			<div class="row">
				<div class="col-md-12"></div>
			</div>
		</div>
	</div>
	<!-- Sub Header -->
	<!-- Content -->
	<div class="charity-main-content">

		<!-- Main Section -->
		<div class="charity-main-section">
			<div class="container">
				<div class="row">
					<div class="col-md-9">
						<div class="charity-rich-editor charity-cause-detail">


							<div class="charity-simple-blog-text">
								<!-- <ul class="charity-simple-blog-options"> -->

								<h3>탈퇴 안내</h3>
								<h6>회원탈퇴를 신청하기 전에 안내 사항을 꼭 확인해주세요.</h6>
								<div>&nbsp;</div>
								<i class="fa fa-check" aria-hidden="true"></i> 탈퇴 후 회원정보 및 개인형
								서비스 이용기록은 모두 삭제됩니다. <br> <br> <i class="fa fa-check"
									aria-hidden="true"></i> 회원정보는 모두 삭제되며, 삭제된 데이터는 복구되지 않습니다. <br>
								<br> <i class="fa fa-check" aria-hidden="true"></i> 삭제되는
								내용을 확인하시고 필요한 데이터는 미리 백업을 해주세요. <br> <br> <i
									class="fa fa-check" aria-hidden="true"></i> 탈퇴 후에도 게시판형 서비스에
								등록한 게시물은 그대로 남아 있습니다. <br> <br> <i class="fa fa-check"
									aria-hidden="true"></i> 문의, 인증게시글 및 댓글은 탈퇴 시 자동 삭제되지 않고 그대로 남아
								있습니다. <br> <br> <i class="fa fa-check"
									aria-hidden="true"></i> 삭제를 원하는 게시글이 있다면 반드시 탈퇴 전 비공개 처리하거나
								삭제하시기 바랍니다. <br> <br> <i class="fa fa-check"
									aria-hidden="true"></i> 탈퇴 후에는 회원정보가 삭제되어 본인 여부를 확인할 수 있는 방법이
								없어, 게시글을 임의로 삭제해드릴 수 없습니다. <br> <br> <br>


								<form id="secession" name="secession" method="get"
									onSubmit="return Checkform()" novalidate>
									<ul class="charity-contact-form">
										<li><label>이름</label> <input type="text" name="name"
											id="name" required /></li>
										<li><label>이메일</label><input type="text" name="member_id"
											id="member_id" required></li>
										<li><label>비밀번호</label><input type="password"
											placeholder="Confirm Password" name="pw" id="pw"
											class="form-control" required></li>
									</ul>
									<input type="checkbox" name="agree" id="agree"> 안내 사항을
									모두 확인하였으며, 이에 동의합니다.
									<div class="buttonbutton">
										<div>&nbsp;</div>

										<button type="submit" class="charity-simple-blog-btn">탈퇴하기</button>
										&nbsp;&nbsp;<a
											href="${pageContext.request.contextPath}/my/mypage"
											class="charity-simple-blog-btn">취소</a>
									</div>
									<input type="hidden" name="${_csrf.parameterName}"
										value="${_csrf.token}" />
								</form>
								<div>&nbsp;</div>


								<!-- jquery validation cdn-->
								<!-- jquery 플러그인 이기때문에 jquery가 있어야 한다. -->
								<script type="text/javascript"
									src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>

								<!-- jquery validation method cdn -->
								<script type="text/javascript"
									src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/additional-methods.min.js"></script>


								<script>
									$("#secession").validate(
													{
														rules : {
															/* 각 태그의 규칙을 설정 */
															/*함수 정의 https://offbyone.tistory.com/50 참고주소 */
															/* 비밀번호 특수문자 https://yoo-hyeok.tistory.com/82  */
															/* 공식 문서 https://jqueryvalidation.org/ */
															/* html의 input태그의 name=""에 설정한 값과 같아야한다.  */
															member_id : {
																required : true,
																email : true,
															},
															pw : {
																required : true,
															},
															name : {
																required : true,
															}
														}, // rules end */

														messages : {
															/* rules에서 설정한 규칙을 위배할시 나오는 메세지 */
															member_id : {
																required : '이메일을 입력해 주세요.'
															},
															pw : {
																required : '비밀번호를 입력해 주세요.'
															},
															name : {
																required : '이름을 입력해 주세요.',
															}
														}, // message end

														errorElement : 'span',
														errorClass : 'error',
														errorPlacement : function(
																error, element) {
															if (element
																	.is(":text")
																	|| element
																			.is(":password")) {
																element
																		.parent()
																		.after(
																				error);
															} else {
																element
																		.after(error);
															}
														}

													}); //validate end
									/* $.validator.addMethod(
													"passwordCK",
													function(value, element) {
														return this.optional(element)
												|| /^.*(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/
												.test(value);
													}); */
								</script>
							</div>
						</div>
					</div>
				</div>
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