<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html >
<html>
<head>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	
	<!-- ckeditor -->
	<script src = "${pageContext.request.contextPath}/resources/ckeditor/ckeditor.js"></script>

  	<!-- meta tags -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <!-- csrf -->
    <meta name="_csrf" content="${_csrf.token}">
    <meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}">
    
<title>나누셰어 - 문의하기</title>

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

	<!-- 상단 로그인버튼 위치 -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
	

</head>
<style>
.charity-simple-blog-btn {
	border: 0;
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
		<div class="container">
			<form action="${pageContext.request.contextPath}/board/notice/write" method="post">
				<table class="table">
					 <tr>
						<td>이름</td>
						<td><sec:authentication property="principal.member.name" /></td>
					</tr>
					<tr>
						<td>제목</td>
						<td><input type="text" id="btitle" name="btitle" size="50"></td>
					</tr>
				
					<tr>
						<td>내용</td>
						<td><textarea cols="20" rows="10" id="bcontent"
								name="bcontent"></textarea></td>
					</tr>
					<tr>
						<td colspan="2"><input class="btn btn-primary" type="submit"
							value="입력"> &nbsp;&nbsp;
							<button type="button" class="btn btn-primary"
								onclick="location.href = '${pageContext.request.contextPath}/board/notice'">목록</button>
						</td>
					</tr>
				</table>
				 <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	                        <input type="hidden" id="_csrf_header" name="_csrf_header" value="${_csrf.headerName}" />
                        </form>

			<!-- Main Section -->
		</div>
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
    <script src="${pageContext.request.contextPath}/resources/charity/script/jquery.jplayer.js"></script>
    <script src="${pageContext.request.contextPath}/resources/charity/script/jplayer.playlist.js"></script>
    <script src="${pageContext.request.contextPath}/resources/charity/script/functions.js"></script>

</body>
</html>