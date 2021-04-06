
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



<!-- 프로그래스바 -->
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" />
<style type="text/css">
//
CSS의 position 속성을 이용하여 두개의 DIV 레이아웃을 겹친다 . .u.i-progressbar {
	position: relative;
}

.progress-label {
	position: absolute;
	left: 50%;
	top: 8px;
	font-weight: bold;
	margin-left: -40px;
}
</style>


<script type="text/JavaScript"
	src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/JavaScript"
	src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">

/* function getresource(barProgress)
{
    if (barProgress >= '0' && barProgress<='20') {
			
			$("#maxmax").attr("src", "/resources/my/그림1.png");
		}if (barProgress > '20' && barProgress<='40') {
			
			$("#maxmax").attr("src", "/resources/my/그림2.png");
		}if (barProgress > '40' && barProgress<='60') {
			
			$("#maxmax").attr("src", "/resources/my/그림3.png");
		}if (barProgress < '60' && barProgress>='80') {
			
			$("#maxmax").attr("src", "/resources/my/그림4.png");
		}if (barProgress < '80' && barProgress>='100') {
			
			$("#maxmax").attr("src", "/resources/my/그림5.png");
		}

 }  */

jQuery(document).ready(
		function() {

			var barProgress = jQuery(".progressbar");


			// value 값의 숫자를 입력함으로서 내용을 채울 수 있다.
			barProgress.eq(0).progressbar({
				value : bar
			});
			barProgress.eq(0).find(".ui-progressbar-value")
					.css({
						"background" : "#2a786b"
					});

		});//var end





	<!-- $(function() {

		var token = $("meta[name='_csrf']").attr("content");
		var header = $("meta[name='_csrf_header']").attr("content");
		$(document).ajaxSend(function(e, xhr, options) {
			xhr.setRequestHeader(header, token);
		});

		//ajax로 어떻게?

		jQuery(document).ready(
						function() {

							var barProgress = jQuery(".progressbar");

							var memberJoin = {
								bar : <sec:authentication property="principal.member.dntcnt" />,

							};
							// value 값의 숫자를 입력함으로서 내용을 채울 수 있다.
							barProgress.eq(0).progressbar({
								value : bar
							});
							barProgress.eq(0).find(".ui-progressbar-value")
									.css({
										"background" : "#2a786b"
									});

						});//var end
		$.ajax({
			type : 'PUT',
			data : JSON.stringify(memberJoin),
			url : "${pageContext.request.contextPath}/my/mypage",
			cache : false,
			/* contentType : 'application/json', */
			contentType: "image/png",
			async : "false",
			datatype : 'json',
			success : function(result) {
				console.log(result);
				if (bar >= '0' && bar<='20') {
					
					$("#maxmax").attr("src", "/resources/my/그림1.png");
				}if (bar > '20' && bar<='40') {
					
					$("#maxmax").attr("src", "/resources/my/그림2.png");
				}if (bar > '40' && bar<='60') {
					
					$("#maxmax").attr("src", "/resources/my/그림3.png");
				}if (bar < '60' && bar>='80') {
					
					$("#maxmax").attr("src", "/resources/my/그림4.png");
				}if (bar < '80' && bar>='100') {
					
					$("#maxmax").attr("src", "/resources/my/그림5.png");
				}
			},

			error : function(e) {
				alert("error");
				console.log(e);
			}

		});//ajax end

	});//function end -->
</script>

<style>
.div-progressbar-value {
	/* transition: all 0.5s; */
	transition: width 0.5s;
	-webkit-transition: width 0.5s;
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





	<div class="skillst" id="maxmax">

		<img src="/resources/my/그림1.png" height="80" width="80"
			style="visibility: hidden;"> <img src="/resources/my/그림2.png"
			height="80" width="80"> <img src="/resources/my/그림3.png"
			height="80" width="80" style="visibility: hidden;"> <img
			src="/resources/my/그림4.png" height="80" width="80"
			style="visibility: hidden;"> <img src="/resources/my/그림5.png"
			height="80" width="80" style="visibility: hidden;"> <img
			src="/resources/my/그림6.png" height="80" width="80"
			style="visibility: hidden;">
		<hr />
		<div class="progressbar">
			<div class="progress-label">25%</div>
		</div>
		<br />
	</div>


</body>
</html>
