<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- meta tags -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta id="_csrf" name="_csrf" th:content="${_csrf.token}" />

<!-- 헤더 안에 추가  -->
<!-- csrf 관련이슈 해결방법 : jsp에 meta 태그추가(csrf값 얻기위해) -->
<!-- js에서 csrf 토큰, 헤더등록 -->
<meta name="_csrf" content="${_csrf.token}">
<meta name="_csrf_header" content="${_csrf.headerName}">

<title>myprofile.jsp</title>


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
	 $(function() {
        	
        	var token = $("meta[name='_csrf']").attr("content");
            var header = $("meta[name='_csrf_header']").attr("content");
            $(document).ajaxSend(function(e, xhr, options) {
                xhr.setRequestHeader(header, token);
            });

	//패스워드 맞는지 확인
	 $.ajax({
		url : "${pageContext.request.contextPath}/my/myprofile",
		type : "GET",
		headers : {
			"Content-Type" : "application/json",
			"X-HTTP-Method-Override" : "GET"
		},
		data : pw,
		datatype : "json",
		success : function(result) {
			console.log(result);

			if (result === "pwdChk") {
				$('#pwMsg').html('');
				location.href = "${pageContext.request.contextPath}/my/myprofile/edit";
			} else {
				$('#pwMsg').html('');
				alert('비밀번호가 일치하지 않습니다.');
			}
		},

		error : function(error) {
			console.log("에러 : " + error)
		}

	}); 

	/* 비밀번호체크 */
	
	  $('#forgotpw').submit(function(event) { 
                event.preventDefault();

                var pw = $("#pw").val();             

                var changePw = {

                    pw: pw                                   
                };
                $.ajax({
                    type: "GET",
                    url: $(this).attr("action"),
                    cache: false,
                    /* contentType: 'application/json; charset=utf-8', */
                    data: JSON.stringify(changePw),
                    success: function(result) {
                    	console.log(result);
                  if (result == "SUCCESS") {
                 console.log("success");
                 $(location).attr('href', "${pageContext.request.contextPath}/my/myprofile/edit");

             }

			} ,
            error: function(e) {
                alert("비밀번호가 일치하지 않습니다");

                console.log(result);
                console.log(e);
            }
        }); //ajax			
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
					<h1>프로필 수정 전 비밀번호 확인 페이지</h1>
					<p>https://yeahajeong.tistory.com/91</p>
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

						<form id="forgotpw"
							action="${pageContext.request.contextPath}/my/myprofile/edit"
							method="get">

							<div class="form-group has-feedback">
								<label class="control-label" for="pw">패스워드</label> <input
									class="form-control" type="password" id="pwConfirm" name="pw" />
							</div>
							<div class="form-group has-feedback">
								<button class="btn btn-success" type="button" id="submit">확인</button>
							</div>
							<input type="hidden" name="${_csrf.parameterName}"
								value="${_csrf.token}" />
						</form>
						<script>
						$("#forgotpw").validate({
								
								rules:{ /* 각 태그의 규칙을 설정 */
									/*함수 정의 https://offbyone.tistory.com/50 참고주소 */
									/* 비밀번호 특수문자 https://yoo-hyeok.tistory.com/82  */
									/* 공식 문서 https://jqueryvalidation.org/ */
									/* html의 input태그의 name=""에 설정한 값과 같아야한다.  */
									pwConfirm : {
										required : true,
										equalTo : '#pw'									
									}
									
								},
								messages:{ /* rules에서 설정한 규칙을 위배할시 나오는 메세지 */
									
										pwConfirm : {
										required : '비밀번호를 입력해 주세요.',
										equalTo : "비밀번호가 일치하지 않습니다."								
									}									
									
									
								},
								errorElement : 'span', /* 디폴트는 lable 태그 lable->span 으로 수정 */
								errorClass : 'error', /* 디폴트 클래스 이름은 error, 클래스 이름을 변경할 수 있다.*/
																
								errorPlacement : function(error, element) { 
									if(element.is(":text") || element.is(":password")										  ){
										element.parent().after(error);
									}else{
										element.after(error);
									}
								}
													
																
							}); 
							
							</script>

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
	<script src="/resources/charity/script/functions.js"></script>
</body>

</html>