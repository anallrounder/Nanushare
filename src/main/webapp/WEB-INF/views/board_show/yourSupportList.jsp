<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


<!doctype html>
<html lang="ko">

	<!-- <script>
		overflow: hidden;
		text-overflow: ellipsis;
		white-space: nowrap;
		width: 100px;
		height: 10px; 
	</script> -->
	
	<head>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>
	
	<!-- meta tags -->
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<meta name="_csrf" content="${_csrf.token}"/>
	<meta name="_csrf_header" content="${_csrf.headerName}"/>
	
	
	
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
	<!-- header -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
	
	 <!-- 웹페이지 탭 로고이미지 삽입  -->
	<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/nanulogo_ico_convert.ico"> 
	
	<!-- sweet alert cdn : https://sweetalert.js.org/guides/ -->
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	
	<script type="text/javascript">
	
	/* $(function(){
	   
	}); */
	
		//$(document).reday(function() {
	 $(function() {
		//랜덤 이미지 불러오기 
		$('.boardShow_img').each(function (index, item) {	        	
	       	var imgUrl = '${pageContext.request.contextPath}/resources/board_thumbnail/bslist0'+Math.floor((Math.random()*6) + 1)+'.png';
	       	console.log("index : "+index);
	       	console.log("item " + item);
	       	console.log("imgurl : " + imgUrl);
	       	console.log($(item).attr("src"));
	       	
	       	$(item).attr("src", imgUrl);
		});
		
		
		/* 	var result = '<c:out value="${result}" />';
		  	checkModal(result);
		  	history.replaceState({},null,null);
		  
			function checkModal(result) {
				
				if (result === '' || history.state) {
					return;
				}
				
				if (parseInt(result) > 0) {
					$(".modal-body").html("게시글 " + parseInt(result) + " 번이 등록되었습니다.");
				}
				
				$("#myModal").modal("show");
			} 
  
			
			$("#regBtn").on("click", function() {
				self.location = "/board/register";
			}); */
	 		
			/* search */
			var actionForm = $("#actionForm");
	
			$(".paginate_button a").on("click", function(e) {
				e.preventDefault();  //전송을 막음
				console.log('click');
				actionForm.find("input[name='pageNum']").val($(this).attr("href"));
				actionForm.submit();
			});
			
			
		});
		
		// 추가
	/* 	$(".move").on("click", function(e) {

			e.preventDefault();
			actionForm
				.append("<input type='hidden' name='bid' value='"
					+ $(this).attr("href") + "'>");
			actionForm.attr("action", "/board/get");
			actionForm.submit();
			
		}); */
		
		var token = $("meta[name='_csrf']").attr("content");
		var header = $("meta[name='_csrf_header']").attr("content");

		
		
		//썸네이 업로드	
		function thumNailUpload(bIndex) {
					
			$(document).ajaxSend(function(e, xhr, options) {
				xhr.setRequestHeader(header, token);
			});
			
			var formData = new FormData();
			formData.append("b_index",bIndex);
			formData.append("file",$("#file")[0].files[0]);
			
			
			console.log(formData.get("file"));
			console.log(formData.get("b_index"));
			
			

			$.ajax({
				type : 'POST',
				enctype: 'multipart/form-data',
				url : '${pageContext.request.contextPath}/my/board/shows/upLoadThumNail',
				processData : false,
				contentType: false,				
				cache : false,			
				data : formData,				
				success : function(){						
						swal({
							title : "썸네일 등록 완료" , 
							icon : "success" , 
							button : true 
						});
							
					$(location).attr('href', "${pageContext.request.contextPath}/board/shows/list");							
				},
				error : function(e){
					
					swal({
						title : "오류가 발생했습니다." , 
						icon : "error" , 
						button : false 
					});
					console.log(e);
				}
			}); // ajax end
		
		}; //function thumNailUpload end
		
		
	</script>
