<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
<html>
<head>
<!-- meta tags -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>myprofile_edit</title>

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


<script type="text/javascript">
	/* 비밀번호 */
	/* $(function() {
		$("#alert-success").hide();
		$("#alert-danger").hide();
		$("input").keyup(function() {
			var pwd1 = $("#pwd1").val();
			var pw = $("#pw").val();
			if (pwd1 != "" || pw != "") {
				if (pwd1 == pw) {
					$("#alert-success").show();
					$("#alert-danger").hide();
					$("#submit").removeAttr("disabled");
				} else {
					$("#alert-success").hide();
					$("#alert-danger").show();
					$("#submit").attr("disabled", "disabled");
				}
			}
		});
	}); */
	/* 비밀번호 */

	/* ajax를 통한 회원정보 수정처리 */
	function modifyMember() {
		var name = $("#name").val();
		var member_id = $("#member_id").val();
		var gender = $("#gender").val();
		var pw = $("#pw").val();
		var phone = $("#phone").val();

		var param = {
			"name" : name,
			"member_id" : member_id,
			"gender" : gender,
			"pw" : pw,
			"phone" : phone
		}

		if (pw == '') {
			alert("비밀번호를 올바르게 입력해주세요.");
		} else {
			$.ajax({
				anyne : true,
				type : 'POST',
				data : JSON.stringify(param),
				url : "/my/myprofile/edit",
				dataType : "text",
				contentType : "application/json; charset=UTF-8",
				success : function(data) {
					alert("변경이 완료되었습니다.");
					location.href = "/my/mypage";
				},
				error : function(jqXHR, textStatus, errorThrown) {
					alert("ERROR : " + textStatus + " : " + errorThrown);
				}
			})
		}

	}
</script>

<script type="text/javascript">
	/*js에서 csrf토큰, 헤더 등록  */

	$(document)
			.ready(
					function() {

						var token = $("meta[name='_csrf']").attr("content");
						var header = $("meta[name='_csrf_header']").attr(
								"content");
						$(document).ajaxSend(function(e, xhr, options) {
							xhr.setRequestHeader(header, token);
						});

						$('#mjoin')
								.submit(
										function(event) {
											event.preventDefault();

											var member_id = $("#member_id")
													.val();
											var pw = $("#pw").val();
											var name = $("#name").val();

											var memberJoin = {

												member_id : member_id,
												pw : pw,
												name : name,

											};

											$
													.ajax({
														type : "POST",
														url : $(this).attr(
																"action"),
														cache : false,
														contentType : 'application/json; charset=utf-8',
														data : JSON
																.stringify(memberJoin),
														success : function(
																result) {
															console.log(result);
															if (result == "SUCCESS") {
																console
																		.log("success");
																$(location)
																		.attr(
																				'href',
																				"${pageContext.request.contextPath}/");

															}
														},
														error : function(e) {
															alert("fail");

															console.log(result);
															console.log(e);
														}
													}); //ajax			
										});

					}); // end ready()
</script>


<style>
#charity-contact-form {
	left: 50%;
	top: 50%;
	position: absolute;
	margin-left: -220px;
	margin-top: -170px;
}

/* .charity-simple-blog-btn {
	border: 0;
}
 */
input {
	width: 200px;
	height: 100px;
	font-size: 20px;
}

li {
	/* li 점 없애기 */
	list-style: none;
	list-style-type: none;
}

.buttonbutton {
	text-align: center;
}

label {
	display: block;
	/* width: 90px; */
	text-align: left;
}

input {
	
	width: 300px;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
	/* To harmonize the look & feel of text field border */
	border: 1px solid #999;
}
</style>


</head>

