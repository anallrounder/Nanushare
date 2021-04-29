<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en">

<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>  

<title>로그인</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="/resources/loginform/css/style.css">

<!-- 웹페이지 탭 로고이미지 삽입  -->
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/nanulogo_ico_convert.ico"> 

<style type="text/css">
/* 랜덤 이미지 */
body {
	background-image: url("https://source.unsplash.com/user/upcastle1/likes/1600x900");
	background-size: cover;	
}

/* 바디 아래부분 흰색 줄어들게 패딩 줄이기 */
.ftco-section {
    padding: 1.5em 0;
}

/* 바디 배경색 투명도 */
body::after{
	position: absolute;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    content: '';
    background:#000;
	z-index: -1;
	opacity:0.5;
}

/* sign in btn radius 변경 -> 어떤게 좋을지 결정하면 바꾸기 */ 
.btn {
	/* border-radius: 0.25rem !important; */  
	border-radius: 40px;
	text-transform: uppercase;  /* sign in 혹시 소문자로 쓰고싶으면 이거 변경 */
}
.form-control {
	/* border-radius: 0.25rem !important;  */
	border-radius: 40px;
}

.btn.btn-primary {
	background: #fbceb5 !important; 
    border: 1px solid #fbceb5 !important;
    color: #000 !important;
    border-radius: 40px; 
}
/* sign in hover 못찾음 */
.btn-primary:hover {
	background-color:white;
	color:#fbceb5;
}
/* sign-up btn radius */
.rounded {
	/* border-radius: 0.25rem !important; */
    border-radius: 4rem !important; 
}
.login-wrap .social a:hover {
	background: #fbceb5 !important;
	border: 1px solid #fbceb5 !important;
	color:#333;
}
</style>
       
</head>

<body class="img js-fullheight" >
	
	<section class="ftco-section">
		<div class="container">
			<!-- 제목 -->
			<div class="row justify-content-center">
				<div class="col-md-6 text-center mt-5 mb-3">
					<h2 class="heading-section">
						<img src="${pageContext.request.contextPath}/resources/nanulogo_ico_convert.ico" style="width:8%; margin-bottom:10px; margin-right:5px;">
						 Nanushare Login 
					</h2>
				</div>
			</div>
           
			<div class="row justify-content-center">
				<div class="col-md-6 col-lg-4">
					<div class="login-wrap p-0">
					<!--  <h3 class="mb-4 text-center">Have an account?</h3> -->
						<form action="/login" class="signin-form" method="post">
							<!-- 아이디 -->
							<div class="form-group">
								<input type="email" id="id" name="username" class="form-control" placeholder="Username" required>
							</div>
							
							<!-- 패스워드 -->
							<div class="form-group">
								<input id="password-field" id="pw" name="password" type="password" class="form-control" placeholder="Password" required> <span toggle="#password-field" class="fa fa-fw fa-eye field-icon toggle-password"></span>
							</div>
                           ${requestScope.loginFailMsg} <!-- 로그인 에러 메시지 출력  -->
                           
                           <!-- 로그인 버튼 -->
							<div class="form-group">
								<button type="submit" class="form-control btn btn-primary submit px-3">Sign In</button>
							</div>
                         	
							<div class="form-group d-md-flex">
								<div class="w-50">
									<label class="checkbox-wrap checkbox-primary">Remember Me <input type="checkbox" checked name="Nanushare_rememberMe"> <span class="checkmark"></span>
									</label>
								</div>
								<div class="w-50 text-md-right">
									<a href="/forgotEmail" style="color: #fff">Forgot Email</a><br/>
									<a href="/forgotPW" style="color: #fff">Forgot Password</a>
								</div>
							</div>
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
						</form>
						
						<p class="w-100 text-center">&mdash; Sign Up &mdash;</p>
						<div class="social d-flex text-center">
							<a href="/signUpForm" class="px-2 py-2 mr-md-1 rounded"> <span>SIGN UP</span></a>
							<!-- <span class="ion-logo-facebook mr-2"></span> sign up</a> -->
  						</div>
						<br />
						<p class="w-100 text-center">&mdash; Or Sign In With &mdash;</p>
						<div align="center">
							<a href="/oauth2/authorization/kakao"> <img alt="kakao" src="/resources/socialButton/kakao_login_medium_wide.png" style="max-width: 100%; height: auto;"></a>
						</div>
						<br />
						<div align="center">
							<!-- /resources/socialButton/naver1_login_Green.png -->
							<a href="/oauth2/authorization/naver"> <img alt="naver" src="/resources/socialButton/naver_login.png" style="max-width: 100%; height: auto;"></a>
							<!-- 이미지 tag에 style을 적용하여 간단하게 반응형으로 제작 -->
							<!-- href="/aouth2/aouthorization/naver" 를 호출하면 provider의 authorization-uri호출  -->
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

<script src="/resources/loginform/js/jquery.min.js"></script>
<script src="/resources/loginform/js/popper.js"></script>
<script src="/resources/loginform/js/bootstrap.min.js"></script>
<script src="/resources/loginform/js/main.js"></script>    
    
</body>

</html>