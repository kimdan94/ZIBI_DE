<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 내용 시작 -->
<c:if test="${book.book_onoff == 2}">
	<script type="text/javascript">
		location.replace('list');
	</script>
</c:if>
<div class="container" id="book_detail">
	<div class="d-flex justify-content-center">
		<div class="rounded col-lg-10">
			<div class="text-center" style="margin-left:20px;position:relative;">
				<c:if test="${book.book_category == 0}"><div style="background:#0f4b43;" class="book-first">취미 소모임</div></c:if>
                <c:if test="${book.book_category == 1}"><div style="background:#5eaf08;" class="book-first">원데이 클래스</div></c:if>
                <c:if test="${book.book_category == 2}"><div style="background:#486627;" class="book-first">스터디 모임</div></c:if>
				<div class="scrap-area">
             		<img id="output_scrap" data-num="${book.book_num}"
             			src="${pageContext.request.contextPath}/images/jy/noScrap.png" width="50px">
             		<br>	
             		<span id="output_scount"></span>	
             	</div>
			</div>
			<div style="float:left;">
				<c:if test="${empty book.book_thumbnailName}">
					<img class="book-thumb" src="${pageContext.request.contextPath}/images/jy/thumbnail_basic.png">
				</c:if>
				<c:if test="${!empty book.book_thumbnailName}">
					<img class="book-thumb" src="${pageContext.request.contextPath}/upload/${book.book_thumbnailName}">
				</c:if>
			</div>
			<table>
				<tr>
					<td class="match-guide">
						<c:if test="${book.book_match == 1}">
							<span>✅ 승인이 필요 없는 모임이에요!</span>
						</c:if>
						<c:if test="${book.book_match == 2}">
							<span>✅ 주최자의 승인이 필요한 모임이에요!</span>
						</c:if>
					</td>
				</tr>
				<tr>
					<td>
						<h4>${book.book_title} (${book.book_headcount}/${book.book_maxcount}명)</h4>
					</td>
				</tr>
				<tr>
					<td class="book-expense">
						<c:if test="${empty book.book_expense}">
							무료
						</c:if>
						<c:if test="${!empty book.book_expense}">
							<fmt:formatNumber value="${book.book_expense}"/>원
						</c:if>
					</td>
				</tr>	
				<tr class="book-profileArea">
					<td>
						<%-- 참여자 --%>
						<c:if test="${user.mem_num != book.mem_num}">
							<img class="book-profile" src="${pageContext.request.contextPath}/member/viewProfile?mem_num=${book.mem_num}">
							<span class="book-nick">${book.mem_nickname}</span>
						</c:if>
						<%-- 주최자 --%>
						<c:if test="${user.mem_num == book.mem_num}">
							<c:if test="${book.compareNow == 2}">
								<c:if test="${book.book_onoff == 0}">
									<input type="button" value="모집 마감하기" class="bookd-btn-green w-75"
										id="complete_btn" data-num="${book.book_num}" data-head="${book.book_headcount}">
								</c:if>
								<c:if test="${book.book_onoff == 3}">
									<input type="button" value="모집 마감" class="btn btn-light w-100" disabled>
								</c:if>
							</c:if>
							<c:if test="${book.compareNow == 1}">
								<c:if test="${book.book_onoff == 0 || book.book_onoff == 3}">
									<input type="button" value="모임 완료하기" class="bookd-btn-green w-100 book-complete"
										data-num="${book.book_num}">
								</c:if>
								<c:if test="${book.book_onoff == 1}">
									<input type="button" value="새로 모집하기" class="bookd-btn w-75"
										id="reset_btn" data-num="${book.book_num}">
								</c:if>
							</c:if>
						</c:if>
					</td>
				</tr>
			</table>
			<hr size="3" width="100%">
			<div>
				<span class="book-span">모임 후기</span>
				<br><br>
				<%-- 모임 후기 --%>
				<div class="owl-carousel">
					<div class="bg-light rounded">
						<div class="d-flex justify-content-center p-4">
							<div class="text-center">
								<h4 class="mb-3">
									<a href="${pageContext.request.contextPath}/book/list">모임 참여</a>
								</h4>
								<p class="mb-1">모임을 만들어 지비러들끼리 소통을 활성화하세요</p>
							</div>
						</div>
					</div>
					<div class="bg-light rounded">
						<div class="d-flex justify-content-center p-4">
							<div class="text-center">
								<h4 class="mb-3">
									<a href="${pageContext.request.contextPath}/book/list">모임 참여</a>
								</h4>
								<p class="mb-1">샘플2</p>
							</div>
						</div>
					</div>
				</div>
				<script>
					$(document).ready(function(){
						var owl = $('.owl-carousel');
						owl.owlCarousel({
							items:4,
						    loop:true,
						    nav:true,
						    margin:10
						});
						owl.on('mousewheel', '.owl-stage', function (e) {
						    if (e.originalEvent.deltaY>0) {
						        owl.trigger('next.owl');
						    } else {
						        owl.trigger('prev.owl');
						    }
						    e.preventDefault();
						});
					});
				</script>
			</div>	
			<hr size="3" width="100%">
			<div class="book-listDiv">
				<span class="book-span">모임 소개</span>
				<br><br>
				${book.book_content}
			</div>
			<hr size="3" width="100%">
			<div class="book-listDiv">
				<span class="book-span">모임 장소</span>
				<br><br>
				${book.book_address1} ${book.book_address2}
				<div id="map" style="width:500px;height:300px;margin-top:13px;"></div>
			</div>
			<div class="book-listDiv">
				<span class="book-span">모임 일정</span>
				<br><br>
				${book.book_gatheringDate}
			</div>
			<div class="book-listDiv">
				<span class="book-span">준비물</span>
				<br><br>
				<c:if test="${empty book.book_kit}">
					준비물 없음
				</c:if>
				<c:if test="${!empty book.book_kit}">
					${book.book_kit}
				</c:if>
			</div>
			<div class="align-center">
				<%-- 주최자 --%>
				<c:if test="${!empty user && user.mem_num == book.mem_num && book.book_onoff == 0}">
					<input type="button" value="수정하기" class="bookd-btn w-25" id="update_btn"
						onclick="location.href='update?book_num=${book.book_num}'">
					<input type="hidden" value="${book.compareNow}" id="compare">
					<input type="hidden" value="${book.book_headcount}" id="head">	
					<script type="text/javascript">
						$('#update_btn').click(function(){
							if($('#compare').val() == 1 && $('#head').val() >= 1){
								alert('모임 완료하기 버튼을 클릭하여 모임 완료를 확정해 주세요.');
								history.go(0);
							}
						});
					</script>
					<c:if test="${book.compareNow == 2}">	
						<input type="button" value="모임 취소하기" class="bookd-btn-green w-25"
							onclick="location.href='cancel?book_num=${book.book_num}'">	
					</c:if>	
				</c:if>
				<%-- 참여자 --%>
				<c:if test="${!empty user && user.mem_num != book.mem_num}">
					<c:if test="${book.book_onoff == 0 && book.compareNow == 2}">
						<input type="button" value="참여 신청하기" id="book_apply" class="bookd-btn-green w-25">
					</c:if>
					<c:if test="${book.book_onoff == 3 || book.compareNow == 1}">
						<input type="button" value="모집 마감" class="btn btn-light w-25" disabled>
					</c:if>
				</c:if>
					<input type="button" value="목록으로" 
						onclick="location.href='list'" class="bookd-btn w-25">
			</div>
		</div>
	</div>
