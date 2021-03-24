<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	통계 테스트

	 <c:forEach var="result" items="${daymoney}">
	 	<c:set var="total" value= "${total + result.dntprice}"/>
	 </c:forEach>
	 합계
	 <br><c:out value="${total}"></c:out>;
	 
	<br>
	
	 주별 통계
	 <c:forEach var="dao" items="${weekmoney}">
	 <c:out value="${dao.dntprice}"></c:out>
	 </c:forEach>
</body>
</html>