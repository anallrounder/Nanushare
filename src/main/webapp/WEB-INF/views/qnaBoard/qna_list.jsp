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

<!-- 문의 게시판 -->
<!-- <link rel="stylesheet" type="text/css" href="/resources/qna/css/common/common.css"/>
 -->
 
 
<!-- 부트스트랩 아이콘 -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

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
		<h2> 1:1 문의 </h2>
	</div>
	
	<div id="wrap">
    <div id="container">
        <div class="inner">        
            <form id="boardForm" name="boardForm">
                <table width="100%" class="table01">
                    <colgroup>
                        <col width="10%" />
                        <col width="25%" />
                        <col width="10%" />
                        <col width="15%" />
                        <col width="20%" />
                    </colgroup>
		<table class="table table-hover">
		<tr>
			<th>글번호
			<th>작성자
			<th>제목
			<th>날짜
			<th>조회수
		</tr>
		
		<c:forEach items="${list}" var="dto">
        	<tr>
            	<td>${dto.b_index}</td>
				<td>${dto.member_id}</td>
				<td>
					<c:forEach begin="1" end="${end.page}"></c:forEach>
					<a href="${pageContext.request.contextPath}/board/qna/${dto.b_index}">${dto.btitle}</a></td>
				<td>${dto.bdate}</td>
				<td>${dto.bhit}</td>	
       	   </tr>
       </c:forEach>  
	</table>
                </table>
            </form>            
            <div class="btn_right mt15">
                <button type="button" class="btn black mr5" onclick="location.href ='${pageContext.request.contextPath}/board/qna/write'">
				문의하기
				</button>	
            </div>
        </div>
    </div>
</div>
	<div align="center">
		<ul class="pagination justify-content-center">
			<c:if test="${pageMaker.prev}">
				<li class="page-item">
					<a href="${pageContext.request.contextPath}/board/qna${pageMaker.makeQuery(pageMaker.startPage - 1)}">이전</a>
				</li>
			</c:if>
		
			<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
				<c:out value="${pageMaker.cri.pageNum == idx?'':''}" />
				<li class="page-item">
					<a href="${pageContext.request.contextPath}/board/qna${pageMaker.makeQuery(idx)}">${idx}</a>
				</li>
			</c:forEach>
				
			<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
				<li class="page-item">
				 	<a href="${pageContext.request.contextPath}/board/qna${pageMaker.makeQuery(pageMaker.endPage +1)}">다음</a>
				</li>
			</c:if><br>
		</ul>
	</div>
		
	
	<!-- 검색창 ---------------------------------------->
	<div class="row" style="clear:left;width:200px;margin:auto;float:left;">
	<div class="col-lg-12">
		<form id="searchForm" action="/noticeBoard/notice_list" method="get">
			<select name="type">
				<!-- <option value="">전체보기</option> -->
				<option value="T">글제목</option>
				<option value="C">내용</option>
				<option value="W">작성자</option>
				<option value="TC">제목+내용</option>
			</select>
			<input type="text" name="keyword" value="${pageMaker.cri.keyword}"/>
			<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
			<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
		</form>
	</div>
	</div>
		
	<div align="">
		<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
    		검색
  		</button>
	</div>	
		<!-- Main Section -->
					</div>
				</div>

			</div>
		</div>
	</div>
	<!-- Main Section -->

	<!-- Search Modal -->
	<div class="modal fade searchmodal" id="searchModal" tabindex="-1"
		role="dialog">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-body">
					<a href="/resources/charity/#" class="charity-close-btn"
						data-dismiss="modal" aria-label="Close"><span
						aria-hidden="true">&times;</span></a>
					<form>
						<input type="text" value="Type Your Keyword"
							onblur="if(this.value == '') { this.value ='Type Your Keyword'; }"
							onfocus="if(this.value =='Type Your Keyword') { this.value = ''; }">
						<input type="submit" value=""> <input type="button"
							value="취소" onClick="history.go(-2)"
							class="charity-simple-blog-btn"> <a
							href="${pageContext.request.contextPath}/my/mypage"
							class="charity-simple-blog-btn">저장</a> <i class="fa fa-search"></i>
					</form>
				</div>

			</div>
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
	
	 <!-- 자주묻는질문 -->
    <script type="text/javascript" src="/resources/faq/js/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="/resources/faq/bootstrap/js/bootstrap.min.js"></script>
    
</body>
</html>