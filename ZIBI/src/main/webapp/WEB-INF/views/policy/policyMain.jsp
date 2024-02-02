<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="container page-width text-center">
	<div class="policy-map text-center">
		<h3>1인 가구 정책</h3>
		<p>지도의 지자체를 클릭하시면 해당 지자체의 1인 가구 정책 사이트로 연결됩니다</p>
	</div>
	<div id="map" style="width:100%; height:600px;"></div>
</div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0f8ec7b176d3f7229af3666b33d6e9b8"></script>
<script>
	$('#policy_btn').toggleClass("mem-btn");
	$('#policy_btn').toggleClass("mem-btn-green");

	//ajax로 데이터 주고받기 - 성공 시 지도 함수 호출
	//페이지 진입 시 데이터를 넘겨주는 방법?

	var MARKER_WIDTH = 33, // 기본, 클릭 마커의 너비
		MARKER_HEIGHT = 36, // 기본, 클릭 마커의 높이
		OFFSET_X = 12, // 기본, 클릭 마커의 기준 X좌표
		OFFSET_Y = MARKER_HEIGHT, // 기본, 클릭 마커의 기준 Y좌표
		OVER_MARKER_WIDTH = 40, // 오버 마커의 너비
		OVER_MARKER_HEIGHT = 42, // 오버 마커의 높이
		OVER_OFFSET_X = 13, // 오버 마커의 기준 X좌표
		OVER_OFFSET_Y = OVER_MARKER_HEIGHT, // 오버 마커의 기준 Y좌표
		SPRITE_MARKER_URL = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markers_sprites2.png', // 스프라이트 마커 이미지 URL
		SPRITE_WIDTH = 126, // 스프라이트 이미지 너비
		SPRITE_HEIGHT = 146, // 스프라이트 이미지 높이
		SPRITE_GAP = 10; // 스프라이트 이미지에서 마커간 간격

	var markerSize = new kakao.maps.Size(MARKER_WIDTH, MARKER_HEIGHT), // 기본, 클릭 마커의 크기
		markerOffset = new kakao.maps.Point(OFFSET_X, OFFSET_Y), // 기본, 클릭 마커의 기준좌표
		overMarkerSize = new kakao.maps.Size(OVER_MARKER_WIDTH, OVER_MARKER_HEIGHT), // 오버 마커의 크기
		overMarkerOffset = new kakao.maps.Point(OVER_OFFSET_X, OVER_OFFSET_Y), // 오버 마커의 기준 좌표
		spriteImageSize = new kakao.maps.Size(SPRITE_WIDTH, SPRITE_HEIGHT); // 스프라이트 이미지의 크기

	var positions = [ // 마커의 위치
			{ url:'https://apis.map.kakao.com/web/sample/basicMarkerImage/', place:new kakao.maps.LatLng(37.566553811240155, 126.9781458100309)},
			{ url:'https://apis.map.kakao.com/web/sample/basicMarkerImage/', place:new kakao.maps.LatLng(37.45567194748538, 126.7056012678951)},
			{ url:'https://apis.map.kakao.com/web/sample/basicMarkerImage/', place:new kakao.maps.LatLng(35.23768885494837, 128.69129810466606)},
			{ url:'https://apis.map.kakao.com/web/sample/basicMarkerImage/', place:new kakao.maps.LatLng(37.2882956928164, 127.05442095096278)}
		], selectedMarker = null; // 클릭한 마커를 담을 변수

	var mapContainer = document.getElementById('map'), // 지도를 표시할 div
		mapOption = {
			center : new kakao.maps.LatLng(35.724906989225346,128.0894168414805), // 지도의 중심좌표
			level : 13
		// 지도의 확대 레벨
		};

	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

	//지도 위에 마커를 표시합니다
	for (var i = 0, len = positions.length; i < len; i++) {
		var gapX = (MARKER_WIDTH + SPRITE_GAP), // 스프라이트 이미지에서 마커로 사용할 이미지 X좌표 간격 값
			originY = (MARKER_HEIGHT + SPRITE_GAP) * i, // 스프라이트 이미지에서 기본, 클릭 마커로 사용할 Y좌표 값
			overOriginY = (OVER_MARKER_HEIGHT + SPRITE_GAP) * i, // 스프라이트 이미지에서 오버 마커로 사용할 Y좌표 값
			normalOrigin = new kakao.maps.Point(0, originY), // 스프라이트 이미지에서 기본 마커로 사용할 영역의 좌상단 좌표
			clickOrigin = new kakao.maps.Point(gapX, originY), // 스프라이트 이미지에서 마우스오버 마커로 사용할 영역의 좌상단 좌표
			overOrigin = new kakao.maps.Point(gapX * 2, overOriginY); // 스프라이트 이미지에서 클릭 마커로 사용할 영역의 좌상단 좌표

		// 마커를 생성하고 지도위에 표시합니다
		addMarker(positions[i].place, positions[i].url, overOrigin, clickOrigin);
	}

	//마커를 생성하고 지도 위에 표시하고, 마커에 mouseover, mouseout, click 이벤트를 등록하는 함수입니다
	function addMarker(position, url, overOrigin, clickOrigin) {

		// 마커를 생성함
		var marker = new kakao.maps.Marker({
			map : map, position : position
		});
		
		// 마커에 click 이벤트를 등록합니다
		kakao.maps.event.addListener(marker, 'click', function() {

			// 클릭된 마커가 없고, click 마커가 클릭된 마커가 아니면 클릭 이벤트 발생
			if (!selectedMarker || selectedMarker !== marker) {
				window.open(url);
			}
			// 클릭된 마커를 현재 클릭된 마커 객체로 설정합니다
			selectedMarker = marker;
		});
		
		// 마커에 mouseover 이벤트를 등록합니다
		kakao.maps.event.addListener(marker, 'mouseover', function() {});

		// 마커에 mouseout 이벤트를 등록합니다
		kakao.maps.event.addListener(marker, 'mouseout', function() {});
	}
</script>