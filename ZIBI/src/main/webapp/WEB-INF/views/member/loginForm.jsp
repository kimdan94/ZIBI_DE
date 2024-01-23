<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
 <!-- Contact Start -->
<div class="container">
	<div class="login-form row justify-content-center">
		<div class="col-7">
			<div id="carouselExample" class="carousel slide">
				<div class="carousel-inner">
					<div class="carousel-item active">
						<img src="${pageContext.request.contextPath}/sample/img/event-1.jpg" class="d-block w-100">
					</div>
					<div class="carousel-item">
						<img src="${pageContext.request.contextPath}/sample/img/event-2.jpg" class="d-block w-100">
					</div>
					<div class="carousel-item">
						<img src="${pageContext.request.contextPath}/sample/img/event-3.jpg" class="d-block w-100">
					</div>
				</div>
				<button class="carousel-control-prev" type="button"
					data-bs-target="#carouselExample" data-bs-slide="prev">
					<span class="carousel-control-prev-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Previous</span>
				</button>
				<button class="carousel-control-next" type="button"
					data-bs-target="#carouselExample" data-bs-slide="next">
					<span class="carousel-control-next-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Next</span>
				</button>
			</div>
		</div>
		<div class="col-5">
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
				<form:button class="btn btn-light active rounded-pill w-100 p-3">로그인</form:button>
			</form:form>
			<div class="text-center">
				<input type="button" class="btn" value="아이디 찾기" onclick="location.href='${pageContext.request.contextPath}/member/'">
				<input type="button" class="btn" value="비밀번호 찾기" onclick="location.href='${pageContext.request.contextPath}/member/'">
				<input type="button" class="btn" value="회원가입" onclick="location.href='${pageContext.request.contextPath}/member/register'">
			</div>
			<%-- [소셜 네트워크 로그인] --%>
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