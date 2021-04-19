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

<meta name="_csrf" content="${_csrf.token}">
<meta name="_csrf_header" content="${_csrf.headerName}">

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

<!-- QNA게시판 리스트 -->
<link rel="stylesheet" href="/resources/qna/css/common/common.css"/>

<!-- 부트스트랩 아이콘 -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

<!-- Ajax -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- 게시글 삭제 -->
<script type="text/javascript">
	$(document).ready(function (){
		
		var token = $("meta[name='_csrf']").attr("content");
		var header = $("meta[name='_csrf_header']").attr("content");
		
		$('#delete').click(function(event){
			event.preventDefault();
			
			var b_index = $("#b_index").val();
			var url = "${pageContext.request.contextPath}/board/qna/modify/" + b_index
	
			$.ajax({
				type : 'DELETE',
				url : url,
				cache : false,
				beforeSend : function(csrf) {   
		            	csrf.setRequestHeader(header, token)
		        },
				success: function(result){
					console.log(result);
					if(result == "SUCCESS"){
						alert('삭제 완료'); 
						$(location).attr('href', '${pageContext.request.contextPath}/board/qna') 
					}
				},
				error:function(e){
					console.log(e);
		               alert('삭제 실패');
		               location.reload(); // 실패시 새로고침하기
				}
			})
		});	
	});	
</script>

<style>
.charity-simple-blog-btn {
	border: 0;
}

​h3 {
	text-align: center;
}

</style>
</head>



 
<body>
	<!-- Header -->
		<%@ include file="/WEB-INF/views/mainMap/mainHeader.jsp"%>
	<!-- Header -->

		<!-- Main Section -->
		
		
		<!-- 문의게시판 - START -->
   <div id="wrapp">
    <div id="containerr">
        <div class="inner">        
            <h2> 1:1 문의 </h2>            
          
                    <form id="updateForm" action="${pageContext.request.contextPath}/board/qna/reply" method="post">
		<table class="table">
			<tr>
				<td>글번호</td>
				<td><input type="hidden" id="b_index" name="b_index" value="${content_view.b_index}">${content_view.b_index}</td>
			</tr>
			<tr>
				<td>작성일</td>
				<td>${content_view.bdate}</td>
			</tr>
			<tr>
				<td>제목</td>
				<td>${content_view.btitle}</td>
			</tr>
			<tr>
				<td>작성자</td>
				<td>${content_view.member_id}</td>
			</tr>
			
			<tr>
				<td>조회수</td>
				<td>${content_view.bhit}</td>
			</tr>
			<tr>
				<td>내용</td>
				<td>${content_view.bcontent}</td>
			</tr>
			
			<tr>
				<td>관리자 답변</td>
				<c:forEach items="${reply_view}" var="reply">
				<td>${reply.rcontent}</td>
				</c:forEach>
				
			</tr>
			
			<sec:authorize access="hasRole('ADMIN')"> 
			<input type="hidden" name="b_index" value="${content_view.b_index}">
			<tr>
				<td>답변</td>
				<td><textarea cols="20" rows="10" id="rcontent" name="rcontent"></textarea></td>
			</tr>
			</sec:authorize>
			
			<tr>
				<td colspan="2">
				
				<sec:authentication property="principal" var="buttonhidden" />
          		<sec:authorize access="isAuthenticated()">   
   
					<!-- 현재 접속된 닉네임과 댓글보드에 저장된 닉네임을 비교해서 일치 하면 보이게 함 -->
					<c:if test="${buttonhidden.username eq content_view.member_id}">
				
					<button type="button" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/board/qna/modify/${content_view.b_index}'">수정</button>
					<button type="button" id= "delete" class="btn btn-primary">삭제</button>&nbsp;&nbsp;
					
					</c:if>
				</sec:authorize>
				
				<sec:authorize access="hasRole('ADMIN')"> 
					<button type="submit" class="btn btn-primary">답변등록</button>
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
				</sec:authorize>
				
					<button type="button" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/board/qna'">목록</button>
				</td>
			</tr>
		</table>
                
            </form>            
        </div>
    </div>
    
		<!-- 문의게시판 - END -->
		
		<!-- Main Section -->


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