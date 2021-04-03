<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>



 <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome Icons -->
  <link rel="stylesheet" href="/resources/AdminLTE-master/plugins/fontawesome-free/css/all.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="/resources/AdminLTE-master/dist/css/adminlte.min.css">

<html>
<head>
<title>Admin Page</title>

 <!-- meta tags -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <title>Charity Team Detail</title>

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

  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome Icons -->
  <link rel="stylesheet" href="/resources/AdminLTE-master/plugins/fontawesome-free/css/all.min.css">
  <!-- IonIcons -->
  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="/resources/AdminLTE-master/dist/css/adminlte.min.css">
  
  <!--탭처리2  -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<style>
	p {
		margin: 20px 0px;
	}
	
	li {
		list-style: none;
	}
	
	li:nth-child(2) {
		color: lime;
	}

	input {
		font-family: 'Roboto', ssans-serif;
		display:block;
		border: none;
		border-radius: 0.25rem;
		border: 1px solid transparent;
		line-height: 1.5rem;
		padding: 0;
		font-size: 1rem;
		color: #607D8B;
		width: 100%;
		margin-top: 0.5rem;
	}
	input:focus {outline: none;}
		
	#ui-datepicker-div {
		display: none;
		background-color: #fff;
		box-shadow: 0 0.125rem 0.5rem rgba(0,0,0,0.1);
		margin-top: 0.25rem;
		border-radius: 0.5rem;
		padding: 0.5rem;
	}
	
	table {
		border-collapse: collapse;
		border-spacing: 0;
	}
	
	.ui-datepicker-calendar thead th {
		padding: 0.25rem 0;
		text-align: center;
		font-size: 0.75rem;
		font-weight: 400;
		color: #78909C;
	
	}
	.ui-datepicker-calendar tbody td {
		width: 2.5rem;
		text-align: center;
		padding: 0;
	}
	
	.ui-datepicker-calendar tbody td a {
		display: block;
		border-radius: 0.25rem;
		line-height: 2rem;
		transition: 0.3s all;
		color: #546E7A;
		font-size: 0.875rem;
		text-decoration: none;
	}
	
	.ui-datepicker-calendar tbody td a:hover {	
		background-color: #E0F2F1;
	}
	
	.ui-datepicker-calendar tbody td a.ui-state-active {
		background-color: #009688;
		color: white;
	}
		
	/* 일요일 빨간색 처리 */
	.ui-datepicker-calendar tbody td.ui-datepicker-week-end:first-child a {  
		color: red; 
	 }

	.ui-datepicker-header a.ui-corner-all {
		cursor: pointer;
		position: absolute;
		top: 0;
		width: 2rem;
		height: 2rem;
		margin: 0.5rem;
		border-radius: 0.25rem;
		transition: 0.3s all;
	}
		
	.ui-datepicker-header a.ui-corner-all:hover {
		background-color: #ECEFF1;
	}
		
	.ui-datepicker-header a.ui-datepicker-prev {	
		left: 0;	
		background: url("data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxMyIgaGVpZ2h0PSIxMyIgdmlld0JveD0iMCAwIDEzIDEzIj48cGF0aCBmaWxsPSIjNDI0NzcwIiBmaWxsLXJ1bGU9ImV2ZW5vZGQiIGQ9Ik03LjI4OCA2LjI5NkwzLjIwMiAyLjIxYS43MS43MSAwIDAgMSAuMDA3LS45OTljLjI4LS4yOC43MjUtLjI4Ljk5OS0uMDA3TDguODAzIDUuOGEuNjk1LjY5NSAwIDAgMSAuMjAyLjQ5Ni42OTUuNjk1IDAgMCAxLS4yMDIuNDk3bC00LjU5NSA0LjU5NWEuNzA0LjcwNCAwIDAgMS0xLS4wMDcuNzEuNzEgMCAwIDEtLjAwNi0uOTk5bDQuMDg2LTQuMDg2eiIvPjwvc3ZnPg==");
		background-repeat: no-repeat;
		background-size: 0.5rem;
		background-position: 50%;
		transform: rotate(180deg);
	}
	
	.ui-datepicker-header a.ui-datepicker-next {
		right: 0;
		background: url('data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxMyIgaGVpZ2h0PSIxMyIgdmlld0JveD0iMCAwIDEzIDEzIj48cGF0aCBmaWxsPSIjNDI0NzcwIiBmaWxsLXJ1bGU9ImV2ZW5vZGQiIGQ9Ik03LjI4OCA2LjI5NkwzLjIwMiAyLjIxYS43MS43MSAwIDAgMSAuMDA3LS45OTljLjI4LS4yOC43MjUtLjI4Ljk5OS0uMDA3TDguODAzIDUuOGEuNjk1LjY5NSAwIDAgMSAuMjAyLjQ5Ni42OTUuNjk1IDAgMCAxLS4yMDIuNDk3bC00LjU5NSA0LjU5NWEuNzA0LjcwNCAwIDAgMS0xLS4wMDcuNzEuNzEgMCAwIDEtLjAwNi0uOTk5bDQuMDg2LTQuMDg2eiIvPjwvc3ZnPg==');
		background-repeat: no-repeat;
		background-size: 10px;
		background-position: 50%;
	}
	
	.ui-datepicker-header a>span {
		display: none;
	}
	
	.ui-datepicker-title {
		text-align: center;
		line-height: 2rem;
		margin-bottom: 0.25rem;
		font-size: 0.875rem;
		font-weight: 500;
		padding-bottom: 0.25rem;
	}
	
	.ui-datepicker-week-col {
		color: #78909C;
		font-weight: 400;
		font-size: 0.75rem;
	}
