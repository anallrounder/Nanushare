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
	function agree() {
		var chkbox = document.getElementsByName('agree');
		var chk = false;
		for (var i = 0; i < chkbox.length; i++) {
			if (chkbox[i].checked) {
				chk = true;
			} else {
				chk = false;
			}
		}
		if (chk) {
			window.location.href = "${pageContext.request.contextPath}/main";
		} else {
			alert("모든 약관에 동의해 주세요.")
		}
	}
</script>

<script type="text/javascript">

/* 403에러때문에 넣은 코드 */
$(document).ready(function() {

	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");
	$(document).ajaxSend(function(e, xhr, options) {
		xhr.setRequestHeader(header, token);
	});

$('#secession').submit(function(event) { //탈퇴 처리
	event.preventDefault();/* 이게있어서 폼태그에는 주소 필요x */

	/* var member_id = $("#member_id").val(); */
	var name = $("#name").val();
	var member_id = $("#member_id").val();
	var pw = $("#pw").val();

	var check = {
			"name" : name,
			"member_id" : member_id,
			"pw" : pw
	/*주는값이 id --# */
	};

//패스워드 맞는지 확인 체크
$.ajax({
			type : 'DELETE',
			/* 내가 처리할 주소(=현재주소) */
			url : "${pageContext.request.contextPath}/my/drop/check",
			contentType : 'application/json; charset=utf-8',
			data: JSON.stringify(check), /* 여기가 컨트롤러로 넘어가는 data {안에넣어주면  = 형식으로 넘어감} */
			async: "false",
			/* datatype : 'text', */
			/*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
			 /* beforeSend : function(xhr) { 
				console.log("header 실행 " + header + token)
				xhr.setRequestHeader(header, token);
			}, */ 

			success : function(result) {
				console.log(result);

				if (result == "SUCCESS") {
					console.log("success");
					$(location)
							.attr('href',"${pageContext.request.contextPath}/main");
					/* 성공했을때 넘어가는 페이지 */

				}
			},

			error : function(error) {
				
				alert("비밀번호가 일치하지 않습니다.");

				console.log("에러 : " + error);
			}

		}); //ajax end
}); //패스워드 체크 스크립트 end
});

























	/* 탈퇴 */
/* 	$(document).ready(function(e) {

			var token = $("meta[name='_csrf']").attr("content");
			var header = $("meta[name='_csrf_header']").attr("content");
			$(document).ajaxSend(function(e, xhr, options) {
				xhr.setRequestHeader(header, token);
			});
		
		$('#secession').click(function(event) {

			//패스워드 입력 확인
			if ($('#pw').val() == '') {
				alert("패스워드를 입력해 주세요.");
				$('#pw').focus();
				return;
			} else if ($('#pwCheck').val() == '') {
				alert("패스워드를 입력해 주세요.");
				$('#pwCheck').focus();
				return;
			}

			//입력한 패스워드가 같인지 체크
			if ($('#passwdCheck').val() != $('#passwd').val()) {
				alert("패스워드가 일치하지 않습니다.");
				$('#passwdCheck').focus();
				return;
			}

			//패스워드 맞는지 확인
			$.ajax({
				url : "${pageContext.request.contextPath}/my/drop",
				type : "DELETE",
				data : $('#delFrm').serializeArray(),
				contentType : "application/json; charset=UTF-8",
				success : function(data) {
					if (data == 0) {
						alert("패스워드가 틀렸습니다.");
						return;
					} else {
						//탈퇴
						var result = confirm('정말 탈퇴 하시겠습니까?');
						if (result) {
							$('#drop').submit();
						}
					}
				},
				error : function() {
					alert("서버 에러.");
				}
			});
		});
	}); */
</script>

</head>

