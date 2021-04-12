<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

</head>



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

						$('#passwordcheck')
								.submit(
										function(event) { //비밀번호 변경 처리

											event.preventDefault();/* 이게있어서 폼태그에는 주소 필요x */

											/* var member_id = $("#member_id").val(); */
											var pwConfirm = $("#pwConfirm")
													.val();

											var check = {

												/* member_id : member_id, */
												pwConfirm : pwConfirm
											/*주는값이 id --# */
											};

											//패스워드 맞는지 확인 체크
											$
													.ajax({
														type : 'POST',
														/* 내가 처리할 주소(=현재주소) */
														url : "${pageContext.request.contextPath}/my/myprofile/check",
														contentType : 'application/json; charset=utf-8',
														data : pwConfirm, /* 여기가 컨트롤러로 넘어가는 data {안에넣어주면  = 형식으로 넘어감} */
														async : "false",
														datatype : 'text',
														/*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
														/* beforeSend : function(xhr) { 
														console.log("header 실행 " + header + token)
														xhr.setRequestHeader(header, token);
														}, */

														success : function(
																result) {
															console.log(result);

															if (result == "SUCCESS") {
																console
																		.log("success");
																$(location)
																		.attr(
																				'href',
																				"${pageContext.request.contextPath}/my/myprofile/edit");
																/* 성공했을때 넘어가는 페이지 */

															}
														},

														error : function(error) {

															alert("비밀번호를 입력해주세요.");

															console.log("에러 : "
																	+ error);
														}

													}); //ajax end
										}); //패스워드 체크 스크립트 end
					});
</script>
<style>
label {
	display: inline-block;
	/* width: 90px; */
	text-align: left;
}

input {
	/* To make sure that all text fields have the same font settings
       By default, textareas have a monospace font */
	font: 1em sans-serif;
	/* To give the same size to all text field */
	width: 300px;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
	/* To harmonize the look & feel of text field border */
	border: 1px solid #999;
}
</style>
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
					<h1>비밀번호 확인 페이지</h1>

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
						<!-- "${pageContext.request.contextPath}/my/myprofile/edit" -->
						<form id="passwordcheck"
							action="${pageContext.request.contextPath}/my/myprofile/edit"
							method="get">
							<!-- 폼태그는 어차피 위에서 성공여부로 주소를 줬기때문에 안줘도 상관없다 -->

							<div class="charity-volunteer-form">
								<ul class="mt-4">
									<label class="control-label" for="pw">패스워드 확인 : </label>
									<input type="password" id="pwConfirm" name="pwConfirm" />
								</ul>
								<!-- name에 똑같이 줘야함 -->
								<div class="form-group has-feedback-center">
									<button class="charity-sub-btn" type="submit" id="submit">확인</button>
								</div>
								<input type="hidden" name="${_csrf.parameterName}"
									value="${_csrf.token}" />
							</div>


						</form>


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
	</div>
	<!-- Footer -->
	<%@ include file="/WEB-INF/views/mainMap/mainFooter.jsp"%>
	<!-- Footer -->

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
						<input type="submit" value=""> <i class="fa fa-search"></i>
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