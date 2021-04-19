<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<title>chat</title>

<style>
	#chat-icon {
		position: fixed;
		bottom:20px;
		right: 20px;
	}
	
	#chat-icon:hover {
		cursor: pointer;
	}

</style>

<script type="text/javascript">
	function openChat() { 
		window.open("/chat", "${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username}", "width=400px, height=600px");
	}
</script>


</head>
<body>

	<div id="chat-icon" onclick="openChat()">
		<img src="/resources/nanulogoRe.ico" style="height:60px;">
	</div>
	
</body>
</html>