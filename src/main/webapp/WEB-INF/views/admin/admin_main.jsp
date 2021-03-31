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
</style>

</head>
<body class="hold-transition sidebar-mini">
 
   <%@ include file="/WEB-INF/views/mainMap/mainHeader.jsp"%>
    
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
  <nav class="main-header navbar navbar-expand navbar-white navbar-light">
    <!-- Left navbar links -->
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
      </li>
      <li class="nav-item d-none d-sm-inline-block">
        <a href="index3.html" class="nav-link">Home</a>
      </li>
      <li class="nav-item d-none d-sm-inline-block">
        <a href="#" class="nav-link">Contact</a>
      </li>
    </ul>
  </nav>
  <!-- /.navbar -->

  <!-- Main Sidebar Container -->

  <aside class="main-sidebar sidebar-dark-primary elevation-4">  
    <!-- Brand Logo -->
    <a href="/resources/AdminLTE-master/index3.html" class="brand-link">
      <img src="/resources/AdminLTE-master/dist/img/AdminLTELogo.png" alt="AdminLTE Logo" class="brand-image img-circle elevation-3" style="opacity: .8">
      <span class="brand-text font-weight-light">AdminLTE 3</span>
    </a>

    <!-- Sidebar -->
    <div class="sidebar">
      <!-- Sidebar user panel (optional) -->
      <div class="user-panel mt-3 pb-3 mb-3 d-flex">
        <div class="image">
          <img src="/resources/AdminLTE-master/dist/img/user2-160x160.jpg" class="img-circle elevation-2" alt="User Image">
        </div>
        <div class="info">
          <a href="#" class="d-block">Alexander Pierce</a>
        </div>
      </div>

      

      <!-- Sidebar Menu -->
      <nav class="mt-2">
        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
          <!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
          <li class="nav-item menu-open">
            <a href="#" class="nav-link active">
              <i class="nav-icon fas fa-tachometer-alt"></i>
              <p>
                Starter Pages
                <i class="right fas fa-angle-left"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="#" class="nav-link active">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Active Page</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="#" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Inactive Page</p>
                </a>
              </li>
            </ul>
          </li>
          <li class="nav-item">
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-th"></i>
              <p>
                Simple Link
                <span class="right badge badge-danger">New</span>
              </p>
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
                        <div class="widget_title"><h2>회원 관리</h2></div>
                        <div class="charity-volunteer-form" >
                         
									<ul class="nav nav-tabs" style="text-align: center;">
										<li class="nav-item"><a class="nav-link active"
											data-toggle="tab" href="#abc">기본 정보</a></li>
										<li class="nav-item"><a class="nav-link"
											data-toggle="tab" href="#def">물품 기부</a></li>
										<li class="nav-item"><a class="nav-link"
											data-toggle="tab" href="#ghi">돈기부여</a></li>
										<li class="nav-item"><a class="nav-link"
											data-toggle="tab" href="#jkl">포인트</a></li>
											<li class="nav-item"><a class="nav-link"
											data-toggle="tab" href="#jkl">문의 내역</a></li>
									</ul>
									<div class="tab-content">
										<div class="tab-pane fade show active" id="abc">
										
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
										<div class="tab-pane fade" id="def">
											<table>

												<div>
													<br>
												</div>
												<tr>

													<th>아이디</th>
													<th>인증제목</th>
													<th>조회수</th>
													<th>날짜</th>
													<th>분류번호</th>
												</tr>


												<c:forEach items="${list2}" var="list2">
													<tr>
														<td>${list2.member_id}</td>
														<td>${list2.btitle}</td>
														<!-- 제목누르면 해당 글내용으로 이동링크 -->
														<td>${list2.bhit}</td>
														<td>${list2.bdate}</td>
														<td>${list2.bcat_num}</td>
													</tr>
												</c:forEach>
											</table>
											<!-- 페이징 -->
											<div id="nav">
												<ul class="startItem">

													<li class="active"><a><<</a></li>

													<li class="active"><a><</a></li>

													<li class="active"><a>1</a></li>

													<li class="currPage" data-page="2"><a>2</a></li>

													<li class="currPage" data-page="3"><a>3</a></li>

													<li class="active"><a>></a></li>

													<li class="active"><a>>></a></li>

												</ul>
											</div>
										
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
    
 
<!-- Bootstrap -->
<script src="/resources/AdminLTE-master/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- AdminLTE App -->
<script src="/resources/AdminLTE-master/dist/js/adminlte.min.js"></script>

</body>
</html>
