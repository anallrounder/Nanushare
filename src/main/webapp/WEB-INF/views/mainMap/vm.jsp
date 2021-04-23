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
                var address = "http://${ip}:8282/sendQR/" + $('.machine').val() +"/"+ $('.item').val();
                console.log("address: " , address);
                
                qrcode.makeCode(address);
                
                $('#urlsub').click(function() {
                	
                		location.href = address;
                });
                
            });
        });
    </script>


    
<style>
@import url("https://fonts.googleapis.com/css?family=Merriweather+Sans&display=swap");

body {
  margin: 0;
  padding: 0;
  font-family: "Merriweather Sans", sans-serif;
  background-color: #dfe4ea;
  min-height: 100vh;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
}

h1 {
  margin-bottom: 3rem;

}

.btn {
  padding: 12px 40px;
  font-size: 16px;
  text-decoration: none;
  background-color: #1e90ff;
  color: #fff;
  transition: 0.2s all;
  box-shadow: 9px 10px 38px -18px rgba(0, 0, 0, 1);
  cursor: pointer;
  border-radius: 2px;

  &:hover {
    opacity: 0.9;
  }

  &:active {
    transform: scale(0.98);
  }
}

.modal {
  display: none;
  position: fixed;
  top: 0;
  left: 0;
  background-color: rgba(0, 0, 0, 0.4);
  z-index: 1;
  width: 100%;
  height: 100%;
  overflow: auto;

}

.modal-content {
    position: fixed;
    top: -50%;
    left: 50%;
    transform: translate(-50%, 50%);
    background-color: #fff;
    margin: 25% auto;
    width: 40%;
    border-radius: 4px;
    text-align: center;
}


.modal-header {
	background-color: #FFAE73;
    padding: 10px 16px;
	color: #fff;
}

.close {
    float: right;
    cursor: pointer;
}

.modal-body {
	padding: 16px;
}

.modal-footer {
	background-color: #FFAE73;
	padding: 16px;
	color: #fff;
	text-align: end;
}

button {
	padding: 8px 28px;
    background-color: #fff;
	color: #ff6348;
    font-size: 14px;
    border: none;
    outline: none;
    border-radius: 3px;
    cursor: pointer;
}

@keyframes show {
  to {
    top: 0;
  }
}


label{
  box-shadow:0 3px 5px rgba(0,0,0,.2);
  padding:15px;
  background:white;
  width:260px;
  display:inline-block;
  position:relative;
  margin-left:10px;
}

#qrcode img {
  justify-content: center;
  margin-left:300px;
}

select {
  border:none;
  outline:none;
  display: inline-block;
  -webkit-appearance:none;
  -moz-appearance:none;
  appearance:none;
  cursor:pointer;
  font-size:16px;
  color:#706c69;
  border-radius:0;
  width:275px;
  z-index:2;
  background:transparent;
}

label:after {
  content:"\25bc";
  font-size:16px;
  color:white;
  background:#FFAE73;
  width:42px;
  text-align:center;
  line-height:3.2em;
  top:0;
  right:0;
  bottom:0;
  position:absolute;
  pointer-events:none;
}

option {
  border-bottom:1px solid #eaeaea;
  border-left:3px solid white;
  appearance:none;
}

option:hover {
  background-color:white;
  border-left:3px solid #f3a1a1;

}


</style>

</head>
<body>

<h1>NanuShare Box &nbsp; &nbsp; <img alt="" src="/resources/nanulogoRe.ico"></h1>
    <!-- Modal trigger -->
    <a class="btn">물품 수령하기 &#9995;</a>

    <!-- Modal -->
    <div class="modal">
      <!-- modal content -->
      <div class="modal-content">
        <div class="modal-header">
          <h3><i>자판기와 물품을 선택하세요!</i><span class="close">&times;</span></h3>
        </div>
        <div class="modal-body">
          <p>&#128683; 수량은 2개 이상 가져가실 수 없습니다 &#128683;<br> 회원님들의 양해부탁드립니다 &#128591; </p>
          
          <form id="selectData">
			<label>
				<select class="machine" > 
					 <option value="" hidden>자판기를 선택하세요</option>
					<c:forEach items="${vmcat}" var="cat">
						<option value="${cat.vm_num}" >${cat.vm_num}</option>
					</c:forEach>
					
				</select>
			</label>
			
			<label>
				<select  class="item">
				 	<option value="" hidden>물건을 선택하세요</option>
					<c:forEach items="${vminven}" var="inven">
						<option value="${inven.iname}">${inven.iname}</option>
					</c:forEach>
				</select>
			</label>
			<button id="makeButton" type="button">QR 생성</button>
		</form>
	
          <div id="qrcode"></div>
        </div>
        <div class="modal-footer">
        
          <button id ="urlsub" type="button">url 테스트</button>
        </div>
      </div>
    </div>



</body>
</html>

 <script type="text/javascript">
        	const modal = document.querySelector(".modal");
        	const modalContent = document.querySelector(".modal-content");
        	
        	var btn = document.querySelector(".btn");
				
        	if(btn) {
        		btn.addEventListener("click", function() {
              	  modal.style.display = "block";
              	  modalContent.classList.add("show");
              	});
        	}
        	
        	var close = document.querySelector(".close");
        	
        	if(close) {
        		
        		close.addEventListener("click", function() {
              	  modal.style.display = "none";
              	  modalContent.classList.remove("show");
              	});

        		
        	}

        	window.onclick = function(e) {
        	  if (e.target == modal) {
        	    modal.style.display = "none";
        	    modalContent.classList.remove("show");
        	  }
        	};

    </script>
