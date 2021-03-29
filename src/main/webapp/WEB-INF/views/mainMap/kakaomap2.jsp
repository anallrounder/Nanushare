<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<html>
<head>
<title>Home</title>

	<!-- 네이티브앱키가 아닌 자바스크립트키를 가져와야함 -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1c9fe3add9f7bb894ed0cd276c423fff"></script>
</head>
<body>
<div id="map" style="width:500px;height:400px;"></div>

	<script>
	
	window.onload = function() {
		
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(37.5700928, 126.9835591), // 지도의 중심좌표
			level : 4 // 지도의 확대 레벨
		};
		

		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

		// 마커를 표시할 위치와 내용을 가지고 있는 객체 배열
		var positions = [ 
			{
			content : '<div><c:forEach var="dao" items="${mapvm}"><c:if test="${dao.vm_num == 's111'}">'
						+'<p style="font-weight: bold; font-size: 18px;">${dao.branch}</p><c:forEach items="${dao.vmamlist}" var="dto">'
							+'<p>${dto.iname} : ${dto.vm_amount}</p></c:forEach></c:if></c:forEach></div>',
			latlng : new kakao.maps.LatLng(37.5700928, 126.9835591)	 /* 사실 위도 경도도 동적으로 데이터 가져와야함 */
		}, {
			content : '<div><c:forEach var="dao" items="${mapvm}"><c:if test="${dao.vm_num == 's222'}">'
			+'<p style="font-weight: bold; font-size: 18px;">${dao.branch}</p><c:forEach items="${dao.vmamlist}" var="dto">'
			+'<p>${dto.iname} : ${dto.vm_amount}</p></c:forEach></c:if></c:forEach></div>',
			latlng : new kakao.maps.LatLng(37.5660156, 126.9828097)
		}, {
			content :'<div><c:forEach var="dao" items="${mapvm}"><c:if test="${dao.vm_num == 's333'}">'
			+'<p style="font-weight: bold; font-size: 18px;">${dao.branch}</p><c:forEach items="${dao.vmamlist}" var="dto">'
			+'<p>${dto.iname} : ${dto.vm_amount}</p></c:forEach></c:if></c:forEach></div>',
			latlng : new kakao.maps.LatLng(37.5697172, 126.9773686)
		}];
		
		
		var markers = new Array();
		var infowindows = new Array();

		for (var i = 0; i < positions.length; i++) {
			
			// 마커 생성
			var marker = new kakao.maps.Marker({
				map : map, // 마커를 표시할 지도
				position : positions[i].latlng // 마커의 위치
			});
			marker.lngData = positions[i].latlng.getLng();
			marker.latData = positions[i].latlng.getLat();
			marker.index = i;
			markers.push(marker);

			// 마커에 표시할 인포윈도우를 생성 
			infowindow = new kakao.maps.InfoWindow({
				content : positions[i].content, // 인포윈도우에 표시할 내용
				removable : true
			});
			
			infowindows.push(infowindow);
			
			//마커 클릭이벤트 (배열에 click이벤트를 하나씩 배열 수 만큼 addListener)
			kakao.maps.event.addListener(marker, 'click', makeOverListener(map, marker, infowindow));
		

			// 마커를 지도에 표시합니다.
			marker.setMap(map);
		};
		
		// 클릭이벤트마다 열고 닫기
		function makeOverListener(map, marker, infowindow) {
		    return function() {
		        for (var i = 0; i < infowindows.length; i++) {
		            infowindows[i].close();
		        }
		        infowindow.open(map, marker);
		    };
		}
		
		// 옆에 지점명 누르면 지도위 마커 인포 띄우기
		$('.branches').click(function() {
			var lng = $(this).data('lng');
			var lat = $(this).data('lat');
			
			//console.log(lng, lat);
			
			for (var i = 0; i < markers.length; i++) {
				var marker = markers[i];
				//console.log(marker.lngData, marker.latData);
				if (lat === marker.latData && lng === marker.lngData) {
					console.log(infowindows[marker.index]);
					var infowindow = infowindows[marker.index];
					for (var i = 0; i < infowindows.length; i++) {
			            infowindows[i].close();
			        }
					infowindow.open(map, marker);
				}
				
			}
		});
	}
	</script>

</body>
</html>