</div>
<%-- 참여 신청 폼(모달) --%>
<div id="bookApplyModal" style="display: none">
	<div class="modal-box">
		<div class="title-phrase2">
			이 모임에 참여할래요!
			<img src="${pageContext.request.contextPath}/images/jy/close.png" id="close_btn">	
		</div>
		<div class="applySub">
			참여 신청 모임
		</div>
		<hr size="3" noshade="noshade" width="100%">
		<ul>
			<li style="float:left;">
				<c:if test="${empty book.book_thumbnailName}">
					<img src="${pageContext.request.contextPath}/images/jy/thumbnail_basic.png">
				</c:if>
				<c:if test="${!empty book.book_thumbnailName}">
					<img src="${pageContext.request.contextPath}/upload/${book.book_thumbnailName}">
				</c:if>
			</li>
			<li class="applyTitle">
				${book.book_title}
			</li>
			<li>
				<span>✅ ${book.book_address1} ${book.book_address2}</span>
			</li>
			<li>
				<c:if test="${book.book_match == 1}">
					✅ 바로 승인/ 
				</c:if>
				<c:if test="${book.book_match == 2}">
					✅ 승인 필요/ 
				</c:if>
				<c:if test="${empty book.book_expense}">
					무료/ 
				</c:if>
				<c:if test="${!empty book.book_expense}">
					<fmt:formatNumber value="${book.book_expense}"/>원/  
				</c:if>
				<c:if test="${empty book.book_kit}">
					준비물 없음
				</c:if>
				<c:if test="${!empty book.book_kit}">
					${book.book_kit}
				</c:if>
			</li>
		</ul>
		<div class="applySub">
			신청자 정보
		</div>
		<hr size="3" noshade="noshade" width="100%">
			<div class="applyDiv">
				<label for="mem_name">이름</label>
				<input type="text" name="mem_name" autocomplete="off"
					id="mem_name" class="form-control" required/>
				<span id="nameValid" class="error-phrase"></span>
			</div>
			<div class="applyDiv2">	
				<label for="mem_email">이메일</label>
				<input type="email" name="mem_email" autocomplete="off"
					id="mem_email" class="form-control" required/>
				<span class="guide-phrase">*입력하신 이메일 주소로 신청 완료 메일이 전송됩니다. 실제 사용하고 계신 이메일을 기입해 주세요.</span>
				<br>
				<span id="emailValid" class="error-phrase"></span>
			</div>
			<div class="applyDiv">
				<label for="mem_phone">연락처</label>
				<input type="text" name="mem_phone" autocomplete="off"
					id="mem_phone" class="form-control" required/>
				<span id="phoneValid" class="error-phrase"></span>
			</div>
			<div>
				<label for="agree">개인 정보 수집에 동의합니다.</label>
				<input type="checkbox" id="agree" required>
				<br>
				<span id="agreeValid" class="error-phrase"></span>
			</div>
			<div style="margin-bottom:12px;">
				<label for="notify">참여를 원하는 모임의 안내사항을 전부 확인하였습니다.</label>
				<input type="checkbox" id="notify" required>
				<br>
				<span id="notifyValid" class="error-phrase"></span>
			</div>
			<button id="apply_btn" class="default-btn" data-num="${book.book_num}" 
				data-apply="${user.mem_num}" data-state="${book.book_state}" 
				data-onoff="${book.book_onoff}" data-g="${book.book_gatheringDate}"
				data-title="${book.book_title}" data-addr="${book.book_address1}">참여하기</button>
			<img src="${pageContext.request.contextPath}/images/jy/loading.gif" id="apply_loading">		
	</div>
	<div class="modal-bg"></div>
</div>
<!-- Daum 지도 API 시작 -->
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
	geocoder.addressSearch('${book.book_address1}', function(result, status) {
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
<!-- Daum 지도 API 끝 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jy/book.apply.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jy/book.scrap.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jy/owl.carousel.js"></script>
<script type="text/javascript">
$(document).on('click','#close_btn',function(){
	$('body').css('overflow-y','');
	$('#bookApplyModal').hide();
});
</script>
<!-- 내용 끝 -->