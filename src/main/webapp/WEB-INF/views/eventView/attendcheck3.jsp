<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- 이건무조건 여기있어야함 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- jquery validation cdn 이거 두개 안되면 폼태그 끝나는 시점 바로 밑에 넣기-->
<!-- jquery 플러그인 이기때문에 jquery가 있어야 한다. -->
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>

<!-- jquery validation method cdn -->
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/additional-methods.min.js"></script>


<!-- meta tags -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- 헤더 안에 추가  -->
<!-- csrf 관련이슈 해결방법 : jsp에 meta 태그추가(csrf값 얻기위해) -->
<!-- js에서 csrf 토큰, 헤더등록 -->
<meta name="_csrf" content="${_csrf.token}">
<meta name="_csrf_header" content="${_csrf.headerName}">

<title>Nanushare</title>
<link rel="shortcut icon" type="image/x-icon"
	href="${pageContext.request.contextPath}/resources/nanulogo_ico_convert.ico">
<!-- 웹페이지 탭 로고이미지 삽입  -->


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

<!-- calendar -->
<link href='/resources/calendar/main.css' rel='stylesheet' />
<script src='/resources/calendar/main.js'></script>



<!--<script
	src='https://fullcalendar.io/releases/fullcalendar/3.9.0/lib/moment.min.js'></script>
 <link
	href='https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.9.0/fullcalendar.min.css'
	rel='stylesheet' />
<link
	href='https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.9.0/fullcalendar.print.css'
	rel='stylesheet' media='print' />
<script
	src='https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.9.0/fullcalendar.min.js'></script> -->


</head>



 <!-- <script>
 
 function dateFormat(date){
	 var yyyy = date.getFullYear();
	 var MM = date.getMonth()+1;
	 var dd = date.getDate();
	 var pdate = yyyy + '-' +MM + '-' + dd;
	 return pdate;	
	 console.log(pdate);
 }
 function getEvent(proSeq){
	 var events;
	 
	 $.ajax({
	
		 type : 'POST',
		 data : {
			 proSeq : proSeq
		 },
		 dataType : 'json',
		 async : false,
		 url : '/event/check/mypoint',
		 success : function(result){
			 events = result;
		 },
		 error : function(xhr, status, error){
			 alert('ajax error' + error);
		 }
		 
	 });
	 
	 return events;
	 
	 
	 function updateFunc(info){
		 start = dateFormat(pdate);
		 end = dateFormat(pdate);
		 var prtpnt = $("#prtpnt").val();
		 
		 $.ajax({
				type : 'PUT',
				 data: JSON.stringify(memberJoin),
				 url : "${pageContext.request.contextPath}/my/myprofile/edit/check",
				cache : false,
				contentType: 'application/json',
				async: "false", 
				datatype : 'json',
			success : function(result) {
				  console.log(result);
				  if (result == "y") {
                      msg = '수정되었습니다.';
				  }else{
					  
					  msg = '수정에 실패했습니다.';
				  }
		  
			},
			
			error : functionxhr, status,error) {
				msg = '수정에 실패했습니다.'
			}
		
	});
	 return msg;
	 
	 }//
	 
	 
	 
 }
 
 </script> -->

<script type="text/javascript"> 

function dateFormat(date){
	 var yyyy = date.getFullYear();
	 var MM = date.getMonth()+1;
	 var dd = date.getDate();
	 var pdate = yyyy + '-' +MM + '-' + dd;
	 return pdate;	
	 console.log(pdate);
}


