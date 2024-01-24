<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="container page-width">
	<div class="member-page mypageMain">
		<div class="row">
			<div class="col">
				<input type="button" class="btn mem-btn-green w-100" value="메인" onclick="location.href='${pageContext.request.contextPath}/member/mypageMain'">
			</div>
			<div class="col">
				<input type="button" class="btn mem-btn w-100" value="거래 내역" onclick="location.href='${pageContext.request.contextPath}/member/'">
			</div>
			<div class="col">
				<input type="button" class="btn mem-btn w-100" value="활동 내역" onclick="location.href='${pageContext.request.contextPath}/member/'">
			</div>
			<div class="col">
				<input type="button" class="btn mem-btn w-100" value="팔로우 내역" onclick="location.href='${pageContext.request.contextPath}/member/'">
			</div>
		</div>
		<div class="row profile-detail">
			<div class="col-6 event text-center align-self-center">
				<div class="photo-area">
					<div class="event-img position-relative">
						<img class="my-photo img-fluid" src="${pageContext.request.contextPath}/member/photoView" width="350" height="350">
						<div class="event-overlay d-flex flex-column">
							<a data-lightbox="event-1" class="my-auto" id="photo_btn">
								<img src="${pageContext.request.contextPath}/images/na/mypage-change.png" width="60px">
							</a>
						</div>
						
					</div>
					<div id="photo_choice" style="display: none;">
						<input type="file" id="upload" accept="image/gif,image/png,image/jpeg">
						<input type="button" value="변경" class="btn mem-btn" id="photo_submit"> 
						<input type="button" value="취소" class="btn mem-btn" id="photo_reset">
						<div id="photo_check"></div>
					</div>
				</div>
			</div>
			<div class="col-6 align-self-center">
				<h6>이메일</h6>
				<p>${memberVO.mem_email}</p>
				<h6>닉네임</h6>
				<p>${memberVO.mem_nickname}</p>
				<c:if test="${!empty memberVO.mem_name}">
					<h6>이름</h6>
					<p>${memberVO.mem_name}</p>
					<h6>연락처</h6>
					<p>${memberVO.mem_phone}</p>
					<h6>주소</h6>
					<p>${memberVO.mem_address1} ${memberVO.mem_address2} (${memberVO.mem_zipcode})</p>
				</c:if>
				
			</div>
		</div>
		<div class="row">
			<div class="col-6">
				<input type="button" value="나의 오픈 프로필" class="btn  mem-btn-green w-100" onclick="location.herf='${pageContext.request.contextPath}/member/'">
			</div>
			<div class="col-6 text-center">
				<input type="button" class="btn mem-btn" value="정보 수정하기" onclick="location.href='${pageContext.request.contextPath}/member/mypageUpdate'">
				<input type="button" class="btn mem-btn" value="비밀번호 변경" onclick="location.href='${pageContext.request.contextPath}/member/'">
				<input type="button" class="btn mem-btn" value="회원 탈퇴" onclick="location.href='${pageContext.request.contextPath}/member/'">
			</div>
		</div>
	</div>
</div>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(function() {

		//프로필 사진 변경 선택 시 버튼 노출
		$('#photo_btn').click(function() {
			$('#photo_choice').show();
		});

		let old_photo = $('.my-photo').attr('src'); //기존 이미지 저장
		let new_photo; //변경할 이미지 변수 선언

		//파일 선택 시
		$('#upload').change(function() {
			new_photo = this.files[0]; //변경할 이미지 저장

			if (!new_photo) { //선택창에서 파일 선택을 취소할 경우
				$('.my-photo').attr('src', old_photo); //기존 이미지로
				return;
			}

			//용량체크
			if (new_photo.size > 1024 * 1024) {
				$('#photo-_check').text('1MB 이하의 이미지만 등록 가능합니다');
				$('.my-photo').attr('src', old_photo); //기존 이미지로
				$(this).val(''); //파일명 지우기
			}

			//미리보기
			let reader = new FileReader(); //사진 파일을 읽어오기 위한 객체 생성
			reader.readAsDataURL(new_photo); //객체를 이용해 선택한 파일을 읽어 옴
			reader.onload = function() { //파일을 다 읽어오면
				$('.my-photo').attr('src', reader.result); //이미지 미리보기 처리
			};
		});

		//전송 클릭 시 업로드
		$('#photo_submit').click(function() {

			//유효성 체크
			if ($('#upload').val() == '') {
				$('#photo_check').text('사진을 선택해주세요');
				$('#upload').focus();
				return;
			}

			//전송할 파일
			let form_data = new FormData();
			form_data.append('upload', new_photo);

			//서버와 통신
			$.ajax({
				url : '../member/updateMyPhoto',
				type : 'post',
				data : form_data,
				dataType : 'json',
				contentType : false,
				processData : false,
				success : function(param) {
					if (param.result == 'logout') {
						alert('로그인 세션이 만료되었습니다! 로그인해주세요');
					} else if (param.result == 'success') {
						old_photo = $('.my-photo').attr('src');
						$('#photo_choice').hide();
					} else {
						alert('등록 오류');
					}
				},
				error : function() {
					alert('네트워크 오류');
				}
			});

		});

		//취소 버튼 클릭 시 리셋
		$('#photo_reset').click(function() {
			$('.my-photo').attr('src', old_photo);
			$('#photo_choice').hide();
			$('#photo_check').hide();
		});
	});
</script>