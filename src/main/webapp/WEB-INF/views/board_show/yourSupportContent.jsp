<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!doctype html>
<html lang="ko">

<head>

    <!-- meta tags -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <!-- csrf_meta_tag_for_jsp
    https://stackoverflow.com/questions/37383730/how-to-add-csrf-token-to-ajax-request -->
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
	
	<!-- 웹페이지 탭 로고이미지 삽입  -->
	<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/nanulogo_ico_convert.ico"> 
	    
    <!-- sweet alert cdn : https://sweetalert.js.org/guides/ -->
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	
	<script type="text/javascript">
		
	/* 인풋박스에 신청 날짜가 오늘 날짜로 입력되도록 하는 자바스크립트 코드  */
	/* This script and many more are available free online at
	The JavaScript Source!! http://javascript.internet.com
	Created by: Jean P. May, Jr. | http://www.wideopenwest.com/~thebearmay */

	function autoDate () {
		
		var tDay = new Date();
		var tMonth = tDay.getMonth()+1;
		var tDate = tDay.getDate();
		if ( tMonth < 10) tMonth = "0"+tMonth;
		if ( tDate < 10) tDate = "0"+tDate;
		document.getElementById("rdate").value = tDay.getFullYear()+"년 "+tMonth+"월 "+tDate+"일";
		//document.getElementById("rdate").value = tDay.getFullYear()+"/"+tMonth+"/"+tDate;
	}
	
	// Multiple onload function created by: Simon Willison
	// http://simonwillison.net/2004/May/26/addLoadEvent/
	function addLoadEvent(func) {
		var oldonload = window.onload;
		if (typeof window.onload != 'function') {
			window.onload = func;
		} else {
			window.onload = function() {
				if (oldonload) {
					oldonload();
				}
				func();
			}
		}
	}
	addLoadEvent(function() {
		autoDate();
	}); 
	</script>
	
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
                    <h1>인증게시판</h1>
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
						<div class="charity-rich-editor">
                            
							<h1>${content_view.btitle}</h1><!-- <hr> -->
							<%-- <figure class="charity-postthumb"><img src="${pageContext.request.contextPath}/resources/charity/extra-images/blog-detail-img.png" alt=""></figure> --%>
							<div class="charity-blog-options">
                                <ul style="float:right">
                                	<li><i class="fa fa-folder-open"></i>  No. ${content_view.b_index}</li> 
                                    <li style="text-indent: 0.3em"><i class="fa fa-calendar"></i><time datetime="2008-02-14 20:00">  ${content_view.bdate}</time></li>
                                    <li style="text-indent: 0.3em"><i class="fa fa-comments"></i><a href="404.html">  23 comments</a></li>
                                    <li style="text-indent: 0.3em"><i class="fa fa-mouse-pointer"></i> 조회수 ${content_view.bhit}</li>
                                </ul>
                            </div>
                            <p>${content_view.bcontent}</p><br>
                           
							<hr>
                            
                            <div class="charity-post-tags">
                                <div class="charity-tags">
                                    <span>Tags:</span>
                                    <a href="#">charity </a>
                                    <a href="#">/ donation</a>
                                    <a href="#"> / needy</a>
                                </div>
                                <div class="charity-blog-social">
                                 	<span></span>
                                    <ul>
                                    	<li><a href="${pageContext.request.contextPath}/board/shows/list" class="fa fa-list-alt"> 목록</a></li>
                                    	<sec:authentication property="principal" var="pinfo" />
										<sec:authorize access="isAuthenticated()">
										<c:if test="${pinfo.username eq content_view.member_id}"> 
                                        	<li><a href="/my/board/shows/modify_view?b_index=${content_view.b_index}" class="fa fa-edit"> 수정</a></li>
                                        	<li><a id="del_btn" href="delete?b_index=${content_view.b_index}" class="fa fa-eraser"> 삭제</a></li>
                                        </c:if>
                                        </sec:authorize>
                                        <!-- onClick="bcontent_del();" -->
                                    </ul>
                                
                                </div>
                            </div>
                        </div>
                        
                        
                        <!-- 이전, 다음글 보기 -->
                      <%--   <div class="charity-prenxt-post">
                            <ul>
                                <li class="charity-prev-post">
                                    <figure>
                                        <a href="404.html"><img src="${pageContext.request.contextPath}/resources/charity/extra-images/post-img1.png" alt=""></a>
                                    </figure>
                                    <div class="charity-prev-artical">
                                        <a href="404.html" class="charity-post-arrow"><i class="fa fa-angle-double-left"></i> Previous Article</a>
                                        <h3><a href="404.html" class="prev_btn">Duis arcu lectus, interdum quisi sodales</a></h3>
                                    </div>
                                </li>
                                <!-- 다음글 -->
                                <li class="charity-next-post">
                                    <figure>
                                        <a href="404.html"><img src="${pageContext.request.contextPath}/resources/charity/extra-images/post-img2.png" alt=""></a>
                                    </figure>
                                    <div class="charity-next-artical">
                                        <a href="404.html" class="charity-post-arrow">Next Article <i class="fa fa-angle-double-right"></i></a>
                                        <h3><a href="404.html">Duis arcu lectus, interdum quisi sodales</a></h3>
                                    </div>
                                </li>
                            </ul>
                        </div> --%>
                        <!-- 이전, 다음글 보기 -->
                       
                        <!-- 댓글 -->
                        <div class="widget_title"><h2>댓글</h2></div><!-- Comments -->
                        <div class="comments-area">
                            
                            <!--// comments \\-->
                            <ul id="listComment"  class="comment-list">
                            
                             	<!-- prepend 자리 -->
                            	
                            	<c:if test="${empty listComment}">
									<p id="nothing" align="center">작성된 댓글이 없습니다</p>
								</c:if>
                             
                             	<c:if test="${! empty listComment}">
                             	<%-- <c:set var="listComment" value="${listComment}" /> --%> <!-- 이건 왜 쓰는건지 잘 모르겠당 -->
                             	<c:forEach var="vo" items="${listComment}">
	                                
	                                <li class="rlist">
	                                    <div class="thumb-list">
	                                    <!-- 랜덤이미지:  class="usre_img" 사용해서 함수실행하고 랜덤 이미지를 돌려가면서 뿌려준다. -->
	                                       <figure><img id="introImg" class="usre_img" src="${pageContext.request.contextPath}/resources/users/user01_sm.png"></figure> 
	                                       <!-- 원래코드 <figure><img id="introImg" border="0"></figure> -->
	                                        
	                                        <div class="text-holder">
	                                            <h6><c:out value="${vo.rid}"/></h6><!-- 작성자 -->
	                                            <div><c:out value="${vo.rdate}"/></div><!-- 작성일 -->
	                                            <p><c:out value="${vo.rcontent}"/></p><!-- 댓글내용 -->
	                                            
	                                            <sec:authentication property="principal" var="pinfo" />
												<sec:authorize access="isAuthenticated()">
												<c:if test="${pinfo.username eq vo.rid}"> 
		                                            <div class="charity-blog-social">
			                                            <i class="fa fa-edit"></i><a class="a-updateView" href="${pageContext.request.contextPath}/board/shows/update_view/${vo.r_num}" ><b>수정하기</b></a> &nbsp;
		                                    		   <%--  onClick="updateView('${vo.b_index}','${vo.rid}','${vo.rdate}','${vo.rcontent}')" --%>
		                                    		    <i class="fa fa-eraser"></i><a class="a-del" href="${pageContext.request.contextPath}/board/shows/delete/${vo.r_num}" ><b>삭제하기</b></a>
		                                    		    <%--  onClick="del('${vo.b_index}','${vo.r_num}')" --%>
	                                    		    </div>
                                    		    </c:if>
                                    		    </sec:authorize>
	                                            <br> 

	                                        </div>  <!-- text-holder end -->
	                                    </div> <!-- thumb-list end -->
	                                </li> <!-- rlist end -->
	                                
                                </c:forEach>
                                </c:if>
                            </ul>
                            <!--// comments \\-->
                            
                        </div>
                        
                        <!--// 댓글 작성 영역 comment-respond \\-->
                        <div class="widget_title"><h2>댓글을 남겨주세요.</h2></div><!-- Leave a Comment -->
                        <div class="comment-respond">
                            <form id="insertForm" action="${pageContext.request.contextPath}/board/shows/reply_insert" method="post">
                                <input type="hidden" id="b_index" name="b_index" value="${content_view.b_index}"/>
									<sec:authentication property="principal" var="pinfo" />
									<sec:authorize access="isAuthenticated()">
									<c:if test="${! empty  pinfo.username}"> 
	                                <p>
	                                    <label>작성자(아이디)</label>
	                                    <input type="text" id="rid" name="rid" value="<c:out value='${pinfo.username}'/>" readonly> <!-- 문제는 이렇게 바꾸니까 값이 안넘어간다 ㅠㅠ -->
	                                  <%--   <input type="text" id="rid" name="rid" value="<sec:authentication property="principal.member.member_id"/>"  readonly >  
	                                   			이거쓰면 로그인 안한 사람이 댓글 없는 컨텐트뷰에 들어올 때 에러남 --%>
	                                </p>
	                                </c:if>
                               	 	</sec:authorize> 
                                <p>
                                    <label>작성일</label>
                                    <input type="text" id="rdate" disabled >
                                </p>   
                                <p class="charity-respond-full-form">
                                    <label>댓글내용</label>
                                    <textarea id="rcontent" name="rcontent" placeholder="댓글을 작성하세요." class="commenttextarea"></textarea>
                                </p>
                                <p class="form-submit">
                                    <!-- <input name="comment_post_ID" value="99" id="comment_post_ID" type="hidden"> -->
                                	<input id="resubmit" name="submit" class="submit" value="댓글작성" type="submit">
                                	
                                <!-- 여기서는 수정, 삭제를 할 필요가 없었잖아? <button type="button" class="btn btn-primary-sm m-2" onClick="rmodify()">삭제</button>
									<button type="button" class="btn btn-primary-sm m-2" onClick="rmodify()">수정</button> -->
                                </p>
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                            </form>
                        </div>
                        <!--// 댓글 작성 영역 comment-respond \\-->
                        
                    </div>
 					<!-- aside 제외한 왼쪽 컨텐츠 div 끝 -->

					<!-- 우측 배너  aside -->
					<%@ include file="/WEB-INF/views/board_show/aside.jsp"%>
					<!-- aside end -->
					
                </div>
            </div>
        </div>
        <!-- Main Section -->

    </div>
    <!-- Content -->

    <!-- Footer -->
    <%@ include file="/WEB-INF/views/mainMap/mainFooter.jsp"%>
    <!-- Footer -->
 
	<script>
	// 댓글 작성 누를 때 로그인 체크: 로그인이 되어있지 않으면 alert창이 뜨고 확인버튼을 누르면 loginPage로 이동한다.
	$(document).ready(function() {
		var rid = $("#rid").val();
		function checkLogin() {
			if (rid == undefined) {
				// 예쁜 alert창
				// 주소이동하는방법 참고: https://onecutwook.tistory.com/3
				// .then키워드는 확인 버튼을 클릭하고 나서 이후의 동작을 정의할 수 있다. => 이 화살표 연산자는 익스플로러에서 작동이 되지 않는다고한다.
				swal({
					text: "로그인 후 글을 작성해주세요.",
					icon: "error",
					button :"확인",
					//timer: 5000,
				})
				.then(function(){
					location.href = '/loginPage'
				});
				//alert("로그인 후 글을 작성해주세요.");
			}
		}
		//댓글 작성 로그인 체크
		$('#resubmit').click(function() {
			checkLogin();
		});
	});
	
	</script>

    <script type="text/javascript">
    	// 이전 페이지 주소
    	/* $(".a-prev_btn").click(function(event) {
    		event.preventDefault();
    		alert("이전글 버튼 click");
    	} */
    	
    	/* function prev_move(b_index) {
			console.log(b_index)
		};
		function next_move(b_index) {
			console.log(b_index)
		};
		if(b_index !== null){
			var url = "${pageContext.request.contextPath}/board/shows/content_view/" + b_index -1;
		}
    	
    	
	   	$.ajax({
	`			type: "POST",
	   	        contentType: 'application/json; charset=utf-8',
	   	  		url: url,
	   	        data: JSON.stringify(form), 
	   	        cache : false,
	   	      
	   	        success: function (data) { 
	   	        	
	   	        console.log("SUCCESS : ", data);
	   	}); */
	   	
	   	 
	   /* 	var member_id = ${content_view.member_id};
	   	var username = ;
	   	
	   	if(member_id ! == username || username == null){
	   		$('#bcontent_del').hide();
	   	}
	   	 */
	   	 
   		// 랜덤 이미지 불러오기 (슬비씨 깃허브 참고: https://github.com/seulpi/TIL/blob/cfae84682eb65d8e85f76de11de663a17f14f22f/Quiz/spring_Answer11.md#5-view )
		$(function(){
	    	$('.usre_img').each(function (index, item) {	        	
	        	var imgUrl = '${pageContext.request.contextPath}/resources/users/user0' + Math.floor((Math.random() * 5) + 1) + '_sm.png';
	        	console.log(imgUrl);
	        	console.log($(item).attr("src"));
	        	$(item).attr("src", imgUrl);
		});
	    	
    	// 댓글 입력 및 ajax로 작성한 댓글 불러오기
    	 $("#insertForm").submit(function(event){
    		event.preventDefault();
    		
    		//alert("insert 시작");
    		// 전달할 값 넣기
    		var b_index = $("#b_index").val();
    		var rid = $("#rid").val();
    		var rcontent = $("#rcontent").val();
    		
    		// 작성된 댓글이 없습니다.
    		//var nothing = $('#nothing').val();
    		
    		// 오늘날짜 받기
            var tDay = new Date();
    		var tMonth = tDay.getMonth()+1;
    		var tDate = tDay.getDate();
    		
    		if ( tMonth < 10) tMonth = "0"+tMonth;
    		if ( tDate < 10) tDate = "0"+tDate;
          	
    		var date = (tDay.getFullYear()+"-"+tMonth+"-"+tDate); // 이거를 바로 쏴주면 sql에러가 났었다.
          
          	var rdate = new Date(date); //그래서 이렇게 변환해서 서버로 넣으니까 잘 들어간다. 하지만 ajax로 뷰단에 쏴줄때는 위의 date를 뿌려줘야 yyyy-mm-dd형식으로 잘 뿌려진다.
    		console.log("rdate= " + rdate + "date= " + date ) ;
    		
    		console.log(b_index,  rid, rcontent, rdate);
    		
    	 	var form = {
    				b_index: b_index,
    				rid : rid,
    				rcontent : rcontent,
    				rdate : rdate
    		}  
    	 	
    	 	// csrf
    	    var token = $("meta[name='_csrf']").attr("content");
            var header = $("meta[name='_csrf_header']").attr("content");
            $(document).ajaxSend(function(e, xhr, options) {
                xhr.setRequestHeader(header, token);
            });
           
     		$.ajax({
    			type:"POST",
    			url:"${pageContext.request.contextPath}/board/shows/reply_insert",
    			cache : false,
    			dataType: 'text',
    			contentType:'application/json; charset=UTF-8',
    			data: JSON.stringify(form),
    			success : function(r_num) {
    					//alert(r_num)
    					//alert(result.replyVO.r_num)
    					//alert(result.rvo.b_index)
    					
	    				swal({
						  title : "댓글 입력 완료" , 
						  icon : "success" , 
						  button : true 
						})
					
    					htmls = '';
    					
    					htmls += '<li>'
    					htmls += '<div class="thumb-list">'
    					htmls += '<figure><img id="introImg" class="usre_img" src="${pageContext.request.contextPath}/resources/users/user02_sm.png"></figure>'
    					htmls += '<div class="text-holder">'
    					htmls += '<h6>' + rid + '</h6>'
    					htmls += '<div>' + date + '</div>' /* rdate를 뿌리면 Mon Apr 12 2021 09:00:00 GMT+0900 (대한민국 표준시)가 나옴  */             
    					htmls += '<p>' + rcontent + '</p>'
						htmls += '<div class="charity-blog-social">'
						htmls += '<i class="fa fa-edit"></i><a class="a-updateView" href="${pageContext.request.contextPath}/board/shows/update_view/' + r_num + '" ><b>수정하기</b></a>'+'&nbsp;'
						htmls += '<i class="fa fa-eraser"></i><a class="a-del" href="${pageContext.request.contextPath}/board/shows/delete/' + r_num + '" ><b>삭제하기</b></a></div>'
    					htmls += '</div>'
    					htmls += '</div>'
    					htmls += '</li>'
    					
    					$("#listComment").prepend(htmls); // 작성 결과 입력
    					
    					$('#rcontent').val(''); //인풋박스 초기화
    					$('#nothing').hide();
    					
    					$(".a-del").click(function(event) { //id는 한번만 calss는 여러번 선택 가능.
    			    		//하나의 id는 한 문서에서 한 번만 사용이 가능(가장 마지막 혹은 처음게 선택). 
    			    		event.preventDefault(); 
    			    	
    			    		//alert("replyDel click");
    			    		console.log("replyDel click");
    			    		
    			    		// csrf
    			    	    var token = $("meta[name='_csrf']").attr("content");
    			            var header = $("meta[name='_csrf_header']").attr("content");
    			            $(document).ajaxSend(function(e, xhr, options) {
    			                xhr.setRequestHeader(header, token);
    			            });
    			            
    			    		var tr = $(this).parent().parent().parent().parent();//자바스크립트 클로저
    			    		
    			    		$.ajax({
    			    			type : 'DELETE', //method
    			    			url : $(this).attr("href"), //주소를 받아오는 것이 두 번째 포인트.
    			    			cache : false,
    			    			success : function(result) {
    			    				console.log("result: " + result); 
    			    				/* if (result == "SUCCESS") {
    			    					$(tr).remove();
    			    					//alert("삭제되었습니다.");
    			    					swal({
    									  title : "진짜로 댓글을 삭제하시겠습니까?" , 
    									  text : "삭제하면이 댓글을 복구 할 수 없습니다!" , 
    									  icon : "warning" , 
    									  button : true , 
    									  dangerMode : true , 
    									})
    									.then((willDelete) => { 
    									  if (willDelete) {  
    									    swal("댓글이 삭제되었습니다!" , { 
    									      icon : "success" , 
    									    });
    									  } 
    									});
    			    					if($('.rlist') !== null){
    			    						$('#nothing').show();
    			    					}  */
    			    					if (result == "SUCCESS") {
    			    					$(tr).remove();
    			    					//alert("삭제되었습니다.");
    			    					swal({
    									  title : "댓글이 삭제되었습니다." , 
    									  icon : "success" , 
    									  button : true 
    									})
    			    				}
    			    			},
    			    			errer : function(e) {
    			    				console.log(e);
    			    			}
    			    		}); //end of ajax
    			    		
    			     	}); // 삭제 종료
    			    	
    				},
    				error : function(request, status, error) {
    					//alert("code:" + request.status + "\n" + "message:"
    					//		+ request.responseText + "\n" + "error:" + error);
    				} // ajax 에러 시 end
    				
    		}); //ajax end
    		 
    		
    		
    	});//#insertForm end
    	
    	// 댓글 삭제
    	
    	$(".a-del").click(function(event) { //id는 한번만 calss는 여러번 선택 가능.
    		//하나의 id는 한 문서에서 한 번만 사용이 가능(가장 마지막 혹은 처음게 선택). 
    		event.preventDefault(); 
    	
    		//alert("replyDel click");
    		console.log("replyDel click");
    		
    		// csrf
    	    var token = $("meta[name='_csrf']").attr("content");
            var header = $("meta[name='_csrf_header']").attr("content");
            $(document).ajaxSend(function(e, xhr, options) {
                xhr.setRequestHeader(header, token);
            });
            
    		var tr = $(this).parent().parent().parent().parent();//자바스크립트 클로저
    		
    		$.ajax({
    			type : 'DELETE', //method
    			url : $(this).attr("href"), //주소를 받아오는 것이 두 번째 포인트.
    			cache : false,
    			success : function(result) {
    				console.log("result: " + result);
    				
    					if (result == "SUCCESS") {
    					$(tr).remove();
    					//alert("삭제되었습니다.");
    					swal({
						  title : "댓글이 삭제되었습니다." , 
						  icon : "success" , 
						  button : true 
						})
    				}
    			},
    			errer : function(e) {
    				console.log(e);
    			}
    		}); //end of ajax
    		
     	}); // 삭제 종료
    	
     	// 댓글 수정 창 보기
     	/*  $(".a-updateView").click(function(event) {
    		event.preventDefault();
    		alert("수정하기 click");
    		
    		function(b_index, rid, rcontent, rdate){
    			console.log(b_index);
        		console.log(rid);
        		console.log(rcontent);
        		console.log(rdate);
        		
        		var b_index = b_index;
        		var rid = rid;
        		var rcontent = rcontent;
        		var rdate = rdate;

    		};
    	 	var form = {
    				b_index: b_index,
    				rid : rid,
    				rcontent : rcontent,
    				rdate : rdate
    		}  
    	 	
    	 	// csrf
    	    var token = $("meta[name='_csrf']").attr("content");
            var header = $("meta[name='_csrf_header']").attr("content");
            $(document).ajaxSend(function(e, xhr, options) {
                xhr.setRequestHeader(header, token);
            }); 
    		
    		$.ajax({
    			type : "GET",
    			url : $(this).attr("href"),
    			cache : false,
    			contentType : 'application/json; charset=UTF-8',
    			dataType : "text", // -> 데이터 타입을 적으면 성공했음에도 불구하고 에러로 처리되어 리스트로 넘어가지 않는다. 
    			data: JSON.stringify(form), 
    			success: function (result) {       
    	               if(result == "SUCCESS"){
    					
    						alert(result+ "수정창 보기");
    	                  
    						htmls = '';
    						
    						htmls += '<form id="insertForm" action="${pageContext.request.contextPath}/board/reply_insert" method="post">
    						htmls += '<input type="text" id="b_inedex" name="b_inedex"  class="form-control"  value="' + b_inex + '"/>'
    						htmls += '<input type="text" id="rid" name="rid" class="form-control" value="' + rid + '">'
    						htmls += '<textarea id="rcontent" name="rcontent" class="form-control">'+ rcontent + '</textarea>'
    						htmls += '<br>'
    						htmls += '<button type="submit" class="btn btn-primary pull-right">댓글작성</button>'
    						htmls += '</form>'
    						
    						$("#rlist").val(htmls); // 작성 결과 입력
    											
    	               }                       
    	             },
    	             error: function (e) {
    	                 console.log(e);
    	             }
    			
    		}); // end of ajax
    	});   */  // end of 수정 event 
    	
    });
    </script>	

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

</html>