<body>
	<!-- Header -->
	<header id="charity-header" class="charity-header-one"
		style="position: relative; z-index: 2">

		<!-- Top Strip -->
		<div class="charity-top-strip">
			<aside>
				<a href="${pageContext.request.contextPath}/main"
					class="charity-logo"
					style="width: 200px; height: 100px; margin: 0px 0px 0px 20px;"><img
					src="/resources/nanulogo.png" alt=""></a>
			</aside>
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
											<li><a
												href="${pageContext.request.contextPath}/menu/menu_about">나누셰어
													소개</a></li>
											<li><a
												href="${pageContext.request.contextPath}/menu/menu_way">찾아오셰어</a></li>
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
                                </span> -->

							</nav>

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
			<aside>
				<a href="#" class="charity-strip-btn charity-bgcolor"
					style="width: 70px; height: 40px; white-space: nowrap; padding: 10px 0px 0px 6px; margin: -75px 50px 0px 0px;">Sign
					up</a> <a href="#" class="charity-strip-btn charity-bgcolor"
					style="width: 70px; height: 40px; white-space: nowrap; padding: 10px 5px 0px 10px; margin: -75px 140px 0px 0px;">Sign
					in</a>
			</aside>
		</div>
		<!-- Top Strip -->
	</header>
	<!-- Header -->

	<!-- Banner -->
	<div class="charity-subheader">
		<span class="black-transparent"></span>
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<h1>프로필수정하는 페이지 - 여기를 지우면 메뉴가 안보임</h1>
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
					<div class="col-md-12">
						<div class="charity-fancy-title">
							<h2>프로필 수정</h2>
						</div>
						<div style="margin: 0 auto" align="center">
							<form id="mjoin" action='<c:url value='/my/myprofile'/>'
								class="myform" method="post" novalidate>

								<ul class="charity-contact-form">

									<!-- <ul class="row"> -->

									<label>아이디 <input type="text" placeholder="Email"
										name="member_id" id="member_id" value="${modifyId}"
										readonly="readonly" required>
									</label>

									<label>이름<input type="text" name="name" id="name"
										placeholder="Name" value="${modifyName}" required>
									</label>

									<%-- <li class="col-md-6">핸드폰 정보 <input type="text"
											placeholder="Phone Number" name="phone" id="phone"
											value="${modifyPhone}" required>
										</li>
										<li class="col-md-6">성별<input type="text"
											placeholder="gender" name="gender" id="gender"
											class="form-control" required>
										</li> --%>
									<label>변경할 비밀번호 입력<input type="password"
										placeholder="Password" name="pw" id="pwd1"
										class="form-control" required>
									</label>
									<label>비밀번호 확인<input type="password"
										placeholder="Confirm Password" name="pwConfirm" id="pw"
										class="form-control" required>
									</label>
								</ul>
						</div>

						<div class="buttonbutton">
							<!-- </ul> -->
							<button type="button"
								onclick="location.href='${pageContext.request.contextPath}/my/drop'"
								class="charity-simple-blog-btn">회원 탈퇴</button>
							<button type="button" onclick="location.href='/my/mypage'"
								class="charity-simple-blog-btn">처음으로</button>
							<button type="button" id="submit" onclick="modifyMember()"
								class="charity-simple-blog-btn">수정완료</button>
						</div>


						</form>


						<script>
							$("#mjoin")
									.validate(
											{

												rules : { /* 각 태그의 규칙을 설정 */
													/*함수 정의 https://offbyone.tistory.com/50 참고주소 */
													/* 비밀번호 특수문자 https://yoo-hyeok.tistory.com/82  */
													/* 공식 문서 https://jqueryvalidation.org/ */
													/* html의 input태그의 name=""에 설정한 값과 같아야한다.  */
													member_id : {
														required : true, /* 필수인가? true는 yes를 의미 */
														email : true
													/* 이메일 형식인가? */
													},
													pw : {
														required : true,
														passwordCK : true,
														minlength : 4, /* 최소글자 */
														maxlength : 12
													/* 최대12 글자 */
													},
													pwConfirm : {
														required : true,
														equalTo : '#pw'
													},
													name : {
														required : true,
														minlength : 2
													},
													
												messages : { /* rules에서 설정한 규칙을 위배할시 나오는 메세지 */

													member_id : {
														required : '이메일을 입력해 주세요.',
														email : '이메일 형식으로 입력해 주세요. ex)xxxx@gmail.com'
													},
													pw : {
														required : '비밀번호를 입력해 주세요.',
														passwordCK : '비밀번호는 영문자, 숫자, 특수문자를 조합하여 입력해야 합니다.',
														minlength : '비밃런호는 최소 4글자 이상 입력해 주세요.',
														maxlength : '비밃런호는 최대 12글자 까지 입력이 가능합니다.'
													},
													pwConfirm : {
														required : '비밀번호를 입력해 주세요.',
														equalTo : "비밀번호가 일치하지 않습니다."
													},
													name : {
														required : '이름을 입력해 주세요.',
														minlength : '2글자 이상 입력해 주세요.'
													},
													
												errorElement : 'span'

											});
							$.validator
									.addMethod(
											"passwordCK",
											function(value, element) {
												return this.optional(element)
														|| /^.*(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/
																.test(value);
											});
						</script>

					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
<!-- Main Section -->



<!-- Content -->


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
					<input type="submit" value=""> <input type="button"
						value="취소" onClick="history.go(-2)"
						class="charity-simple-blog-btn"> <a
						href="${pageContext.request.contextPath}/my/mypage"
						class="charity-simple-blog-btn">저장</a> <i class="fa fa-search"></i>
				</form>
			</div>

		</div>
	</div>
</div>


<!-- Footer -->
<footer id="charity-footer" class="charity-footer-one">
	<!-- Footer Widget -->
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
	<!-- Footer Widget -->
</footer>
<!-- Footer -->




<!-- jQuery -->
<script src="/resources/charity/script/jquery.js"></script>
<script src="/resources/charity/script/popper.min.js"></script>
<script src="/resources/charity/script/bootstrap.min.js"></script>
<script src="/resources/charity/script/slick.slider.min.js"></script>
<script src="/resources/charity/script/progressbar.js"></script>
<script src="/resources/charity/script/fancybox.min.js"></script>
<script src="/resources/charity/script/jquery.countdown.min.js"></script>
<script src="/resources/charity/https://maps.googleapis.com/maps/api/js"></script>
<script src="/resources/charity/script/jquery.jplayer.js"></script>

</body>
</html>