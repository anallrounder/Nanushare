<!-- 혜선_ 물품기부 신청서 작성, 전송 뷰 페이지 틀 작성중 03.18-->

<%@ page language="java" contentType="text/html; charset=UTF8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>포인트 기부</title>

<!-- point input box 입력시 공백일 경우와 1000포인트 미만일 경우 검증 -->
<script>
	/* alert띄우는 방법 */
	/* function dd(bool){
		if(boll.value.length==0){
			alert("기부할 포인트를 입력해주세요.")
			return false;
		}
		return true;
	} */
	
	/* 인풋박스 오른쪽에 빨간글씨로 검증 내용 띄우는 방법 */
	function dd(bool){
		var hlep = document.getElementById("one_help");
		if(bool.value.length==0){
			help.innerHTML = "기부할 포인트를 입력해주세요.";
			return false;
		}
		else{
			help.innerHTML="";
		}
		return true;
	}
	
	/* 4자리 이상 숫자인지 확인 */
	function(data){
		var hlep = document.getElementById("one_help");
		if(data.value.lenth!=4){
			help.innerHTML = "1000point부터 기부할 수 있습니다.";
			return false;
		}
	
		return true;
	}
	
	/* 수업시간에 배운 방식 */
	window.onload = function(){
		var lf = document.getElementById("donatePoint");
        lf.onsubmit = function() {
          if(document.getElementById("inputPoint").value == "") {
            alert("기부할 포인트를 입력해주세요.");
            return false;
          } else {
            alert("포인트가 기부되었습니다.!");
            return true;
          }
        };
      }
	}
</script>


</head>
<body>

	<h2>포인트 나눔하기</h2>

	<div>
	<form id="donatePoint" name="donatePoint" method="post" action="pointAction">
		<c:forEach var="vo1" items="${memberInfo}"> 
		<input type="hidden" name="member_id" value="${vo1.member_id}">
		
		<table>
			<tr>
				<td width="150">아이디(이메일)</td>
				<td colspan="5">${vo1.member_id}</td>
			</tr>
			<tr>
				<td>이름</td>
				<td colspan="5">${vo1.name}</td>
			</tr>
			
			<c:forEach var="vo2" items="${vo1.pointList}">
			<tr>
				<td>보유포인트</td>
				<td>${vo2.nowpnt} 포인트
				<input type="hidden" name="totalpnt" value="${vo2.totalpnt}">
				<input type="hidden" name="nowpnt" value="${vo2.nowpnt}">
				</td>
			</tr> 
			</c:forEach> 
			<tr>
				<td>나눌 포인트</td>
				<td colspan="5">
					<input type="text" id="inputPoint" name="dntpnt" placeholder="기부할 포인트를 입력하세요." onblur="dd(this)"/> point
					<span id="one_help" class="help"></span> <!-- 경고창을 텍스트 박스 옆에 띄우기 위함 -->	
				</td>
			</tr>
			<tr>	
				<td colspan="6">*포인트는 1000p 이상부터 100p단위로 나눔할 수 있습니다.</td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" id="btnDonatePoint" value="나눔하기"></td>
				<td colspan="2"><input type="reset" value="다시선택하기"></td>
				<td colspan="2"><a href="/donation/item/main">이전화면으로</a></td> <!-- 확인필요 -->
			</tr>
		</table>
		</c:forEach>
	</form>
	</div>
</body>
</html>