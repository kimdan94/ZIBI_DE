<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>    
<!-- 내용 시작 -->
<%-- daterangepicker --%>
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
<div class="container">
	<div class="d-flex justify-content-center">
		<div class="rounded login-form col-md-4 col-lg-6">
			<form:form action="write" id="book_write" 
					modelAttribute="bookVO" enctype="multipart/form-data">
				<div class="title-phrase">
					${mem_nickname}님의 소모임을<br>
					소개해 주세요!
				</div>	
				<div class="align-right">
					<h4>필수 입력사항</h4>
				</div>
				<hr size="3" noshade="noshade" width="100%">
				<div class="book_match">
					<form:label path="book_match">승인 여부</form:label>
					<br>
					<form:radiobutton path="book_match" id="book_match1"  value="1"/><label for="book_match1">바로 승인</label>
					<form:radiobutton path="book_match" id="book_match2" value="2"/><label for="book_match2">승인 필요</label>
					<br>
					<form:errors path="book_match" cssClass="error-phrase"/>
					<br>
					<span class="guide-phrase">*승인 필요 체크 시 나의 예약 내역에서 신청자의 참여를 직접 승인해야 예약이 확정됩니다.</span>
				</div>				
				<div>
					<form:label path="book_category">카테고리</form:label>
					<br>
					<form:select path="book_category">
						<form:option value="0">취미 소모임</form:option>
						<form:option value="1">원데이 클래스</form:option>
						<form:option value="2">스터디 모임</form:option>
					</form:select>
					<form:errors path="book_category" cssClass="error-phrase"/>
				</div>
				<div>
					<form:label path="book_title">제목</form:label>
					<form:input path="book_title" class="w-100 form-control p-3"/>
					<form:errors path="book_title" cssClass="error-phrase"/>
				</div>
				<div>
					<form:label path="book_gatheringDate">모임 일정</form:label>
					<form:input path="book_gatheringDate" class="w-100 form-control p-3" placeholder="모임 날짜와 시간을 선택해 주세요!"/>
					<form:errors path="book_gatheringDate" cssClass="error-phrase"/>
					<script>
					$("#book_gatheringDate").daterangepicker({
					    locale: {
					    "format": 'YYYY-MM-DD a HH:mm',
					    "applyLabel": "확인",
					    "cancelLabel": "취소",
					    "daysOfWeek": ["일", "월", "화", "수", "목", "금", "토"],
					    "monthNames": ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"]
					    },
					    timePicker: true,
					    showDropdowns: true,
					    autoApply: true,
					    timePicker24Hour: false,
					    singleDatePicker: true
					}).on('cancel.daterangepicker',function(ev,picker){
						$(ev.currentTarget).val('');
					});
						 
					$("#book_gateringDate").on('show.daterangepicker', function (ev, picker) {
					    $(".yearselect").css("float", "left");
					    $(".monthselect").css("float", "right");
					    $(".cancelBtn").css("float", "right");
					});
					</script>
				</div>
				<div>
					<form:label path="book_zipcode">우편번호</form:label>
					<input type="button" onclick="execDaumPostcode()" 
						class="default-btn" value="우편번호 찾기">
					<form:input path="book_zipcode" autocomplete="off" class="w-100 form-control p-3"/>
					<form:errors path="book_zipcode" cssClass="error-phrase"/>
				</div>
				<div>
					<form:label path="book_address1">모임 장소</form:label>
					<form:input path="book_address1" class="w-100 form-control p-3"/>
					<form:errors path="book_address1" cssClass="error-phrase"/>
				</div>
				<div>
					<form:label path="book_address2">상세 주소</form:label>
					<form:input path="book_address2" class="w-100 form-control p-3"/>
					<form:errors path="book_address2" cssClass="error-phrase"/>
				</div>
				<div>
					<form:label path="book_maxcount">참여 인원</form:label>
					<form:input path="book_maxcount" class="w-100 form-control p-3"
						placeholder="최대 참여 인원을 알려주세요!"/>
					<form:errors path="book_maxcount" cssClass="error-phrase"/>	
				</div>
				<div>
					<form:label path="book_content">소개 글</form:label>
					<form:textarea path="book_content"/>
					<form:errors path="book_content" cssClass="error-phrase"/>
				</div>
				<div class="align-right" style="margin-top:50px;">
					<h4>선택 입력사항</h4>
				</div>
				<hr size="3" noshade="noshade" width="100%">
				<div class="filebox">
					<form:label path="book_thumbnailName">썸네일</form:label>
					<br>
					<input type="file" id="book_thumbnailName" name="upload"
						accept="image/gif,image/png,image/jpeg">
					<form:errors path="book_thumbnailName" cssClass="error-phrase"/>	
					<br>
					<span class="guide-phrase">
						*500 x 500px 또는 1:1 비율의 고화질 이미지를 권장하며 미선택 시 기본 이미지가 제공됩니다.
					</span>
				</div>
				<div>
					<form:label path="book_expense">참여 비용</form:label>
					<input type="number" id="book_expense" name="book_expense"
						class="w-100 form-control p-3" placeholder="비용이 발생하지 않는다면 넘어가도 좋아요!">
				</div>
				<div>
					<form:label path="book_kit">준비물</form:label>
					<form:input path="book_kit" class="w-100 form-control p-3" 
						placeholder="지참해야 하는 준비물이 있다면 알려주세요!  ex. 붓, 수채화 물감"/>
				</div>
				<div class="align-center" style="margin-top:20px;">
				<input type="submit" value="모임 만들기" class="w-25 btn btn-light form-control p-3 rounded-pill">
				<input type="button" class="w-25 btn btn-light form-control p-3 rounded-pill" 
					onclick="location.href='list'" value="목록으로">
				</div>	
			</form:form>
		</div>
	</div>
