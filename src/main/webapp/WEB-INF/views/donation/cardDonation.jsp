<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- 아임포트 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<script type="text/javascript">
	var IMP = window.IMP; // 생략가능
	IMP.init('imp54168696'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
	
	IMP.request_pay({
	    pg : 'inicis', // version 1.1.0부터 지원.
	    pay_method : 'card', //결제 수단	    
	    merchant_uid : 'merchant_' + new Date().getTime(), //가맹점에서 생성/관리하는 고유 주문번호
	    name : '주문명:결제테스트', //주문명
	    amount : 14000, //결제금액
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
	
	

</script>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
</body>
</html>