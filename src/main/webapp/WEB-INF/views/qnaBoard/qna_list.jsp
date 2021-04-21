<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>

<!-- meta tags -->
<!-- <meta charset="utf-8"> -->
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title> 나누셰어 - 공지사항 </title>

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

<!-- 웹페이지 탭 로고이미지 삽입  -->
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/nanulogo_ico_convert.ico"> 

<!-- 부트스트랩 아이콘 -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

<!-- Google Font: Source Sans Pro -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
<!-- Font Awesome -->
<link rel="stylesheet" href="/resources/AdminLTE-master/plugins/fontawesome-free/css/all.min.css">
<!-- Theme style -->
<!-- <link rel="stylesheet" href="/resources/AdminLTE-master/dist/css/adminlte.min.css"> -->

<!-- header  -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">


<style>
/* body {
	background-color: f9f9fb;
}  */
.charity-simple-blog-btn {
	border: 0;
}

​h3 {
	text-align: center;
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

</style>

</head>


<body style="background-color: f9f9fb">
	<!-- Header -->
	<%@ include file="/WEB-INF/views/mainMap/mainHeader.jsp"%>
	
	<!-- Main Section -->
	
	<!-- Banner -->
    <div id="forimg" class="charity-subheader">
       <span class="black-transparent"></span>
        <div class="container">
            <div class="row">
                <div class="col-md-12"> 
                   <!--  <h1>1:1 문의</h1> -->
                   <!--  <p>show your support</p> -->
                </div>
            </div>
        </div>
    </div>
    <!-- Banner -->
	
	
	<!-- Content -->
	<div class="charity-fancy-title " style="margin-top:70px; margin-bottom:20px;">
		<h2> 1:1 문의 </h2>
	</div> 
	<!-- <a href='https://www.freepik.com/vectors/people'>People vector created by freepik - www.freepik.com</a> -->
	
	<div id="container">
		<div class="row">
			<!-- <div class="container">
						</div> -->
			
		<div class="container" style="height:90%" >
		    
	        <div class="col-12"> 
	           <!--  <div class="card"> -->
					<!-- <div class="card-body"> -->
						
						<!-- 문의하기 버튼 -->
						<div class="col-md-2" style="float: right; padding-right:30px;">
							<button type="button" class="charity-sub-btn" onclick="location.href ='${pageContext.request.contextPath}/board/qna/write'" 
							style="width:100px; height:40px; font-size:16px; mrgin-top:0px;"><i class="fa fa-question" ></i>  문의하기</button>	
					    </div>
						<!-- 문의하기 버튼 -->
					
						
		        		<form id="boardForm" class="charity-volunteer-form" name="boardForm" style="margin-bottom:0px; padding-bottom:10px;">
							<table class="table taWWble-striped projects" >
							<!-- <table class="table table-light table-hover " > -->
								<colgroup>
			                        <col width="10%" />
			                        <col width="35%" />
			                        <col width="25%" />
			                        <col width="20%" />
			                        <col width="10%" />
			                    </colgroup>
								
								<thead><!-- table-dark -->
									<tr bgcolor="#ccccc">
									<!-- <tr ffd7b9 bgcolor="#d1c997"> --><!-- ffd7b9 bgcolor="#d1c997" style="opacity:70%"--> 
										<th style="border-left: none;" >글번호</th>
										<th>제목</th >
										<th>작성자</th>
										<th>날짜</th>
										<th style="border-right: none;">조회수</th>
									</tr>
								</thead>
		
								<tbody>
								<c:forEach items="${list}" var="dto">
						        	<tr>	
						            	<td style="border-left: none;"  >${dto.b_index}</td>
										<td><a href="${pageContext.request.contextPath}/board/qna/${dto.b_index}">${dto.btitle}</a></td>
										<td>${dto.member_id}</td>
										<td>${dto.bdate}</td>
										<td style="border-right: none;">${dto.bhit}</td>	
						       	   </tr>
								</c:forEach>  
				              </tbody>
				          </table>
				          
						</form>
						
						<!-- Pagination -->
						<!-- <div > -->
						<div  style="margin:30px;">
						<div class="charity-pagination" >
							<ul class="page-numbers" >
								<li>
									<c:if test="${pageMaker.prev}">
										<a class="previous page-numbers" href="${pageContext.request.contextPath}/board/qna${pageMaker.makeQuery(pageMaker.startPage - 1) }"><i class="fa fa-angle-left"></i>prev</a>
									</c:if>
								</li>
								
								<li>
									<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
									<c:out value="${pageMaker.cri.pageNum == idx?'':''}" />
										<a href="${pageContext.request.contextPath}/board/qna${pageMaker.makeQuery(idx)}">${idx}</a>
									</c:forEach>
								</li>
								
								<li>
									<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
										<a class="next page-numbers" href="${pageContext.request.contextPath}/board/qna${pageMaker.makeQuery(pageMaker.endPage +1) }">next<i class="fa fa-angle-right"></i></a>
									</c:if>
								</li>
							</ul>
						</div>
						</div>
						
						
						<!-- 	이부분 공백 더 줘야하는데 방법 찾아야함 -->
						
						<!-- </div> -->
						<!-- Pagination -->
			      <!--   </div> -->
			        <!-- /.card-body -->		
	      		<!-- </div> -->
	      <!-- /.card -->
			</div></div>
		</div>
	</div>
	<!-- content -->
	
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
		
	    
</body>


</html>