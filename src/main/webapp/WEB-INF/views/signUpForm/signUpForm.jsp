<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!doctype html>
<html lang="en">
  <head>
  
  <%-- <sec:csrfMetaTags/> --%>
<!-- 헤더 안에 추가  -->
<!-- csrf 관련이슈 해결방법 : jsp에 meta 태그추가(csrf값 얻기위해) -->
<!-- js에서 csrf 토큰, 헤더등록 -->
<meta name="_csrf" content="${_csrf.token}"> 
<meta name="_csrf_header" content="${_csrf.headerName}">
  
  	<title>Sign Up</title>
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  	
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">

	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	
	<link rel="stylesheet" href="/resources/signUpForm/css/style.css">
	
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
				var birth = $("#birth").val();
				var phone = $("#phone").val();
				var signuppath = $("#signuppath").val();
			
				var memberJoin = {
						
						member_id : member_id,
						pw : pw,
						name : name,
						gender : gender,
						birth : birth,
						phone : phone,
						signuppath : signuppath
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
							$(location).attr('href',"${pageContext.request.contextPath}");
							
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
	<body class="img" style="background-image: url(/resources/signUpForm/images/bg.jpg);">
	<section class="ftco-section">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-6 text-center mb-5">
					<h2 class="heading-section">Nanushare Sign Up</h2>
				</div>
			</div>
			<div class="row justify-content-center">
				<div class="col-md-7 col-lg-5">
					<div class="login-wrap">
		      	<h3 class="text-center mb-4">Create Your Account</h3>
						<form id="mjoin" action="${pageContext.request.contextPath}/memberJoin" class="signup-form" method="post">
		      		
			      		<div class="form-group mb-3">
			      			<label class="label" for="email">Email Address</label>
			      			<input type="text" id="member_id" class="form-control" placeholder="johndoe@gmail.com">
			      			<span class="icon fa fa-paper-plane-o"></span>
			      		</div>
		      		
			      		<div class="form-group mb-3">
			              <label class="label" for="password">Password</label>
			              <input id="pw" type="password" class="form-control" placeholder="Password">
			              <span toggle="#password" class="fa fa-fw fa-eye field-icon toggle-password"></span>
			              <span class="icon fa fa-lock"></span>
		            	</div>
	            
	            
		           	   <div class="form-group mb-3">
			              <label class="label" for="password">Password</label>
			              <input id="password-confirm" type="password" class="form-control" placeholder="Password">
			              <span toggle="#password-confirm" class="fa fa-fw fa-eye field-icon toggle-password"></span>
			              <span class="icon fa fa-lock"></span>
		               </div>
		      		
		      		  <div class="form-group mb-3">
		      			  <label class="label" for="name">Name</label>
		      			  <input id="name" type="text" class="form-control" placeholder="John Doe">
		      			  <span class="icon fa fa-user-o"></span>	      			
		      		  </div>
		      		
		      		  <div class="form-group mb-3">
		      			 <label class="label" for="name">GENDER</label>
			      		 <input type="radio" name="gender" id = "gender" value="M">Male
				 		 <input type="radio" name="gender" id="gender" value="W">Female			 			
			 		  </div>
			 			
			 		  <div class="form-group mb-3">
			 			 <label class="label" for="name">BIRTHDAY</label>
						 <input type="date" id="birth"> <br/>
		      		  </div>
		      			
		      		  <div class="form-group mb-3">
		      			 <label class="label" for="name">Phone</label>
		      			 <input type="text" id="phone" class="form-control" placeholder="01012345678">
		      			 <span class="icon fa fa-user-o"></span>
		      		  </div>
		      		
	            	            
	            <div class="form-group">
	            	<button type="submit" class="form-control btn btn-primary submit px-3">Sign Up</button>
	            </div>
	          </form>
	          <p>I'm already a member! <a data-toggle="tab" href="/">Sign In</a></p>
	        </div>
				</div>
			</div>
		</div>
	</section>

	<script src="/resources/signUpForm/js/jquery.min.js"></script>
	<script src="/resources/signUpForm/js/popper.js"></script>
    <script src="/resources/signUpForm/js/bootstrap.min.js"></script>
    <script src="/resources/signUpForm/js/main.js"></script>

	</body>
</html>

