<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=87c1587ac88e1ca49f898a1b8be46a5c&libraries=services"></script>
		<style>
		    .wrap {position: absolute;left: 0;bottom: 40px;width: 288px;height: 132px;margin-left: -144px;text-align: left;overflow: hidden;font-size: 12px;font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;line-height: 1.5;}
		    .wrap * {padding: 0;margin: 0;}
		    .wrap .info {width: 286px;height: 120px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
		    .wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
		    .info .title {padding: 5px 0 0 10px;height: 30px;background: #eee;border-bottom: 1px solid #ddd;font-size: 18px;font-weight: bold;}
		    .info .close {position: absolute;top: 10px;right: 10px;color: #888;width: 17px;height: 17px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
		    .info .close:hover {cursor: pointer;}
		    .info .body {position: relative;overflow: hidden;}
		    .info .desc {position: relative;margin: 13px 0 0 90px;height: 75px;}
		    .desc .ellipsis {overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
		    .desc .jibun {font-size: 11px;color: #888;margin-top: -2px;}
		    .info .img {position: absolute;top: 6px;left: 5px;width: 73px;height: 71px;border: 1px solid #ddd;color: #888;overflow: hidden;}
		    .info:after {content: '';position: absolute;margin-left: -12px;left: 50%;bottom: 0;width: 22px;height: 12px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
		    .info .link {color: #5085BB;}
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
	
			map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
			 
			// 마커를 표시할 위치와 내용을 가지고 있는 객체 배열입니다 
			positions = [
			    {
			        content: '카카오', 
			        latlng: new kakao.maps.LatLng(33.450705, 126.570677)
			    },
			    {
			        content: '생태연못', 
			        latlng: new kakao.maps.LatLng(33.450936, 126.569477)
			    },
			    {
			        content: '텃밭', 
			        latlng: new kakao.maps.LatLng(33.450879, 126.569940)
			    },
			    {
			        content: '근린공원',
			        latlng: new kakao.maps.LatLng(33.451393, 126.570738)
			    }
			];
			
			markers = [];
			overlays = [];
// 			marker = {};
// 			over = {};
			for(var i = 0; i < positions.length; i++){
				markers[i] = new kakao.maps.Marker({
				       		        map: map, // 마커를 표시할 지도
				    		        position: positions[i].latlng // 마커의 위치
				    		 		});
// 				markers[i] = marker;
				markers[i].setMap(map);
				overlays[i] = new kakao.maps.CustomOverlay({
    			    content: '<div class="wrap">' + 
    	            '    <div class="info">' + 
    	            '        <div class="title">' + 
    	            '            카카오 스페이스닷원' + 
    	            '            <div class="close" onclick="closeOverlay('+i+')" title="닫기"></div>' + 
    	            '        </div>' + 
    	            '        <div class="body">' + 
    	            '            <div class="img">' +
    	            '                <img src="https://cfile181.uf.daum.net/image/250649365602043421936D" width="73" height="70">' +
    	            '           </div>' + 
    	            '            <div class="desc">' + 
    	            '                <div class="ellipsis">'+ positions[i].content +'</div>' + 
    	            '                <div class="jibun ellipsis">(우) 63309 (지번) 영평동 2181</div>' + 
    	            '                <div><a href="https://www.kakaocorp.com/main" target="_blank" class="link">홈페이지</a></div>' + 
    	            '            </div>' + 
    	            '        </div>' + 
    	            '    </div>' +    
    	            '</div>',
    			    map: map,
    			    position: positions[i].latlng
    			});
				closeOverlay(i);
// 				overlays[i] = over;
				
// 				kakao.maps.event.addListener(markers[i], 'click', function() {
// 					overlays[i].setMap(null);
// 				});
				
			}
// 			for(var j = 0; j < positions.length;j++){
// 				kakao.maps.event.addListener(markers[j], 'click', function() {
// 					overlays[j].setMap(null);
// 				});
// 			}
			function closeOverlay(i) {
				overlays[i].setMap(null);
			}
		</script>
		<%
			for(int i = 0; i < 4; i++){
			%>
				<script>
					kakao.maps.event.addListener(markers[<%=i%>], 'click', function() {
						for(var i = 0; i < positions.length; i++){
							if(i!=<%=i%>){
								overlays[i].setMap(null);
							}
						}
						overlays[<%=i%>].setMap(map);
					});
				</script>
			<%
			}
		%>
	</body>
</html>







