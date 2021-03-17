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
	
	<table  width="500" cellpadding="0" cellspacing="0" border="1">
		<tr>
			<td>아이디</td>
			<td>이름</td>
			<td>성별</td>
			<td>전화번호</td>
			<td>패스워드</td>			
		</tr>		
		<c:forEach items="${list}" var="list">
			<tr>
				<td>${list.member_id}</td>
				<td>${list.name}</td>				
				<td>${list.gender}</td>
				<td>${list.phone}</td>
				<td>${list.pw}</td>				
			</tr>
		</c:forEach>
	</table>

</body>
</html>