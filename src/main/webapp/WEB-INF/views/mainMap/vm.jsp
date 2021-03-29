<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="/resources/qrcode.js"></script> <!-- QR생성을 위한 js라이브러리 -->

<html>
<head>
<title>SELECT VM</title>

<meta id="_csrf" name="_csrf" content="${_csrf.token}"/>
<!-- default header name is X-CSRF-TOKEN -->
<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}"/>

<!-- <script>
	
	//csrf관련 토큰 설정(시큐리티 사용해서 이 설정 없으면 post 403에러 뜸)
	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");
	
	$(function() {
	    $(document).ajaxSend(function(e, xhr, options) {
	        xhr.setRequestHeader(header, token);
	    });
	});
	
	
	 $(document).ready(function() { //  함수 형식의 문제로 하루 넘게 고생..function({}} -> function() { }
			
		 $("#selectData").submit(function(event) {
			event.preventDefault();
	 
			var selectCatValue = $(".machine").val();
			var selectItemValue = $(".item").val();
				
			var params = {
				"vm_num" : selectCatValue , 
				"iname" : selectItemValue
				} //json 은 key를 반드시 큰 따옴표로 해줘야한다. 작은 따옴표 안됨.
						
			//var params = $("#selectData").serialize();
				
			console.log(params);
		
			
			$.ajax({ //페이지 변화없이 무언가를 하고싶을때 사용하고 DB에서 꺼내올 데이터가 있을때
				// select문도 카테고리에 따라 내용이 달라지면 ajax사용, 우리는 정해진 DB값을 꺼내오기 때문에 ajax가 필요없음(밑에 select코드 사용해도 충분)
				type: 'POST',
				dataType: 'text', // 왜 'json'으로 주면 에러로 반환할까? 보내는 타이
				data: JSON.stringify(params),
				cache: false,
				contentType : 'application/json; charset=UTF-8',
				url: "${pageContext.request.contextPath}/sendQR", 
				success: function(result) {
					if(result == "SUCCESS") {
						alert(this.data);
					}
				},
				error : function(e) {
					console.log(e);
				}
				
			});
		 });
	}); 

</script> -->

 <script type="text/javascript">
        $(document).ready(function() {
            var qrcode = new QRCode(document.getElementById("qrcode"), {
                text: "",
                width: 128,
                height: 128,
                colorDark : "#000000",
                colorLight : "#ffffff",
                correctLevel : QRCode.CorrectLevel.H
            });
            
            $('#makeButton').click(function() {
                var address = "${pageContext.request.contextPath}/sendQR/" + $('.machine').val() +"/"+ $('.item').val();
                
                qrcode.makeCode(address);
                
                $('#urlsub').click(function() {
                	
                		location.href = address;
                });
                
            });
        });
    </script>


</head>
<body>
	<form id="selectData">

		<select class="machine"> <!-- name은 id와 다르게 중복 가능하나 id,class처럼 css에서는 사용할수가 없음 -->
			<c:forEach items="${vmcat}" var="cat">
				<option value="${cat.vm_num}">${cat.vm_num}</option>
			</c:forEach>
			
		</select> 
		
		<select  class="item">
			<c:forEach items="${vminven}" var="inven">
				<option value="${inven.iname}">${inven.iname}</option>
			</c:forEach>
		</select>
		<button id="makeButton" type="button">QR 생성</button>
	</form>
	
    <div id="qrcode"></div>
    
    <button id ="urlsub" type="button">url테스트</button>
</body>
</html>
