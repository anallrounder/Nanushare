<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html lang="en">

<head>

    <!-- meta tags -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <title>Charity</title>

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
	
	<!-- SIDE BAR 1 CSS -->
    <link rel="stylesheet" href="/resources/sidebar/css/styles.css">
    
    <!-- Notice board Bootstrap -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<style>
   	/* 	.bar-move {
   		transform: translateY(-150px);
   		transition-duration: 2s;
   		transition-timing-function: linear;
   		}
     */
     
    </style>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.22/css/jquery.dataTables.css">
	<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.js"></script>
 	
	<script type="text/javascript">
   	$(document).ready(function(){
      $("#updateForm").submit(function(event){         
           event.preventDefault();     
           var b_index = $("#b_index").val();
           var member_id = $("#member_id").val();
           var btitle = $("#btitle").val();
           var bcontent = $("#bcontent").val();              
           
           console.log(member_id);
           console.log(btitle);
           console.log(bcontent);
           console.log($(this).attr("action"));    
           
           var form = {
        		 b_index: b_index,
                 member_id: member_id,
                 bcontent: bcontent,
                 btitle: btitle
           };

           $.ajax({
             type : "PUT",
             url : $(this).attr("action"),
             cache : false,
             contentType:'application/json; charset=utf-8', // 인코딩 데이터 변환
             data: JSON.stringify(form), // 보안 문제 해결을 위해 stringify 메소드를 사용
             success: function (result) {       
               if(result == "SUCCESS"){
                  // update가 완료되었으면 리스트 페이지로 이동        
                  $(location).attr('href', '${pageContext.request.contextPath}/restful/notice/')                            
               }                       
             },
             error: function (e) {
                 console.log(e);
             }
         })            
       }); // end submit()       
   	}); // end ready()
	</script>
	<script type="text/javascript">
	$(document).ready(function (){
		$('#delete').click(function(event){
			event.preventDefault();
			console.log("ajax 호출전");		
			//var trObj = $(this).parent().parent(); 
 
			$.ajax({
				type : 'DELETE',
				url : $(this).attr("href"),
				cache : false,
				success: function(result){
					console.log(result);
					if(result=="SUCCESS"){
						if(result == "SUCCESS"){     
                  					$(location).attr('href', '${pageContext.request.contextPath}/restful/notice/')                            
               				}  
					}
				},
				error:function(e){
					console.log(e);
				}
			})
		});	
	});	
	</script>
	
</head>

<body>
    <%@ include file="/WEB-INF/views/mainMap/mainHeader.jsp"%>


    <!-- Banner -->
    <div class="charity-subheader">
        <span class="black-transparent"></span>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h1> 공지사항 </h1>
                </div>
            </div>
        </div>
    </div>
   
    <!-- Sidebar -->
	   <div class="l-navbar" id="navbar">
        <nav class="nav">
            <div>
                <div class="nav__brand">
                    <ion-icon name="menu-outline" class="nav__toggle" id="nav-toggle"></ion-icon>
                    <a href="#" class="nav__logo"> 더하기 </a>
                </div>
                <div class="nav__list">
                    <a href="#" class="nav__link active">
                        <ion-icon name="calendar-outline" class="nav__icon"></ion-icon>
                        <span class="nav_name"> 공지사항 </span>
                    </a>
                </div>  
				<div class="nav__list">
                    <a href="#" class="nav__link active2">
                        <ion-icon name="calendar-outline" class="nav__icon"></ion-icon>
                        <span class="nav_name"> 문의하기 </span>
                    </a>
                </div>  
        </nav>
    </div>
    
    <!-- Content -->
    <div class="charity-main-content">

        <!-- Main Section -->
        <div class="charity-main-section">
            <div class="container">
                <div class="row">

  	<form id="updateForm" action="${pageContext.request.contextPath}/restful/notice/${content_view.b_index}" method="post">
		<table class="table">
			<input type="hidden" id="b_index" value="${content_view.b_index}">
			<tr>
				<td>번호</td>
				<td>${content_view.b_index}</td>
			</tr>
			<tr>
				<td>조회수</td>
				<td>${content_view.bhit}</td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" id="member_id" value="${content_view.member_id}"></td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input type="text" id="btitle" value="${content_view.btitle}"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea rows="10" id="bcontent">${content_view.bcontent}</textarea></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" class="btn btn-primary" value="수정">&nbsp;&nbsp;
					<button type="button" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/restful/notice/${content_view.b_index}'" id="delete">삭제</button>&nbsp;&nbsp;
					<button type="button" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/restful/notice/reply/${content_view.b_index}'">답변</button>&nbsp;&nbsp;
					<button type="button" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/restful/notice'">목록</button>
				</td>
			</tr>
		</table>
	</form>		
</div>
</div>
</div>
</div>
    <!-- Content -->

    <%@ include file="/WEB-INF/views/mainMap/mainFooter.jsp"%>

    <!-- Search Modal -->
    <div class="modal fade searchmodal" id="searchModal" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-body">
                    <a href="#" class="charity-close-btn" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></a>
                    <form>
                        <input type="text" value="Type Your Keyword" onblur="if(this.value == '') { this.value ='Type Your Keyword'; }" onfocus="if(this.value =='Type Your Keyword') { this.value = ''; }">
                        <input type="submit" value="">
                        <i class="fa fa-search"></i>
                    </form>
                </div>
                
            </div>
        </div>
    </div>

    <!-- jQuery -->
    <script src="/resources/charity/script/jquery.js"></script>
    <script src="/resources/charity/script/popper.min.js"></script>
    <script src="/resources/charity/script/bootstrap.min.js"></script>
    <script src="/resources/charity/script/slick.slider.min.js"></script>
    <script src="/resources/charity/script/progressbar-main.js"></script> <!-- progressbar 복붙해서 사용  -->
    <script src="/resources/charity/script/fancybox.min.js"></script>
    <script src="/resources/charity/script/jquery.countdown.min.js"></script>
    <script src="https://maps.googleapis.com/maps/api/js"></script>
    <script src="/resources/charity/script/jquery.jplayer.js"></script>
    <script src="/resources/charity/script/jplayer.playlist.js"></script>
    <script src="/resources/charity/script/functions-main.js"></script> <!-- fuctions 복붙해서 사용 -->
    
    <!-- IONICONS -->
    <script src="https://unpkg.com/ionicons@5.2.3/dist/ionicons.js"></script>
    
    <!-- Sidebar JS -->
    <script src="/resources/sidebar/js/main.js"></script>
    
    <!-- jQuery -->
<script src="/resources/plugins/jquery/jquery.min.js"></script>
<!-- jQuery UI 1.11.4 -->
<script src="/resources/plugins/jquery-ui/jquery-ui.min.js"></script>
<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->


</body>

</html>
                      