<body>
<!-- 약관동의때문에 추가 -->
 <script src='{% static "js/jquery-1.11.3.min.js" %}'></script>
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

	<!-- Header -->
	<%@ include file="/WEB-INF/views/mainMap/mainHeader.jsp"%>
	<!-- Header -->


	<!-- Banner -->
	<div class="charity-subheader">
		<span class="black-transparent"></span>
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<h1>탈퇴 페이지</h1>
					https://yulfsong.tistory.com/75?category=797541 참고할것
					<p>https://ming9mon.tistory.com/75</p>
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
						<div class="charity-rich-editor charity-cause-detail">


							<div class="charity-simple-blog-text">
								<ul class="charity-simple-blog-options">

									<h3>탈퇴 안내</h3>
									<h6>회원탈퇴를 신청하기 전에 안내 사항을 꼭 확인해주세요.</h6>
									<br>
									<i class="fa fa-check" aria-hidden="true"></i> 탈퇴 후 회원정보 및 개인형
									서비스 이용기록은 모두 삭제됩니다.
									<br>
									<br>
									<i class="fa fa-check" aria-hidden="true"></i> 회원정보는 모두 삭제되며,
									삭제된 데이터는 복구되지 않습니다.
									<br>
									<br>
									<i class="fa fa-check" aria-hidden="true"></i> 삭제되는 내용을 확인하시고
									필요한 데이터는 미리 백업을 해주세요.
									<br>
									<br>
									<i class="fa fa-check" aria-hidden="true"></i> 탈퇴 후에도 게시판형 서비스에
									등록한 게시물은 그대로 남아 있습니다.
									<br>
									<br>
									<i class="fa fa-check" aria-hidden="true"></i> 문의, 인증게시글 및 댓글은
									탈퇴 시 자동 삭제되지 않고 그대로 남아 있습니다.
									<br>
									<br>
									<i class="fa fa-check" aria-hidden="true"></i> 삭제를 원하는 게시글이 있다면
									반드시 탈퇴 전 비공개 처리하거나 삭제하시기 바랍니다.
									<br>
									<br>
									<i class="fa fa-check" aria-hidden="true"></i> 탈퇴 후에는 회원정보가
									삭제되어 본인 여부를 확인할 수 있는 방법이 없어, 게시글을 임의로 삭제해드릴 수 없습니다.
									<br>
									<br>
									<br>

									</li>
									<form action="${pageContext.request.contextPath}/home" id="secession"
										class="myform" method="post">
										<div class="charity-contact-form">
											<table border="0">
												<tr>
													<td
														style="border-top: none; border-bottom: none; border-left: none; border-right: none;">이름</td>
													<td
														style="text-align: left; border-top: none; border-bottom: none; border-left: none; border-right: none;"><input
														type="text" placeholder="Confirm name" name="name"
														required><br /></td>
													<!-- <td><div class="invalid-feedback">이름을 입력해주세요.</div></td> -->
												</tr>
												<tr>
													<td
														style="border-top: none; border-bottom: none; border-left: none; border-right: none;">아이디(이메일)</td>
													<td
														style="text-align: left; border-top: none; border-bottom: none; border-left: none; border-right: none;"><input
														type="text" placeholder="Confirm email" name="email"
														required><br /></td>
													<!-- <td><div class="invalid-feedback">아이디를 입력해주세요.</div></td> -->
												</tr>
												<tr>
													<td
														style="border-top: none; border-bottom: none; border-left: none; border-right: none;">비밀번호</td>
													<td
														style="text-align: left; border-top: none; border-bottom: none; border-left: none; border-right: none;"><input
														type="text" placeholder="Confirm Password" id="pw"
														name="pw" required></td>
													<!-- <td><div class="invalid-feedback">비밀번호를 입력해주세요.</div></td> -->
												</tr>
											</table>
											<br> <br> <input type="checkbox" name="agree"
												id="chk1"> 안내 사항을 모두 확인하였으며, 이에 동의합니다.
								</ul>

								<div>
									<br> <a href="javascript:agree();"
										class="charity-simple-blog-btn" button class="fpmgBt2"
										onClick="member_submit()" type="submit">탈퇴하기</a>

									</form>
									<a href="${pageContext.request.contextPath}/my/mypage"
										class="charity-simple-blog-btn">취소</a>
									<!-- 탈퇴하면 탈퇴되었습니다 감사합니다 페이지 띄우고 3초뒤 리다이렉트로 홈으로 가는 페이지 구현 생각중 -->
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