document.addEventListener('DOMContentLoaded', function() {
	 
	//var proSeq = $('#proSeq').val();
	//var events = getEvent(proSeq);
	
	 var calendarEl = document.getElementById('calendar');
	  var calendar = new FullCalendar.Calendar(calendarEl, {
		
	    headerToolbar: {
	    left:'',
	      center: 'title',
	      right: '버튼'
	    },   
	      customButtons: {
	        버튼: {
	          text: '출석체크',
	          click: function() {
	            
	        	  alert('오늘 출석 완료!');
	            
	            $(document).ready(function(){ 
	         	   
	         	   var token = $("meta[name='_csrf']").attr("content");
	         		var header = $("meta[name='_csrf_header']").attr("content");
	         		$(document).ajaxSend(function(e, xhr, options) {
	         			xhr.setRequestHeader(header, token);
	         		});
	            
	            
	         // ajax 통신으로 출석 정보 저장하기 
                // POST "/users/attendances" -> { status: "success", date:"2018-07-01"}
                // 통신 성공시 버튼 바꾸고, property disabled 만들기 
	            /* 추가부분 */
	            
	          
	            
	           	 function dateFormat(pdate){
		           	 var yyyy = date.getFullYear();
		           	 var MM = date.getMonth()+1;
		           	 var dd = date.getDate();
		           	var pdate = yyyy + '-' +MM + '-' + dd;	
		           	
		           	return pdate;
		          }
                
	           //var m	 = calendar.moment(2021-04-13);
	           var m = new Date;
      	 		var pdate = pdate;
      	 		var member_id = $("#member_id").val();
                var prtpnt = 10; 
                
                var memberPoint = {
            			"member_id" : member_id,		 
            			"prtpnt" : prtpnt,
            			"pdate" : pdate
            			
            		}; 
                console.log(member_id);
				  console.log(m);
				  console.log(pdate);
				  console.log(prtpnt);
                
	             $.ajax({
					type : 'POST',
					data: JSON.stringify(memberPoint),
					url : "${pageContext.request.contextPath}/event/check3/getpoint",
					cache : false,
					contentType: 'application/json',
					async: "false",
					datatype : 'json',
					success : function(pdate) {
						$(".fc-버튼-button").prop('disabled', true);
						$(".fc-버튼-button").html('출석완료');
						eventSources: [{
							events: function(info, successCallback, failureCallback) {
								
								
								
								$.ajax({
									url: "${pageContext.request.contextPath}/event/check3/getpoint",
									type: 'POST',
									dataType: 'json',
									data: {
										start : moment(info.startStr).format('YYYY-MM-DD'),
										end : moment(info.endStr).format('YYYY-MM-DD')
									},
									success: function(data) {
										successCallback(data);
									}
								});
							}
						}]
						
						
						  if (pdate == m) {
							  console.log(member_id);
							  console.log(date);
							  console.log(pdate);
	                          console.log("success");
	                          //console.log(pdate);
	                          alert("성공");
	                          
						} else if(result == "FAIL"){
							 console.log(member_id);
							  console.log(m);
							  console.log(pdate);
			   	    		console.log(result);
			   	    		alert("1일 1회 참여가 가능합니다.");
			   	    	} 
				    },
					error : function(e) {
						console.log(member_id);
						alert("필수 입력 사항을 입력해주세요.");
	                     console.log(e);
					}//success, error
					
					
				
					});  //ajax끝 /* 추가부분 */
	            });//function end     

	          }
	        }//버튼
	      }//custom버튼
	    });
	 

	    calendar.render();
	  });

</script>



<body>
	<!-- Header -->
	<%@ include file="/WEB-INF/views/mainMap/mainHeader.jsp"%>
	<!-- Header -->
	<!-- Sub Header -->
	<div class="charity-subheader">
		<!--  style="background-image: url(/resources/loginform/images/bg.jpg);"  -->
		<span class="black-transparent"></span>
		<div class="container">
			<div class="row">
				<div class="col-md-12"></div>
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
					<div class="col-md-9 bottom-spacer">

						<div class="charity-event-rich-editor">
							<h1 style="text-align: center;">
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								매일 출석체크하고 포인트를 적립하세요!</h1>
						</div>

<div>출석체크 달력</div>
						
<!-- 달력 -->
						<div id='calendar' style="max-width: 1000px; margin: 40px auto;">
						</div>
<input type="hidden" name="${_csrf.parameterName}"
									value="${_csrf.token}" />
									



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
	<div class="modal fade searchmodal" id="searchModal" tabindex="-1"
		role="dialog">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-body">
					<a href="/resources/charity/#" class="charity-close-btn"
						data-dismiss="modal" aria-label="Close"><span
						aria-hidden="true">&times;</span></a>
					<form>
						<input type="text" value="Type Your Keyword"
							onblur="if(this.value == '') { this.value ='Type Your Keyword'; }"
							onfocus="if(this.value =='Type Your Keyword') { this.value = ''; }">
						<input type="submit" value=""> <i class="fa fa-search"></i>
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
	<script src="/resources/charity/script/progressbar.js"></script>
	<script src="/resources/charity/script/fancybox.min.js"></script>
	<script src="/resources/charity/script/jquery.countdown.min.js"></script>
	<script src="https://maps.googleapis.com/maps/api/js"></script>
	<script src="/resources/charity/script/jquery.jplayer.js"></script>
	<script src="/resources/charity/script/jplayer.playlist.js"></script>
	<script src="/resources/charity/script/functions-main.js"></script>


