<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<!-- meta tags -->
<meta charset="utf-8">
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


<!-- 부트스트랩 아이콘 -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

<!-- Google Font: Source Sans Pro -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
<!-- Font Awesome -->
<link rel="stylesheet" href="/resources/AdminLTE-master/plugins/fontawesome-free/css/all.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="/resources/AdminLTE-master/dist/css/adminlte.min.css">

</head>

<style>
.charity-simple-blog-btn {
	border: 0;
}

​h3 {
	text-align: center;
}
</style>
<body>
	<!-- Header -->
		<%@ include file="/WEB-INF/views/mainMap/mainHeader.jsp"%>
	<!-- Header -->
	
	<!-- Main Section -->
	<!-- Content -->
	<div class="charity-fancy-title">
		<br>
		<h2> 1:1 문의 </h2>
	</div>
	
	
	<div id="container">
		<div class="row">
			<div class="col-9">
				<button type="button" class="charity-sub-btn" onclick="location.href ='${pageContext.request.contextPath}/board/qna/write'">문의하기</button>	
		    </div>
		    <br><br><br>
		    
		  <div class="container">
		    
	        <div class="col-12"> 
	            <div class="card">
					<div class="card-body">
		        		<form id="boardForm" class="charity-volunteer-form" name="boardForm">
							<table class="table taWWble-striped projects">
								<thead>
									<tr>
										<th>글번호</th>
										<th>작성자</th>
										<th>제목</th>
										<th>날짜</th>
										<th>조회수</th>
										<th>option</th>
									</tr>
								</thead>
		
								<tbody>
								<c:forEach items="${list}" var="dto">
						        	<tr>
						            	<td>${dto.b_index}</td>
										<td>${dto.member_id}</td>
										<td>${dto.btitle}</td>
										<td>${dto.bdate}</td>
										<td>${dto.bhit}</td>	
										<td>
				                          <a class="btn btn-primary btn-sm" href="${pageContext.request.contextPath}/board/qna/${dto.b_index}">
				                              <i class="fas fa-folder">
				                              </i>
				                              View
				                          </a>
				                          <a class="btn btn-info btn-sm" href="#">
				                              <i class="fas fa-pencil-alt">
				                              </i>
				                              Edit
				                          </a>
				                          <a class="btn btn-danger btn-sm" href="#">
				                              <i class="fas fa-trash">
				                              </i>
				                              Delete
				                          </a>
				                      </td>
						       	   </tr>
								</c:forEach>  
				              </tbody>
				          </table>
						</form>
						
						<!-- Pagination -->
						<div class="charity-pagination">
							<ul class="page-numbers">
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
						<!-- Pagination -->
			        </div>
			        <!-- /.card-body -->		
	      		</div>
	      <!-- /.card -->
			</div></div>
		</div>
	</div>

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
	

<!-- AdminLTE App -->
<script src="/resources/AdminLTE-master/dist/js/adminlte.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="/resources/AdminLTE-master/dist/js/demo.js"></script>
    
</body>
</html>