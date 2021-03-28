<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>

<head>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <!-- jquery validation cdn-->
    <!-- jquery 플러그인 이기때문에 jquery가 있어야 한다. -->
    <script type="text/javascript" src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>

    <!-- jquery validation method cdn -->
    <script type="text/javascript" src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/additional-methods.min.js">
    </script>

    <!-- 웹페이지 탭 로고이미지 삽입  -->
    <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/nanulogo_ico_convert.ico">
	
	    <%-- <sec:csrfMetaTags/> --%>
    <!-- 헤더 안에 추가  -->
    <!-- csrf 관련이슈 해결방법 : jsp에 meta 태그추가(csrf값 얻기위해) -->
    <!-- js에서 csrf 토큰, 헤더등록 -->
    <meta name="_csrf" content="${_csrf.token}">
    <meta name="_csrf_header" content="${_csrf.headerName}">



    <meta charset="UTF-8">
    <title>비밀번호 찾기</title>
    <style type="text/css">
        .error {
            color: red;
        }
    </style>
    <script type="text/javascript">
        $(function() {
        	
        	var token = $("meta[name='_csrf']").attr("content");
            var header = $("meta[name='_csrf_header']").attr("content");
            $(document).ajaxSend(function(e, xhr, options) {
                xhr.setRequestHeader(header, token);
            });
            
            $('#forgotpw').submit(function(event) { //비밀번호 변경 처리
                event.preventDefault();

                var member_id = $("#member_id").val();
                var pw = $("#pw").val();             

                var changePw = {

                    member_id: member_id,
                    pw: pw                                   
                };

                $.ajax({
                    type: "POST",
                    url: $(this).attr("action"),
                    cache: false,
                    contentType: 'application/json; charset=utf-8',
                    data: JSON.stringify(changePw),
                    success: function(result) {
                        console.log(result);
                        if (result == "SUCCESS") {
                            console.log("success");
                            $(location).attr('href', "${pageContext.request.contextPath}/");

                        }
                    },
                    error: function(e) {
                        alert("정보를 빠짐없이 입력해 주세요.");

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
                        type: 'post',
                        url: '${pageContext.request.contextPath}/sendMail',
                        data: {
                            mail: mail
                        },
                        dataType: 'json',
                        async: "false",
                        success: function(data) {
                            console.log(data.key);
                            key = data.key;
                        }

                    });
                }
                if (mail != "") {
                    alert("인증번호가 해당 메일로 전송되었습니다.");
                }

                $("#compare").css("display", "block");
                $("#compare-text").css("display", "block");


            }); //certification end

            $('#compare').on("propertychange change keyup paste input", function() {
                if ($("#compare").val() == key) {
                    $("#compare-text").text("인증에 성공하셨습니다.").css("color", "black");
                    isCertification = true;
                } else {
                    $("#compare-text").text("인증에 실패하셨습니다.").css("color", "red");
                    isCertification = false;
                }
            }); // compare end

         /*    $("#submit-btn").click(function() {
                if (isCertification == false) { //인증이 완료되지 않았다면
                    alert("메일 인증이 완료되지 않았습니다.");
                }
            }); */

            $("#submit-btn").click(function submitCheck() { //폼에서 submit을 진행했을대 메일인증이 되어있지 않다면 페이지전환을 할 수 없다.
                if (isCertification == false) {
                    alert("메일 인증이 완료되지 않았습니다.");
                    return false;
                } else
                    true;
            });
        });
    </script>



</head>

<body>
    <form action="/changePw" id="forgotpw" onsubmit="return submitCheck();" method="post" novalidate>
        <fieldset>
            <p>가입시 입력했던 이메일을 입력해 주세요. </p> <br />
            <div>
            	이메일 : <input type="text" id="member_id" name="member_id"> <input type="button" id="certification" value="인증번호 전송"> <br />
            </div>
            <div>
           	 인증번호 : <input type="text" id="compare" name="compare"> <span id="compare-text" style="display: none">불일치</span> <br />
            </div>
            <div>
            	새로운 비밀번호 : <input type="password" id="pw" name="pw"> <br />
            </div>
            <div>
           	 비밀번호 확인 : <input type="password" id="pwConfirm" name="pwConfirm"> <br />
            </div>
            <input type="submit" id="submit-btn" value="비밀번호 변경">
        </fieldset>
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
    </form>

    <script>
        $("#forgotpw").validate({

            rules: {
                /* 각 태그의 규칙을 설정 */
                /*함수 정의 https://offbyone.tistory.com/50 참고주소 */
                /* 비밀번호 특수문자 https://yoo-hyeok.tistory.com/82  */
                /* 공식 문서 https://jqueryvalidation.org/ */
                /* html의 input태그의 name=""에 설정한 값과 같아야한다.  */
                member_id: {
                    required: true,
                    /* 필수인가? true는 yes를 의미 */
                    email: true
                    /* 이메일 형식인가? */
  
                },
                pw: {
                    required: true,
                    passwordCK: true,
                    minlength: 4,
                    /* 최소글자 */
                    maxlength: 12 /* 최대12 글자 */
                },
                pwConfirm: {
                    required: true,
                    equalTo: '#pw'
                }

            },
            messages: {
                /* rules에서 설정한 규칙을 위배할시 나오는 메세지 */

                member_id: {
                    required: '이메일을 입력해 주세요.',
                    email: '이메일 형식으로 입력해 주세요. ex)xxxx@gmail.com'
                    
                },
                pw: {
                    required: '비밀번호를 입력해 주세요.',
                    passwordCK: '비밀번호는 영문자, 숫자, 특수문자를 조합하여 입력해야 합니다. ex)?는 사용할 수 없습니다.',
                    minlength: '비밀번호는 최소 4글자 이상 입력해 주세요.',
                    maxlength: '비밀번호는 최대 12글자 까지 입력이 가능합니다.'
                },
                pwConfirm: {
                    required: '비밀번호를 입력해 주세요.',
                    equalTo: "비밀번호가 일치하지 않습니다."
                }

            },
            errorElement: 'span',
            /* 디폴트는 lable 태그 lable->span 으로 수정 */
            errorClass: 'error',
            /* 디폴트 클래스 이름은 error, 클래스 이름을 변경할 수 있다.*/


            errorPlacement: function(error, element) {
                if (element.is(":text") || element.is(":password")) {
                    element.parent().after(error);
                } else {
                    element.after(error);
                }
            }


        });
        $.validator.addMethod("passwordCK", function(value, element) { //어째서인지 ?는 특수문자 취급을 못 하고있다.
            return this.optional(element) || /^.*(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/.test(value);
        });
    </script>

</body>

</html>