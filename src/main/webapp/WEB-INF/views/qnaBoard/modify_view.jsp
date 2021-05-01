<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="ko">
<!-- blog detail 사용 css style도 여기서 찾을 것  .charity-form-btn 생성함 color에도 추가함-->
<head>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <!-- meta tags -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <!-- csrf_meta_tag_for_jsp
    https://stackoverflow.com/questions/37383730/how-to-add-csrf-token-to-ajax-request -->
	<meta name="_csrf" content="${_csrf.token}"/>
	<meta name="_csrf_header" content="${_csrf.headerName}"/>
	
	 <!-- sweet alert cdn : https://sweetalert.js.org/guides/ -->
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    
    <title>나누셰어 - 1:1문의</title>

    <!-- CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/charity/css/bootstrap.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/charity/css/fontawesome-all.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/charity/css/flaticon.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/charity/css/slick-slider.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/charity/css/fancybox.css">
    <link href="${pageContext.request.contextPath}/resources/charity/css/jplayer.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/charity/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/charity/css/color.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/charity/css/responsive.css">
	
	<!-- 웹페이지 탭 로고이미지 삽입  -->
	<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/nanulogo_ico_convert.ico"> 
	
	<!-- header  -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
	
	<!-- ckeditor -->
	<script src = "${pageContext.request.contextPath}/resources/ckeditor/ckeditor.js"></script>
	
	<!-- new korean font from google -->
	<!-- NotoSansKR, Gothic A1 -->
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Gothic+A1:wght@100;200;300;400;500;600;700;800;900&family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
	
	<script type="text/javascript">
	
	$(document).ready(function(){
		$("#modify").submit(function(event){			
			event.preventDefault();
			
			var board_id = $("#b_index").val(); 					
			var title = $("#btitle").val(); 
			var text = $("#bcontent").val(); 
			
			// csrf
			var token = $("meta[name='_csrf']").attr("content");
			var header = $("meta[name='_csrf_header']").attr("content");
			$(document).ajaxSend(function(e, xhr, options) {
				xhr.setRequestHeader(header, token);
			});
			
			var form = {
				b_index : board_id,
				btitle : title,
				bcontent : text
			}
			
			$.ajax({
				type : "PUT",
				url : $(this).attr("action"),
				cache : false,
				dataType: 'text',
				contentType: 'application/json; charset=utf-8',
				data : JSON.stringify(form),
				success : function(result){
					console.log("result : " + result );
						if(result == "SUCCESS") {
							//$(location).attr('href', '${pageContext.request.contextPath}/board/sows/content_view/'+ form.b_index +');
							window.location.href='${pageContext.request.contextPath}/board/qna/'+ board_id;
							
							swal({
								title : "글 수정 완료" , 
								icon : "success" , 
								button : true 
							});
						}
				},
				error : function(e){
					//alert("오류가 발생했습니다.");
					swal({
						title : "오류가 발생했습니다." , 
						icon : "error" , 
						button : false 
					});
					console.log(e);
				}
			}); // ajax end
		}); // event end
	}); // ready end
</script>
<style>
/*  a 태그 후버시 밑줄, 파랑 속성 제거 */
a:hover { 
 	text-decoration: none;
 	color:#333;
}

#forimg {
	background-image: url('/resources/banner_imgs/qna_banner.jpg');
	background-repeat:no-repeat;
	background-position: center;
	width:100%;
	
}
.black-transparent {
	opacity:50%;
}
.charity-volunteer-form {
	background-color: #f9f9fb;
}

.charity-blog-social ul {
	margin:0px;
}
.charity-sub-btn {
	cursor: pointer;
}
.charity-sub-btn:hover {
	background-color: #78665A;
}
</style>	
	
</head>

