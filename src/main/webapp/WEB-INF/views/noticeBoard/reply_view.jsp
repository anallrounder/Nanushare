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

  			
	</div>

	<table class="table table-hover">
		<tr>
			<th>번호</th>
			<th>글쓴이</th>
			<th>제목</th>
			<th>날짜</th>
			<th>조회수</th>
		</tr>
			
		<c:forEach items="${list}" var="dto">
        	<tr>
            	<td>${dto.b_index}</td>
				<td>${dto.member_id}</td>
				<td>
					<c:forEach begin="1" end="${end.page}">[Re]</c:forEach>
					<a href="${pageContext.request.contextPath}/restful/board/${dto.b_index}">${dto.btitle}</a></td>
				<td>${dto.bdate}</td>
				<td>${dto.bhit}</td>
       	   </tr>
       </c:forEach>  	   
	</table>
	
	<div class="container" align="center"><!--  -->
		<ul class="pagination">
			<c:if test="${pageMaker.prev}">
				<li class="page-item">
					<a href="board${pageMaker.makeQuery(pageMaker.startPage - 1)}">이전</a>
				</li>
			</c:if>
		
			<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
				<c:out value="${pageMaker.cri.pageNum == idx?'':''}" />
				<li class="page-item">
					<a href="board${pageMaker.makeQuery(idx)}">${idx}</a>
				</li>
			</c:forEach>
				
			<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
				<li class="page-item">
				 	<a href="board${pageMaker.makeQuery(pageMaker.endPage +1)}">다음</a>
				</li>
			</c:if>
		</ul>
	</div>
	
	<div align="center">
		<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
    		검색
  		</button>
  		<button type="button" class="btn btn-primary" onclick="location.href = '${pageContext.request.contextPath}/restful/notice/write'">
				글쓰기
		</button>	
  		<br>
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
                      