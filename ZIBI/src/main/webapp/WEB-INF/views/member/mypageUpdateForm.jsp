<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<div class="container mypageMain">
	<form:form action="mypageUpdate" id="update_member" modelAttribute="memberVO">
		<form:errors element="span"/>
		<div class="row">
			<div class="col-6">
				프로필 사진 : ${memberVO.mem_email}
			</div>
			<div class="col-6">
				이메일 : ${memberVO.mem_email}
			</div>
			<div class="col-6">
				<form:label path="mem_name">이름</form:label>
				<form:input path="mem_name" class=" form-control p-3"/>
				<form:errors path="mem_name"/>
			</div>
			<div class="col-6">
				<form:label path="mem_nickname">닉네임</form:label>
				<form:input path="mem_nickname" class="form-control p-3" placeholder="한글만 가능" autocomplete="off"/>
				<input type="button" class="btn btn-secondary" value="중복체크" id="nickname_check" style="display: none;">
				<span id="nickname_area"></span>
				<form:errors path="mem_nickname"/>
			</div>
			<div class="col-6">
				<form:label path="mem_phone">연락처</form:label>
				<form:input path="mem_phone" class="form-control p-3"/>
				<input type="button" class="btn btn-secondary" value="중복체크" id="phone_check" style="display: none;">
				<span id="phone_area"></span>
				<form:errors path="mem_phone"/>
			</div>
			<div class="col-6">
				<form:label path="mem_zipcode">우편번호</form:label>
				<form:input path="mem_zipcode" class="input-check w-100 form-control p-3" maxlength="5" autocomplete="off"/>
				<input type="button" class="btn btn-secondary" value="찾기" id="zipcode_check" onclick="execDaumPostcode()">
				<span id="zipcode_area"></span>
				<form:errors path="mem_name"/>
			</div>
			<div class="col-6">
				<form:label path="mem_address1">주소</form:label>
				<form:input path="mem_address1" class="form-control p-3"/>
				<form:errors path="mem_address1"/>
			</div>
			<div class="col-6">
				<form:label path="mem_address2">상세 주소</form:label>
				<form:input path="mem_address2" class="form-control p-3"/>
				<form:errors path="mem_address2"/>
			</div>
			<form:button class="btn btn-light form-control p-3">회원 정보 수정</form:button>
		</div>
	</form:form>
</div>
<div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:1;-webkit-overflow-scrolling:touch;">
	<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼">
</div>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	
	var element_layer = document.getElementById('layer'); // 우편번호 찾기 화면을 넣을 element

	function closeDaumPostcode() { // iframe을 넣은 element를 안보이게 한다.
		element_layer.style.display = 'none';
	}

	function execDaumPostcode() {
		new daum.Postcode({
			oncomplete : function(data) {
				// 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

				// 각 주소의 노출 규칙에 따라 주소를 조합한다. 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var addr = ''; // 주소 변수
				var extraAddr = ''; // 참고항목 변수

				//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
				if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
					addr = data.roadAddress;
				} else { // 사용자가 지번 주소를 선택했을 경우(J)
					addr = data.jibunAddress;
				}

				// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
				if (data.userSelectedType === 'R') {
					
					if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) { // 법정동명이 있을 경우 추가한다. (법정리는 제외)법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
						extraAddr += data.bname;
					}
					if (data.buildingName !== '' && data.apartment === 'Y') { // 건물명이 있고, 공동주택일 경우 추가한다.
						extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
					}
					if (extraAddr !== '') { // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
						extraAddr = ' (' + extraAddr + ')';
					}
					//(주의)address1에 참고항목이 보여지도록 수정
					// 조합된 참고항목을 해당 필드에 넣는다.
					//(수정) document.getElementById("address2").value = extraAddr;

				}
				//(수정) else {
				//(수정)    document.getElementById("address2").value = '';
				//(수정) }
				
				document.getElementById('mem_zipcode').value = data.zonecode; // 우편번호와 주소 정보를 해당 필드에 넣는다.
				document.getElementById("mem_address1").value = addr + extraAddr; //(수정) + extraAddr를 추가해서 address1에 참고항목이 보여지도록 수정
				document.getElementById("mem_address2").focus(); // 커서를 상세주소 필드로 이동한다.

				// iframe을 넣은 element를 안보이게 한다.
				// (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
				element_layer.style.display = 'none';
			},
			width : '100%',
			height : '100%',
			maxSuggestItems : 5
		}).embed(element_layer);

		element_layer.style.display = 'block'; // iframe을 넣은 element를 보이게 한다.
		initLayerPosition(); // iframe을 넣은 element의 위치를 화면의 가운데로 이동시킨다.
	}

	// 브라우저의 크기 변경에 따라 레이어를 가운데로 이동시키고자 하실때에는 resize이벤트나, orientationchange이벤트를 이용하여 값이 변경될때마다 아래 함수를 실행 시켜 주시거나, 직접 element_layer의 top,left값을 수정해 주시면 됩니다.
	function initLayerPosition() {
		var width = 300; //우편번호서비스가 들어갈 element의 width
		var height = 400; //우편번호서비스가 들어갈 element의 height
		var borderWidth = 1; //샘플에서 사용하는 border의 두께

		// 위에서 선언한 값들을 실제 element에 넣는다.
		element_layer.style.width = width + 'px';
		element_layer.style.height = height + 'px';
		element_layer.style.border = borderWidth + 'px solid gray';
		// 실행되는 순간의 화면 너비와 높이 값을 가져와서 중앙에 뜰 수 있도록 위치를 계산한다.
		element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width) / 2 - borderWidth) + 'px';
		element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height) / 2 - borderWidth) + 'px';
	}