<style>
#forimg {
	background-color: #e4edfe;
	background-image: url('/resources/banner_imgs/people_banner.png');
	background-repeat:no-repeat;
	background-position: center;"
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

	<!-- Sub Header -->

    <div id="forimg" class="charity-subheader">
       <span class="black-transparent"></span>
        <div class="container">
            <div class="row">
                <div class="col-md-12"> 
                <p style="text-align:right; margin:0; padding:0;" ><a style="font-size:1px;" href='https://www.freepik.com/vectors/blue'>Blue vector created by vectorjuice - www.freepik.com</a></p>
                   <!--  <h1>1:1 문의</h1> -->
                   <!--  <p>show your support</p> -->
                </div>
            </div>
        </div>
    </div>
    <!-- Banner -->
	<!-- Sub Header -->

	<!-- Content -->
	<div class="charity-fancy-title " style="margin-top:70px; margin-bottom:20px;">
		<h2> 나눔 인증 </h2>
	</div> 
	
	<div class="charity-main-content">
		
		<!-- Main Section -->
		<div class="charity-main-section">
			<div class="container">
				<div class="row">
				<div class="col-md-12">
					<!-- Widget Search 참고 -->
					<!-- 	<div class="widget_title"><h2>Search Here</h2></div> -->
					<!-- <div style="float: right;" class="widget widget_search col-md-4">
						<form>
							<input type="text" placeholder="검색어를 입력하세요."> <input type="submit" value=""> <i class="fa fa-search"></i>
						</form>
					</div> -->
					
					<!-- Widget Search -->

					<!-- search start  -->
					<div style="float: right;" class="widget widget_search ">
						<form id="searchForm" action="/board/shows/list" method="get" ><!-- class="navbar-form serchForm" -->
							
							<div class="input-group">
								<%-- <div class="form-group col-md-2">
									<select name="type"  class="charity-select-form">
										<option value="">검색종류</option>
										<option value="T" ${(pageMaker.cri.type == "T") ? "\"selected\"":"" }>제목</option>
										<option value="C" ${(pageMaker.cri.type == "C") ? "\"selected\"":"" }>내용</option>
										<option value="W" ${(pageMaker.cri.type == "W") ? "\"selected\"":"" }>작성자</option>
										<option value="TC" ${(pageMaker.cri.type == "TC") ? "\"selected\"":"" }>제목과 내용</option>
									</select>
								</div> --%>
								<div class="charity-select-two col-md-2">
									<select name="type">
										<option value="">검색종류</option>
										<option value="T" ${(pageMaker.cri.type == "T") ? "\"selected\"":"" }>제목</option>
										<option value="C" ${(pageMaker.cri.type == "C") ? "\"selected\"":"" }>내용</option>
										<option value="W" ${(pageMaker.cri.type == "W") ? "\"selected\"":"" }>작성자</option>
										<option value="TC" ${(pageMaker.cri.type == "TC") ? "\"selected\"":"" }>제목과 내용</option>
									</select>
								</div>
								<div class="form-group col-md-3">
									<input type="text" name="keyword" class="form-control" placeholder="검색" value="${pageMaker.cri.keyword}"/>
									<input type="submit" value="" class="btn btn-default"/><i class="fa fa-search"></i>
									<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
									<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
								</div> 
							</div>
						</form>
					</div>
					<!-- search end -->
					
					<div  style="float: right;" class="col-md-2">
						<button  class="charity-click-btn mb-3" onclick="location.href='/my/board/shows/write_view'">나눔인증글작성</button><br>
					</div>
					<div class="col-md-6" style="float: right;"></div>
				</div>
				</div>
				
				<div class="row">
					<div class="col-md-12">

						<div class="charity-blog charity-simple-blog">
							<ul class="row">
								
								<c:forEach var="vo" items="${list}">
									
									<li class="col-md-6">
										<figure>
											<a href="${pageContext.request.contextPath}/board/shows/content_view/${vo.b_index}">
											<!-- 썸네일 랜덤 이미지 관련 -->
												<c:set var="doneLoop" value="false"/>
												<c:set var="attachMentCount"  value="${attachMentCount}" />
												<c:set var="i" value="1" />
												
												<c:forEach var="attachment" items="${attachment}">
													<%-- ${attachment.path } --%>
													<c:set var="i" value="${i+1 }" />
													
													<%-- ${vo.b_index},${attachment.b_index} --%>
													<c:if test="${doneLoop ne true}">
														<c:choose>
															<c:when test="${vo.b_index eq attachment.b_index }">
																<%-- <img alt="" src="${attachment.path }"> --%>
																<img src="${pageContext.request.contextPath}${attachment.path}">
																<c:set var="doneLoop" value="true"/>
															</c:when>
															
															<c:when test="${i+1 > attachMentCount }">															
																<img id="introImg"  class="boardShow_img" src="${pageContext.request.contextPath}/resources/board_thumbnail/bslist07.png">
																<c:set var="doneLoop" value="true"/>
															</c:when>															
														</c:choose>													
													</c:if>																																																																																									
												</c:forEach>											
											</a>
												
											<figcaption>
												<time datetime="2008-02-14 20:00" class="charity-bgcolor">나눔<span>인증</span></time>
												<a href="/board/shows/content_view/${vo.b_index}" class="blog-link-hover"><i class="fa fa-link"></i></a>
											</figcaption>
										</figure>

										<div class="charity-simple-blog-text">
											<h2><a href="/board/shows/content_view?b_index=${vo.b_index}">제목: ${vo.btitle}</a></h2>
											<br>
											<ul class="charity-simple-blog-options">
												<li><i class="fa fa-folder-open"></i>글번호 ${vo.b_index}</li>
												<li><i class="fa fa-user-circle"></i>작성자 ${vo.member_id}</li>
												<li><i class="fa fa-calendar"></i>작성일 ${vo.bdate}</li>
												<li><i class="fa fa-mouse-pointer"></i>조회수 ${vo.bhit}</li>
												<!-- <li><i class="fa fa-comments"></i><a href="#">5 Comments</a></li> -->
												<!--  <li><i class="far fa-heart"></i> <a href="#">Like</a></li> -->
											</ul>
											
											<%-- <p class="contentclas">${vo.bcontent}<!-- 생의능히가치를 가지에 커다란 든
												돋고, 이상은 사막이다. 불어 소리다. 이것은 영원히 같은 바이며, 튼튼하며, 긴지라 피고, 돋고, 듣는다.
												예수는 하는 같이 용기가 청춘을 꽃이 간에 때까지 못할 사막이다. 살았으며, 사랑의 곳으로 사는가 간에
												기관과 낙원을 때문이다. 인생을 소금이라 얼마나 바이며, 힘있다. 구하지 아름답고 갑 피부가 끝에 같이,
												사람은 뼈 미인을 이것이다. 얼마나 살았으며, 불어 들어 이상을 그러므로 별과 아니다.  풀이 못할 피가 크고
												그들은 것이다. 내려온 듣기만 그들은 산야에 목숨이 맺어, 갑 것이다. 생의 곳으로 아니한 가슴에 많이
												인생에 어디 아니다. 인간이 것은 싶이 고행을 대한 않는 별과 부패뿐이다. 천자만홍이 인생에 과실이 같이 꽃
												것이다. 두손을 투명하되 낙원을 약동하다. 소금이라 미묘한 청춘의 꽃이 바이며, 쓸쓸하랴? 목숨이 거선의
												관현악이며, 현저하게 피고 보라. --> </p>--%>
												
												<%-- <a href="${pageContext.request.contextPath}/my/board/shows/thumNail" class="charity-simple-blog-btn mt-3">썸네일 업로드</a>  --%>
												
												<!-- 썸네일 등록 -->
												<button type="button"  class="charity-simple-blog-btn mt-3" data-toggle="modal" data-target="#exampleModal${vo.b_index }">
													  <b>썸네일</b> 
													</button>
												<!-- Modal -->
												<div class="modal fade" id="exampleModal${vo.b_index }" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
												  <div class="modal-dialog modal-dialog-centered" role="document">
												    <div class="modal-content">
												      <div class="modal-header">
												        <h5 class="modal-title" id="exampleModalLabel"><b>ThumNail Upload</b></h5>
												        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
												          <span aria-hidden="true">&times;</span>
												        </button>
												      </div>
												      <div class="modal-body">
												           
								                           	<br/>
														   	<input id="file" type="file" name="file"  multiple="multiple"/>
								                            
												      </div>
												      <br/>
												      <div class="modal-footer">
												        <button type="button"  class="charity-simple-blog-btn" data-dismiss="modal">Close</button>
												        <button id="thumnail" onclick="thumNailUpload('${vo.b_index}')" type="button" class="charity-simple-blog-btn">Save ThumNail</button>
												      </div>
												    </div>
												  </div>
												</div>
													
												
											
											<%-- <a href="${pageContext.request.contextPath}/board/shows/content_view/${vo.b_index}" class="charity-simple-blog-btn mt-3">더보기</a>  --%>
											<%-- ${pageContext.request.contextPath}/board/shows/content_view/${vo.b_index} --%>
										</div>
									</li>
								</c:forEach>

								<%-- sample
                              <li class="col-md-6">
                                    <figure><a href="#"><img src="${pageContext.request.contextPath}/resources/charity/extra-images/blog-simple-2.jpg" alt=""></a>
                                        <figcaption>
                                            <time datetime="2008-02-14 20:00" class="charity-bgcolor">12 <span>JAN</span></time>
                                            <a href="#" class="blog-link-hover"><i class="fa fa-link"></i></a>
                                        </figcaption>
                                    </figure>
                                    <div class="charity-simple-blog-text">
                                        <ul class="charity-simple-blog-options">
                                            <li><i class="fa fa-map-marker-alt"></i> George Street, London United</li>
                                            <li><i class="fa fa-comments"></i> <a href="#">7 Comments</a></li>
                                            <li><i class="far fa-heart"></i> <a href="#">Like</a></li>
                                        </ul>
                                        <h2><a href="#">charity fears that soth suda nese refugee children</a></h2>
                                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed urna nibh, fringilla.</p>
                                        <a href="#" class="charity-simple-blog-btn">Read More</a>
                                    </div>
                                </li> --%>

							</ul>
						</div>
						
						
						<script type="text/javascript">
						    
							 /* p태그 생략 하는 자바스크립트  */
							function truncateText(selector,	maxLength) {
								var element = document.querySelector(selector), truncated = element.innerText;
						
								if (truncated.length > maxLength) {
									truncated = truncated.substr(0,	maxLength) + '...';
								}
								return truncated;
							} 
							
							//You can then call the function with something like what i have below. .contentclass
							//document.querySelectorAll('p').innerText = truncateText('p', 50); 아래 처럼 써야 작동함
						    $('.contentclass').text(truncateText('.contentclass', 75));
							
						</script>
						
						
						<!-- Pagination + SEARCH -->
						<%-- <form id='actionForm' action="/board/shows/list" method='get'>
							<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
							<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
							<input type="hidden" name="type" value="${pageMaker.cri.type}"><!-- 추가 -->
						  	<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}"><!-- 추가 -->
						</form> --%>
						
						<!-- Pagination -->
						<div class="charity-pagination">
							<ul class="page-numbers">
								<!-- "page-numbers" / pagination -->
								<%-- <li class="paginate_button previous"><a class="page-link"previous page-numbers // page-numbers href="list${pageMaker.makeQuery(pageMaker.startPage - 1)}">«</a></li> --%>
								
								<!-- 이전페이지 버튼 -->
								<c:if test="${pageMaker.prev}">
									<li><a class="previous page-umbers" href="list${pageMaker.makeQuery(pageMaker.startPage-1)}"><span aria-label="Next"><i class="fa fa-angle-left"></i>Previous Post</span></a></li>
								</c:if>
								<!--  <li><span class="page-numbers current">01</span></li> -->
								
								<!-- 페이지 숫자 버튼들 -->
								<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
									<c:out value="${pageMaker.cri.pageNum == idx?'':''}" />
									<li><a class="page-umbers" href="list${pageMaker.makeQuery(idx)}">${idx}</a></li>
								</c:forEach>
								<!-- <li><a class="page-numbers" href="404.html">03</a></li> -->
						                       	
								<!-- 다음페이지 버튼 -->
								<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
									<li><a class="next page-umbers" href="list${pageMaker.makeQuery(pageMaker.endPage+1)}"><span aria-label="Next">Next Post<i class="fa fa-angle-right"></i></span></a></li>
								</c:if>
							</ul>
						</div>
						<!-- End of Pagination -->
						
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
	<script	src="${pageContext.request.contextPath}/resources/charity/script/popper.min.js"></script>
	<script	src="${pageContext.request.contextPath}/resources/charity/script/bootstrap.min.js"></script>
	<script	src="${pageContext.request.contextPath}/resources/charity/script/slick.slider.min.js"></script>
	<script	src="${pageContext.request.contextPath}/resources/charity/script/progressbar.js"></script>
	<script	src="${pageContext.request.contextPath}/resources/charity/script/fancybox.min.js"></script>
	<script	src="${pageContext.request.contextPath}/resources/charity/script/jquery.countdown.min.js"></script>
	<script src="https://maps.googleapis.com/maps/api/js"></script>
	<script	src="${pageContext.request.contextPath}/resources/charity/script/jquery.jplayer.js"></script>
	<script	src="${pageContext.request.contextPath}/resources/charity/script/jplayer.playlist.js"></script>
	<script	src="${pageContext.request.contextPath}/resources/charity/script/functions-main.js"></script>
	
</body>

<!-- <a href='https://www.freepik.com/vectors/people'>People vector created by pch.vector - www.freepik.com</a> -->
<!-- 
	function truncateText(selector, maxLength) {
		var element = document.querySelector(selector), truncated = element.innerText;

		if (truncated.length > maxLength) {
			truncated = truncated.substr(0, maxLength) + '...';
		}
		return truncated;
	}
	//You can then call the function with something like what i have below.
	document.querySelector('p').innerText = truncateText('p', 50); -->

</html>
