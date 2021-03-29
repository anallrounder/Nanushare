<!-- 혜선_ 물품기부 신청서 작성, 전송 뷰 페이지 틀 작성중 03.18-->

<%@ page language="java" contentType="text/html; charset=UTF8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신청서 작성</title>

<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script> 
<script type="text/javascript">
	function changeSelection(){
		if(document.sendForm.amount.options[document.sendForm.amount.selectedIndex].value == '0'){
			 document.sendForm.donaamount.disabled = true;
			 document.sendForm.donaamount.value = "";
		}
		if(document.sendForm.amount.options[document.sendForm.amount.selectedIndex].value == '9'){
			 document.sendForm.donaamount.disabled = false;
			 document.sendForm.donaamount.value = "";
			 document.sendForm.donaamount.focus();
		} else{
			 document.sendForm.donaamount.disabled = true;
			 document.sendForm.donaamount.value = document.sendForm.amount.options[document.sendForm.amount.selectedIndex].value;
		}
	} 
	
	$(document).ready(function() {
		$('#selectDirect').attr('disabled', 'disabled');
		// submit으로 form 전송시 disabled된 input box값은 전달되지 않아 'submit'버튼 클릭시 해당 컨트롤의 disabled 속성을 제거하도록 해야한다.
		$('#btnSend').click(function(){
			$('#selectDirect').removeAttr('disabled');
		});
	});
	
</script>
<script>
  /* 현재 날짜를 받아오기 위한 작업 */
  document.getElementById('currentDate').valueAsDate = new Date();
  /*  또 다른 방법:  document.getElementById('currentDate').value = new Date().toISOString().substring(0, 10); */
</script>

</head>
<body>
	<!-- 부트스트랩 테마 적용 전. 틀 잡기중 
	 Header: 메뉴  + 마이페이지 / 로그아웃  연결해야함
	 body 신청서 내용  -->
	
	<!-- 테이블 참고자료 (임시 작성)
		itemdonation
	 	IDNT_NUM	NUMBER				No		1	물품기부번호
		IDNTDATE	DATE				Yes		2	날짜
		MEMBER_ID	VARCHAR2(100 BYTE)	Yes		3	아이디
		DONAAMOUNT	NUMBER				Yes		4	기부수량
		ICAT_NUM	NUMBER				Yes		5	물품분류번호 
		
		1	21/03/17	Ulric@naver.com		10	1
		2	21/03/17	Frances@naver.com	5	2
		
		iteminven
		ICAT_NUM	NUMBER				No		1	물품별분류번호
		INAME		VARCHAR2(50 BYTE)	Yes		2	물품명
		IAMOUNT	NUMBER					Yes		3	수량 
		
		1	마스크	100
	 	2	기저귀	100
		3	생리대	100
		4	문구류	100
		5	손세정제	100 
	-->
	
	<div>
	<form name="sendForm" method="post" action="formAction">
		<input type="hidden" name="member_id" value="${memberInfo.member_id}">
		<table>
			<tr>
				<td width="150">아이디(이메일)</td>
				<td colspan="5">${memberInfo.member_id}</td>
			</tr>
			<tr>
				<td>이름</td>
				<td colspan="5">${memberInfo.name}</td>
			</tr>	
			<tr>
				<td>신청날짜</td>
				<td colspan="5"> <input type="date" id="currentDate" name="idntdate"></td>
				<!-- 현재 날짜를 달력에서 자동으로 받아옴.(변경은 가능) -> 그런데 왜 나는 현재날짜가 안받아와지는걸까?
				여기서 중요한건 input type을 date로 해줘야함 -->
			</tr>
			<tr>
				<td>연락처</td> 
				<!-- 수정할 수 있게 변경하는게 좋을까? 일단은 수정할 수 없도록 만들었다.
				추후에 01012345678 과 같이 숫자만 출력되는 것을 -하이픈이 들어가서 보여지도록 구현해야할 필요성이 있어 보인다.
				-->
				<td colspan="5"><%-- <input type="text" name="phone" value="${memberInfo.phone}" /> --%>${memberInfo.phone}</td>
			</tr>
			<tr>
				<!-- 물품선택은 한번에 한종류만 넘길 수 있도록 라디오 버튼으로 구현함 -->
				<td>물품선택</td>
				<td><input type="radio" name="icat_num" value="1">마스크</td>
				<td><input type="radio" name="icat_num" value="2">기저귀</td>				
				<td><input type="radio" name="icat_num" value="3">생리대</td>
				<td><input type="radio" name="icat_num" value="4">문구류</td>
				<td><input type="radio" name="icat_num" value="5">손세정제</td>
			</tr>
			<tr>
				<td>수량선택</td>
				<td colspan="5">
					<!-- disabled는 기본으로 인풋박스가 비활성화 되는 기능이다. 동시에 셀렉트 박스에서 입력한 값이 input box로 입력된다.
					자바스크립트 jQuery 함수를 사용해 셀렉트 박스의 value가 9일 경우(숫자는 임의로 설정함) disabled를 해제하고 수량을 입력할 수 있도록 했다.
					결국 input box에 입력된 값이 form을 넘길 때 수량값으로 넘어가게 된다. -->
					<input type="text" id="selectDirect" name="donaamount" disabled /> 
					<select id="selectBox" name="amount" style="width:160px;" onchange="changeSelection()">
						<option value="0"> 수량선택</option>
						<option value="9">*직접입력*</option>
						<option value="10">10</option>
						<option value="20">20</option>
						<option value="30">30</option>
						<option value="40">40</option>
						<option value="50">50</option>
						<option value="100">100</option>
					</select>
				</td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" id="btnSend" value="신청"></td>
				<td colspan="2"><input type="reset" value="다시선택하기"></td>
				<td colspan="2"><a href="/donation/item/main">이전화면으로</a></td> <!-- 확인필요 -->
			</tr>
		</table>
	</form>
	</div>
</body>
</html>