<body style="background-color: #f9f9fb">
    <!-- Header -->
    <%@ include file="/WEB-INF/views/mainMap/mainHeader.jsp"%>
    <!-- Header -->
    
    <!-- Banner -->
     <div id="forimg" class="charity-subheader">
        <span class="black-transparent"></span>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                   <!--  <h1>문의 하기</h1>
                    <p>show your support</p> -->
                </div>
            </div>
        </div>
    </div>
    <!-- Banner -->

    <!-- Content -->
	<div class="charity-fancy-title " style="margin-top:70px; margin-bottom:20px;">
		<h2> 1:1 문의 </h2>
	</div> 
    <div class="charity-main-content">

        <!-- Main Section -->
		<div class="charity-main-section">
			<div class="container">
				<div class="row">
					<div class="col-md-9">
                       <form action="${pageContext.request.contextPath}/board/qna/modify" id="modify" method="post" >
                       <input type="hidden" id="b_index" name="b_index" value="${modify_view.b_index}" >
	                       <div class="charity-contact-form">
	                           <h4><span>Title</span><input type="text" id="btitle" name="btitle" value="${modify_view.btitle}"></h4><hr><br>
	                           
	                           <h4 class="mt-3">Content</h4>
	                           
	                           <p><textarea id="bcontent" name="bcontent">${modify_view.bcontent}</textarea></p>
							  
							   <!-- 에디터 -->
							   <script type="text/javascript">
		                        	var ckeditor_config = {
			        						resize_enaleb : false, //에디터 크기조절 x
			        						height:"450",
			        						enterMode : CKEDITOR.ENTER_BR,
			        						shiftEnterMode : CKEDITOR.ENTER_P,
			        						filebrowserUploadUrl : '<c:url value="${pageContext.request.contextPath}/my/board/shows/imageUpload" />?${_csrf.parameterName}=${_csrf.token}'
		        					};
		                            CKEDITOR.replace('bcontent', ckeditor_config);
		                        </script>
		                        
							   <button type="submit" id="modify" class="charity-sub-btn"><i class="fa fa-save"> 수정완료</i></button>
							   <button type="button" class="charity-sub-btn"><i class="fa fa-arrow-left"  onclick="location.href='${pageContext.request.contextPath}/board/qna/${modify_view.b_index}'"> 수정취소</i></button>
							   <!-- charity-main-btn -->
							   <!-- 버튼에 링크걸기 https://m.blog.naver.com/rain483/220529222723 -->
	                          
	                        </div>
	                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                        </form>
                        
                    	<!--   a href="plist" -->
                        <div style="float: right; margin-right:5px; text-color:2a786b;" class="mb-3"> <a href="${pageContext.request.contextPath}/board/qna" class="fa fa-list-alt" style="color:#333" > 1:1 문의 목록으로  </a></div>
                       
                    </div>

                    <!-- 우측 배너  aside -->
					<%@ include file="/WEB-INF/views/board_show/aside.jsp"%>
					<!-- aside end -->
					
                </div>
            </div>
        </div>
        <!-- Main Section -->
		
    </div>
    <!-- Content -->

    <!-- Footer -->
    <%@ include file="/WEB-INF/views/mainMap/mainFooter.jsp"%>
    <!-- Footer -->

    <!-- jQuery -->
    <script src="${pageContext.request.contextPath}/resources/charity/script/jquery.js"></script>
    <script src="${pageContext.request.contextPath}/resources/charity/script/popper.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/charity/script/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/charity/script/slick.slider.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/charity/script/progressbar.js"></script>
    <script src="${pageContext.request.contextPath}/resources/charity/script/fancybox.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/charity/script/jquery.countdown.min.js"></script>
    <script src="https://maps.googleapis.com/maps/api/js"></script>
    <script src="${pageContext.request.contextPath}/resources/charity/script/jquery.jplayer.js"></script>
    <script src="${pageContext.request.contextPath}/resources/charity/script/jplayer.playlist.js"></script>
    <script src="${pageContext.request.contextPath}/resources/charity/script/functions-main.js"></script>
</body>

</html>