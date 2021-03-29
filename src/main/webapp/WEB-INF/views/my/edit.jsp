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
	$(function() {
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
	});
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


<style>
#charity-contact-form {
	left: 50%;
	top: 50%;
	position : absolute;
	margin-left : -220px;
	margin-top :-170px;

}

.charity-simple-blog-btn {
	border: 0;
}
</style>
</head>

<body>
	<!-- Header -->
	<header id="charity-header" class="charity-header-one">
		<!-- Top Strip -->
		<div class="charity-top-strip">
			<div class="container">
				<div class="row">
					<aside class="col-6 charity-strip-text">
						<p>Explore The charity</p>
						<span><i class="fas fa-phone fa-rotate-90"></i> 123 456 789</span>
						<span><i class="far fa-envelope"></i> <a
							href="/resources/charity/mailto:name@email.com">info@example.com</a></span>
					</aside>
					<aside class="col-6"></aside>
				</div>
			</div>
		</div>
		<!-- Top Strip -->
		<!-- Main Header -->
		<div class="charity-main-header">
			<div class="container">
				<div class="row">
					<aside class="col-3">
						<a href="/resources/charity/index.html" class="charity-logo"><img
							src="/resources/charity/images/logo.png" alt=""></a>
					</aside>
					<aside class="col-9">
						<div class="float-right">
							<a href="/resources/charity/#menu" class="menu-link active"><span></span></a>
							<nav id="menu" class="menu charity-navigation">
								<ul>
									<li class="active"><a href="/resources/charity/index.html">Home</a></li>
									<li><a href="/resources/charity/#">Events</a>
										<ul class="children">
											<li><a href="/resources/charity/event-list.html">Event
													List</a></li>
											<li><a href="/resources/charity/event-grid.html">Event
													Grid</a></li>
											<li><a href="/resources/charity/event-detail.html">Event
													Detail</a></li>
										</ul></li>
									<li><a href="/resources/charity/#">Causes</a>
										<ul class="children">
											<li><a href="/resources/charity/cause-list.html">Cause
													List</a></li>
											<li><a href="/resources/charity/cause-grid.html">Cause
													Grid</a></li>
											<li><a href="/resources/charity/cause-detail.html">Cause
													Detail</a></li>
										</ul></li>
									<li><a href="/resources/charity/#">Blog</a>
										<ul class="children">
											<li><a href="/resources/charity/blog-large.html">Cause
													List</a></li>
											<li><a href="/resources/charity/blog-medium.html">Cause
													Grid</a></li>
											<li><a href="/resources/charity/blog-detail.html">Cause
													Detail</a></li>
										</ul></li>
									<li><a href="/resources/charity/#">Team</a>
										<ul class="children">
											<li><a href="/resources/charity/team-grid.html">Team
													Grid</a></li>
											<li><a href="/resources/charity/team-classic.html">Team
													Classic</a></li>
											<li><a href="/resources/charity/team-detail.html">Team
													Detail</a></li>
										</ul></li>
									<li><a href="/resources/charity/#">Pages</a>
										<ul class="children">
											<li><a href="/resources/charity/about.html">About Us</a></li>
											<li><a href="/resources/charity/prayer-list.html">Prayer
													List</a></li>
											<li><a href="/resources/charity/prayer-grid.html">Prayer
													Grid</a></li>
											<li><a href="/resources/charity/prayer-detail.html">Prayer
													Detail</a></li>
											<li><a href="/resources/charity/404.html">404 Error</a></li>
											<li><a href="/resources/charity/search-result.html">Search
													Result</a></li>
										</ul></li>
									<li><a href="/resources/charity/contact-us.html">Contact</a></li>
								</ul>
							</nav>
							<ul class="charity-header-options">
								<li><a href="/resources/charity/#" data-toggle="modal"
									data-target="#searchModal"><i class="fas fa-search"></i></a></li>
								<li><a href="/resources/charity/#"><i
										class="fab fa-opencart"></i></a>
									<div class="charity-cart-box">
										<p>No products in the cart.</p>
									</div></li>
							</ul>
						</div>
					</aside>
				</div>
			</div>
		</div>
		<!-- Main Header -->
	</header>
	<!-- Header -->



	<!-- Banner -->
	<div class="charity-subheader">
		<span class="black-transparent"></span>
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<h1>프로필수정하는 페이지</h1>
					<p>프로필수정하는 페이지</p>
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

						<form action='<c:url value='/my/myprofile'/>' class="myform"
							method="post">
							<div class="wrapwrap">
							<div class="charity-contact-form">
								
									<ul class="row">

										<li class="col-md-6">이름<input type="text" name="name"
											id="name" placeholder="Name" value="${modifyName}"
											readonly="readonly" required> <!-- <input type="text" placeholder="Name"
										name="name" required -->
										</li>
										<br />

										<li class="col-md-6">아이디 <input type="text"
											placeholder="Email" name="member_id" id="member_id"
											value="${modifyId}" required>
										</li>
										<li class="col-md-6">핸드폰 정보 <input type="text"
											placeholder="Phone Number" name="phone" id="phone"
											value="${modifyPhone}" required>
										</li>
										<li class="col-md-6">성별<input type="text"
											placeholder="gender" name="gender" id="gender"
											class="form-control" required>
										</li>
										<li class="col-md-6">변경할 비밀번호 입력<input type="password"
											placeholder="Password" name="pw" id="pwd1"
											class="form-control" required>
										</li>
										<li class="col-md-6">비밀번호 확인<input type="password"
											placeholder="Confirm Password" name="pw" id="pw"
											class="form-control" required>

											<div class="alert alert-success" id="alert-success">비밀번호가
												일치합니다.</div>
											<div class="alert alert-danger" id="alert-danger">비밀번호가
												일치하지 않습니다.</div></li>

									</ul>
									<button type="button"
										onclick="location.href='${pageContext.request.contextPath}/my/drop'"
										class="charity-simple-blog-btn">회원 탈퇴</button>
									<button type="button" onclick="location.href='/my/mypage'"
										class="charity-simple-blog-btn">처음으로</button>
									<button type="button" id="submit" onclick="modifyMember()"
										class="charity-simple-blog-btn">수정완료</button>
								</div>
							</div>
						</form>
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