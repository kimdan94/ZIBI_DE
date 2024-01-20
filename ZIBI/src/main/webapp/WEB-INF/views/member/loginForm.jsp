<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
 <!-- Contact Start -->
<div class="container">
	<div class="d-flex justify-content-center">
		<div class="rounded login-form col-md-4 col-lg-6">
			<form:form action="login" id="login" modelAttribute="memberVO">
				<div id="login-check">
					<form:errors element="span"/>
				</div>
				<div>
					<form:label path="mem_email">이메일</form:label>
					<form:input path="mem_email" class="w-100 form-control p-3 mb-4" />
				</div>
				<div>
					<form:label path="mem_password">비밀번호</form:label>
					<form:password path="mem_password" class="w-100 form-control p-3 mb-4" />
				</div>
				<%-- [소셜 네트워크 로그인] --%>
				<form:button class="w-100 btn btn-light form-control p-3 rounded-pill">로그인</form:button>
			</form:form>
			<div id="register-check">
				<%-- 아이디 찾기 [버튼] --%>
				<%-- 비밀번호 찾기 [버튼] --%>
			</div>
		</div>
	</div>
</div>
<!-- Contact End -->
<script type="text/javascript">
	let mem_email = document.getElementById('mem_email');
	let mem_password = document.getElementById('mem_password');
	//아이디, 비밀번호 입력 유효성 체크
	document.getElementById('login').onsubmit = function() {
		document.getElementById('memberVO.errors').innerText = ' ';
		if (mem_email.value.trim() == '' || mem_password.value.trim() == '') {
			document.getElementById('register-check').innerText = '이메일 혹은 비밀번호를 입력해주세요';
			return false;
		}
	};
	//자바 유효성 체크 후 이메일 재입력 시 UI 초기화
	mem_email.onkeydown = function() {
		document.getElementById('memberVO.errors').innerText = ' ';
	}
</script>
<!-- 바디 끝 -->