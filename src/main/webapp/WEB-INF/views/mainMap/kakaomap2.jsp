<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>


<html>
<head>
<title>Home</title>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<!-- 네이티브앱키가 아닌 자바스크립트키를 가져와야함 -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1c9fe3add9f7bb894ed0cd276c423fff"></script>
</head>
<body>
<div id="map" style="width:500px;height:400px;"></div>
		
	<script>
	
	var positions = new Array();
	var markers = new Array();
	var infoWindows = new Array();
	
	window.onload = function() {
		
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(37.5700928, 126.9835591), // 지도의 중심좌표
			level : 7 // 지도의 확대 레벨
		};
		
		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

		
		// ajax -> 페이지 로드 시 마커, 마커에 대한 인포인도우 정보를 호출
		loadInfoWindows(map, positions, markers, infoWindows);
		
		// 옆에 지점명 누르면 지도위 마커 인포 띄우기
		$('.branches').click(function() {
			var lng = $(this).data('lng');
			var lat = $(this).data('lat');
			
			for (var i = 0; i < markers.length; i++) {
				var marker = markers[i];
				if (lat.toString() === marker.latData && lng.toString() === marker.lngData) {
					
					for (var i = 0; i < infoWindows.length; i++) {
						infoWindows[i].close();
			        }
					var infowindow = infoWindows[marker.index];
					updateInfowindow(marker.vmNum, marker.branch, infowindow);
					infowindow.open(map, marker);
				}
				
			}
		});
	}
	
	function loadInfoWindows(map, positions, markers, infoWindows) {
		$.ajax({
			url: "/vm/info",
			async: false,
			success: function(data) {
				//console.log(data);
				var list = data.list;
				if (list.length <= 0) {
					// javascript return = java에서의 break (실행 종료)
					return;
				}
				
				
				for (var i = 0; i < list.length; i++) {
					var html = '';
					var vm = list[i];
					//console.log(i, vm);
					var vmNum = vm.vm_num;
					var branch = vm.branch;					
					var lat = vm.lat;
					var lng = vm.lng;
					var itemList = vm.vmamlist;
					
					html += '<div>';
					html += '<h4 class="infowindow-title"><i class="fas fa-heart"></i>' + branch + '</h4>';
					html += '<div class="infowindow-item">';
					
					for (var j = 0; j < itemList.length; j++) {
						var item = itemList[j];
						html += '<h6> -' + item.iname + ' : <span style="color:red"> ' + item.vm_amount + '</span></h6>';
						if (item.iname === '마스크') {
							console.log('개수', item.vm_amount);
						}
					}
					
					html += '</div>';
					
					var result = {
							content: html, 
							lat: lat,
							lng: lng, 
							vmNum: vmNum,
							branch: branch
					};
					positions[i] = result;
				}
				//console.log(positions);
			}
		});
		
		
		for (var i = 0; i < positions.length; i++) {
			// 마커 생성
			var marker = new kakao.maps.Marker({
				map : map, // 마커를 표시할 지도
				position : new kakao.maps.LatLng(positions[i].lat, positions[i].lng)  // 마커의 위치
			});
			
			marker.latData = positions[i].lat;
			marker.lngData = positions[i].lng;
			marker.vmNum = positions[i].vmNum;
			marker.branch = positions[i].branch;
			marker.index = i;
			markers.push(marker);

			// 마커에 표시할 인포윈도우를 생성 
			infowindow = new kakao.maps.InfoWindow({
				content : positions[i].content, // 인포윈도우에 표시할 내용
				removable : true
			});
			
			
			infoWindows.push(infowindow);
			
			//마커 클릭이벤트 (배열에 click이벤트를 하나씩 배열 수 만큼 addListener)
			kakao.maps.event.addListener(marker, 'click', makeOverListener(map, marker, infowindow));

			// 마커를 지도에 표시합니다.
			marker.setMap(map);
		};
		return infoWindows;

	}
	// 클릭이벤트마다 열고 닫기
	function makeOverListener(map, marker, infowindow) {
		return function() {
			updateInfowindow(marker.vmNum, marker.branch, infowindow);
	        for (var i = 0; i < infoWindows.length; i++) {
	            infoWindows[i].close();
	        }
	        infowindow.open(map, marker);
	    };
	}
	
	// 실시간으로 사용하기 위한 함수 (클릭했을때 ajax로 DB 실시간 업데이트 되는 로직 콜)
	function updateInfowindow(vmNum, branch, infowindow) {
		
		$.ajax({
			url: "/vm/item/info",
			async: false,
			data: {
				vmNum : vmNum
			},
			success: function(data) {
				
				var content = '';
				content += '<div style="width: 200px;">';
				content += '<h4 class="infowindow-title"><i class="fas fa-heart"></i>' + branch + '</h4>';
				content += '<div class="infowindow-item">';
				
				var itemList = data.iteminfo;
				for (var j = 0; j < itemList.length; j++) {
					var item = itemList[j];
					content += '<h6> -' + item.iname + ' : <span style="color:red">' + item.vm_amount + '</span></h6>';
				}
				
				content += '</div>';
				
				// 윈포윈도우 content 재설정(업데이트)
				infowindow.setContent(content);
			}
		});
	}
	
	</script>

</body>
</html>
