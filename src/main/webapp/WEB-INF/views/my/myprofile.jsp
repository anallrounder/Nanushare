<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- meta tags -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

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
	//패스워드 맞는지 확인
	$.ajax({
		url : "${pageContext.request.contextPath}/my/myprofile",
		type : "POST",
		headers : {
			"Content-Type" : "application/json",
			"X-HTTP-<ethod-Override" : "POST"
		},
		data : pw,
		datatype : "json",
		success : function(result) {
			if (data == "pwConfirmOK") {
				$('#pwMsg').html('');
				chk1 = true;
			} else {
				$('#pwMsg').html('');
				chk1 = false;
			}
		},

		error : function(error) {
			console.log("에러 : " + error)
		}

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
	<header id="charity-header" class="charity-header-one"
		style="position: relative; z-index: 2"> <!-- Top Strip -->
	<div class="charity-top-strip">
		<aside> <a href="${pageContext.request.contextPath}/main"
			class="charity-logo"
			style="width: 200px; height: 100px; margin: 0px 0px 0px 20px;"><img
			src="/resources/nanulogo.png" alt=""></a> </aside>
		<div class="container">
			<div class="row">
				<aside class="col-12">
				<div class="float-center">
					<a href="#menu" class="menu-link active"><span></span></a>
					<nav id="menu" class="menu charity-navigation">

					<ul>
						<!-- <li class="active"><a href="index.html">Home</a></li> -->
						<li style="padding: 0px 40px 0px 70px"><a href="#"
							style="font-size: 20px;">나누셰어란?</a>
							<ul class="children">
								<li><a href="${pageContext.request.contextPath}/menu/about">나누셰어
										소개</a></li>
								<li><a href="${pageContext.request.contextPath}/menu/way">찾아오셰어</a></li>
								<!--     <li><a href="event-detail.html">Event Detail</a></li> -->
							</ul></li>
						<li style="padding: 0px 40px 0px 30px"><a href="#"
							style="font-size: 20px;">나눔함 안내</a> <!--  <ul class="children">
                                            <li><a href="cause-list.html">Cause List</a></li>
                                            <li><a href="cause-grid.html">Cause Grid</a></li>
                                            <li><a href="cause-detail.html">Cause Detail</a></li>
                                        </ul> --></li>
						<li style="padding: 0px 40px 0px 30px"><a href="#"
							style="font-size: 20px;">나누기</a>
							<ul class="children">
								<li><a href="blog-large.html">물품 나누기</a></li>
								<li><a href="blog-medium.html">돈기부여하기</a></li>
								<!-- <li><a href="blog-detail.html">Cause Detail</a></li> -->
							</ul></li>
						<li style="padding: 0px 40px 0px 30px"><a href="#"
							style="font-size: 20px;">나눔 인증</a> <!--  <ul class="children">
                                            <li><a href="team-grid.html">Team Grid</a></li>
                                            <li><a href="team-classic.html">Team Classic</a></li>
                                            <li><a href="team-detail.html">Team Detail</a></li>
                                        </ul> --></li>
						<li style="padding: 0px 40px 0px 30px"><a href="#"
							style="font-size: 20px;">이벤트</a>
							<ul class="children">
								<li><a href="about.html">출석체크</a></li>
								<li><a href="prayer-list.html">테스트</a></li>
								<li><a href="prayer-grid.html">게임</a></li>
								<!--  <li><a href="prayer-detail.html">Prayer De1tail</a></li>
                                            <li><a href="404.html">404 Error</a></li>
                                            <li><a href="search-result.html">Search Result</a></li> -->
							</ul></li>
						<li style="padding: 0px 40px 0px 30px"><a
							href="contact-us.html" style="font-size: 20px;">더하기</a>
							<ul class="children">
								<li><a href="about.html">공지사항</a></li>
								<li><a href="prayer-list.html">문의하기</a></li>
							</ul></li>


					</ul>
					<!--  <span class="float-right">
                                    <a href="#" class="charity-strip-btn charity-bgcolor" style="width:100px;height:30px;">Sign up</a>
                          			<a href="#" class="charity-strip-btn charity-bgcolor" style="width:100px;height:30px;">Sign in</a>
                                </span> --> </nav>

					<!--    <ul class="charity-header-options" style="text-align: center">
                                <li><a href="#" data-toggle="modal" data-target="#searchModal"><i class="fas fa-search"></i></a></li>
                                <li><a href="#"><i class="fab fa-opencart"></i></a> <div class="charity-cart-box"> <p>No products in the cart.</p> </div> </li>
             
                                <li> <a href="#" class="charity-strip-btn charity-bgcolor" style="width:100px;height:30px;">Sign up</a></li>
                          		<li><a href="#" class="charity-strip-btn charity-bgcolor" style="width:100px;height:30px;">Sign in</a></li>
                                
                            </ul>
                             -->

				</div>

				</aside>


				<!--     <aside class="col-12"> 
                        <div class="float-right">
                          <ul class="charity-social-network">
                              <li><a href="#" class="fab fa-facebook-f"></a></li>
                              <li><a href="#" class="fab fa-google"></a></li>
                              <li><a href="#" class="fab fa-pinterest-p"></a></li>
                              <li><a href="#" class="fab fa-linkedin-in"></a></li>
                              <li><a href="#" class="fab fa-twitter"></a></li>
                          </ul>
                          <a href="#" class="charity-strip-btn charity-bgcolor" >Sign up</a>
                          <a href="#" class="charity-strip-btn charity-bgcolor">Sign in</a>
                         
                        </div>
                    </aside> -->
			</div>
		</div>
		<aside> <a href="#" class="charity-strip-btn charity-bgcolor"
			style="width: 70px; height: 40px; white-space: nowrap; padding: 10px 0px 0px 6px; margin: -75px 50px 0px 0px;">Sign
			up</a> <a href="#" class="charity-strip-btn charity-bgcolor"
			style="width: 70px; height: 40px; white-space: nowrap; padding: 10px 5px 0px 10px; margin: -75px 140px 0px 0px;">Sign
			in</a> </aside>
	</div>
	<!-- Top Strip --> </header>
	<!-- Header -->


	<!-- Banner -->
	<!-- 	<div class="charity-subheader">
		<span class="black-transparent"></span>
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<h1>프로필 수정 전 비밀번호 확인 페이지</h1>
					<p>https://yeahajeong.tistory.com/91</p>
				</div>
			</div>
		</div>
	</div> -->
	<!-- Banner -->



	<!-- Content -->
	<div class="charity-main-content">

		<!-- Main Section -->
		<div class="charity-main-section">
			<div class="container">
				<div class="row">
					<div class="col-md-9">


						<ul class="charity-simple-blog-options">


							<div class="charity-contact-form">
								<ul class="row">
									<!-- post로 수정해야함 -->
									<form method="get" class="myform"
										action="${pageContext.request.contextPath}/my/myprofile/edit">
										<li class="col-md-6">비밀번호 확인 <input type="password"
											placeholder="비밀번호를 입력해주세요" name="pw" required></li> <input
											class="charity-simple-blog-btn" type="submit" value="확인">
									</form>
								</ul>
							</div>
						</ul>



						</ul>

						<!-- <div class="form-row  required"
										data-required-text="암호가 일치하지 않습니다">
										<li class="col-md-6"><label
											for="dwfrm_profile_login_passwordconfirm"> <span>
													비밀번호 확인</span> <span class="required-indicator">*</span>
										</label> <input class="input-text-pw password required"
											id="dwfrm_profile_login_passwordconfirm" type="password"
											name="dwfrm_profile_login_passwordconfirm"
											placeholder="Confirm Password" value="" maxlength="255"
											minlength="8" required /></li>
									</div> -->
						</ul>


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
	<footer id="charity-footer" class="charity-footer-one"> <!-- Footer Widget -->
	<div class="charity-footer-widget">
		<div class="container">

			<!-- CopyRight -->
			<div class="charity-copyright">
				<a href="/resources/charity/#" class="back-top charity-bgcolor"><i
					class="fa fa-angle-up"></i></a>
				<p>© 2021, All Right Reserved - by</p>
				<ul>
					<li><a href="/resources/charity/404.html">Terms and
							conditions</a></li>
					<li><a href="/resources/charity/404.html">Privacy policy</a></li>
				</ul>
			</div>
			<!-- CopyRight -->
		</div>
	</div>
	<!-- Footer Widget --> </footer>
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