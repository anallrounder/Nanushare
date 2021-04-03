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
    <header id="charity-header" class="charity-header-one" style="position:relative;z-index:2 ;">
     
        <!-- Top Strip -->
        <div class="charity-top-strip">
            <div class="container-fluid px-0">
                <div class="row">
                 <div class="col-3">
                 	<a href="${pageContext.request.contextPath}/main" class="charity-logo" style="width:200px;height:100px; margin: 0px 0px 0px 20px;"><img src="/resources/nanulogo.png" alt=""></a>
                 </div>
                 
                 <div class="col-6">
                        <div class="float-center">
                            <a href="#menu" class="menu-link active"><span></span></a>
                            <nav id="menu" class="menu charity-navigation">
                            
                                <ul>
                                    <!-- <li class="active"><a href="index.html">Home</a></li> -->
                                    <li style="padding: 0px 40px 0px 50px"><a href="${pageContext.request.contextPath}/menu/about" style="font-size: 20px;">나누셰어란?</a>
                                        <ul class="children">
                                            <li><a href="${pageContext.request.contextPath}/menu/about">나누셰어 소개</a></li>
                                            <li><a href="${pageContext.request.contextPath}/menu/way">찾아오셰어</a></li>
                                        <!--     <li><a href="event-detail.html">Event Detail</a></li> -->
                                        </ul>
                                    </li>
                                      <li style="padding: 0px 40px 0px 30px"><a class="mainMap-top" href="#" style="font-size: 20px; display: scroll;">나눔함 안내</a>
                                       <!--  <ul class="children">
                                            <li><a href="cause-list.html">Cause List</a></li>
                                            <li><a href="cause-grid.html">Cause Grid</a></li>
                                            <li><a href="cause-detail.html">Cause Detail</a></li>
                                        </ul> -->
                                    </li>
                                    <li style="padding: 0px 40px 0px 30px"><a href="${pageContext.request.contextPath}/donation/item/main" style="font-size: 20px;">나누기</a>
                                        <ul class="children">
                                            <li><a href="${pageContext.request.contextPath}/donation/item/main">물품 나누기</a></li>
                                            <li><a href="${pageContext.request.contextPath}/donation/money/main">돈기부여하기</a></li>
                                            <!-- <li><a href="blog-detail.html">Cause Detail</a></li> -->
                                        </ul>
                                    </li>
                                      <li style="padding: 0px 40px 0px 30px"><a href="${pageContext.request.contextPath}/board/shows/list" style="font-size: 20px; ">나눔 인증</a>
                                       <!--  <ul class="children">
                                            <li><a href="team-grid.html">Team Grid</a></li>
                                            <li><a href="team-classic.html">Team Classic</a></li>
                                            <li><a href="team-detail.html">Team Detail</a></li>
                                        </ul> -->
                                    </li>
                                    <li style="padding: 0px 40px 0px 30px"><a href="${pageContext.request.contextPath}/event/check"style="font-size: 20px;">이벤트</a>
                                        <ul class="children">
                                            <li><a href="${pageContext.request.contextPath}/event/check">출석체크</a></li>
                                            <li><a href="${pageContext.request.contextPath}/event/test">테스트</a></li>
                                            <li><a href="${pageContext.request.contextPath}/event/game">게임</a></li>
                                           <!--  <li><a href="prayer-detail.html">Prayer De1tail</a></li>
                                            <li><a href="404.html">404 Error</a></li>
                                            <li><a href="search-result.html">Search Result</a></li> -->
                                        </ul>
                                    </li>
                                    <li style="padding: 0px 40px 0px 30px"><a href="${pageContext.request.contextPath}/restful/notice" style="font-size: 20px;">더하기</a>
                                     	<ul class="children">
                                            <li><a href="${pageContext.request.contextPath}/restful/notice">공지사항</a></li>
                                            <li><a href="${pageContext.request.contextPath}/restful/qna">문의하기</a></li>
                                    	</ul>
                                    </li>	
                              
                         
                                </ul>
                             <!--   <span class="float-right">
                                    <a href="#" class="charity-strip-btn charity-bgcolor" style="width:100px;height:30px;">Sign up</a>
                          			<a href="#" class="charity-strip-btn charity-bgcolor" style="width:100px;height:30px;">Sign in</a>
                                </span>  -->
                             
                            </nav>
                          <!--   <div class="float-right">
                             <ul class="charity-header-options" style="text-align: center"> -->
                             <!--    <li><a href="#" data-toggle="modal" data-target="#searchModal"><i class="fas fa-search"></i></a></li>
                                <li><a href="#"><i class="fab fa-opencart"></i></a> <div class="charity-cart-box"> <p>No products in the cart.</p> </div> </li>
              -->
                                <%-- <li><a href="${pageContext.request.contextPath}/signUpForm" class="charity-strip-btn charity-bgcolor" style="width:100px;height:30px; padding: 10px 0px 0px 6px; margin: -75px -80px 0px 0px;">회원가입</a></li>
                          		<li><a href="#" class="charity-strip-btn charity-bgcolor" style="width:100px;height:30px;">Sign in</a></li>
                                 --%>
                                <!-- all 버튼 header -->
			
                         <!--    </ul> -->
                            
                          </div>
                    </div>
                    <div class="col-3">
                    <div class="charity-logo">
		             <!-- all 버튼 header -->
		           <sec:authorize access="isAnonymous()"> 
		            
		            	<a href="${pageContext.request.contextPath}/loginPage" class="charity-strip-btn charity-bgcolor" style="width:90px;height:40px; white-space: nowrap; padding: 13px 0px 0px 20px; margin: -10px -310px 0px 0px;">로그인</a>
						<a href="${pageContext.request.contextPath}/signUpForm" class="charity-strip-btn charity-bgcolor" style="width:90px;height:40px; white-space: nowrap; padding: 13px 10px 0px 15px; margin: -10px -420px 0px 0px;">회원가입</a>
				   
				 </sec:authorize>
				
				
				 <!-- 로그인됐을때 버튼 header -->
				<sec:authorize access="hasRole('USER')">
					<c:forEach items="${username}" var="username">
	                   <a href="#" style="white-space: nowrap; margin: 0px 450px 0px 100px; color: #ffffff; font-size: 16px; float: right;">${username}님</a>
	                </c:forEach> 
					<a href="${pageContext.request.contextPath}/my/mypage" class="charity-strip-btn charity-bgcolor" style="width:90px; height:40px; white-space: nowrap; padding: 12px 0px 0px 7px; margin: -35px 300px 0px 0px;">마이페이지</a>

					<form action="/member/logout" method="post" id="mlogout">
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
						<a href="#"
							class="charity-strip-btn charity-bgcolor"
							onclick="document.getElementById('mlogout').submit();"
							style="width: 90px; height: 40px; white-space: nowrap; padding: 13px 0px 0px 15px; margin: -35px -200px 0px 0px;">로그아웃</a>
					</form>
				</sec:authorize>
							
				<!-- 관리자 버튼 header -->			
				<sec:authorize access="hasRole('ADMIN')"> 
						
					<c:forEach items="${username}" var="username">
                    	<p style="white-space: nowrap;  margin: 0px 450px 0px 100px; color: #ffffff; font-size: 16px; float: right;">${username}님</p>
                    </c:forEach> 
					<a href="${pageContext.request.contextPath}/admin/donation" class="charity-strip-btn charity-bgcolor" style="width:95px;height:40px; white-space: nowrap; padding: 12px 0px 0px 3px; margin: -35px 300px 0px 0px;">관리자페이지</a>
					<form action="/member/logout" method="post" id="mlogout">
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
						<a
							href="#"
							class="charity-strip-btn charity-bgcolor"
							onclick="document.getElementById('mlogout').submit();"
							style="width: 90px; height: 40px; white-space: nowrap; padding: 13px 0px 0px 15px; margin: -35px -200px 0px 0px;">로그아웃</a>
						
					</form>
				</sec:authorize>
				</span>
			</div>
               </div>
                </div>
            </div>
            
          <!--   <aside class="col-12"> 
                        <ul class="charity-header-options">  -->
                          <!-- all 버튼 header -->
                        <%--   <sec:authorize access="isAnonymous()"> 	
                        
                          <li><a href="${pageContext.request.contextPath}/loginPage" class="charity-strip-btn charity-bgcolor" style="width:70px;height:40px; white-space: nowrap; padding: 13px 0px 0px 3px; margin: -90px 0px 0px 0px;">로그인</a></li>
                          <li><a href="${pageContext.request.contextPath}/signUpForm" class="charity-strip-btn charity-bgcolor" style="width:70px;height:40px; white-space: nowrap; padding: 13px 0px 0px 0px; margin: -90px 0px 0px 0px;">회원가입</a></li>
                         </sec:authorize>
                          --%>
                         
                         <!-- 로그인됐을때 버튼 header -->
                       <%--   <sec:authorize access="hasRole('USER')">
                        
				             <c:forEach items="${username}" var="username">
                          	<li><p style="white-space: nowrap; margin: -85px 10px 0px 0px; color: #ffffff; font-size: 16px">${username}님</p></li>
                          	</c:forEach> 
							<li><a href="${pageContext.request.contextPath}/my/mypage" class="charity-strip-btn charity-bgcolor" style="width:70px;height:40px; white-space: nowrap; padding: 12px 0px 0px 6px; margin: -90px 0px 0px 0px;">마이페이지</a></li>
							
							<li><form action="/member/logout" method="post" id="mlogout">
								<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
								<a
									href="#"
									class="charity-strip-btn charity-bgcolor"
									onclick="document.getElementById('mlogout').submit();"
									style="width: 70px; height: 40px; white-space: nowrap; padding: 13px 0px 0px 0px; margin: -90px 0px 0px 0px;">로그아웃</a>
						
							</form></li>
						</sec:authorize> --%>
						
							<!-- 관리자 버튼 header -->
						<%-- <sec:authorize access="hasRole('ADMIN')"> 
						
						<c:forEach items="${username}" var="username">
                          	<li><p style="white-space: nowrap; margin: -85px 10px 0px 0px; color: #ffffff; font-size: 16px">${username}님</p></li>
                          	</c:forEach> 
							<li><a href="${pageContext.request.contextPath}/admin/Donation" class="charity-strip-btn charity-bgcolor" style="width:70px;height:40px; white-space: nowrap; padding: 12px 0px 0px 6px; margin: -90px 0px 0px 0px;">관리자페이지</a></li>
							<li><form action="/member/logout" method="post" id="mlogout">
								<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
								<a
									href="#"
									class="charity-strip-btn charity-bgcolor"
									onclick="document.getElementById('mlogout').submit();"
									style="width: 70px; height: 40px; white-space: nowrap; padding: 13px 0px 0px 0px; margin: -90px 0px 0px 0px;">로그아웃</a>
						
							</form></li>
						</sec:authorize>
                         </ul>
                    </aside>  
		</div> --%>
        <!-- Top Strip -->
    </header>
    <!-- Header -->
    
           
			<!-- all 버튼 header -->
			<%-- <sec:authorize access="isAnonymous()"> 
				<aside>
            	<a href="${pageContext.request.contextPath}/signUpForm" class="charity-strip-btn charity-bgcolor" style="width:70px;height:40px; white-space: nowrap; padding: 10px 0px 0px 6px; margin: -75px 50px 0px 0px;">회원가입</a>
				<a href="${pageContext.request.contextPath}/loginPage" class="charity-strip-btn charity-bgcolor" style="width:75px;height:40px; white-space: nowrap; padding: 10px 5px 0px 15px; margin: -75px 140px 0px 0px;">로그인</a>
			</aside>
			</sec:authorize> --%>
			
			 <!-- 로그인됐을때 버튼 header -->
			<%-- <sec:authorize access="isAuthenticated()"> --%>
				<%-- <a href="${pageContext.request.contextPath}/member/logout"class="charity-strip-btn charity-bgcolor" style="width:70px;height:40px; white-space: nowrap; padding: 10px 0px 0px 6px; margin: -75px 50px 0px 0px;">로그아웃</a> --%>
				
				<%-- <c:forEach items="${username}" var="username">
					<tr>
						<td> <p style="color: red;"> ${username}님 어서오세요. </p> </td>
					</tr>
				</c:forEach>
				<form action="/member/logout" method="post">
					<input type="submit" class="charity-strip-btn charity-bgcolor" style="width:70px;height:40px; white-space: nowrap; padding: 10px 0px 0px 6px; margin: -75px 50px 0px 0px;" value="로그아웃">
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
				</form>
				<a href="${pageContext.request.contextPath}/my/mypage" class="charity-strip-btn charity-bgcolor" style="width:75px;height:40px; white-space: nowrap; padding: 10px 5px 0px 0px; margin: -75px 140px 0px 0px;">마이페이지</a>
			</sec:authorize>
			 --%>
			 
			  <!-- 관리자 버튼 header -->	
			<%-- <sec:authorize access="hasRole('ADMIN')">			 
				<a href="${pageContext.request.contextPath}/member/logout" class="charity-strip-btn charity-bgcolor" style="width:70px;height:40px; white-space: nowrap; padding: 10px 0px 0px 6px; margin: -75px 50px 0px 0px;">로그아웃</a>
				<a href="${pageContext.request.contextPath}/admin/Donation" class="charity-strip-btn charity-bgcolor" style="width:75px;height:40px; white-space: nowrap; padding: 10px 5px 0px 10px; margin: -75px 140px 0px 0px;">관리자 페이지</a>
			</sec:authorize>
 --%>
	


    <!-- jQuery -->
    
    <script src="/resources/charity/script/jquery.js"></script>
    <script src="/resources/charity/script/popper.min.js"></script>
   
</body>

</html>