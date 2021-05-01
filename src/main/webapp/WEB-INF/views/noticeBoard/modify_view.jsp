<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<!-- meta tags -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">


<meta name="_csrf" content="${_csrf.token}">
<meta id="_csrf_header" name="_csrf_header"	content="${_csrf.headerName}">

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

<!-- 부트스트랩 아이콘 -->
<link rel="stylesheet"	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

<!-- ckeditor -->
<script src = "${pageContext.request.contextPath}/resources/ckeditor/ckeditor.js"></script>

<!-- 상단 로그인버튼 위치 -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
	
</head>

<style>
.charity-simple-blog-btn {
	border: 0;
}
.charity-blog-social ul {
   margin:0px;
}

​h3 {
	text-align: center;
}

#forimg {
	background-color: #eaf3fa;
	background-image: url('/resources/charity/qna/notice_banner2.jpg');
	background-size: 500px;
	background-repeat: no-repeat;
	background-position: center;	
}

.black-transparent {
	opacity: 50%;
}

.charity-volunteer-form {
	background-color: #f9f9fb;
}
.charity-sub-btn {
	cursor: pointer;
}
.charity-sub-btn:hover {
	background-color: #78665A;
}
/*  a 태그 후버시 밑줄, 파랑 속성 제거 */
a:hover { 
 	text-decoration: none;
 	color:#333;
}
</style>

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
					
					 <form id="updateForm" action="${pageContext.request.contextPath}/board/notice/modify" method="post">
							<!-- <form action="/board/shows/modify" id="modify" method="post" > -->
							<input type="hidden" id="b_index" name="b_index" value="${modify_view.b_index}" >
							<div class="charity-contact-form">
	                           <h4><span>Title</span></h4>
	                           <input type="text" id="btitle" name="btitle" value="${modify_view.btitle}" >
	                         	
	                           <br>
	                           
	                           <h4 class="mt-5">Content</h4>
	                           <%-- <p><textarea class="form-control" name="bcontent" rows="20" style="width:100%;">${modify_view.bcontent}</textarea></p><br> --%>
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
							   <button type="button" class="charity-sub-btn"><i class="fa fa-arrow-left"  onclick="location.href='${pageContext.request.contextPath}/board/notice/${modify_view.b_index}'">수정취소</i></button>							 
	                        </div>
	                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                        </form>
                        
                        <div style="float: right; margin-right:5px; text-color:2a786b;"><a href="${pageContext.request.contextPath}/board/notice" class="fa fa-list-alt" style="color:#333" > 공지사항 목록으로 </a></div>
                        
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
	<script src="/resources/charity/script/functions-main.js"></script>

	<!-- 자주묻는질문 -->
	<script type="text/javascript"
		src="/resources/faq/js/jquery-1.10.2.min.js"></script>
	<script type="text/javascript"
		src="/resources/faq/bootstrap/js/bootstrap.min.js"></script>

</body>
</html>