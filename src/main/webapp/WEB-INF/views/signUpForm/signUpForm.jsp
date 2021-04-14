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
    
    <link rel="shortcut icon" type="image/x-icon" 
    	href="${pageContext.request.contextPath}/resources/nanulogo_ico_convert.ico"> <!-- 웹페이지 탭 로고이미지 삽입  -->
    
    <!-- bootstrap -->	
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>


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
    
    <style type="text/css">
    	.error {
    		color : red;   	
    	}
    </style>

    <script type="text/javascript">
        /*js에서 csrf토큰, 헤더 등록  */

		//$(document).ready(function()
        $(function() {

            var token = $("meta[name='_csrf']").attr("content");
            var header = $("meta[name='_csrf_header']").attr("content");
            $(document).ajaxSend(function(e, xhr, options) {
                xhr.setRequestHeader(header, token);
            });


            $('#mjoin').submit(function(event) { // 가입처리
                event.preventDefault();

                var member_id = $("#member_id").val();
                var pw = $("#pw").val();
                var name = $("#name").val();
                var subemail = $("#subemail").val();
                //var gender = $('input[name="gender"]:checked').val();
               // var birth = $("#birth").val();
               // var phone = $("#phone").val();
                var signuppath = $("#signuppath").val();

                var memberJoin = {

                    member_id: member_id,
                    pw: pw,
                    name: name,
                   // gender: gender,
                    //birth: birth,
                   // phone: phone,
                   subemail : subemail,
                    signuppath: signuppath
                };

                $.ajax({
                    type: "POST",
                    url: $(this).attr("action"),
                    cache: false,
                    dataType : 'text',
                    contentType: 'application/json; charset=utf-8',
                    data: JSON.stringify(memberJoin),
                    success: function(result) {
                        console.log(result);
                        if (result == "SUCCESS") {
                            console.log("success");
                           $(location).attr('href', "${pageContext.request.contextPath}/main");

                        }
                    },
                    error: function(e) {
                        alert("가입 정보를 빠짐없이 입력해 주세요.");

                        console.log(result);
                        console.log(e);
                    }
                }); //ajax			
            });
            
            var isCertification = false;
            var key = "";
            $('#certification').click(function() { // 인증버튼 클릭시 입력한 이메일로 인증 번호를 해당 이메일로 전송
            	var mail = $("#member_id").val(); // 인증받을 이메일 주소
            	if (mail == "") {
        			alert("메일 주소가 입력되지 않았습니다.");
        		} else {
	            	$.ajax({
	            		type : 'post',
	            		url : '${pageContext.request.contextPath}/sendMail',
	            		data : {
	            			mail : mail
	            		},
	            		dataType : 'json',
	            		async : "false",
	            		success : function(data){
	            			console.log(data.key);
	            			key = data.key;
	            		}
	            		
	            	});
        		}
            	if(mail != ""){
            		alert("인증번호가 해당 메일로 전송되었습니다.");
            	}
            	
            	$("#compare").css("display","block");
            	$("#compare-text").css("display","block");
            	
    			
    		});//certification end
            
            $('#compare').on("propertychange change keyup paste input", function() {
        		if ($("#compare").val() == key) {
        				$("#compare-text").text("인증에 성공하셨습니다.").css("color","black");
        				isCertification = true;
        		} else {
        			$("#compare-text").text("인증에 실패하셨습니다.").css("color","red");
        			isCertification = false;
        		}
        	});// compare end
        	
            /* $("#submit-btn").click(function(){
        		if(isCertification==false){ //인증이 완료되지 않았다면
        			alert("메일 인증이 완료되지 않았습니다.");
        		}
        	}); */
        	
            $("#submit-btn").click(function submitCheck(){ //폼에서 submit을 진행했을대 메일인증이 되어있지 않다면 페이지전환을 할 수 없다.
        		if(isCertification==false){
        			alert("메일 인증이 완료되지 않았습니다.");
        			return false;
        		}else
        			true;
        	});

        }); // end ready()
        
     
        
   
    </script>


