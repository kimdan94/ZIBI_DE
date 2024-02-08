<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>

        <!-- 결제창 start -->
        <div class="container-fluid blog py-6">
            <div class="container">
                <div class="text-center wow" data-wow-delay="0.1s">
                    <small class="d-inline-block fw-bold text-dark text-uppercase bg-light border border-primary rounded-pill px-4 py-1 mb-3">Payment</small>
                    <h1 class="display-5 mb-5">결제하기</h1>
                </div>
                <div class="row gx-4 justify-content-center">
                
                
                	<!-- 예매 정보 시작 -->
                    <div class="col-md-6 col-lg-4 wow" >
                        <div class="blog-item">
                            <div class="blog-content mx-4 d-flex rounded bg-light">
                                <div class="text-dark bg-primary rounded-start">
                                    <div class="h-100 p-3 d-flex flex-column justify-content-center text-center">
                                        <p class="fw-bold mb-0" style="color:white;">1</p>
                                        <p class="fw-bold mb-0" style="color:white;">Step</p>
                                    </div>
                                </div>
                                <p class="h5 lh-base my-auto h-100 p-3">예매정보</p>
                            </div>
                            <div class="overflow-hidden rounded" style="background-color:pink; height:600px;">
                            	<p>제목 : ${payPerformance.performance_title}</p>
                            	<p><img class="img-fluid rounded" src="${pageContext.request.contextPath}/upload/${payPerformance.performance_poster}" alt="" style="width:150px;"></p>
                            	<p>연령 : ${payPerformance.performance_age}</p>
                            	<p>영화관 : ${payCinema.cinema_theater}</p>
                            	<p>일시 : ${payTicketing.ticketing_date} ${payTicketing.ticketing_start_time} </p>
                            	<p></p>
                            	<div>
									좌석 : 
									<c:forEach var="seatList" items="${seatList}" varStatus="status">
									${seatList} 
									</c:forEach>
								</div>
                            </div>
                        </div>
                    </div>
                    <!-- 예매 정보 끝 -->
                    
                    
                    <!-- 결제 수단 시작 -->
                    <div class="col-md-6 col-lg-4 wow">
                        <div class="blog-item">
                            <div class="blog-content mx-4 d-flex rounded bg-light">
                                <div class="text-dark bg-primary rounded-start">
                                    <div class="h-100 p-3 d-flex flex-column justify-content-center text-center">
                                        <p class="fw-bold mb-0" style="color:white;">2</p>
                                        <p class="fw-bold mb-0" style="color:white;">Step</p>
                                    </div>
                                </div>
                                <p class="h5 lh-base my-auto h-100 p-3">결제수단</p>
                            </div>
                            <div class="overflow-hidden rounded" style="background-color:pink; height:600px;">
                            	<input type="radio" name="options" value="kakaopay"> 카카오페이
								<input type="radio" name="options" value="card"> 카드결제
                            </div>
                        </div>
                    </div>
                    <!-- 결제 수단 끝 -->
                    
                    <!-- 결제하기 시작 -->
                    <div class="col-md-6 col-lg-4 wow">
                        <div class="blog-item">
                        	<div class="blog-content mx-4 d-flex rounded bg-light">
                                <div class="text-dark bg-primary rounded-start">
                                    <div class="h-100 p-3 d-flex flex-column justify-content-center text-center">
                                        <p class="fw-bold mb-0" style="color:white;">3</p>
                                        <p class="fw-bold mb-0" style="color:white;">Step</p>
                                    </div>
                                </div>
                                <p class="h5 lh-base my-auto h-100 p-3">결제하기</p>
                            </div>
                            <div class="overflow-hidden rounded" style="background-color:pink; height:600px;">
                            	<div>일반 : ${payCinema.cinema_adult} X ${adult_money}</div>
								<div>청소년 : ${payCinema.cinema_teenage} X ${teenage_money}</div>
								<div>우대 : ${payCinema.cinema_treatment} X ${treatement_money}</div>
								<div>합계 : <span id="total_price">${payCinema.cinema_adult*adult_money + payCinema.cinema_teenage*teenage_money + payCinema.cinema_treatment*treatement_money}</span></div>
                            	
								<button class="btn btn-primary py-2 px-4 d-none d-xl-inline-block rounded-pill" onclick="pay()">결제</button>
                            </div>
                        </div>
                    </div>
                    <!-- 결제하기 시작 -->
                    
                    
                </div>
            </div>
        </div>
        <!-- 결제창 End -->
<!-- <button onclick="kakaoPay()">카카오페이</button> -->
<!-- <button onclick="card()">카카오페이</button> -->


