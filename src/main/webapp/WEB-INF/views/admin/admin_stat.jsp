<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
<head>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- ChartJS -->
<script src="/resources/AdminLTE-master/plugins/chart.js/Chart.min.js"></script>
 <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome Icons -->
  <link rel="stylesheet" href="/resources/AdminLTE-master/plugins/fontawesome-free/css/all.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="/resources/AdminLTE-master/dist/css/adminlte.min.css">
  
 <!-- meta tags -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <title>Admin Page</title>

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
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
	<!-- Admin style -->
  	<link rel="stylesheet" href="/resources/admin/admin_style.css">
  	<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/nanulogo_ico_convert.ico"> 

<style>
body {
	background-color: f9f9fb;
} 
.charity-simple-blog-btn {
	border: 0;
}

​h3 {
	text-align: center;
}

#forimg {
	background-image: url('/resources/banner_imgs/admin_banner.png');
	background-repeat:no-repeat;
	background-position: center;
	width:100%;
	
}
.black-transparent {
	opacity:50%;
}

.user-panel img {

	margin: 0px 0px 0px 15px;
}


</style>

</head>
<body class="hold-transition sidebar-mini">
 
   <%@ include file="/WEB-INF/views/mainMap/mainHeader.jsp" %>
    
    <!-- Banner -->
    <div id="forimg" class="charity-subheader">
       <span class="black-transparent"></span>
        <div class="container">
            <div class="row">
                <div class="col-md-12"> 
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
    </ul>
  </nav>

  <!-- Main Sidebar Container -->
  <aside class="main-sidebar sidebar-dark-primary elevation-4">  

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
          <li class="nav-item">
            <a href="#m_day" class="nav-link active" data-toggle="tab">
             <i class="nav-icon fas fa-donate"></i>
              <p>후원금 관리</p>
            </a>
          </li>
          
          <li class="nav-item">
            <a href="/admin/member" class="nav-link">
              <i class="nav-icon fas fa-users"></i>
              <p>회원 관리</p>
            </a>
          </li>
          
          <li class="nav-item">
            <a href="/admin/room" class="nav-link">
              <i class="fas fa-comment-dots nav-icon"></i>
              <p>채팅 관리</p>
            </a>
          </li>
          
          <li class="nav-item"><%-- ${pageContext.request.contextPath}/admin/item --%>
            <a href="#" class="nav-link" data-toggle="tab">
              <i class="nav-icon fas fa-box-open"></i>
              <p>재고 관리<i class="right fas fa-angle-left"></i></p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="/admin/headItem" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>본사 재고</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="/admin/branchItem" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>지점 재고</p>
                </a>
              </li>
             </ul>
          </li>
          
          <li class="nav-item">
            <a href="#" class="nav-link" data-toggle="tab">
              <i class="nav-icon fas fa-th"></i>
              <p>게시판 관리<i class="right fas fa-angle-left"></i></p>
            </a>
            
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="/board/notice" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>공지사항</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="/board/qna" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>문의게시판</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="/board/shows/list" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>인증게시판</p>
                </a>
              </li>
             </ul>
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
				
						<div class="tab-content">
							<div class="tab-pane fade show active" id="m_day">
							
								<div class="charity-fancy-title " style=" margin:60px 0px 60px 0px;">
									<h2> 후원금 통계 </h2>
								</div>
								<!-- 월 선택 -->
								
								<div class="charity-volunteer-form" >
								<h4>월을 선택하세요</h4>
						          <select class="form-control" id="choice-month" style="width:200px">
						          	<c:forEach var="i" begin="1" end="12">
							        	<option value="${i}" <c:if test="${i eq month}">selected</c:if>>
							        		${i}
							        	</option>
							        </c:forEach>
							      </select>

								<!-- BAR CHART -->
							    <div class="card card-success">
									<div class="card-header">
										<h3 class="card-title">일별</h3>
										<div class="card-tools">
											<button type="button" class="btn btn-tool" data-card-widget="collapse"><i class="fas fa-minus"></i></button>
							                  <button type="button" class="btn btn-tool" data-card-widget="remove"><i class="fas fa-times"></i></button>
							            </div>
							       	</div>
							       	
							        <div class="card-body">
							           <div class="chart">
							              <canvas id="barChart" style="min-height: 400px; height: 400px; max-height: 400px; max-width: 100%;"></canvas>
							           </div>
							        </div>
							       <!-- /.card-body -->
							       
							   </div>
							   <!-- /.card -->
							   
							   <!-- BAR CHART -->
							    <div class="card card-success">
									<div class="card-header">
										<h3 class="card-title">월별</h3>
										<div class="card-tools">
											<button type="button" class="btn btn-tool" data-card-widget="collapse" ><i class="fas fa-minus"></i></button>
							                <button type="button" class="btn btn-tool" data-card-widget="remove"><i class="fas fa-times"></i></button>
							            </div>
							       	</div>
							       	
							        <div class="card-body">
							           <div class="chart">
							              <canvas id="barMonthChart" style="min-height: 400px; height: 400px; max-height: 400px; max-width: 100%;"></canvas>
							           </div>
							        </div>
							       <!-- /.card-body -->
							       
							   </div>
							   <!-- /.card -->
							   
							    <!-- BAR CHART -->
							    <div class="card card-success">
									<div class="card-header">
										<h3 class="card-title">년별</h3>
										<div class="card-tools">
											<button type="button" class="btn btn-tool" data-card-widget="collapse"><i class="fas fa-minus"></i></button>
							                  <button type="button" class="btn btn-tool" data-card-widget="remove"><i class="fas fa-times"></i></button>
							            </div>
							       	</div>
							       	
							        <div class="card-body">
							           <div class="chart">
							              <canvas id="barYearChart" style="min-height: 400px; height: 400px; max-height: 400px; max-width: 100%;"></canvas>
							           </div>
							        </div>
							       <!-- /.card-body -->
							       
							   </div>
							   <!-- /.card -->
							   </div>
							</div>
						</div>
				
					<!-- chart End -->
              </div>
           </div>
		</div>
	</div>
   <!-- Main Section End-->
   
