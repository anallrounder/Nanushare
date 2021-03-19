<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script type="text/javascript">
	
	
	 $(document).ready(function(){
		 

			$('#mjoin').submit(function(event) {
				event.preventDefault();
			
				
				
				var member_id = $("#member_id").val();
				var pw = $("#pw").val();
				var name = $("#name").val();
				var gender = $("#gender").val();
				var birth = $("#birth").val();
				var phone = $("#phone").val();
				var authname = $("#authname").val();
				
				
				var memberJoin = {
						
						member_id : member_id,
						pw : pw,
						name : name,
						gender : gender,
						birth : birth,
						phone : phone,
						authname : authname
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
		성별 : <label> <input type="radio" id = "gender" value="M" checked="checked">M </label>
			 <label> <input type="radio" id="gender" value="W">W</label><br>
		생일 : <input type="date" id="birth"> <br>
		연락처 : <input type="text" id="phone"> <br>
		<label> <input type="radio" id = "authname" value="관리자" checked="checked">관리자 </label>
		<label> <input type="radio" id="authname" value="회원">회원</label><br>
		<input type="submit" value="가입">
	</form>
</body>
</html>