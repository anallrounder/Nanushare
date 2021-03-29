<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!doctype html>
<html lang="en">

<head>
    <title>Login</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="/resources/loginform/css/style.css">
    <link rel="shortcut icon" type="image/x-icon" 
    	href="${pageContext.request.contextPath}/resources/nanulogo_ico_convert.ico"> <!-- 웹페이지 탭 로고이미지 삽입  -->
    	
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>  
    
    <script type="text/javascript">
    
		    var imgArray = new Array();
		    imgArray[0] = "IMG_1.PNG";
		    imgArray[1] = "IMG_2.PNG";
		    imgArray[2] = "IMG_3.PNG";
		    imgArray[3] = "IMG_4.PNG";
		    imgArray[4] = "IMG_5.PNG";
		    imgArray[5] = "IMG_6.PNG";
		    imgArray[6] = "IMG_7.PNG";
		    imgArray[7] = "IMG_8.PNG";
		    
		  function showImage() {
			var imgnum = Math.round(Math.random()*8)+1;
			var objImg = document.getElementById("introimg"); 
			objImg.src=imgArray[imgNum]; 
			setTimeout(showImage,5000);			
		}    
   </script>   
</head>

<body class="img js-fullheight" style="background-image: url(/resources/loginform/images/bg.jpg);">

	  <section class="ftco-section">
        <div class="container">
        	
            <div class="row justify-content-center">
                <div class="col-md-6 text-center mb-5">
                    <h2 class="heading-section">Nanushare Login</h2>
                </div>
            </div>
            <div class="row justify-content-center">
                <div class="col-md-6 col-lg-4">
                    <div class="login-wrap p-0">
                        <h3 class="mb-4 text-center">Have an account?</h3>
                        <form action="/login" class="signin-form" method="post">
                            <div class="form-group">
                                <input type="email" id="id" name="username" class="form-control" placeholder="Username" required>
                            </div>
                            <div class="form-group">
                                <input id="password-field" id="pw" name="password" type="password" class="form-control" placeholder="Password" required> <span toggle="#password-field" class="fa fa-fw fa-eye field-icon toggle-password"></span>
                            </div>
                            <div class="form-group">
                                <button type="submit" class="form-control btn btn-primary submit px-3">Sign In</button>
                            </div>
                            <div class="form-group d-md-flex">
                                <div class="w-50">
                                    <label class="checkbox-wrap checkbox-primary">Remember Me <input type="checkbox" checked> <span class="checkmark"></span>
                                    </label>
                                </div>
                                <div class="w-50 text-md-right">
                                    <a href="/forgotPassword" style="color: #fff">Forgot Password</a>
                                </div>
                            </div>
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                        </form>
                        <p class="w-100 text-center">&mdash; Sign Up &mdash;</p>
                        <div class="social d-flex text-center">
                            <a href="/signUpForm" class="px-2 py-2 mr-md-1 rounded"> <span>sign up</span></a>
                            <!-- <span class="ion-logo-facebook mr-2"></span> sign up</a> -->
                        </div>
                        <br />
                        <p class="w-100 text-center">&mdash; Or Sign In With &mdash;</p>
                        <div align="center">
                            <a href="/oauth2/authorization/kakao"> <img alt="kakao" src="/resources/socialButton/kakao_login_medium_wide.png" style="max-width: 100%; height: auto;"></a>
                        </div>
                        <br />
                        <div align="center">
                            <a href="/oauth2/authorization/naver"> <img alt="naver" src="/resources/socialButton/naver1_login_Green.png" style="max-width: 100%; height: auto;"></a>
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