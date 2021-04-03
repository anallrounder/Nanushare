<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<html>
<head>
<title></title>
</head>
<body>

	 <!-- 로그인됐을때 버튼 header -->

	 <c:choose>
	  	<c:when test="${success == 'false'}">
	  		<h1 style="color: red">${message}</h1>
		</c:when>
	  <c:otherwise>
	  	<h1 style="color: black">${message}</h1>
	  </c:otherwise>
	</c:choose>

	
</body>
</html>