</div>
<!-- Content End -->

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
    
 
<!-- jQuery -->
<script src="/resources/AdminLTE-master/plugins/jquery/jquery.min.js"></script>

<!-- AdminLTE App -->
<script src="/resources/AdminLTE-master/dist/js/adminlte.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="/resources/AdminLTE-master/dist/js/demo.js"></script>


<script>
  var chart;
  
  $(function () {
    /* ChartJS
     * -------
     * Here we will create a few charts using ChartJS
     */
     
    //--------------
    //- 일별 CHART -
    //--------------
    
    
    /* loadChart($('#choice-month option:selected').val()); */
    loadChart(${month});

   	//데이터 가변적으로 변경을 위한 클릭이벤트(추후 드롭다운메뉴로 변경할것)
    $('#choice-month').change(function() {
    	var month = $(this).val();
    	loadChart(month);

    });
   
    function loadChart(month) {
		$.ajax({
			url: '/admin/temp',
			async: false,
			data: {month : month},
			success: function(data) {
				console.log('data', data);
				 
				 var labels =[];
				 var dayData =[]; 
				 
				 var day = getMaxDay(${2021}, month);
				 console.log("day", day);

				 // push로 데이터 삽입 push가 js가 제공하는 배열 객체의 값을 넣을때 사용하는 함수
				 for(var i = 1; i <= day; i++ ) {
					
					labels.push(i + "일");
					dayData.push(data[i]);
				 }
				 
					console.log("labels",labels);
					console.log("dayData",dayData);	
					
				    var areaChartData = {
				      labels  : labels,
				      datasets: [
				        {
				          label               : '돈기부여 일별 통계',
				          backgroundColor     : 'rgba(60,141,188,0.9)',
				          borderColor         : 'rgba(60,141,188,0.8)',
				          pointRadius          : false,
				          pointColor          : '#3b8bba',
				          pointStrokeColor    : 'rgba(60,141,188,1)',
				          pointHighlightFill  : '#fff',
				          pointHighlightStroke: 'rgba(60,141,188,1)',
				          data                : dayData
				        }
				      ]
				    }

				    //-------------
				    //- BAR CHART -
				    //-------------
				    var barChartCanvas = $('#barChart').get(0).getContext('2d')
				    var barChartData = $.extend(true, {}, areaChartData)
				    var temp0 = areaChartData.datasets[0]
				    
				    barChartData.datasets[0] = temp0

				    var barChartOptions = {
				      responsive              : true,
				      maintainAspectRatio     : false,
				      datasetFill             : false,
				      scales: {
				    	  yAxes: [
				              {
				                  ticks: {
				                      beginAtZero: true,
				                      stepSize: 200,
				                      max: 2000
				                  }
				              }
				          ]
				      }
				      
				    }

				    chart = new Chart(barChartCanvas, {
				      type: 'bar',
				      data: barChartData,
				      options: barChartOptions
				    })
			}
		});
    }
  
  });
  
