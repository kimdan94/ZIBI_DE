<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="page-main">
	<h2>선택</h2>
	<!-- form태그를 사용하려면 먼저 Controller에서 modelAttribute부터 -->
	<form:form action="registerCinema" modelAttribute="ticketingVO" enctype="multipart/form-data">
		<form:errors element="div" cssClass="error-color"/>
			<ul>
				<li>
					<form:label path="performance_num">영화 선택</form:label>
					<select>
						<option value="">선택	</option>
						<c:forEach var="performance" items="${listPerformance}">
						<option value="${performance.performance_num}">${performance.performance_title} ${performance.performance_start_date}</option>
						</c:forEach>
					</select>
					<form:errors path="performance_num" cssClass="error-color"/>
				</li>
				<li>
					<form:label path="cinema_num">상영관 지역 선택</form:label>
					<select>
						<option value="">선택	</option>
						<c:forEach var="cinema" items="${listCinemaLoc1}">
						<option value="${cinema.cinema_location1}">${cinema.cinema_location1} ${performance.performance_start_date}</option>
						</c:forEach>
					</select>
					<form:errors path="cinema_num" cssClass="error-color"/>
				</li>
				<li>
					<form:label path="cinema_num">상영관 지역 선택</form:label>
					<select>
						<option value="">선택	</option>
						<c:forEach var="performance" items="${listPerformance}">
						<option value="${performance.performance_num}">${performance.performance_title} ${performance.performance_start_date}</option>
						</c:forEach>
					</select>
					<form:errors path="cinema_num" cssClass="error-color"/>
				</li>
				<li>
					<form:label path="ticketing_date">날짜</form:label>
					<form:input path="ticketing_date"/>
					<form:errors path="ticketing_date" cssClass="error-color"/>
				</li>
				<li>
					<form:label path="ticketing_start_time">시간</form:label>
					<form:input path="ticketing_start_time"/>
					<form:errors path="ticketing_start_time" cssClass="error-color"/>
				</li>
			</ul>
			<div class="align-center">
				<form:button>전송</form:button>
				<input type="button" value="목록" onclick="location.href='list'">
			</div>	
	</form:form>
</div>

<c:forEach var="performance" items="${listPerformance}" varStatus="status">
	<div>${performance.performance_num} 
	${performance.performance_title} 
	${performance.performance_start_date}</div>
</c:forEach>
