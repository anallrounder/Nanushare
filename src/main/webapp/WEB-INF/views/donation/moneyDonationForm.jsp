<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 버튼을 눌렀을때 결제가 진행, 결제가완료 되면 db카운트 -->
	<!-- 서버로 넘겨줄 정보 즉, nanushare db에 저장할 정보 -->
	<!-- 결제번호, 결제자 아이디, 결제금액, 결제날짜, 
		결제처리 상태(카드는 즉시 완료 되지만, 무통장은 확인을 해야함),pg사, 결제방법 분류 번호 -->
	<!-- 1. 카드, 2. 계좌 -->
	<h1>설명~~~</h1>
	<form action="/donation/money/card" method="get">
		<input type="submit" value="카드">
		
	</form>
	
	<form action="/donation/money/vbank" method="get">
		<input type="submit" value="계좌">
		
	</form>
	

</body>
</html>