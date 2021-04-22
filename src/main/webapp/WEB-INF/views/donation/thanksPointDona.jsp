
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!doctype html>
<html lang="en">

<head>

<!-- meta tags -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>나누셰어 - 돈기부여</title>

<!-- CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/charity/css/bootstrap.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/charity/css/fontawesome-all.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/charity/css/flaticon.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/charity/css/slick-slider.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/charity/css/fancybox.css">
<link href="${pageContext.request.contextPath}/resources/charity/css/jplayer.css" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/charity/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/charity/css/color.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/charity/css/responsive.css">

<!-- 웹페이지 탭 로고이미지 삽입  -->
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/nanulogo_ico_convert.ico"> 

<!-- header -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">

<style type="text/css">
#forimg {
	background-color: #eaf0fe;
	background-image: url('/resources/banner_imgs/donation_banner.jpg');
	background-repeat:no-repeat;
	background-position: center;
	background-height:100%;
}
.black-transparent {
	opacity:50%;
}
</style>

</head>

<body>
    
    <!-- Header -->
    <%@ include file="/WEB-INF/views/mainMap/mainHeader.jsp"%>
    <!-- Header -->

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
  <!--   <div class="charity-fancy-title " style="margin-top:70px; margin-bottom:20px;">
		<h2> 포인트 나눔하기 </h2>
	</div> -->
    
    <div class="charity-main-content">

        <!-- Main Section -->
        <div class="charity-main-section charity-aboutus-text-full">
            <div class="container">
                <div class="row">
                        
                    <div class="col-md-7">
                        <div class="charity-aboutus-text">
                            <h1 style="text-align:center;">나눔해주셔서 감사합니다.</h1>
                            <div>&nbsp;</div>
                            <h3><span style="color:#FFAE73;"><sec:authentication property="principal.member.name" /></span>님의 소중한 후원금(후원물품), 투명하고 정직하게 사용하겠습니다.</h3>
                            <ul class="charity-list-style-one">
                            <div>&nbsp;</div>
                            <div>&nbsp;</div>
                            <div>&nbsp;</div>
                            <h5>*나눔 내역은 마이페이지에서 확인하실 수 있습니다.*</h5>
                           </ul>
                            <!-- <h6>Donation So Far: <span>$ 6000</span></h6> -->
                                                        	<br>
                                <a href="/main" class="charity-about-btn m-2">메인페이지</a><a href="/my/mypage" class="charity-about-btn m-2">마이페이지</a>
                            	<br>
                        </div>
                    </div>
                    <div class="col-md-5">
                        
                            <img src="${pageContext.request.contextPath}/resources/donation/money_teamwork.jpg" alt="">
                       
                    </div>

                </div>
            </div>
        </div>
        <!-- Main Section -->

       
      

    </div>
    <!-- Content -->

 	 <!-- Footer -->
    <%@ include file="/WEB-INF/views/mainMap/mainFooter.jsp"%>
    <!-- Footer -->



    <!-- jQuery -->
    <script src="${pageContext.request.contextPath}/resources/charity/script/jquery.js"></script>
    <script src="${pageContext.request.contextPath}/resources/charity/script/popper.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/charity/script/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/charity/script/slick.slider.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/charity/script/progressbar.js"></script>
    <script src="${pageContext.request.contextPath}/resources/charity/script/fancybox.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/charity/script/jquery.countdown.min.js"></script>
    <script src="https://maps.googleapis.com/maps/api/js"></script>
    <script src="${pageContext.request.contextPath}/resources/charity/script/jquery.jplayer.js"></script>
    <script src="${pageContext.request.contextPath}/resources/charity/script/jplayer.playlist.js"></script>
    <script src="${pageContext.request.contextPath}/resources/charity/script/functions.js"></script>
</body>
</body>

</html>
<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!doctype html>
<html lang="en">

<head>
    <!-- meta tags -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <title>나눔해 주셔서 감사합니다.</title>

    <!-- CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/charity/css/bootstrap.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/charity/css/fontawesome-all.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/charity/css/flaticon.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/charity/css/slick-slider.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/charity/css/fancybox.css">
    <link href="${pageContext.request.contextPath}/resources/charity/css/jplayer.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/charity/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/charity/css/color.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/charity/css/responsive.css">
	
	<!-- 웹페이지 탭 로고이미지 삽입  -->
	<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/nanulogo_ico_convert.ico"> 
	

</head>

<body>
    <!-- Header -->
    <%@ include file="/WEB-INF/views/mainMap/mainHeader.jsp"%>
    <!-- Header -->

    <!-- Sub Header -->
    <div class="charity-subheader">
        <span class="light-black-transparent"></span>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h1>나눔해 주셔서 감사합니다.</h1>
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed urna nibh, fringilla fermentum at.</p>
                </div>
            </div>
        </div>
    </div>
    <!-- Sub Header -->

    <!-- Content -->
    <div class="charity-main-content">
        
        <!-- Main Section -->
        <div class="charity-main-section">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="error-page-wrap">
                            <div class="error-page-inner">
                                <h2>Thank you</h2>
                                <span>나눔해주셔서 감사합니다.</span><br><br>
								<c:forEach var="vo1" items="${memberInfo}"> 
	                             <table>
	                             <c:forEach var="vo2" items="${vo1.pointList}">
	                                <tr>
	                                <td> 나눔 포인트 :</td> 
	                                <td> ${vo2.dntpnt} Point</td>
	                                </tr>
	                                <tr>
	                                <td>잔여 포인트 : </td>
	                                <td>${vo2.nowpnt} Point </td>
	                                </tr>
	                                </c:forEach>
	                             </table>
                               </c:forEach> 
                              
                              	<br>
                                <a href="#" class="error-page-btn">메인페이지</a>&nbsp;&nbsp;<a href="#" class="error-page-btn">마이페이지</a>
                            	<br>
                            <!--     <form>
                                    <input type="text" placeholder="Enter your Keyword">
                                    <input type="submit" value="">
                                    <i class="fa fa-search"></i>
                                </form> -->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Main Section -->

    </div>
    <!-- Content -->


 	 <!-- Footer -->
    <%@ include file="/WEB-INF/views/mainMap/mainFooter.jsp"%>
    <!-- Footer -->

    
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
    <script src="${pageContext.request.contextPath}/resources/charity/script/jquery.js"></script>
    <script src="${pageContext.request.contextPath}/resources/charity/script/popper.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/charity/script/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/charity/script/slick.slider.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/charity/script/progressbar.js"></script>
    <script src="${pageContext.request.contextPath}/resources/charity/script/fancybox.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/charity/script/jquery.countdown.min.js"></script>
    <script src="https://maps.googleapis.com/maps/api/js"></script>
    <script src="${pageContext.request.contextPath}/resources/charity/script/jquery.jplayer.js"></script>
    <script src="${pageContext.request.contextPath}/resources/charity/script/jplayer.playlist.js"></script>
    <script src="${pageContext.request.contextPath}/resources/charity/script/functions.js"></script>
</body>

</html> --%>