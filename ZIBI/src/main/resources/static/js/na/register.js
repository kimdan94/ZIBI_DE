function closeModalAction(){ //모달창 클릭 시 닫기
	//이메일 인증 여부 확인
	
	/*if(confirm(이메일 인증이 완료되지 않았습니다. 그래도 닫으시겠습니까?)){
		//닫기
		$('#emailAuthModal').hide();
	}*/
}

let email_checked = 0; //이메일 중복 체크 
let nickname_checked = 0; //닉네임 중복 체크
let password_checked = 0; //비밀번호 일치 체크 

//이메일 인증 API 추가 시 버튼 및 스크립트 변경 필요


//이메일 중복 체크
$('#email_check').click(function(){

	if($('#mem_email').val().trim()==''){
		$('#email_area').text('이메일을 입력해주세요');
		$('#mem_email').val('').focus();
		return;
	}
	
	let mem_email = $('#mem_email').val();
	
	$.ajax({
		url: 'checkEmail',
		type: 'post',
		data: {mem_email:mem_email},
		dataType: 'json',
		success:function(param){
			if(param.result=='emailDuplicated'){
				$('#email_area').text('이메일 중복');
				$('#mem_email').val('').focus();
				email_checked = 0;
			} else if(param.result=='notMatchPattern'){
				$('#email_area').text('이메일 형식 맞지 않음');
				$('#mem_email').val('').focus();
				email_checked = 0;
			} else if(param.result=='emailNotFound'){ //이메일 중복이 없는 경우 이메일 인증 api 실행
				emailAuthSend(mem_email); //인증 메일 전송
			} else {
				alert('이메일 중복 체크 오류');
				email_checked = 0;
			}
		},
		error:function(){
			alert('이메일 중복 체크 네트워크 통신 오류');
			email_checked = 0;
		}
	});//end of ajax
});//end of email check click

//이메일 중복 체크 후 값 변경 시 초기화
$('#mem_email').keydown(function(){
	$('#email_area').text('');
	email_checked = 0;
});//end of keydown

function emailAuthSend(mem_email){ //인증메일 전송
	$.ajax({
		url: 'emailAuth', //인증 메일 전송 컨트롤러와 통신
		type: 'post',
		data: {mem_email:mem_email},
		dataType: 'json',
		success:function(param){ //전송 성공 시
			alert('성공');
			//사용자 입력란 활성화, 타이머 걸기
			$('#emailAuthModal').show();
			
			//사용자가 입력하면
			$('#userEmailAuth').keyup(function(){
				
			});
			
				//param.code와 비교
				
				//불일치할 경우 > 재입력
				
				//일치할 경우 > 회원가입 진행
			
			//} else {
			//	alert('인증 메일 전송 오류');
			//}
		},
		error:function(){
			alert('인증 메일 네트워크 통신 오류');
		}
	});//end of ajax
}//end of emailAuth

function emailAuthCheck(){ //인증코드 확인 함수
	
}//end of emailAuthCheck


//닉네임 중복 체크
$('#nickname_check').click(function(){
	if($('#mem_nickname').val().trim()==''){
		$('#nickname_area').text('닉네임을 입력해주세요');
		$('#mem_nickname').val('').focus();
		return;
	}
	$.ajax({
		url: 'registerNickname',
		type: 'post',
		data: {mem_nickname:$('#mem_nickname').val()},
		dataType: 'json',
		success:function(param){
			if(param.result=='nicknameDuplicated'){
				$('#nickname_area').text('닉네임 중복');
				$('#mem_nickname').val('').focus();
				nickname_checked = 0;
			} else if(param.result=='notMatchPattern'){
				$('#nickname_area').text('닉네임 형식 맞지 않음');
				$('#mem_nickname').val('').focus();
				nickname_checked = 0;
			} else if(param.result=='nicknameNotFound'){
				$('#nickname_area').text('닉네임 사용 가능');
				nickname_checked = 1;
			} else {
				alert('닉네임 중복 체크 오류');
				nickname_checked = 0;
			}
		},
		error:function(){
			alert('네트워크 통신 오류');
			nickname_checked = 0;
		}
	});//end of ajax
});//end of click

//닉네임 중복 체크 후 값 변경 시 초기화
$('#mem_nickname').keydown(function(){
	$('#nickname_area').text('');
	nickname_checked = 0;
});

//비밀번호 일치 여부
$('#c_password').keyup(function(){
	$('#cpassword_area').text('');
	password_checked = 0;
	
	if($('#mem_password').val()==$('#c_password').val()){
		$('#cpassword_area').text('비밀번호가 일치합니다');
		password_checked = 1;
	}
});//end of keyup

//submit 이벤트 발생 시 이메일, 닉네임, 비밀번호 체크
$('#register_member').submit(function(){
	let count = 0;
	
	if(email_checked==0)	{
		$('#email_area').text('이메일 중복 체크를 진행해주세요');
		count++;
	}
	if(nickname_checked==0){
		$('#nickname_area').text('닉네임 중복 체크를 진행해주세요');
		count++;
	}	
	if(password_checked==0){
		$('#password_area').text('비밀번호를 올바르게 입력해주세요');
		count++;
	}	
	
	if(count>0)	return false;
});//end of submit