<!-- <input type="radio" name="options" value="tosspay"> 토스페이 -->




<!-- ----------------------------<<ChoiceVO>>------------------------------------ -->
<form id="choiceValue" action="choiceSeat" method="get">
<%-- 
	<!-- ticketing_num -->
	<input type="hidden" id="ticketing_num" name="ticketing_num" value="${payTicketing.ticketing_num}"/>
	<!-- cinema_num -->
	<input type="hidden" id="cinema_num" name="cinema_num" value="${payCinema.cinema_num}"/>
	
	<!-- 좌석 번호 -->
	<input type="hidden" id="choice_seat" name="choice_seat" value="${seatList}"/>
	<!-- 일반 명 수 -->
	<input type="hidden" id="choice_adult" name="choice_adult" value="${adult_money}"/>
	<!-- 청소년 명 수 -->
	<input type="hidden" id="choice_teenage" name="choice_teenage" value="${teenage_money}"/>	
	<!-- 우대 명 수 -->
	<input type="hidden" id="choice_treatment" name="choice_treatment" value="${treatement_money}"/>
 --%>

	
	<input type="hidden" id="uid" name="uid" value=""/>

	<!-- <input type="submit" value="결제하기"> -->
</form>
<!-- ----------------------------<<ChoiceVO>>------------------------------------ -->

<div id="payment-data" data-ticketing-num="${payTicketing.ticketing_num}" data-cinema-num="${payCinema.cinema_num}" data-choice-seat="${seatList}" data-choice-adult="${adult_money}" data-choice-teenage="${teenage_money}" data-choice-treatment="${treatement_money}"></div>

<!-- 결제하기 버튼 생성 -->
<script type="text/javascript">
function total(){ 
	var total_price = $('#total_price').text();
	console.log(total_price);
}
var IMP = window.IMP;
IMP.init("imp22154723"); // 가맹점 식별코드

function pay(){
	//ifError();
	
	console.log($("#payment-data").data("ticketing-num"));
	console.log($("#payment-data").data("cinema-num"));
	
	var listVar = $('input[name=options]:checked').val();
	console.log(listVar);
	if(listVar == 'kakaopay') {
		kakaoPay();
	} else if(listVar == 'card'){
		card();
	}
	
}
 
