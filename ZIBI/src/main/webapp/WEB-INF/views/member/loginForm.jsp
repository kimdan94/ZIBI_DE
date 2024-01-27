<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
 <!-- Contact Start -->
<div class="container page-width">
	<div class="member-form row justify-content-center">
		<div class="col-6">
			<div id="carouselExample" class="carousel slide">
				<div class="carousel-inner">
					<div class="carousel-item active">
						<img src="${pageContext.request.contextPath}/images/na/sample1.jpg" class="d-block w-100">
					</div>
					<div class="carousel-item">
						<img src="${pageContext.request.contextPath}/images/na/sample2.jpg" class="d-block w-100">
					</div>
					<div class="carousel-item">
						<img src="${pageContext.request.contextPath}/images/na/sample3.jpg" class="d-block w-100">
					</div>
				</div>
				<button class="carousel-control-prev" type="button" data-bs-target="#carouselExample" data-bs-slide="prev">
					<span class="carousel-control-prev-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Previous</span>
				</button>
				<button class="carousel-control-next" type="button" data-bs-target="#carouselExample" data-bs-slide="next">
					<span class="carousel-control-next-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Next</span>
				</button>
			</div>
		</div>
		<div class="col-4 align-self-center">
			<form:form action="login" id="login" modelAttribute="memberVO">
				<div>
					<form:label path="mem_email">이메일</form:label>
					<form:input path="mem_email" class="w-100 form-control" />
					<form:label path="mem_password">비밀번호</form:label>
					<form:password path="mem_password" class="w-100 form-control" />
				</div>
				<div id="register-check" style="margin-top: 30px;"> <!-- 높이 고정 후 수직 가운데 정렬 -->
					<form:errors element="span"/>
				</div>
				<form:button class="btn mem-btn-green w-100" style="margin:10px 0 10px 0;">로그인</form:button>
				<div class="text-center">
					<a id="kakao-login-btn" href="javascript:loginWithKakao()">
						<img src="${pageContext.request.contextPath}/images/na/login_kakao.png" width="80" alt="카카오 로그인 버튼" />
					</a>
					<input type="button" class="btn mem-btn w-100" value="비밀번호 찾기" onclick="location.href='${pageContext.request.contextPath}/member/findPassword'">
					<input type="button" class="btn mem-btn w-100" value="회원가입" onclick="location.href='${pageContext.request.contextPath}/member/register'">
				</div>
			</form:form>
		</div>
	</div>
</div>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script>
	
	/*---------카카오 로그인 함수--------*/
	function loginWithKakao() { //로그인 버튼 클릭 시 실행되는 함수

		Kakao.init('0f8ec7b176d3f7229af3666b33d6e9b8'); //카카오 초기화
		console.log(Kakao.isInitialized()); // 초기화 판단여부

		Kakao.Auth.login({ //카카오 서버에 로그인 요청
			success : function(authObj) { // 성공 시 access 토큰 값(authObj) 발급 받음
				Kakao.Auth.setAccessToken(authObj.access_token); // access 토큰 값 저장
				getInfo(); //사용자 정보 요청 함수 실행
			},
			fail : function(err) {
				alert('카카오 토큰 값 가져오기 실패');
			}
		});
	}

	function getInfo() { //사용자 정보 요청 함수
		Kakao.API.request({ //카카오 서버로부터 응답을 받음
			url : '/v2/user/me',
			success : function(res) { //성공 시
				let email = res.kakao_account.email; //이메일 정보 받아옴
				$.ajax({
					url:'loginKakao',
					type:'post',
					data:{mem_email:email},
					dataType:'json',
					success: function(param){
						if(param.result=='success'){
							location.replace("/main/home");
						} else{
							alert('카카오 로그인 오류');
						}
					},
					error:function(){
						alert('네트워크 통신 오류');
					}
				});
			},
			fail : function(error) {
				alert('카카오 로그인/회원가입에 실패했습니다. 관리자에게 문의하세요.');
			}
		});
	}
</script>
<!-- 유효성 체크-->
<!-- 바디 끝 -->