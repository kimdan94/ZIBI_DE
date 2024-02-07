<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="container-fluid contact py-6">
	<div class="container">
	<h2>결제 내역</h2>
	
	<c:forEach var="cinema" items="${payCinema}" varStatus="status">
		<div>${cinema}</div>
	</c:forEach>
	<br>
	<c:forEach var="performance" items="${payPerformance}" varStatus="status">
		<div>${performance}</div>
	</c:forEach>
	<br>
	<c:forEach var="ticketing" items="${payTicketing}" varStatus="status">
		<div>${ticketing}</div>
	</c:forEach>
	<br>
	<c:forEach var="choice" items="${payChoice}" varStatus="status">
		<div>${choice}</div>
	</c:forEach>
	<br>
	<c:forEach var="payment" items="${payPayment}" varStatus="status">
		<div>${payment}</div>
	</c:forEach>
	
	<c:forEach var="payment" items="${total}" varStatus="status">
		<div>${payment.cinemaVO.cinema_num}</div>
	</c:forEach>
	
	</div>
</div>