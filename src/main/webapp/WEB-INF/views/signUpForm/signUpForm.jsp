<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!doctype html>
<html lang="en">

<head>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    
    <!-- jquery validation cdn-->
    <!-- jquery 플러그인 이기때문에 jquery가 있어야 한다. -->
    <script type="text/javascript" src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>

    <!-- jquery validation method cdn -->
    <script type="text/javascript" src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/additional-methods.min.js">
    </script>


    <%-- <sec:csrfMetaTags/> --%>
    <!-- 헤더 안에 추가  -->
    <!-- csrf 관련이슈 해결방법 : jsp에 meta 태그추가(csrf값 얻기위해) -->
    <!-- js에서 csrf 토큰, 헤더등록 -->
    <meta name="_csrf" content="${_csrf.token}">
    <meta name="_csrf_header" content="${_csrf.headerName}">

    <title>Sign Up</title>


    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

    <link rel="stylesheet" href="/resources/signUpForm/css/style.css">

    <script type="text/javascript">
        /*js에서 csrf토큰, 헤더 등록  */


        $(document).ready(function() {

            var token = $("meta[name='_csrf']").attr("content");
            var header = $("meta[name='_csrf_header']").attr("content");
            $(document).ajaxSend(function(e, xhr, options) {
                xhr.setRequestHeader(header, token);
            });


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

                    member_id: member_id,
                    pw: pw,
                    name: name,
                    gender: gender,
                    birth: birth,
                    phone: phone,
                    signuppath: signuppath
                };

                $.ajax({
                    type: "POST",
                    url: $(this).attr("action"),
                    cache: false,
                    contentType: 'application/json; charset=utf-8',
                    data: JSON.stringify(memberJoin),
                    success: function(result) {
                        console.log(result);
                        if (result == "SUCCESS") {
                            console.log("success");
                            $(location).attr('href', "${pageContext.request.contextPath}/");

                        }
                    },
                    error: function(e) {
                        alert("fail");

                        console.log(result);
                        console.log(e);
                    }
                }); //ajax			
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
                        <form id="mjoin" action="${pageContext.request.contextPath}/memberJoin" 
                        	class="signup-form" method="post" novalidate> 
                        	<!-- novalidate -> 브라우저에서 제공하는 validate를 끄겠다. 그리고 jquery validation plugin 사용 -->
							<fieldset>
							<!-- <legend>Input Information</legend> legend 태그는 제목 설정 태그 -->
							
                            <div class="form-group mb-3">
                                <label class="label" for="member_id">Email Address</label>
                                <input type="email" id="member_id" name="member_id" class="form-control" placeholder="XXXXX@gmail.com" >
                                <span class="icon fa fa-paper-plane-o"></span>
                            </div>

                            <div class="form-group mb-3">
                                <label class="label" for="pw">Password</label>
                                <input id="pw" name="pw" type="password" class="form-control" placeholder="Password" >                             
                                <span class="icon fa fa-lock"></span>
                            </div>


                            <div class="form-group mb-3">
                                <label class="label" for="pw">Password Confirm</label>
                                <input name="pwConfirm" type="password" class="form-control" placeholder="Password Confirm" >                                
                                <span class="icon fa fa-lock"></span>
                            </div>

                            <div class="form-group mb-3">
                                <label class="label" for="name">Name</label>
                                <input id="name" name="name" type="text" class="form-control" placeholder="홍길동" >
                                <span class="icon fa fa-user-o"></span>
                            </div>

                            <div class="form-group mb-3">
                                <label class="label" for="phone">Phone</label>
                                <input type="text" id="phone" name="phone" class="form-control" placeholder="01012345678" >
                                <span class="icon fa fa-user-o"></span>
                            </div>

                            <div class="form-group mb-3">
                                <label class="label" for="gender">GENDER</label> &nbsp
                                <input type="radio" name="gender" id="gender" value="M">Male &nbsp
                                <input type="radio" name="gender" id="gender" value="F">Female
                            </div>

                            <div class="form-group mb-3">
                                <label class="label" for="birth" >BIRTHDAY</label>
                                <input type="date" id="birth" name="birth" > <br />
                            </div>

                            <input type="hidden" id="signuppath" value="home">
                            <!-- 가입경로는 히든으로 표시, 자체가입자는 반드시 signuppath에 home 입력 -->

                            <div class="form-group">
                                <button type="submit" class="form-control btn btn-primary submit px-3">Sign Up</button>
                            </div>
                            </fieldset>
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                        </form>
                        <script>
							$("#mjoin").validate({
								
								rules:{ /* 각 태그의 규칙을 설정 */
									/* html의 input태그의 name=""에 설정한 값과 같아야한다.  */
									member_id :{
										required : true, /* 필수인가? true는 yes를 의미 */
										email : true /* 이메일 형식인가? */
									},									
									pw :{
										required : true,
										passwordCK : true,
										minlength : 4, /* 최소글자 */
										maxlength : 12 /* 최대12 글자 */
									},
									pwConfirm : {
										required : true,
										equalTo : '#pw'									
									},
									name : {
										required : true,
										minlength : 2
									},									
									phone : {
										required : true
									},									
									gender :{
										required : true
									},
									birth : {
										required : true,
										date : true
									}
									
								},
								messages:{ /* rules에서 설정한 규칙을 위배할시 나오는 메세지 */
									
									member_id :{
										required : '이메일을 입력해 주세요.',
										email : '이메일 형식으로 입력해 주세요. ex)xxxx@gmail.com'
									},									
									pw :{
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
									phone : {
										required : '핸드폰 번호를 입력해 주세요.'
									},									
									gender :{
										required : '성별을 선택해 주세요.'
									},
									birth : {
										required : '생년 월일을 입력해 주세요.',
										date : '날자형식이 아닙니다.'
									}
									
								}
								
																
							}); 
							$.validator.addMethod("passwordCK",  function( value, element ) {
								   return this.optional(element) ||  /^.*(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/.test(value);
								});	
						</script>
                        <p>I'm already a member! <a data-toggle="tab" href="${pageContext.request.contextPath}/">Sign In</a></p>
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