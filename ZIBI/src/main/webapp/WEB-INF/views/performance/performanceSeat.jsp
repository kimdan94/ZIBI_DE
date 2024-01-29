<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/hyun/choose.seat.js"></script>


<!-- 인원 선택 Start -->
<div class="container-fluid contact py-6">
	<div class="container">
		<h2>인원 선택</h2>
		<div>
			<span class="people">성인</span>
			<span class="people adult-minus">-</span>
			<span class="people adult-num">0</span>
			<span class="people adult-plus">+</span>
		</div>
		<div>
			<span class="people">청소년</span>
			<span class="people teenage-minus">-</span>
			<span class="people teenage-num">0</span>
			<span class="people teenage-plus">+</span>
		</div>
		<div>
			<span class="people">우대</span>
			<span class="people treatement-minus">-</span>
			<span class="people treatement-num">0</span>
			<span class="people treatement-plus">+</span>
		</div>
	</div>
</div>
<br><br><br>
<!-- 인원선택 End -->


<!-- 좌석 선택 Start -->
<div class="container-fluid contact py-6 wow bounceInUp" data-wow-delay="0.1s">
	<div class="container">
		<h2>좌석 선택</h2>
	
	</div>
</div>
<!-- 좌석 선택 End -->

<br><br><br><br><br><br><br><br>
<form action="submitSeat" method="post">
	
	<input type="submit" value="결제하기">
</form>