</head>

<body class="img" style="background-image: url(/resources/signUpForm/images/img_5.jpg);">
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
                        	class="signup-form" method="post" onsubmit='submitCheck()' novalidate> <!-- onsubmit='submitCheck()' -->
                        	<!-- novalidate -> 브라우저에서 제공하는 validate를 끄겠다. 그리고 jquery validation plugin 사용 -->
							<fieldset>
							<!-- <legend>Input Information</legend> legend 태그는 제목 설정 태그 -->
							
                            <div class="form-group mb-3">                           	
                                <label class="label" for="member_id">이메일 주소</label>                                                                                                                               
                                <input type="text" id="member_id" name="member_id" class="form-control" placeholder="이메일을 입력해 주세요." >                                                          
                                <span class="icon fa fa-paper-plane-o"></span>                                
                            </div>
                            <div style="float: right;">
                            	<button type="button" id="certification" class="btn btn-warning">인증번호 전송</button>
                            	<!-- <input type="button" id="certification" value="인증번호 전송"> -->
                            </div>
                            <br/>
                            <div class="form-group mb-3">                           	
                                <label class="label" for="compare">이메일 인증번호</label>                                                                                                                               
                                <input type="text" id="compare" class="form-control" placeholder="인증키를 입력해 주세요." >                                                                                         
                                <span class="icon fa fa-paper-plane-o"></span>                                
                            </div>
                            <span id="compare-text" style="display: none">불일치</span>
                            
                            <div class="form-group mb-3">                           	
                                <label class="label" for="subemail">서브 이메일 주소</label>                                                                                                                               
                                <input type="text" id="subemail" name="subemail" class="form-control" placeholder="서브 이메일을 입력해 주세요." >                                                          
                                <span class="icon fa fa-paper-plane-o"></span>                                
                            </div>

                            <div class="form-group mb-3">
                                <label class="label" for="pw">비밀번호</label>
                                <input id="pw" name="pw" type="password" class="form-control" placeholder="비밀번호를 입력해 주세요." >                                                            
                                <span class="icon fa fa-lock"></span>
                            </div>

                            <div class="form-group mb-3">
                                <label class="label" for="pw">비밀번호 확인</label>
                                <input name="pwConfirm" type="password" class="form-control" placeholder="비밀번호를 입력해 주세요." >                                
                                <span class="icon fa fa-lock"></span>
                            </div>

                            <div class="form-group mb-3">
                                <label class="label" for="name">이름</label>
                                <input id="name" name="name" type="text" class="form-control" placeholder="홍길동" >
                                <span class="icon fa fa-user-o"></span>
                            </div>

                           <!--  <div class="form-group mb-3">
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
                            </div> -->

                            <input type="hidden" id="signuppath" value="home">
                            <!-- 가입경로는 히든으로 표시, 자체가입자는 반드시 signuppath에 home 입력 -->

                            <div class="form-group">
                                <button type="submit" id="submit-btn" class="form-control btn btn-primary submit px-3">Sign Up</button>
                            </div>
                            </fieldset>
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                        </form>
                        <script>
							$("#mjoin").validate({
								
								rules:{ /* 각 태그의 규칙을 설정 */
									/*함수 정의 https://offbyone.tistory.com/50 참고주소 */
									/* 비밀번호 특수문자 https://yoo-hyeok.tistory.com/82  */
									/* 공식 문서 https://jqueryvalidation.org/ */
									/* html의 input태그의 name=""에 설정한 값과 같아야한다.  */
									member_id :{
										required : true, /* 필수인가? true는 yes를 의미 */
										email : true, /* 이메일 형식인가? */
										remote : "${pageContext.request.contextPath}/IdCheck",
										/* 인증할때 다른 파일이나 url을 통해 인증을 받고 싶을때 이용, ajax형태, remote는 리턴타입이 boolean  */
										spaceCheck : true
									},
									subemail : {
										required : true,
										email : true,
										spaceCheck : true
										
									},
									pw :{
										required : true,
										passwordCK : true,
										minlength : 4, /* 최소글자 */
										maxlength : 12, /* 최대12 글자 */
										spaceCheck : true
									},
									pwConfirm : {
										required : true,
										equalTo : '#pw'	,
										spaceCheck : true
									},
									name : {
										required : true,
										minlength : 2,
										spaceCheck : true
									}									
									/* phone : {
										required : true,
										number : true
									},									
									gender :{
										required : true
									},
									birth : {
										required : true,
										date : true
									} */
									
								},
								messages:{ /* rules에서 설정한 규칙을 위배할시 나오는 메세지 */
									
									member_id :{
										required : '이메일을 입력해 주세요.',
										email : '이메일 형식으로 입력해 주세요. ex)xxxx@gmail.com',
										remote :'이미 사용중인 이메일 입니다.',
										spaceCheck: '공백없이 입력해주세요.'
									},
									subemail : {
										required : '이메일을 입력해 주세요.',
										email : '이메일 형식으로 입력해 주세요. ex)xxxx@gmail.com',
										spaceCheck: '공백없이 입력해주세요.'
									},
									pw :{
										required : '비밀번호를 입력해 주세요.',
										passwordCK : '비밀번호는 영문자, 숫자, 특수문자를 조합하여 입력해야 합니다. ex)?와 공백은 사용할 수 없습니다.',
										minlength : '비밀번호는 최소 4글자 이상 입력해 주세요.',
										maxlength : '비밀번호는 최대 12글자 까지 입력이 가능합니다.',
										spaceCheck: '공백없이 입력해주세요.'
									},
									pwConfirm : {
										required : '비밀번호를 입력해 주세요.',
										equalTo : "비밀번호가 일치하지 않습니다.",
										spaceCheck: '공백없이 입력해주세요.'
									},
									name : {
										required : '이름을 입력해 주세요.',
										minlength : '2글자 이상 입력해 주세요.',
										spaceCheck: '공백없이 입력해주세요.'
									}									
									/* phone : {
										required : '핸드폰 번호를 입력해 주세요.',
										number : '숫자만 입력해 주세요. ex)01012345678'
									},									
									gender :{
										required : '성별을 선택해 주세요.'
									},
									birth : {
										required : '생년 월일을 입력해 주세요.',
										date : '날자형식이 아닙니다.'
									} */
									
								},
								errorElement : 'span', /* 디폴트는 lable 태그 lable->span 으로 수정 */
								errorClass : 'error', /* 디폴트 클래스 이름은 error, 클래스 이름을 변경할 수 있다.*/
								
								/* 에러메세지의 위치 수정 가능 , 참고 블로그 https://goodteacher.tistory.com/163*/
								/* errorPlacement : function(error, element) { 
									if(element.is(":radio") || element.is(":text") || element.is(":password") 
											|| element.is(":text")  ){
										element.parent().after(error);
									}else{
										element.after(error);
									}
								} */
								
								errorPlacement : function(error, element) { 
									if(element.is(":text") || element.is(":password")										  ){
										element.parent().after(error);
									}else{
										element.after(error);
									}
								}
													
																
							}); 
							$.validator.addMethod("passwordCK",  function( value, element ) { //어째서인지 ?는 특수문자 취급을 못 하고있다.
								   return this.optional(element) ||  /^.*(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/.test(value);
								});
							
							/* 공백 체크 함수 추가함 */
                            $.validator.addMethod("spaceCheck" /* validate명 */ , function(value, element) {
                                //검사하는 name태그의 value 중 공백이 없으면 true, 있으면 false리턴
                                //false 리턴 시 messages에 선언된 내용들 띄워줌
                                return $(element).val().indexOf(" ") = -1 ? true : false;
                            });
                            //출처: https://devhong.tistory.com/3 [주니어를 탈출하고 싶은 개발자의 블로그]
							
							
						</script>
                       
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