<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!doctype html>
<html lang="ko">

<head>

    <!-- meta tags -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <title>Main Header</title>

</head>

<body class="home">
    <!-- Header -->
    <header id="charity-header" class="charity-header-one">
        <!-- Top Strip -->
        <div class="charity-top-strip">
			
			<a href="${pageContext.request.contextPath}/main" class="charity-logo"><img src="/resources/nanulogoRe.ico" alt=""></a>
			
			<div>
				<a href="#menu" class="menu-link active"><span></span></a>
				<nav id="menu" class="menu charity-navigation">
					<ul>
						<li><a href="${pageContext.request.contextPath}/menu/about">나누셰어란?</a>
							<ul class="children">
								<li><a href="${pageContext.request.contextPath}/menu/about">나누셰어 소개</a></li>
								<li><a href="${pageContext.request.contextPath}/menu/way">찾아오셰어</a></li>
							</ul>
						</li>
						<li><a href="${pageContext.request.contextPath}/main">나눔함 안내</a></li>
						<li>
							<a href="${pageContext.request.contextPath}/donation/item/main">나누기</a>
							<ul class="children">
								<li><a href="${pageContext.request.contextPath}/donation/item/main">물품 나누기</a></li>
								<li><a href="${pageContext.request.contextPath}/donation/money/main">돈기부여하기</a></li>
							</ul>
						</li>
						<li><a href="${pageContext.request.contextPath}/board/shows/list">나눔 인증</a></li>
						<li><a href="${pageContext.request.contextPath}/my/event/check">이벤트</a>
							<ul class="children">
								<li><a href="${pageContext.request.contextPath}/my/event/check">출석체크</a></li>
								<li><a href="${pageContext.request.contextPath}/event/test">테스트</a></li>
								<li><a href="${pageContext.request.contextPath}/event/game">게임</a></li>
							</ul>
						</li>
						<li><a href="${pageContext.request.contextPath}/board/notice">더하기</a>
							<ul class="children">
								<li><a href="${pageContext.request.contextPath}/board/notice">공지사항</a></li>
								<li><a href="${pageContext.request.contextPath}/board/faq">FAQ</a></li>
								<li><a href="${pageContext.request.contextPath}/board/qna">문의하기</a></li>
							</ul>
						</li>	
					</ul>
				</nav>
			</div>
            
            <div class="float-right">
				<!-- all 버튼 header -->
				<sec:authorize access="isAnonymous()"> 
					<div class="all-header">
					<a href="${pageContext.request.contextPath}/loginPage" class="charity-strip-btn charity-bgcolor" >로그인</a>
					
					<form id="signUp">
						<a href="${pageContext.request.contextPath}/signUpForm" class="charity-strip-btn charity-bgcolor">회원가입</a>
					</form>
					
					</div>
					
				</sec:authorize>	
																																			
				<!-- 로그인됐을때 버튼 header -->
				<div class="user-header">
				<sec:authorize access="hasRole('USER')">
					<c:forEach items="${username}" var="username">
	                   <span>${username}님</span>
	                </c:forEach> 
					
					<a href="${pageContext.request.contextPath}/my/mypage" class="charity-strip-btn charity-bgcolor">마이페이지</a>

					<form action="/member/logout" method="post" id="mlogout">
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
						<a href="#" class="charity-strip-btn charity-bgcolor" onclick="document.getElementById('mlogout').submit();">로그아웃</a>
					</form>
				</sec:authorize>
				</div>
							
				<!-- 관리자 버튼 header -->	
				<div class="admin-header">		
				<sec:authorize access="hasRole('ADMIN')"> 
					<c:forEach items="${username}" var="username">
                    	<span>${username}님</span>
                    </c:forEach>
                   
					<a href="${pageContext.request.contextPath}/admin/stat" class="charity-strip-btn charity-bgcolor">관리자페이지</a>
					<form action="/member/logout" method="post" id="mlogout">
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
						<a href="#" class="charity-strip-btn charity-bgcolor" onclick="document.getElementById('mlogout').submit();">로그아웃</a>
					</form>
					
				</sec:authorize>
				</div>
			</div>
		</div>
         
        <!-- Top Strip -->
    </header>
    <!-- Header -->
    
    <!-- jQuery -->
    
    <!-- <script src="/resources/charity/script/jquery.js"></script>
    <script src="/resources/charity/script/popper.min.js"></script> -->
    <!-- <script src="/resources/charity/script/functions-main.js"></script> --><!--추가-->
   
</body>

</html>