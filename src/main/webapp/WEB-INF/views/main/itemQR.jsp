<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="jquery.qrcode.min.js"></script>

<html>
<head>
<title>QR CODE</title>

<script>
	$(document).ready(function(){
		
		$('#qrcode').qrcode("this plugin is great");
		
	});

</script>

</head>
<body>

<div id="qrcode"> </div>

</body>
</html>
