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
				<form:button class="btn mem-btn-green w-100">로그인</form:button>
				<div class="text-center">
					<%-- [소셜 네트워크 로그인] --%>
					<input type="button" class="btn mem-btn w-100" value="아이디 찾기" onclick="location.href='${pageContext.request.contextPath}/member/'">
					<input type="button" class="btn mem-btn w-100" value="비밀번호 찾기" onclick="location.href='${pageContext.request.contextPath}/member/'">
					<input type="button" class="btn mem-btn w-100" value="회원가입" onclick="location.href='${pageContext.request.contextPath}/member/register'">
				</div>
			</form:form>
		</div>
	</div>
</div>
<!-- Contact End -->
<script type="text/javascript">
	let mem_email = document.getElementById('mem_email');
	let mem_password = document.getElementById('mem_password');
	//아이디, 비밀번호 입력 유효성 체크
	document.getElementById('login').onsubmit = function() {
		if(mem_email.value.trim() == '' || mem_password.value.trim() == '') {
			document.getElementById('register-check').innerHTML = '<span>이메일 혹은 비밀번호를 입력해주세요</span>';
			return false;
		}
		document.getElementById('memberVO.errors').innerText = ' ';
	};
	//자바 유효성 체크 후 이메일 재입력 시 UI 초기화
	mem_email.onkeydown = function() {
		document.getElementById('memberVO.errors').innerText = ' ';
	}
</script>
<!-- 바디 끝 -->