</script> <!-- 우편번호 검색 끝 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(function(){

		function phoneCheck(message){
			$('#phone_check').show();
			$('#mem_phone.errors').text('');
			$('#phone_area').text(message);
			$('#mem_phone').val('').focus();
			phone_checked = 0;
		}
		function nicknameCheck(message){
			$('#nickname_check').show();
			$('#mem_nickname.errors').text('');
			$('#nickname_area').text(message);
			$('#mem_nickname').val('').focus();
			nickname_checked = 0;
		}

		let phone_checked = 1; //닉네임 변경 변수 체크
		let nickname_checked = 1; //닉네임 변경 변수 체크
		
		//연락처 변경을 위해 키다운 시 중복 버튼 활성화 및 중복 체크 시행
		$('#mem_phone').keydown(function(){

			phone_checked = 0;
			
			$('#phone_check').show();
			$('#phone_area').text('');
			$('#mem_phone.errors').text('');
						
			//연락처 중복 체크 버튼 클릭 시
			$('#phone_check').click(function(){
				$('#mem_phone.errors').text('');
				
				if($('#mem_phone').val().trim()==''){ //유효성 체크
					phoneCheck('연락처를 입력해주세요');
					return;
				}
				
				$.ajax({
					url: 'checkPhone',
					type: 'post',
					data: {mem_phone:$('#mem_phone').val()},
					dataType: 'json',
					success:function(param){
						if(param.result=='phoneDuplicated'){
							phoneCheck('연락처가 중복됩니다');
						} else if(param.result=='notMatchPattern'){
							phoneCheck('연락처 형식이 불일치합니다');
						} else if(param.result=='phoneNotFound'){
							$('#phone_area').text('연락처 사용 가능합니다');
							phone_checked = 1;
						} else if(param.result=='originalPhone'){
							$('#phone_area').text('원래 연락처 사용 가능합니다');
							phone_checked = 1;
						} else {
							phoneCheck('연락처 중복 체크 오류가 발생했습니다');
						}
					},
					error:function(){
						alert('네트워크 통신 오류');
						phone_checked = 0;
					}
				});//end of ajax
			});
		});
		
		//닉네임 변경을 위해 키다운 시 중복 버튼 활성화 및 중복 체크 시행
		$('#mem_nickname').keydown(function(){

			nickname_checked = 0;
			
			$('#nickname_check').show();
			$('#nickname_area').text('');
			$('#mem_nickname.errors').text('');
						
			//닉네임 중복 체크
			$('#nickname_check').click(function(){
				$('#mem_nickname.errors').text('');
				
				if($('#mem_nickname').val().trim()==''){ //유효성 체크
					nicknameCheck('닉네임을 입력해주세요');
					return;
				}
				
				$.ajax({
					url: 'checkNickname',
					type: 'post',
					data: {mem_nickname:$('#mem_nickname').val()},
					dataType: 'json',
					success:function(param){
						if(param.result=='nicknameDuplicated'){
							nicknameCheck('닉네임이 중복됩니다');
						} else if(param.result=='notMatchPattern'){
							nicknameCheck('닉네임은 한글만 입력 가능합니다');
						} else if(param.result=='nicknameNotFound'){
							$('#nickname_area').text('닉네임 사용 가능');
							nickname_checked = 1;
						} else if(param.result=='originalNickName'){
							$('#nickname_area').text('원래 닉네임 사용 가능');
							nickname_checked = 1;
						} else {
							nicknameCheck('닉네임 중복 체크 오류가 발생했습니다');
						}
					},
					error:function(){
						alert('네트워크 통신 오류');
						nickname_checked = 0;
					}
				});//end of ajax
			});
		});
		
		//submit 이벤트 발생 시 닉네임 체크
		$('#register_member').submit(function(){
			if(nickname_checked==0){
				nicknameCheck('닉네임 중복 체크를 진행해주세요');
				return false;
			}
		});
	});//end of function
</script>