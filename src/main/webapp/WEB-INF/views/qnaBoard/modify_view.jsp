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

<!-- 작성 폼 스크립트 -->
<script type="text/javascript">
	$(document).ready(function(){
		
		var token = $("meta[name='_csrf']").attr("content");
		var header = $("meta[name='_csrf_header']").attr("content");
		
		$("#updateForm").submit(function(event){         
           event.preventDefault();
          
           var b_index = $("#b_index").val();
           var btitle = $("#btitle").val();
           var bcontent = $("#bcontent").val();
           
           
           var form = {
        		 b_index: b_index,
        		 btitle: btitle,
        		 bcontent: bcontent
           };
           
           $.ajax({
             type : "POST",
             url : $(this).attr("action"),
             cache : false,
             contentType:'application/json; charset=utf-8',
             data: JSON.stringify(form), 
             //데이터를 전송하기 전에 헤더에 csrf값을 설정 (같이 넘겨줘야 post 403 error가 없다)
             beforeSend : function(csrf) {   
            	csrf.setRequestHeader(header, token)
             },
             success: function (result) {       
               if(result == "SUCCESS") {
                  $(location).attr('href', '${pageContext.request.contextPath}/board/qna')                            
               }                       
             },
             error: function (e) {
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
	
	</form>		
		
		<!-- 문의게시판 - START -->
   <div id="wrapp">
    <div id="containerr">
        <div class="inner">        
            <h2> 1:1 문의 </h2>            
           
                    <form id="updateForm" action="${pageContext.request.contextPath}/board/qna/modify">
		<table class="table">
			<tr>
				<td>글번호</td>
				<td><input type="hidden" id="b_index" name="b_index" value="${modify_view.b_index}">${modify_view.b_index}</td>
			</tr>
			<tr>
				<td>작성일</td>
				<td>${modify_view.bdate}</td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input type="text" id="btitle" name="btitle" size="50" value="${modify_view.btitle}"></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td>${modify_view.member_id}</td>
			</tr>
			
			<tr>
				<td>조회수</td>
				<td>${modify_view.bhit}</td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea cols="20" rows="10" id="bcontent" name="bcontent" >${modify_view.bcontent}</textarea></td>
			</tr>
			<tr>
				<td colspan="2">
					<button type="submit" class="btn btn-primary ">수정완료</button>
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
					<button type="button" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/board/qna'">목록</button>
				</td>
			</tr>
		</table>
                
            </form>            
        </div>
    </div>
    
		<!-- 문의게시판 - END -->
		
		<!-- Main Section -->

	<!-- Search Modal -->
	<div class="modal fade searchmodal" id="searchModal" tabindex="-1" role="dialog">
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
	
	
    
</body>
</html>