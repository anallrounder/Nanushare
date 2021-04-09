<!-- blog detail 사용 css style도 여기서 찾을 것  .charity-form-btn 생성함 color에도 추가함-->

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!doctype html>
<html lang="ko">

<head>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	
	<!-- ckeditor -->
	<script src = "${pageContext.request.contextPath}/resources/ckeditor/ckeditor.js"></script>
    
    <!-- meta tags -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <meta name="_csrf" content="${_csrf.token}">
    <meta name="_csrf_header" content="${_csrf.headerName}">
    
    <script type="text/javascript">
    
 
	   $(function() {
		   var token = $("meta[name='_csrf']").attr("content");
           var header = $("meta[name='_csrf_header']").attr("content");
           $(document).ajaxSend(function(e, xhr, options) {
               xhr.setRequestHeader(header, token);
           });
           
           
           CKEDITOR.replace('editor4',{
           		filebrowserUploadUrl:'${pageContext.request.contextPath}/my/board/shows/imageUpload',
           		height:"450", //textArea 높이
           		enterMode: "2", //엔터할때 <br> 1. p, 2. br, 3. div
           		uiColor : "#FFFFFF" //인터페이스 컬러
           		//skin : ""
           	});
           
           /* window.parent.CKEDITOR.tools.callFunction(" +
        		  callback + 
        		  ",'" + fileUrl + "','이미지를 업로드 하였습니다.'") */
        
          /*  window.parent.CKEDITOR.tools.callFunction(1,,"이미지업로드") */
           
		     
		});
	 
    
    </script>

    <title>나누셰어 - 나눔인증</title>

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
    
    <!-- Banner -->
    <div class="charity-subheader">
        <span class="black-transparent"></span>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h1>나눔 인증</h1>
                    <p>show your support</p>
                </div>
            </div>
        </div>
    </div>
    <!-- Banner -->
    

    <!-- Content -->
    <div class="charity-main-content">

        <!-- Main Section -->
        <div class="charity-main-section">
            <div class="container">
                <div class="row">
              		 <div class="col-md-9">
               
                       <form action="${pageContext.request.contextPath}/my/board/shows/write" method="post" enctype="multipart/form-data" >
                     	   
	                       <div class="charity-contact-form">
	                           <h4><span>Title</span></h4>
	                           <input type="text" name="btitle" placeholder="제목을 작성하세요." >
	                           <br>
	                           <br>
	                           <h4>Images</h4>
	                           <%-- <figure class="charity-postthumb"><img src="${pageContext.request.contextPath}/resources/charity/extra-images/blog-detail-img.png" alt=""></figure> --%>
	                           <p>썸네일 이미지 첨부하기 :
	                           	<br/>
							   		<input type="file" name="file" multiple="multiple"/>
	                            </p>
	                            <!-- <button type="submit" class="charity-sub-btn"><i class="fa fa-save"> 이미지 저장</i></button> -->
	                           <br><br>
	                           <h4>Content</h4>
	                           <p><textarea id="editor4" name="bcontent" placeholder="내용을 작성하세요."></textarea></p>
	                           
	                           <br><br>
							   <br><hr>

	                          <%--  <button type="button" class="charity-sub-btn"><i class="fa fa-eraser" onclick="location.href='delete?b_index=${modify_view.b_index}'"> 글삭제</i></button> --%>
							   <button type="submit" class="charity-sub-btn"><i class="fa fa-save"> 작성완료</i></button>
							   <button type="reset" class="charity-sub-btn"><i class="fa fa-undo"> 다시쓰기</i></button>
							   <!-- charity-main-btn -->
							   <!-- 버튼에 링크걸기 https://m.blog.naver.com/rain483/220529222723 -->
	                        </div>
	                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                        </form>
                        <!-- <script>CKEDITOR.replace('editor4');</script> -->
                        


                        
                      	<!--   a href="plist" -->
                        <div style="float: right; margin-right:5px; text-color:2a786b;"> <a href="plist" class="fa fa-list-alt" > 나눔 인증 게시판 돌아가기 </a></div>
                        <br><br>
                 
                    </div>		     
		
			        <!-- aside -->
			    	<%@ include file="/WEB-INF/views/board_show/aside.jsp"%>
			    	<!-- aside -->
    	
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
    <!-- <script src="https://maps.googleapis.com/maps/api/js"></script> -->
    <script src="${pageContext.request.contextPath}/resources/charity/script/jquery.jplayer.js"></script>
    <script src="${pageContext.request.contextPath}/resources/charity/script/jplayer.playlist.js"></script>
    <script src="${pageContext.request.contextPath}/resources/charity/script/functions.js"></script>
</body>

</html>