</style>

</head>
<body class="hold-transition sidebar-mini">
 
   <%@ include file="/WEB-INF/views/mainMap/mainHeader.jsp" %>
    
    <!-- Banner -->
	<div class="charity-subheader">
		<span class="black-transparent"></span>
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<h1>관리자 페이지</h1>
	                <p>Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero</p>
				</div>
			</div>
			
		</div>
	</div>
	<!-- Banner -->
	
    <!-- Content -->
    <div class="charity-main-content">
    
   
 <!-- Navbar -->
  <nav class="main-header navbar navbar-expand navbar-white navbar-light" style="margin-top: -50px;">
    <!-- Left navbar links -->
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
      </li>
      
      <!-- <li class="nav-item d-none d-sm-inline-block">
        <a href="index3.html" class="nav-link">Home</a>
      </li>
      <li class="nav-item d-none d-sm-inline-block">
        <a href="#" class="nav-link">Contact</a>
      </li> -->
    </ul>
  </nav>
  <!-- /.navbar -->

  <!-- Main Sidebar Container -->

  <aside class="main-sidebar sidebar-dark-primary elevation-4">  
    <!-- Brand Logo -->
   <!--  <a href="/resources/AdminLTE-master/index3.html" class="brand-link">
      <img src="/resources/AdminLTE-master/dist/img/AdminLTELogo.png" alt="AdminLTE Logo" class="brand-image img-circle elevation-3" style="opacity: .8">
      <span class="brand-text font-weight-light">AdminLTE 3</span>
    </a> -->

    <!-- Sidebar -->
    <div class="sidebar">
      <!-- Sidebar user panel (optional) -->
      <div class="user-panel mt-3 pb-3 mb-3 d-flex">
          <img src="/resources/AdminLTE-master/dist/img/user2-160x160.jpg" class="img-circle elevation-2" alt="User Image">
        <div class="info">
        <sec:authorize access="hasRole('ADMIN')"> 
	          <c:forEach items="${username}" var="username">
		         <a href="#" class="d-block">${username}님</a>
		     </c:forEach> 
	     </sec:authorize>
        </div>
      </div>
      
     


      <!-- Sidebar Menu -->
      <nav class="mt-2">
        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
          <!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
          <li class="nav-item menu-open">
            <a href="#money" class="nav-link active" data-toggle="tab">
             <i class="nav-icon fas fa-donate"></i>
              <p>후원금 관리<i class="right fas fa-angle-left"></i></p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="#m_day" class="nav-link active" data-toggle="tab">
                  <i class="far fa-circle nav-icon"></i>
                  <p>일별</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="#m_week" class="nav-link" data-toggle="tab">
                  <i class="far fa-circle nav-icon"></i>
                  <p>주별</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="#m_month" class="nav-link" data-toggle="tab">
                  <i class="far fa-circle nav-icon"></i>
                  <p>월별</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="#m_year" class="nav-link" data-toggle="tab">
                  <i class="far fa-circle nav-icon"></i>
                  <p>년별</p>
                </a>
              </li>
            </ul>
          </li>
          
          <li class="nav-item">
            <a href="#users" class="nav-link" data-toggle="tab">
              <i class="nav-icon fas fa-users"></i>
              <p>회원 관리</p>
            </a>
          </li>
          
          <li class="nav-item">
            <a href="#items" class="nav-link" data-toggle="tab">
              <i class="nav-icon fas fa-box-open"></i>
              <p>재고 관리<i class="right fas fa-angle-left"></i></p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="#item_head" class="nav-link" data-toggle="tab">
                  <i class="far fa-circle nav-icon"></i>
                  <p>본사 재고</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="#item_branch" class="nav-link" data-toggle="tab">
                  <i class="far fa-circle nav-icon"></i>
                  <p>지점 재고</p>
                </a>
              </li>
             </ul>
          </li>
          
          <li class="nav-item">
            <a href="#boards" class="nav-link" data-toggle="tab">
              <i class="nav-icon fas fa-th"></i>
              <p>게시판 관리</p>
            </a>
          </li>
        </ul>
      </nav>
      <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
  </aside>

        <!-- Main Section -->
        <div class="charity-main-section">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        
                        <!--// volunteer-form \\-->
                        <br>
                        
                        <div class="charity-volunteer-form" >
									<div class="tab-content">
										<div class="tab-pane fade show active" id="users">
										<div class="widget_title"><h2>회원 관리</h2></div>
											<table>
												<div>
													<br>
												</div>
												 <!--// volunteer-form \\-->
						                            <form>
							                            <tr>
							                               <th>아이디</th>
							                               <th>이름</th>
							                               <th>가입경로</th>
							                               <th>후원금기부횟수</th>
							                               <th>물품기부횟수</th>
							                               <th>블랙리스트 여부</th>
						                               	</tr>
						                                
						                                <c:forEach items="${memberControl}" var="member">
						                                 <tr>
							                               <th><a href="member_view?member_id=${member.member_id}">${member.member_id}</a></th>
							                               <th>${member.name}</th>
							                               <th>${member.signuppath}</th>
							                               <th>${member.dntcnt}</th>
							                               <th>${member.itemdntcnt}</th>
							                               <th>${member.bklist}</th>
						                               	</tr>
						                                </c:forEach>
						                            </form>
						                                   
						                        <!--// volunteer-form \\-->
											</table>
											<button type="submit">회원 정보 수정</button>
											<!-- 페이징 -->
											<div id="nav">
												<a href="#" rel="0" class="active">1</a>
											</div>
											
										</div>
										<div class="tab-pane fade" id="item_head">
											<form action="admin/itemupdate" method="get">
											<div class="widget_title"><h2>본사 재고</h2></div>
												<table>
													<div>
														<br>
													</div>
													<tr>
														<th>물품명</th>
														<th>현재 보유량</th>
														<th>입고량</th>
														<th>입고일</th>
														<th>출고량</th>
														<th>출고일</th>
														<th>출고지점</th>
													</tr>
	
													<c:forEach items="${item}" var="headItem">
													<tr>
														<td>${headItem.iname}</td> <!-- 물품명 출력  -->
														<td>${headItem.iamount}</td> <!-- 현재 수량 출력 -->
														<td> <!-- 입고량 -->
															<select>
																<option value="0">0</option>
																<option value="10">10</option>
																<option value="20">20</option>
																<option value="30">30</option>
																<option value="40">40</option>
																<option value="50">50</option>
															</select>
														</td>
														<td><input type="text" class="datepicker" autocomplete="off" ></td>

													<td><!-- 출고량 -->
															<select> 
																<option value="0">0</option>
																<option value="10">10</option>
																<option value="20">20</option>
																<option value="30">30</option>
																<option value="40">40</option>
																<option value="50">50</option>
															</select>
														</td>
														<td><input type="text" class="datepicker"></td>
														<td><!-- 출고지점 -->
														
															<select> 
															<c:forEach items="${vm}" var="vmvo">
																<option value="${vmvo.branch}">${vmvo.branch}</option>
															</c:forEach> 
															</select>
														
														</td>
													</tr>
													</c:forEach>
												</table>
												
												<button type="submit">업데이트</button>
											</form>
											<!-- 페이징 -->
											<!-- <div id="nav">
												<ul class="startItem">

													<li class="active"><a><<</a></li>

													<li class="active"><a><</a></li>

													<li class="active"><a>1</a></li>

													<li class="currPage" data-page="2"><a>2</a></li>

													<li class="currPage" data-page="3"><a>3</a></li>

													<li class="active"><a>></a></li>

													<li class="active"><a>>></a></li>

												</ul>
											</div> -->
										
										</div>
										
										<div class="tab-pane fade" id="item_branch">
											<form>
											<div class="widget_title"><h2>지점 재고</h2></div>
												<table class="branchI">
													<div>
														<br>
													</div>
													<tr>
														<th>No.</th>
														<th>지점명</th>
														<th>마스크</th>
														<th>기저귀</th>
														<th>생리대</th>
														<th>문구류</th>
														<th>손세정제</th>
													</tr>
	
													<c:forEach items="${vvam}" var="vmdao" varStatus="status">
													<tr>
														<td>${status.count}</td> <!-- index  -->
														<td>${vmdao.branch}</td> <!-- 지점명 -->
														<c:forEach items="${vmdao.vmamlist}" var="list">
																<td>${list.vm_amount}</td>
														</c:forEach>
													</tr>
													</c:forEach>
												</table>
											</form>
										</div>
										<div class="tab-pane fade" id="ghi">
											<table>
												<div>
													<br>
												</div>
												<tr>
													<th>물품이름</th>
													<th>날짜</th>

													<th>수량</th>
													<th>아이디</th>

												</tr>


												<c:set var="list3" value="${list3}" />
												<c:forEach items="${list3}" var="dao3" varStatus="status">
													<c:forEach items="${dao3.dona}" var="dto3"
														varStatus="status">
														<tr>

															<td>${dao3.iname}</td>
															<td>${dto3.idntdate}</td>

															<!-- 제목누르면 해당 글내용으로 이동링크 -->
															<td>${dto3.donaamount}</td>
															<td>${dto3.member_id}</td>
														</tr>
													</c:forEach>
												</c:forEach>
											</table>
											<div id="nav">
												<a href="#" rel="0" class="active">1</a>
											</div>
											
										</div>
										<div class="tab-pane fade" id="jkl">
											<table>
												<div>
													<br>
												</div>
												<tr>

													<th>번호</th>
													<th>댓글내용</th>
													<th>날짜</th>
													<th>아이디</th>
													<th>분류번호</th>
												</tr>
												<c:set var="list4" value="${list4}" />
												<c:forEach items="${list4}" var="dao4" varStatus="status">
													<c:forEach items="${dao4.reply}" var="dto4"
														varStatus="status">
														<tr>
															<td>${dto4.r_num}</td>
															<td>${dto4.rcontent}</td>
															<!-- 제목누르면 해당 글내용으로 이동링크 -->
															<td>${dto4.rdate}</td>
															<td>${dto4.rid}</td>
															<td>${dao4.b_index}</td>
														</tr>
													</c:forEach>
												</c:forEach>
											</table>
											<div id="nav">
												<a href="#" rel="0" class="active">1</a>
											</div>
											
										</div>
									</div>
						

                        </div>
                        <!--// volunteer-form \\-->
                        <div class="charity-team-contactus">
                       
                            <ul>
                                <li>
                                    <i class="fa fa-envelope"></i>
                                    <h5>돌아가기</h5>
                                <!--     <a href="mailto:name@email.com">info@example.com</a> -->
                                </li>
                                <li>
                                    <i class="fa fa-phone"></i>
                                    <h5>회원 삭제</h5>
                                    <!-- <span>+(091)61 3146 8728</span> -->
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Main Section -->

    </div>
    <!-- Content -->

	
	   <%@ include file="/WEB-INF/views/mainMap/mainFooter.jsp"%>

 <!-- jQuery -->
   <!--  <script src="/resources/charity/script/jquery.js"></script>
    <script src="/resources/charity/script/popper.min.js"></script> -->
    <script src="/resources/charity/script/bootstrap.min.js"></script>
    <script src="/resources/charity/script/slick.slider.min.js"></script>
    <script src="/resources/charity/script/progressbar-main.js"></script> <!-- progressbar 복붙해서 사용  -->
    <script src="/resources/charity/script/fancybox.min.js"></script>
    <script src="/resources/charity/script/jquery.countdown.min.js"></script>
    <script src="https://maps.googleapis.com/maps/api/js"></script>
    <script src="/resources/charity/script/jquery.jplayer.js"></script>
    <script src="/resources/charity/script/jplayer.playlist.js"></script>
    <script src="/resources/charity/script/functions-main.js"></script> <!-- fuctions 복붙해서 사용 -->
    
 
<!-- Bootstrap -->
<script src="/resources/AdminLTE-master/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- AdminLTE App -->
<script src="/resources/AdminLTE-master/dist/js/adminlte.min.js"></script>

<!-- <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"> -->
<!-- 위에 script를 추가하면 덮여져서인지 datepicker가 팝업이 아예 안됨 
https://stackoverflow.com/questions/36207203/uncaught-typeerror-datepicker-is-not-a-functionanonymous-function-->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>  
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script>
$(document).ready(function() { 
	$('.datepicker').datepicker();
  });
	
	/* dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], // 요일의 한글 형식.
	monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'], // 월의 한글 형식.
	monthNames:[ "1월", "2월", "3월", "4월", "5월", "6월","7월", "8월", "9월", "10월", "11월", "12월" ] // 상단에 월의 한글 형식
	*/
</script>

</body>
</html>
