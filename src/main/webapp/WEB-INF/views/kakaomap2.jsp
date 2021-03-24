<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<html>
<head>
<title>Home</title>
<!-- <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7077a1888038abefefea902f6662041"></script>
<script>
	document.ready(function(
			var mapContainer = document.getElementById('map'); // 지도를 표시할 div 
		    mapOption = { 
		        center: new kakao.maps.LatLng(37.5701927,126.9744637), // 지도의 중심좌표
		        level: 3 // 지도의 확대 레벨
		    };

		// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
		var map = new kakao.maps.Map(mapContainer, mapOption); 
	
	
	));

</script>
	 -->

	<!-- 네이티브앱키가 아닌 자바스크립트키를 가져와야함 -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1c9fe3add9f7bb894ed0cd276c423fff"></script>
</head>
<body>
<div id="map" style="width:500px;height:400px;"></div>
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(37.5700928, 126.9835591), // 지도의 중심좌표
			level : 5
		// 지도의 확대 레벨
		};
		

		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

		// 마커를 표시할 위치와 내용을 가지고 있는 객체 배열
		var positions = [ {
			content : '<div>종로점</div>',
			latlng : new kakao.maps.LatLng(37.5700928, 126.9835591)
		}, {
			content : '<div>을지로역점</div>',
			latlng : new kakao.maps.LatLng(37.5660156, 126.9828097)
		}, {
			content : '<div>광화문점</div>',
			latlng : new kakao.maps.LatLng(37.5697172, 126.9773686)
		}];

		for (var i = 0; i < positions.length; i++) {
			// 마커 생성
			var marker = new kakao.maps.Marker({
				map : map, // 마커를 표시할 지도
				position : positions[i].latlng // 마커의 위치
			});

			// 마커에 표시할 인포윈도우를 생성 
			var infowindow = new kakao.maps.InfoWindow({
				content : positions[i].content, // 인포윈도우에 표시할 내용
				removable : true
			});

			// 마커에 클릭이벤트를 등록합
			kakao.maps.event.addListener(marker, 'click', makeClick(map,
					marker, infowindow));

		}

		// 인포윈도우를 표시하는 클로저를 만드는 함수
		function makeClick(map, marker, infowindow) {
			return function() {
				infowindow.open(map, marker);
			};
		}
	</script>

</body>
</html>
