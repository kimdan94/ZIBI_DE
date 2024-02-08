<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	<div class="container page-width">
		<h2>결제완료</h2><br><br>
		<div class="row">
			<div class="col">
				<input type="button" class="btn mem-btn-green w-100" value="예매 내역" onclick="" id="">
			</div>
		</div>


	<!--  -->
	<c:forEach var="total" items="${total}" varStatus="status">
				<img class="" style="width:150px;" src="${pageContext.request.contextPath}/upload/${total.performanceVO.performance_poster}" alt="">
				<div>
					${total.cinemaVO.cinema_location1} ${total.cinemaVO.cinema_location2} ${total.cinemaVO.cinema_theater}
				</div>
				<div>
					${total.performanceVO.performance_title} ${total.performanceVO.performance_age}
				</div>
			<div>${total.ticketingVO.ticketing_date} ${total.ticketingVO.ticketing_start_time}</div>
			<div>${total.paymentVO.payment_type} ${total.paymentVO.payment_price} ${total.paymentVO.payment_state} ${total.paymentVO.payment_date}</div>

			<div>
			<c:forEach var="all" items="${all}" varStatus="status">
			<c:if test="${total.paymentVO.payment_uid==all.paymentVO.payment_uid}">
				${all.choiceVO.choice_row}행 ${all.choiceVO.choice_col}열  
			</c:if>
			</c:forEach>
			</div>

		</c:forEach>
		
		
		<!--  -->




		<a href='history'>결제내역</a>
	</div>
	
	
		
		
