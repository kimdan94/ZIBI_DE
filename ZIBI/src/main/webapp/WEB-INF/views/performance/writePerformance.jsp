<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<div class="page-main">
	<h2>글쓰기/</h2>
	<!-- form태그를 사용하려면 먼저 Controller에서 modelAttribute부터 -->
	<form:form action="register" modelAttribute="performanceVO" enctype="multipart/form-data">
		<form:errors element="div" cssClass="error-color"/>
			<ul>
				<li>
					<form:label path="performance_title">제목</form:label>
					<form:input path="performance_title"/>
					<form:errors path="performance_title" cssClass="error-color"/>
				</li>
				<li>
					<form:label path="performance_content">내용</form:label>
					<form:textarea path="performance_content"/>
					<form:errors path="performance_content" cssClass="error-color"/>
				</li>
				<li><!-- upload를 하려면 vo에 MultipartFile 변수를 만들어줘야 한다 (sql X) -->
					<form:label path="upload">포스터</form:label>
					<input type="file" name="upload" id="upload">
				</li>
				<li>
					<form:label path="performance_start_date">개봉일</form:label>
					<form:input path="performance_start_date"/>
					<form:errors path="performance_start_date" cssClass="error-color"/>
				</li>
				<li>
					<form:label path="performance_age">상영등급</form:label>
					<form:input path="performance_age"/>
					<form:errors path="performance_age" cssClass="error-color"/>
				</li>
				<li>
					<form:label path="performance_category">카테고리</form:label>
					<form:input path="performance_category"/>
					<form:errors path="performance_category" cssClass="error-color"/>
				</li>
			</ul>
			<div class="align-center">
				<form:button>전송</form:button> 
				<input type="button" value="목록" onclick="location.href='list'">
			</div>	
	</form:form>
</div>


<!-- 
레이아웃
<div class="container-fluid contact py-6 wow bounceInUp" data-wow-delay="0.1s">
	<div class="container">
		<h2>좌석 선택</h2>
	
	</div>
</div>

 -->