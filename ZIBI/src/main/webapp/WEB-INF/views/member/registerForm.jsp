<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<div class="container form-width">
	<div class="member-form">
		<form:form action="register" id="register_member" modelAttribute="memberVO">
			<div class="row">
				<div class="col-6">
					<form:label path="mem_email">이메일</form:label>
					<form:input path="mem_email" class="form-control p-3" placeholder="test@test.com" autocomplete="off"/>
					<input type="button" class="btn" value="중복체크" id="email_check">
					<span id="email_area"></span>
					<form:errors path="mem_email"/>
				</div>
				<div class="col-6">
					<form:label path="mem_nickname">닉네임</form:label>
					<form:input path="mem_nickname" class="form-control p-3" placeholder="한글만 가능" autocomplete="off"/>
					<input type="button" class="btn" value="중복체크" id="nickname_check">
					<span id="nickname_area"></span>
					<form:errors path="mem_nickname"/>
				</div>
				<div class="col-6">
					<form:label path="mem_password">비밀번호</form:label>
					<form:password path="mem_password" class="w-100 form-control p-3" placeholder="영문 대소문자, 숫자 4자리에서 12자리 가능"/>
					<span id="password_area"></span>
				</div>
				<div class="col-6">
					<label for="c_password">비밀번호 확인</label>
					<input type="password" id="c_password" class="w-100 form-control p-3"  placeholder="비밀번호와 동일하게 입력" >
					<span id="cpassword_area"></span>
				</div>
			</div>
			<form:button class="btn btn-light active rounded-pill w-100 p-3">회원가입하기</form:button>
		</form:form>
	</div>
</div>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(function(){

		let email_checked = 0; //이메일 중복 체크 
		let nickname_checked = 0; //닉네임 중복 체크
		let password_checked = 0; //비밀번호 일치 체크 
		
		<%--이메일 인증 API 추가 시 버튼 및 스크립트 변경 필요--%>
		//이메일 중복 체크
		$('#email_check').click(function(){
			if($('#mem_email').val().trim()==''){
				$('#email_area').text('이메일을 입력해주세요');
				$('#mem_email').val('').focus();
				return;
			}
			$.ajax({
				url: 'checkEmail',
				type: 'post',
				data: {mem_email:$('#mem_email').val()},
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
					} else if(param.result=='emailNotFound'){
						$('#email_area').text('이메일 사용 가능');
						email_checked = 1;
					} else {
						alert('이메일 중복 체크 오류');
						email_checked = 0;
					}
				},
				error:function(){
					alert('네트워크 통신 오류');
					email_checked = 0;
				}
			});//end of ajax
		});//end of email check click
		
		//이메일 중복 체크 후 값 변경 시 초기화
		$('#mem_email').keydown(function(){
			$('#email_area').text('');
			email_checked = 0;
		});
		
		<%--이메일 인증 API--%>
		
		
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
		});
		
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
		});
		
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
		
	});//end of function
</script>