<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!-- 바디 시작 -->
<div class="container">
	<form:form action="login" id="login" modelAttribute="memberVO">
		<form:errors element="div"/>
			<span id="login_area"></span>
			<div>
				<form:label path="mem_email">이메일</form:label>
				<form:input path="mem_email"/>
			</div>
			<div>
				<form:label path="mem_password">비밀번호</form:label>
				<form:password path="mem_password"/>
			</div>
		<form:button>로그인</form:button>
	</form:form>
</div>
<script type="text/javascript">
	
	let mem_email = document.getElementById('mem_email');
	let mem_password = document.getElementById('mem_password');
	
	//아이디, 비밀번호 입력 유효성 체크
	document.getElementById('login').onsubmit = function(){
		if(mem_email.value.trim()=='' || mem_password.value.trim()==''){
			document.getElementById('login_area').innerText='이메일 혹은 비밀번호를 입력해주세요';
			return false;
		}
	};
	//자바 유효성 체크 후 이메일 재입력 시 UI 초기화
	mem_email.onkeydown=function(){
		document.getElementById('memberVO.errors').innerText='';
	}
</script>
<!-- 바디 끝 -->