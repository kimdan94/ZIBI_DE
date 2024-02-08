<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="container-fluid contact py-6">
	<div class="container">
	<h2>결제 내역</h2>
	
	<table>
		<tr>
			<th>상영관</th>
			<th>영화</th>
			<th>날짜/시간</th>
			<th>결제</th>
			<th>좌석</th>
		</tr>
		
		<c:forEach var="total" items="${total}" varStatus="status">
		<tr>
			<td>
				<img class="" style="width:150px;" src="${pageContext.request.contextPath}/upload/${total.performanceVO.performance_poster}" alt="">
			</td>
			<td>
				<div>
					${total.cinemaVO.cinema_location1} ${total.cinemaVO.cinema_location2} ${total.cinemaVO.cinema_theater}
				</div>
				<div>
					${total.performanceVO.performance_title} ${total.performanceVO.performance_age}
				</div>
			</td>
			<td>${total.ticketingVO.ticketing_date} ${total.ticketingVO.ticketing_start_time}</td>
			<td>${total.paymentVO.payment_type} ${total.paymentVO.payment_price} ${total.paymentVO.payment_state} ${total.paymentVO.payment_date}</td>

			<td>
			<c:forEach var="all" items="${all}" varStatus="status">
			<c:if test="${total.paymentVO.payment_uid==all.paymentVO.payment_uid}">
				${all.choiceVO.choice_row}행 ${all.choiceVO.choice_col}열  
			</c:if>
			</c:forEach>
			</td>

		</tr>
		</c:forEach>
		
	</table>
	
	<br><br><br><br><br><br><br><br><br><br>
	<c:forEach var="total" items="${total}" varStatus="status">
		<div>${total.cinemaVO}</div>
		<div>${total.performanceVO}</div>
		<div>${total.ticketingVO}</div>
		<div>${total.choiceVO}</div>
		<div>${total.paymentVO}</div>
		<br><br>
		<hr>
		<div>
			${total.paymentVO.payment_uid}
			<c:forEach var="all" items="${all}" varStatus="status">
			<c:if test="${total.paymentVO.payment_uid==all.paymentVO.payment_uid}">
				<div>
				${all.choiceVO.choice_row} ${all.choiceVO.choice_col}
				</div>
			</c:if>
			</c:forEach>
		
		</div>
		<hr>
	</c:forEach>
	
	</div>
</div>

