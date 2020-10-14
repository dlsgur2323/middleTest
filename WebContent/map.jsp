<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		<style>
		    .wrap {position: absolute;left: 0;bottom: 40px;width: 260px;height: 280px;margin-left: -144px;text-align: left;overflow: hidden;font-size: 16px;font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;line-height: 1.5;}
		    .wrap * {padding: 0;margin: 0;}
/* 		    .wrap img {width : 260px;height: 180px;} */
		    .wrap .title {position : relative;}
		    .wrap .wish {position : absolute; right : 10px; top : 10px;}
		    .wrap .info {width: 260px;height: 280px;border-radius: 10px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
		    .info .body {position: relative;overflow: hidden;}
		    .info .desc {position: relative;margin: 13px 0 0 13px;height: 100px;}
		    .desc .ellipsis {overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
		    .desc .jibun {font-size: 11px;color: #888;margin-top: -2px;}
/* 		    .info:after {content: '';position: absolute;margin-left: -12px;left: 50%;bottom: 0;width: 22px;height: 12px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')} */
/* 		    .info .link {color: #5085BB;} */
		</style>
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=87c1587ac88e1ca49f898a1b8be46a5c&libraries=services"></script>
		<script type="text/javascript" src="/test/js/jquery-3.5.1.min.js"></script>
		<script>
			$(function(){
				$(document).on("click", ".wish" , function(e){
					e.preventDefault();
					
				})
			})
		</script>
	</head>
	<body>
		<div id="map" style="width:1000px;height:1000px;"></div>
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
					clickable : true,
    			    content: '<a href="" target="_blank"><div class="wrap">' + 
    	            '    <div class="info">' + 
    	            '        <div class="title">' + 
    	            '            <img src="/test/images/가구1.jpg" width="260px" height="170px">' + 
	    	        '			 <img src="/test/images/check.png" class="wish">' +
    	            '        </div>' + 
    	            '        <div class="body">' + 
    	            '            <div class="desc">' + 
    	            '                <div class="ellipsis">'+ positions[i].content +'</div>' + 
    	            '                <div class="jibun ellipsis">호텔/객실</div>' + 
    	            '                <div>₩55,600/1박</div>' + 
    	            '            </div>' + 
    	            '        </div>' +
    	            '    </div>' +    
    	            '</div></a>',
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
			kakao.maps.event.addListener(map, 'click', function(e) {        
				for(var i = 0; i < positions.length; i++){
					overlays[i].setMap(null);
				}
			})
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







