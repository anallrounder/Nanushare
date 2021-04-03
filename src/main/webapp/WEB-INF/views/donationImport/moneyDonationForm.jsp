<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- 아임포트 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

 <%-- <sec:csrfMetaTags/> --%>
    <!-- 헤더 안에 추가  -->
    <!-- csrf 관련이슈 해결방법 : jsp에 meta 태그추가(csrf값 얻기위해) -->
    <!-- js에서 csrf 토큰, 헤더등록 -->
    <meta name="_csrf" content="${_csrf.token}">
    <meta name="_csrf_header" content="${_csrf.headerName}">


<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">

$(function() {
	var IMP = window.IMP; // 생략가능 
	IMP.init('imp54168696'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
	

    var token = $("meta[name='_csrf']").attr("content");
    var header = $("meta[name='_csrf_header']").attr("content");
    $(document).ajaxSend(function(e, xhr, options) {
        xhr.setRequestHeader(header, token);
    });
    
    
    /* 카드결제 */
    $('#donaCard').click( 
	   function requestCard() {
		   var donaCardSelect =  $("#donaCardSelect").val();
		   donaCardSelect = parseInt(donaCardSelect);
		   
		    $.ajax({
		       type : 'post',
			   url : "${pageContext.request.contextPath}/my/test",
			   contentType : "application/json; charset=UTF-8",
			   data : 'json',
			   success : function(data){
				   console.log(data);
				   
				   IMP.request_pay({
			    	    pg : 'inicis', // version 1.1.0부터 지원.
			    	    pay_method : 'card', //결제 수단	    
			    	    merchant_uid : 'Nanushare__' + new Date().getTime(), //가맹점에서 생성/관리하는 고유 주문번호
			    	    name : '후원금', //주문명
			    	    amount : donaCardSelect, //결제금액
			    	    buyer_email : data.member_id, //구매자 이메일
			    	    buyer_name : data.name, //주문자 이름   
			    	    m_redirect_url : 'https://www.yourdomain.com/payments/complete'
			    	   /*  m_redirect_url은 모바일 결제프로세스가 시작되면서 PG사의 페이지로 redirect되었다가, 
			    	    완료 후 다시 사이트로 복귀하기 위해 사용되는 파라메터입니다. 
			    	    이 경우, m_redirect_url에 해당되는 서버 핸들러에서 결제여부 체크 및 금액 변조확인이 이루어져야 합니다. 
			    	    이를 위해 결제완료 후 랜딩되는 URL은 다음과 같은 추가 파라메터를 가지게 됩니다. */
			    	}, function(rsp) {
			    	    if ( rsp.success ) { //결제 성공시 호출
			    	        var msg = '결제가 완료되었습니다.';
			    	        msg += '고유ID : ' + rsp.imp_uid;
			    	        msg += '상점 거래ID : ' + rsp.merchant_uid;
			    	        msg += '결제 금액 : ' + rsp.paid_amount;
			    	        msg += '카드 승인번호 : ' + rsp.apply_num;
			    	        
			    	        
			    	        
			    	    } else { //결제 실패시 호출
			    	        var msg = '결제에 실패하였습니다.';
			    	        msg += '에러내용 : ' + rsp.error_msg;
			    	    }
			    	    alert(msg);
			    	});
			   },
			   error: function(e) {
                   

                   console.log("에러");
                   console.log(e);
               }
			  
			   
		   });
	    	
	    	
	    	
    }); //카드결제 end
    
    /* 실시간 계좌 이체 */
    $('#donaTrans').click( 
	   function requestTrans() {
		   var donaTransSelect =  $("#donaTransSelect").val();
		   donaTransSelect = parseInt(donaTransSelect);
	    	
	    	IMP.request_pay({
	    	    pg : 'inicis', // version 1.1.0부터 지원.
	    	    pay_method : 'trans', //결제 수단	    
	    	    merchant_uid : 'Nanushare_' + new Date().getTime(), //가맹점에서 생성/관리하는 고유 주문번호
	    	    name : '후원금', //주문명
	    	    amount : donaTransSelect, //결제금액
	    	    buyer_email : 'iamport@siot.do', //구매자 이메일
	    	    buyer_name : '구매자이름', //주문자 이름   
	    	    m_redirect_url : 'https://www.yourdomain.com/payments/complete'
	    	   /*  m_redirect_url은 모바일 결제프로세스가 시작되면서 PG사의 페이지로 redirect되었다가, 
	    	    완료 후 다시 사이트로 복귀하기 위해 사용되는 파라메터입니다. 
	    	    이 경우, m_redirect_url에 해당되는 서버 핸들러에서 결제여부 체크 및 금액 변조확인이 이루어져야 합니다. 
	    	    이를 위해 결제완료 후 랜딩되는 URL은 다음과 같은 추가 파라메터를 가지게 됩니다. */
	    	}, function(rsp) {
	    	    if ( rsp.success ) {
	    	        var msg = '결제가 완료되었습니다.';
	    	        msg += '고유ID : ' + rsp.imp_uid;
	    	        msg += '상점 거래ID : ' + rsp.merchant_uid;
	    	        msg += '결제 금액 : ' + rsp.paid_amount;
	    	        msg += '카드 승인번호 : ' + rsp.apply_num;
	    	    } else {
	    	        var msg = '결제에 실패하였습니다.';
	    	        msg += '에러내용 : ' + rsp.error_msg;
	    	    }
	    	    alert(msg);
	    	});
	    	
    }); //실시간 계좌 이체  end
     
    
});


</script>




</head>
<body>
	<!-- 버튼을 눌렀을때 결제가 진행, 결제가완료 되면 db카운트 -->
	<!-- 서버로 넘겨줄 정보 즉, nanushare db에 저장할 정보 -->
	<!-- 아임포트 서버에도 내가 원하느정보를 던져주고, rest api를 통해서 아임포트 서버로부터 내가 원하는장보를 가져와서 db에 저장  -->
	<!-- 결제번호, 결제자 아이디, 결제금액, 결제날짜, 
		결제처리 상태(카드는 즉시 완료 되지만, 무통장은 확인을 해야함),pg사, 결제방법 분류 번호 -->
	<!-- 1. 카드, 2. 계좌 -->
	<h1>설명</h1>
	
	<!-- 컨트롤러에서 회원정보 가져오기 member_id, 이름 -->
	
	<button type="button" id="donaCard" onclick="requestCard()" value="카드"  >카드</button>
	<select name="donaCardSelect" id="donaCardSelect"> <!-- 결제금액 선택해서 아임포트에 전달 -->
		<option value="">후원금선택</option>
		<option value="1000">1000원</option>
		<option value="5000">5000원</option>
		<option value="10000">10000원</option>	
	</select>
	<br/>
	
	
	<button type="button" id="donaTrans" onclick="requestTrans()" value="카드"  >계좌</button>
	<select name="donaTransSelect" id="donaTransSelect">
		<option value="">후원금선택</option>
		<option value="1000">1000원</option>
		<option value="5000">5000원</option>
		<option value="10000">10000원</option>	
	</select>
	
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	
	
	

</body>
</html>