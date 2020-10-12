<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=87c1587ac88e1ca49f898a1b8be46a5c&libraries=services"></script>
		<style>
		</style>
	</head>
	<body>
		<div id="map" style="width:500px;height:400px;"></div>
		<script>
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			    mapOption = {
			        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			        level: 3 // 지도의 확대 레벨
			    };  
			
			// 지도를 생성합니다    
			var map = new kakao.maps.Map(mapContainer, mapOption); 
			
			// 주소-좌표 변환 객체를 생성합니다
			var geocoder = new kakao.maps.services.Geocoder();
			// 주소로 좌표를 검색합니다
			geocoder.addressSearch('제주특별자치도 제주시 첨단로 242', function(result, status) {
			
			    // 정상적으로 검색이 완료됐으면 
			     if (status == kakao.maps.services.Status.OK) {
			    	 coords = new kakao.maps.LatLng(result[0].y, result[0].x);
			       // 결과값으로 받은 위치를 마커로 표시합니다
			        var marker = new kakao.maps.Marker({
			            map: map,
			            position: coords
			        });
			
			        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
			        map.setCenter(coords);
			
			    } 
			});
			
			        
		</script>
	</body>
</html>