/*   function updateYAxesValue(value) {
	chart.options = {
		responsive              : true,
		maintainAspectRatio     : false,
		datasetFill             : false,
		scales: {
			yAxes: [
				{
				ticks: {
					beginAtZero: true,
					stepSize: 200,
		    		max: value
		    		}
		  		}
			]
		}
	};
    chart.update();
	  
  } */
  
  function getMaxDay(year, month) {
	  month -= 1;
	  return 32 - new Date(year, month, 32).getDate();
  }
  
	//-------------
  	//- 월별 CHART -
	//-------------
  
  	var mlabels =[];
   	var monthData =[]; 
    
   	// push로 데이터 삽입 push가 js가 제공하는 배열 객체의 값을 넣을때 사용하는 함수
   	<c:forEach var="i" begin="1" end="12">
   		mlabels.push("${i}" + "월");
		monthData.push("${monthSale[i]}");
	</c:forEach>
  

	var barMonthChartCanvas = $('#barMonthChart').get(0).getContext('2d')
	var barMonthChartData	= {
			labels: mlabels,
			datasets: [
				{
				label: '돈기부여 월별 통계',
				data: monthData,
	       		backgroundColor : ['#00c0ef', '#00a65a', '#f39c12', '#f56954', '#3c8dbc', '#d2d6de'],
	      		}
	    	]
	  	}
	
	var barMonthOptions     = {
	    maintainAspectRatio : false,
	    responsive : true,
	  }
	
	new Chart(barMonthChartCanvas, {
	    type: 'bar',
	    data: barMonthChartData,
	    options: barMonthOptions
	  })
	
	//-------------
  	//- 년별 CHART -
	//-------------
  	var ylabels = "${year}"; 
   	var yearData = "${yearSale}"; 
   	console.log("ylabels", ylabels);
   	//console.log("yearData", typeof(yearData));
   
	var barYearChartCanvas = $('#barYearChart').get(0).getContext('2d')
	var barYearChartData	= {
			labels: [ylabels],
			datasets: [
				{
				label: '돈기부여 년별 통계',
				data: [yearData],
	       		backgroundColor : ['#f39c12', '#00a65a', '#f56954', '#00c0ef', '#3c8dbc', '#d2d6de'],
	      		}
	    	]
	  	}
	
	var barYearOptions     = {
	    maintainAspectRatio : false,
	    responsive : true,
	    scales: {
			xAxes: [{
				barPercentage: 0.2
	        }],
			yAxes: [
	              {
	                  ticks: {
	                      beginAtZero: true,
	                      stepSize: 1000,
	                      max: 10000
	                  }
	              }
	          ]
	      }
	    
	  }
	
	new Chart(barYearChartCanvas, {
	    type: 'bar',
	    data: barYearChartData,
	    options: barYearOptions
	  })

</script>


</body>
</html>