</div>
<!-- 내용 끝 -->
<!-- 우편번호 검색 시작 -->
	<!-- iOS에서는 position:fixed 버그가 있음, 적용하는 사이트에 맞게 position:absolute 등을 이용하여 top,left값 조정 필요 -->
<div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:1;-webkit-overflow-scrolling:touch;">
<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼">
</div>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    // 우편번호 찾기 화면을 넣을 element
    var element_layer = document.getElementById('layer');

    function closeDaumPostcode() {
        // iframe을 넣은 element를 안보이게 한다.
        element_layer.style.display = 'none';
    }

    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    //(주의)address1에 참고항목이 보여지도록 수정
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    //(수정) document.getElementById("address2").value = extraAddr;
                
                } 
                //(수정) else {
                //(수정)    document.getElementById("address2").value = '';
                //(수정) }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('book_zipcode').value = data.zonecode;
                //(수정) + extraAddr를 추가해서 address1에 참고항목이 보여지도록 수정
                document.getElementById("book_address1").value = addr + extraAddr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("book_address2").focus();

                // iframe을 넣은 element를 안보이게 한다.
                // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
                element_layer.style.display = 'none';
            },
            width : '100%',
            height : '100%',
            maxSuggestItems : 5
        }).embed(element_layer);

        // iframe을 넣은 element를 보이게 한다.
        element_layer.style.display = 'block';

        // iframe을 넣은 element의 위치를 화면의 가운데로 이동시킨다.
        initLayerPosition();
    }

    // 브라우저의 크기 변경에 따라 레이어를 가운데로 이동시키고자 하실때에는
    // resize이벤트나, orientationchange이벤트를 이용하여 값이 변경될때마다 아래 함수를 실행 시켜 주시거나,
    // 직접 element_layer의 top,left값을 수정해 주시면 됩니다.
    function initLayerPosition(){
        var width = 300; //우편번호서비스가 들어갈 element의 width
        var height = 400; //우편번호서비스가 들어갈 element의 height
        var borderWidth = 5; //샘플에서 사용하는 border의 두께

        // 위에서 선언한 값들을 실제 element에 넣는다.
        element_layer.style.width = width + 'px';
        element_layer.style.height = height + 'px';
        element_layer.style.border = borderWidth + 'px solid';
        // 실행되는 순간의 화면 너비와 높이 값을 가져와서 중앙에 뜰 수 있도록 위치를 계산한다.
        element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width)/2 - borderWidth) + 'px';
        element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height)/2 - borderWidth) + 'px';
    }
</script>
<!-- 우편번호 검색 끝 -->