//https://hstory0208.tistory.com/entry/Spring-%EC%95%84%EC%9E%84%ED%8F%AC%ED%8A%B8import%EB%A1%9C-%EA%B2%B0%EC%A0%9C-%EA%B8%B0%EB%8A%A5-%EA%B5%AC%ED%98%84%ED%95%98%EA%B8%B0-%ED%81%B4%EB%9D%BC%EC%9D%B4%EC%96%B8%ED%8A%B8-%EC%84%9C%EB%B2%84-%EC%BD%94%EB%93%9C-%ED%8F%AC%ED%95%A8
function kakaoPay() {
	IMP.request_pay({
	    pg : 'kakaopay', // html5_inicis : 일반 카드 // kakaopay.TC0ONETIME : 카카오페이 // pg사 코드 https://portone.gitbook.io/docs/tip/pg-2
	    pay_method : 'card', // kakaopay에서 생략 가능
	    merchant_uid: "order_no_" + new Date().getTime(), // 상점에서 관리하는 고유 주문 번호 - String
	    name : '주문명:결제테스트', // 상품명
	    amount : $('#total_price').text(), // 가격 - integer
	    buyer_email : '',
	    buyer_name : '구매자이름', // 구매자 이름
	    buyer_tel : '', // 휴대폰 번호
	}, function(rsp) {
	    if ( rsp.success ) {
	    	var total_price = document.getElementById('total_price');
	    	console.log('가격 : ' + total_price);
	    	console.log('uid : ' + rsp.merchant_uid);
	    	$('#uid').attr('value', rsp.merchant_uid);
	    	//[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
	    	$.ajax({
	    		url: "/performance/initPayment", //cross-domain error가 발생하지 않도록 주의해주세요
	    		type: 'POST',
	    		data: {
	    			// uid, type, price, choice_num
	    			

		    		imp_uid : rsp.imp_uid,
		    		merchant_uid : rsp.merchant_uid,
		    		pay_method : 'card',
		    		total_price : $('#total_price').text(),
		    		/* ticketing_num : $('#ticketing_num').val(),
		    		cinema_num : $('#cinema_num').val(),
		    		choice_seat : $('#choice_seat').val(),
		    		choice_adult : $('#choice_adult').val(),
		    		choice_teenage : $('#choice_teenage').val(),
		    		choice_treatment : $('#choice_treatment').val() */
		    		
		    		ticketing_num : $('#payment-data').data("ticketing-num"),
		    		cinema_num : $('#payment-data').data("cinema-num"),
		    		choice_seat : $('#payment-data').data("choice-seat"),
		    		choice_adult : $('#payment-data').data("choice-adult"),
		    		choice_teenage : $('#payment-data').data("choice-teenage"),
		    		choice_treatment : $('#payment-data').data("choice-treatment")
		    		
		    		//기타 필요한 데이터가 있으면 추가 전달
	    		},
	    		dataType: 'json',
	    		success:function(param){
					//alert(rsp.imp_uid + ' // ' + rsp.merchant_uid);
					console.log(param.result);
	    			if(param.result=='success'){
						var msg = '결제가 완료되었습니다.';
		    			msg += '\n 상점 거래ID : ' + rsp.merchant_uid;
		    			//msg += '\n 결제 금액 : ' +rsp.merchant_uid;
		    			//msg += ' 카드 승인번호 : ' + rsp.apply_num; // 카카오 페이지에서는 안 보임
		    			
		    			alert(msg);

		    			submit();
		    			//location.href='/performance/showTicket';
					}
	    			
				},
				error:function(){
					alert('결제 네트워크 오류 발생');
					ifError();
				}
	    	
	    	})
	    } else {
	    	ifError();
	        var msg = '결제에 실패하였습니다. ';
	        msg += '에러내용 : ' + rsp.error_msg;
	        alert(msg);
	        location.href='/main/home'; // 이동함
	    }
	});
}
function card() {
	IMP.request_pay({
	    pg : 'html5_inicis', // html5_inicis : 일반 카드 // kakaopay.TC0ONETIME : 카카오페이 // pg사 코드 https://portone.gitbook.io/docs/tip/pg-2
	    pay_method : 'card', // kakaopay에서 생략 가능
	    merchant_uid: "order_no_" + new Date().getTime(), // 상점에서 관리하는 고유 주문 번호 - String
	    name : '주문명:결제테스트', // 상품명
	    amount : $('#total_price').text(), // 가격 - integer
	    buyer_email : '',
	    buyer_name : '구매자이름', // 구매자 이름
	    buyer_tel : '', // 휴대폰 번호
	}, function(rsp) {
	    if ( rsp.success ) {
	    	var total_price = document.getElementById('total_price');
	    	console.log('가격 : ' + total_price);
	    	//[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
	    	$.ajax({
	    		url: "/performance/initPayment", //cross-domain error가 발생하지 않도록 주의해주세요
	    		type: 'POST',
	    		data: {
	    			// uid, type, price, choice_num
		    		imp_uid : rsp.imp_uid,
		    		merchant_uid : rsp.merchant_uid,
		    		pay_method : 'kakaopay',
		    		total_price : $('#total_price').text(),
		    		ticketing_num : $('#ticketing_num').val(),
		    		cinema_num : $('#cinema_num').val(),
		    		choice_seat : $('#choice_seat').val(),
		    		choice_adult : $('#choice_adult').val(),
		    		choice_teenage : $('#choice_teenage').val(),
		    		choice_treatment : $('#choice_treatment').val()
		    		
		    		//기타 필요한 데이터가 있으면 추가 전달
	    		},
	    		dataType: 'json',
	    		success:function(param){
					//alert(rsp.imp_uid + ' // ' + rsp.merchant_uid);
					console.log(param.result);
	    			if(param.result=='success'){
						var msg = '결제가 완료되었습니다.';
		    			msg += '\n상점 거래ID : ' + rsp.merchant_uid;
		    			//msg += '\n결제 금액 : ' +rsp.merchant_uid;
		    			//msg += '카드 승인번호 : ' + rsp.apply_num; // 카카오 페이지에서는 안 보임
		    			
		    			alert(msg);

		    			//submit();
		    			location.href='/performance/showTicket';
					}
	    			
				},
				error:function(){
					alert('결제 네트워크 오류 발생');
					ifError();
				}
	    	
	    	})
	    } else {
	    	ifError();
	        var msg = '결제에 실패하였습니다. ';
	        msg += '에러내용 : ' + rsp.error_msg;
	        alert(msg);
	        location.href='/main/home'; // 이동함
	    }
	});
}
function ifError() {
	alert('error 진입');
	$.ajax({
		url:'errorPayment',
		type:'post',
		data:{},
		dataType:'json',
		success:function(param){
				alert('에러 성공ㄹ');
		},
		error:function(){
			alert('네트워크 오류 발생');
		}
	});
}
function submit() {
	document.getElementById('choiceValue').submit(); // submit
}

</script>
