<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<%-- <sec:csrfMetaTags/> --%>
<!-- 헤더 안에 추가  -->
<!-- csrf 관련이슈 해결방법 : jsp에 meta 태그추가(csrf값 얻기위해) -->
<!-- js에서 csrf 토큰, 헤더등록 -->
<meta name="_csrf" content="${_csrf.token}"> 
<meta name="_csrf_header" content="${_csrf.headerName}">

<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script type="text/javascript">
	/*js에서 csrf토큰, 헤더 등록  */
	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");
	$(document).ajaxSend(function(e, xhr, options) {
	    xhr.setRequestHeader(header, token);
	});
	
	 $(document).ready(function(){
		 var token = $("meta[name='_csrf']").attr("content");
		var header = $("meta[name='_csrf_header']").attr("content");

			$('#mjoin').submit(function(event) {
				event.preventDefault();
			
				
				
				var member_id = $("#member_id").val();
				var pw = $("#pw").val();
				var name = $("#name").val();
				var gender = $('input[name="gender"]:checked').val();
				//var gender = $("#gender").val();
				var birth = $("#birth").val();
				var phone = $("#phone").val();
				//var authname = $('input[name="authname"]:checked').val();
				//var authname = $("#authname").val();
				
				
				var memberJoin = {
						
						member_id : member_id,
						pw : pw,
						name : name,
						gender : gender,
						birth : birth,
						phone : phone
						//authname : authname
				};
				
				$.ajax({
					type : "POST",
					url : $(this).attr("action"),
					cache : false,
					contentType:'application/json; charset=utf-8',
					data: JSON.stringify(memberJoin),
					success : function(result){
						console.log(result);
						if(result == "SUCCESS"){
							console.log("success");
							$(location).attr('href',"${pageContext.request.contextPath}/login");
							
						}
					},
					error : function(e){						
						alert("fail");
						
						console.log(result);
						console.log(e);
					}										
				});	//ajax			
			});					
		
	   }); // end ready()
	
	</script>
	
</head>
<body>

	<form id="mjoin" action="${pageContext.request.contextPath}/memberJoin" method="post">
		이메일 : <input type="email" id="member_id"> <br>
		pw	: <input type="password" id="pw"> <br>
		이름 : <input type="text" id="name"> <br>
		성별 : <label> <input type="radio" name="gender" id = "gender" value="M">남자 </label>
			 <label> <input type="radio" name="gender" id="gender" value="W">여자</label><br>
		생일 : <input type="date" id="birth"> <br>
		연락처 : <input type="text" id="phone"> <br>
		<!-- <label> <input type="radio" name="authname" id = "authname" value="관리자">관리자 </label>
		<label> <input type="radio" name="authname" id="authname" value="회원">회원</label><br> -->
		<input type="submit" value="가입">
	</form>
</body>
</html>