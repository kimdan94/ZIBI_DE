<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<div class="container">
	<form:form action="mypageUpdate" id="update_member" modelAttribute="memberVO">              
		<div class="form-group">
			이메일 : ${memberVO.mem_email}
		</div>
		<div>
			<form:label path="mem_nickname">닉네임</form:label>
			<form:input path="mem_nickname" placeholder="한글만 가능합니다" style="width:300px;" />
			<input type="button" value="중복체크" id="nickname_check">구현 필요
			<form:errors path="mem_nickname" />
			<span id="nickname_area"></span>
		</div>
		<div>
			<form:label path="mem_name">이름</form:label>
			<form:input path="mem_name" style="width:300px;" />
			<form:errors path="mem_name" />
		</div>
		<div>
			<form:label path="mem_phone">연락처</form:label>
			<form:input path="mem_phone" placeholder="010-1234-1234 형식으로 입력해주세요" style="width:300px;" />
			<input type="button" value="중복체크" id="phone_check">구현 필요
			<form:errors path="mem_phone" />
			<span id="phone_area"></span> <%-- 핸드폰 번호 인증 API --%>
		</div>
		<div>
			<form:label path="mem_zipcode">우편번호</form:label>
			<form:input path="mem_zipcode" placeholder="5자로 입력해주세요" style="width:300px;" />
			<input type="button" value="우편번호" id="zipcode_check">구현 필요<%-- 우편번호 찾기 API --%>
			<form:errors path="mem_zipcode" />
		</div>
		<div>
			<form:label path="mem_address1">주소</form:label>
			<form:input path="mem_address1" style="width:300px;" />
			<form:errors path="mem_address1" />
		</div>
		<div>
			<form:label path="mem_address2">상세주소</form:label>
			<form:input path="mem_address2" style="width:300px;" />
			<form:errors path="mem_address2" />
		</div>
		<form:button>회원 정보 수정</form:button>
	</form:form>
</div>