</body>
</html>

<!-- 		$(document).ready(function(){
		    				  $('#calendar').fullCalendar({
		    				    header: {
		    				      right: 'custom2 prevYear,prev,next,nextYear'
		    				    },   
		    			        // 출석체크를 위한 버튼 생성 --필요없음. canvas의 id로 가져와봄
		    				   /* customButtons: { */
		    				    	 #canvas:{ 
		    				        custom2: {
		    				         /*  text: '출석체크하기', */
		    				         /*  id: 'check', */
		    				          click: function() {
		    				
		    				        	  url: "/event/check/mypoint",
		    				        	  type: "PUT",
		    				        	  data : {
		    				        		  prtpnt, prtpnt},
		    				        	  }
		    				        	  dataType: "text",
		    				        	  success: function (date) {
		    				        		 //출석이라고 뿌려주기..
			    				        	  }
		    				        		  
		    				        	 }
		    				        }
		    				        	/* $(".fc-custom2-button").prop('disabled', true);
		    				        		  $(".fc-custom2-button").html('출석완료');*/
		    				        }
		    				    },
		    			       // 달력 정보 가져오기 
		    			     
		    				    eventSources: [{
		    				    		  $.ajax({
		    							// ajax 통신으로 달력 정보 가져오기 
		    			                // GET "/users/attendances" -> {dateList:[ date: "2016-03-21", ... ]}
		    				    		url: '/event/check',
		    				    		type: 'GET',
		    				    		dataType: "JSON",
		    				    		success: function (data) { 
		    				    			//출석이라고 뿌려줘야함
		    				    		},
		    				    		error: function() {
		    				    			alert('there was an error while fetching events!');
		    				    		},
		    				    		color: 'purple',   
		    				    		textColor: 'white' 
		    				    	});//ajax
		    				    	
		    				    	}]
		    				    	
		    				  }); 
		    			 }); -->






<!-- <script type="text/javascript">  
document.addEventListener('DOMContentLoaded', function() {
	  var calendarEl = document.getElementById('calendar');

	  var calendar = new FullCalendar.Calendar(calendarEl, {
		 initialView: 'dayGridMonth', //무조건 initialView로 써줘야함
	    header: {
		      right: 'custom2 prevYear,prev,next,nextYear'
		    },
	    footer: {
	      left: 'custom2',
	      center: '',
	      right: 'prev,next'
	    },
	    customButtons: {
	    
	      custom2: {
	        text: 'custom 2',
	        click: function() {
	          alert('clicked custom button 2!');
	        },
	         /*  eventSources: [

			    				        // your event source
			    				        {
			    				          events: [ // put the array in the `events` property
					    				            {
				    				              title  : '출석',
				    				              start  : '2021-04-14'
				    				         }
			    				          ],
			    				          color: 'black',     // an option!
			    				          textColor: 'yellow' // an option!
			    				        }

			    				        // any other event sources...

			    				      ] */

	        
	      }
	    } 
	  });

	  calendar.render();
	});    
		    				    /* eventSources: [{
		    				    		  $.ajax({
		    				    				url: '/event/check',
		  		    				    		type: 'GET',
		  		    				    		data : {
		  		    				    			
		  		    				    			 title : 'chulcheck',
		    				    					  dateList : .getDate
		  		    				    			
		  		    				    		}
		  		    				    		dataType: "JSON",
		  		    				    		success: function (data) { 
		    				    					 
		    				    				  }
		    							// ajax 통신으로 달력 정보 가져오기 
		    			                // GET "/users/attendances" -> {dateList:[ date: "2016-03-21", ... ]}
		    				    		
		    				    			//출석이라고 뿌려줘야함
		    				    		},
		    				    		error: function() {
		    				    			alert('there was an error while fetching events!');
		    				    		},
		    				    		color: 'purple',   
		    				    		textColor: 'white' 
		    				    	});//ajax
		    				    	
		    				    	}] */
		    				    	
		    				 // }); 
		    			// });



</script> -->