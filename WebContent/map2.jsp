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
	
			var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
			 
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
			
			markers = [
			               {
			            	   marker : new kakao.maps.Marker({
						       		        map: map, // 마커를 표시할 지도
						    		        position: positions[0].latlng // 마커의 위치
						    		    })
			               },
			               {
			            	   marker : new kakao.maps.Marker({
						       		        map: map, // 마커를 표시할 지도
						    		        position: positions[1].latlng // 마커의 위치
						    		    })
			               },
			               {
			            	   marker : new kakao.maps.Marker({
						       		        map: map, // 마커를 표시할 지도
						    		        position: positions[2].latlng // 마커의 위치
						    		    })
			               },
			               {
			            	   marker : new kakao.maps.Marker({
						       		        map: map, // 마커를 표시할 지도
						    		        position: positions[3].latlng // 마커의 위치
						    		    })
			               }
			              ]
			
			
			overlays = [
			                {
			                	overlay : new kakao.maps.CustomOverlay({
			        			    content: '<div class="wrap">' + 
			        	            '    <div class="info">' + 
			        	            '        <div class="title">' + 
			        	            '            카카오 스페이스닷원' + 
			        	            '            <div class="close" onclick="closeOverlay0()" title="닫기"></div>' + 
			        	            '        </div>' + 
			        	            '        <div class="body">' + 
			        	            '            <div class="img">' +
			        	            '                <img src="https://cfile181.uf.daum.net/image/250649365602043421936D" width="73" height="70">' +
			        	            '           </div>' + 
			        	            '            <div class="desc">' + 
			        	            '                <div class="ellipsis">'+ positions[0].content +'</div>' + 
			        	            '                <div class="jibun ellipsis">(우) 63309 (지번) 영평동 2181</div>' + 
			        	            '                <div><a href="https://www.kakaocorp.com/main" target="_blank" class="link">홈페이지</a></div>' + 
			        	            '            </div>' + 
			        	            '        </div>' + 
			        	            '    </div>' +    
			        	            '</div>',
			        			    map: map,
			        			    position: markers[0].marker.getPosition()
			        			})
			                },
			                {
			                	overlay : new kakao.maps.CustomOverlay({
			        			    content: '<div class="wrap">' + 
			        	            '    <div class="info">' + 
			        	            '        <div class="title">' + 
			        	            '            카카오 스페이스닷원' + 
			        	            '            <div class="close" onclick="closeOverlay1()" title="닫기"></div>' + 
			        	            '        </div>' + 
			        	            '        <div class="body">' + 
			        	            '            <div class="img">' +
			        	            '                <img src="https://cfile181.uf.daum.net/image/250649365602043421936D" width="73" height="70">' +
			        	            '           </div>' + 
			        	            '            <div class="desc">' + 
			        	            '                <div class="ellipsis">'+ positions[1].content +'</div>' + 
			        	            '                <div class="jibun ellipsis">(우) 63309 (지번) 영평동 2181</div>' + 
			        	            '                <div><a href="https://www.kakaocorp.com/main" target="_blank" class="link">홈페이지</a></div>' + 
			        	            '            </div>' + 
			        	            '        </div>' + 
			        	            '    </div>' +    
			        	            '</div>',
			        			    map: map,
			        			    position: markers[1].marker.getPosition()
			        			})
			                },
			                {
			                	overlay : new kakao.maps.CustomOverlay({
			        			    content: '<div class="wrap">' + 
			        	            '    <div class="info">' + 
			        	            '        <div class="title">' + 
			        	            '            카카오 스페이스닷원' + 
			        	            '            <div class="close" onclick="closeOverlay2()" title="닫기"></div>' + 
			        	            '        </div>' + 
			        	            '        <div class="body">' + 
			        	            '            <div class="img">' +
			        	            '                <img src="https://cfile181.uf.daum.net/image/250649365602043421936D" width="73" height="70">' +
			        	            '           </div>' + 
			        	            '            <div class="desc">' + 
			        	            '                <div class="ellipsis">'+ positions[2].content +'</div>' + 
			        	            '                <div class="jibun ellipsis">(우) 63309 (지번) 영평동 2181</div>' + 
			        	            '                <div><a href="https://www.kakaocorp.com/main" target="_blank" class="link">홈페이지</a></div>' + 
			        	            '            </div>' + 
			        	            '        </div>' + 
			        	            '    </div>' +    
			        	            '</div>',
			        			    map: map,
			        			    position: markers[2].marker.getPosition()
			        			})
			                },
			                {
			                	overlay : new kakao.maps.CustomOverlay({
			        			    content: '<div class="wrap">' + 
			        	            '    <div class="info">' + 
			        	            '        <div class="title">' + 
			        	            '            카카오 스페이스닷원' + 
			        	            '            <div class="close" onclick="closeOverlay3()" title="닫기"></div>' + 
			        	            '        </div>' + 
			        	            '        <div class="body">' + 
			        	            '            <div class="img">' +
			        	            '                <img src="https://cfile181.uf.daum.net/image/250649365602043421936D" width="73" height="70">' +
			        	            '           </div>' + 
			        	            '            <div class="desc">' + 
			        	            '                <div class="ellipsis">'+ positions[3].content +'</div>' + 
			        	            '                <div class="jibun ellipsis">(우) 63309 (지번) 영평동 2181</div>' + 
			        	            '                <div><a href="https://www.kakaocorp.com/main" target="_blank" class="link">홈페이지</a></div>' + 
			        	            '            </div>' + 
			        	            '        </div>' + 
			        	            '    </div>' +    
			        	            '</div>',
			        			    map: map,
			        			    position: markers[3].marker.getPosition()
			        			})
			                },
			               ]
			
			
		    kakao.maps.event.addListener(markers[0].marker, 'click', function() {
			    overlays[0].overlay.setMap(map);
			});
		    kakao.maps.event.addListener(markers[1].marker, 'click', function() {
			    overlays[1].overlay.setMap(map);
			});
		    kakao.maps.event.addListener(markers[2].marker, 'click', function() {
			    overlays[2].overlay.setMap(map);
			});
		    kakao.maps.event.addListener(markers[3].marker, 'click', function() {
			    overlays[3].overlay.setMap(map);
			});
		
		function closeOverlay0() {
			overlays[0].overlay.setMap(null);
		}
		function closeOverlay1() {
			overlays[1].overlay.setMap(null);
		}
		function closeOverlay2() {
			overlays[2].overlay.setMap(null);
		}
		function closeOverlay3() {
			overlays[3].overlay.setMap(null);
		}
			
		</script>
	</body>
</html>