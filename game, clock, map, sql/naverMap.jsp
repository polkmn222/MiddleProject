<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=tua2e9wo8k"></script>
<meta name="viewport" content="width=device-width, initial-scale = 1">
<link rel="stylesheet"
	href="https://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css" />
<script src="https://code.jquery.com/jquery-1.11.1.min.js"></script>
<script
	src="https://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>
<meta charset="UTF-8">
<title>naver map</title>
<style>
.button1 {
	background-color: #F0F8FF;
}
</style>
</head>
<body>
	<script>
		$(function() {

			initMap();

		});

		function initMap() {
			var map = new naver.maps.Map('map', {
				center : new naver.maps.LatLng(37.5929438, 127.0342868),
				zoom : 16
			});
			// maker 
			var marker = new naver.maps.Marker(
					{
						map : map,
						title : "우정초밥",
						position : new naver.maps.LatLng(37.5929960,
								127.0342868),
						icon : {
							content : '<img src="<c:url value="/img/icon.png"/>" alt="" style="margin: 0px; padding: 0px; border: 0px solid transparent; display: block; max-width: none; max-height: none; -webkit-user-select: none; position: absolute; width: 32px; height: 32px; left: 0px; top: 0px;">',
							size : new naver.maps.Size(32, 32),
							anchor : new naver.maps.Point(16, 32)
						}
					});

			// 되찾기 마크 
			var locationBtnHtml = '<a href="#" class="btn_mylct"><span class="spr_trff spr_ico_mylct"><img src="/img/icon2.png" width="55" height="55" /></span></a>';
			/* var map = new naver.maps.Map('map', {zoom: 16});  */
			naver.maps.Event.once(map, 'init', function() {
				//customControl 객체 이용하기
				var customControl = new naver.maps.CustomControl(
						locationBtnHtml, {
							position : naver.maps.Position.TOP_LEFT
						});
				customControl.setMap(map);
				naver.maps.Event.addDOMListener(customControl.getElement(),
						'click', function() {
							map.setCenter(new naver.maps.LatLng(37.5929960,
									127.0342868));
						});

			});
			//작은 창 정보 
			var contentString = [
					'<div class="iw_inner">',
					'   <h3>우정초밥 <img src="/img/uj1.png" width="100" height="50" alt="" class="thumb" /></h3>',
					'   <p>서울특별시 성북구 종암동 종암로3길 31<br />',
					'      전화번호 : <a href="tel:050713472333">050713472333</a><br />',
					'       <a href="http://localhost/uj/home" target="_self">http://localhost/uj/home</a>',
					'   </p>', '</div>' ].join('');

			var infowindow = new naver.maps.InfoWindow({
				content : contentString
			});

			naver.maps.Event.addListener(marker, "click", function(e) {
				if (infowindow.getMap()) {
					infowindow.close();
				} else {
					infowindow.open(map, marker);
				}
			});

			infowindow.open(map, marker);
		}
	</script>
	<div id="map"
		style="width: 100%; height: 75vh; margin: 0 auto; float: left"></div>

	<div>
		<p>
			<button type=button class="button button1"
				onclick="location.href='https://map.naver.com/v5/directions/-/14141397.151503626,4522094.137155175,%EC%9A%B0%EC%A0%95%EC%B4%88%EB%B0%A5,1156260886,PLACE_POI/-/car?c=14141397.1515036,4522094.1371552,15,0,0,0,dh'">길찾 기</button>
		<ul>
			<li><strong>우정초밥</strong></li>
			<li>서울특별시 성북구 종암동 종암로3길 31</li>
			<li>전화번호 : <a href='tel:050713472333'>050713472333</a>
			</li>
			<li>이용시간 : <strong>런치</strong><em> 25.000원</em> 1부)11시30분
				2부)1시5분 <strong>디너</strong><em> 35.000원</em> 1부)5시30분 2부) 7시5분 <br>
				<u>매주 토요일 낮12시 부터 1주일 예약 시작</u><br> <span style="color: red;">휴무일</span>
				: 월요일 , 목요일 (변경 될 수 있습니다)<br> 디엠 전화 예약불가합니다<br>
			</li>
			<li>주차공간 : 공간이 협소하여 대중교통 이용 바랍니다.</li>
		</ul>
	</div>
</body>
</html>
