<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link rel="icon" href="${pageContext.request.contextPath}/images/logo_tab.png"/>
<link rel="apple-touch-icon" href="${pageContext.request.contextPath}/images/logo_tab.png"/>
<link href="${pageContext.request.contextPath}/css/de.css" rel="stylesheet">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/helper.scrap.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/helper.solution.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/helper.reply.js"></script>
<!-- 내용 시작 -->
<div class="container-fluid contact py-6">
	<div class="d-flex justify-content-center">
		<div class="rounded login-form col-md-4 col-lg-6">
		<c:if test="${helper.helper_category ==  1}"><div style="background:#04B486;" class="border_cate">벌레</div></c:if>
		<c:if test="${helper.helper_category ==  2}"><div>[ 조립 ]</div></c:if>
		<c:if test="${helper.helper_category ==  3}"><div>[ 수리 ]</div></c:if>
		<c:if test="${helper.helper_category ==  4}"><div>[ 소분 ]</div></c:if>
		<c:if test="${helper.helper_category ==  5}"><div>[ 기타 ]</div></c:if>
		<br>
		<div class="title">
		${helper.helper_title}
		</div>
		<div class="align-right">
		<c:if test="${!empty user}">
		<!-- 스크랩 -->		
		<img id="output_scrap" data-num="${helper.helper_num}" 
			src="${pageContext.request.contextPath}/images/de/heart1.png" width="30">
		<!-- 스크랩 개수 -->
		스크랩  <span id="output_scount"></span>
		<span>·</span>
		<img src="${pageContext.request.contextPath}/images/de/hit.png" width="30">
		조회수  ${helper.helper_hit}
		<!-- 댓글 개수 -->	
		<span id="output_rcount"></span>
		</c:if>
		</div>
		<div class="align-left">
		<!-- 해결중&해결완료 토글 -->
		<div>
		<c:if test="${user.mem_num == helper.mem_num}">
		<img id="output_solution" data-num="${helper.helper_num}" class="toggle"
			src="${pageContext.request.contextPath}/images/de/toggle1.png" width="50">
		<span id="output_text">[판매 중]</span>
		</c:if>
		<br>
		</div>
		</div>
		
		<div class="align-right">
		<c:if test="${user.mem_num == helper.mem_num}">
		<input type="button" value="글수정" onclick="location.href='update?helper_num=${helper.helper_num}'"
			class="d-inline-block fw-bold text-dark text-uppercase bg-light border border-color rounded-pill px-2 py-1 mb-1">
		<input type="button" value="글삭제" onclick="location.href='delete?helper_num=${helper.helper_num}'"
				id="delete_btn" class="d-inline-block fw-bold text-dark text-uppercase bg-light border border-color rounded-pill px-2 py-1 mb-1">
		</c:if>
		</div>
		
		<br><br>
		<div class="align-center">
		<c:if test="${empty helper.helper_filename}">
		<img src="${pageContext.request.contextPath}/images/de/noimg.png"
			style="width:500px; height:500px;">
		</c:if>
		<c:if test="${!empty helper.helper_filename}">
		<img src="${pageContext.request.contextPath}/upload/${helper.helper_filename}"
			style="width:500px; height:500px;" class="radius">
		</c:if>
		</div>
		<br>
		<div>
			<img src="${pageContext.request.contextPath}/member/viewProfile?mem_num=${helper.mem_num}"
						width="40" height="40" class="my-photo radius">
			${helper.mem_nickname}
			<div class="align-right">
			<c:if test="${!empty helper.helper_modify_date}">
			최근 수정일 : ${helper.helper_modify_date}
			</c:if>
			<c:if test="${empty helper.helper_modify_date}">
			작성일 : ${helper.helper_reg_date}
			</c:if>
			</div>
			<div class="align-right">
	</div>
		</div>
	<hr size="3" noshade="noshade">			
	
	<div class="title">상세설명</div><br>
	<div>
	${helper.helper_content}
	</div>
	<div>
		주소 : ${helper.helper_address1} ${helper.helper_address2}
		<div id="map" style="width:300px;height:300px;margin-top:10px;"></div>
	</div>
	<br><br>
	<!-- 댓글 시작 -->
	<div id="reply_div">
		<span class="re_title"></span>
		<form id="re_form">
			<input type="hidden" name="helper_num" value="${helper.helper_num}" id="helper_num">
			<textarea rows="3" cols="50" name="re_content" id="re_content" class="rep-content" 
			<c:if test="${empty user}">disabled="disabled"</c:if>
			><c:if test="${empty user}">로그인 후 작성할 수 있습니다.</c:if></textarea>	
		  <c:if test="${!empty user}">
		  <div id="re_first">
		  	<span class="letter-count">300/300</span>
		  </div>
		  <div id="re_second" class="align-right">
		  	<input type="submit" value="작성하기">
		  </div>
		  </c:if>
		</form>
	</div>
	<!-- 댓글 목록 출력 시작 -->
	<div id="output"></div>
	<div class="paging-button" style="display:none;">
		<input type="button" value="더보기">
	</div>
	<div id="loading" style="display:none;">
	<img src="${pageContext.request.contextPath}/images/de/loading.gif" width="100" height="100">
	</div>
	<!-- 댓글 목록 출력 끝 -->
	<!-- 댓글 끝 -->
	<!-- 채팅 시작 -->
	<div class="align-center">
	<input type="button" value="채팅하기" onclick="location.href='talkList?helper_num=${helper.helper_num}'"
		class="w-25 btn btn-light form-control p-3 rounded-pill" >
	</div>
	<!-- 채팅 끝 -->
	<br><br>
	<div class="align-center">
	<input type="button" value="목록으로" onclick="location.href='list?helper_num=${helper.helper_num}'" 
			class="w-25 btn btn-light form-control p-3 rounded-pill">	
	</div>		
</div>
</div>
</div>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=397d490d4a8bb2a2dc0a8a1612615084&libraries=services"></script>
	<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표(초기 값으로 주소를 좌표로 바꿔서 제공하면 중심 좌표가 바뀜)
        level: 3 // 지도의 확대 레벨
    };  

	// 지도를 생성합니다    
	var map = new daum.maps.Map(mapContainer, mapOption); 
	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new daum.maps.services.Geocoder();
	// 주소로 좌표를 검색합니다
	geocoder.addressSearch('${helper.helper_address1}', function(result, status) {
	    // 정상적으로 검색이 완료됐으면 
	     if (status === daum.maps.services.Status.OK) {
	    	 console.log('lat : ' + result[0].y);
	    	 console.log('lng : ' + result[0].x);
	        var coords = new daum.maps.LatLng(result[0].y, result[0].x);
	        // 결과값으로 받은 위치를 마커로 표시합니다
	        var marker = new daum.maps.Marker({
	            map: map,
	            position: coords
	        });
	        
	        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	        map.setCenter(coords);
	    } 
	});    
</script>	
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(function(){
	$('#delete_btn').click(function(){
		let choice = confirm('정말 삭제하시겠습니까?');
		if(!choice){
			return false;
		}
	});
});
</script>

<!-- 내용 끝 -->