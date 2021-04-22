<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<!DOCTYPE>
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
<link rel="stylesheet" type="text/css"
	href="/resources/charity/css/imgblink_hj.css">

<link rel="stylesheet" href="/resources/charity/css/style_mypage_hj.css">

<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" />

<!-- 부트스트랩아이콘 -->
<link rel="stylesheet"
	href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
	integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p"
	crossorigin="anonymous" />
	
	<!-- 상단 로그인버튼 위치 -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
	

<style>
.maxmax {
	position: relative;
}

li {
	list-style: none;
}

.number2 {
	text-align: center;
	color: 585858;
	font-weight: bold;
}

.threebox {
	color: white;
	width: 190px;
	height: 190px;
	border-radius: 95px;
	text-align: center;
	margin: auto;
	font-size: 14px;
	vertical-align: middle;
	line-height: 150px;
	border-style: double;
	border: white 10px padding;
}

.twobox {
	text-color: 424242;
	width: 190px;
	height: 100px;
	border-radius: 95px;
	text-align: center;
	margin: 0 auto;
	font-size: 14px;
	vertical-align: middle;
	line-height: 150px;
}
</style>

<script type="text/JavaScript"
	src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/JavaScript"
	src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script type="text/javascript">
	$(function() {
		$('.usre_img')
				.each(
						function(index, item) {
							var imgUrl = '${pageContext.request.contextPath}/resources/users/user0'
									+ Math.floor((Math.random() * 1) + 1)
									+ '_sm.png';
							console.log(imgUrl);
							console.log($(item).attr("src"));
							$(item).attr("src", imgUrl);
						});
	});
</script>
<style>
#forimg {
	background-color: white;
	background-image: url('/resources/charity/qna/mypage2.png');
	background-size: 1600px;
	background-repeat: repeat;
	background-position: center;	
}

.black-transparent {
	opacity: 50%;
}

.charity-volunteer-form {
	background-color: #f9f9fb;
}
</style>
</head>
<body>

<!-- include를 위해 잘림 -->
<!-- Banner -->
	    <div id="forimg" class="charity-subheader">
       <span class="black-transparent"></span>
        <div class="container">
            <div class="row">
                <div class="col-md-12"> 
                  
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
			<!--  col-md-10 으로 넓이 넓힘 -->
			<div class="container col-md-10">
				<div class="view-account">
					<section class="module">
						<div class="module-inner">
<!-- include를 위해 잘림 -->


							<!-- sidebar -->
							<div class="side-bar">
	<div class="user-info" >
		<figure>
			<img id="introImg" class="usre_img"
				src="${pageContext.request.contextPath}/resources/users/user01_sm.png">
		</figure>
		<ul class="meta list list-unstyled">
			<li class="name"><h2>
					<sec:authentication property="principal.member.name" />
				</h2></li>
			<li class="email"><sec:authentication
					property="principal.member.member_id" /></a></li>
			<li class="activity"><sec:authentication
					property="principal.member" var="buttonhidden" /> <sec:authorize
					access="isAuthenticated()">

					<c:if test="${buttonhidden.signuppath == 'home'}">

						<button class="charity-simple-blog-btn w-100 text-white stats"
							type="submit"
							onclick="location.href ='${pageContext.request.contextPath}/my/myprofile'">
							프로필수정</button>

					</c:if>
				</sec:authorize> <sec:authentication property="principal.member" var="buttonhidden" />
				<sec:authorize access="isAuthenticated()">

					<c:if test="${buttonhidden.signuppath != 'home'}">

						<button class="charity-simple-blog-btn w-100 text-white stats"
							type="submit"
							onclick="location.href ='${pageContext.request.contextPath}/my/drop'">
							회원탈퇴</button>

					</c:if>
				</sec:authorize></li>
		</ul>
	</div>

	<!-- jQuery -->
	<script src="/resources/charity/script/jquery.js"></script>
	<script src="/resources/charity/script/popper.min.js"></script>
	<script src="/resources/charity/script/bootstrap.min.js"></script>
	<script src="/resources/charity/script/slick.slider.min.js"></script>
	<script src="/resources/charity/script/progressbar-my.js"></script>
	<script src="/resources/charity/script/fancybox.min.js"></script>
	<script src="/resources/charity/script/jquery.countdown.min.js"></script>
	<script src="https://maps.googleapis.com/maps/api/js"></script>
	<script src="/resources/charity/script/jquery.jplayer.js"></script>
	<script src="/resources/charity/script/jplayer.playlist.js"></script>
	<script src="/resources/charity/script/functions-main.js"></script>


</body>
</html>
