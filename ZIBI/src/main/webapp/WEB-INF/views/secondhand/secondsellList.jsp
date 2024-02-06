<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(function() {
	//전체
    function SecondsellAll() {
		
        $.ajax({
            url: 'sc_sellAll',
            type: 'post',
            data: { mem_num: ${memberVO.mem_num} },
            dataType: 'json',
            success: function(param) {
                // 해당 탭의 tbody에 동적으로 생성한 내용 추가
                $('#tab-6 tbody').empty();

                $(param.sellAllList).each(function(index, item) {
                    let output = '<tr>';
                    output += '<td><a href="detail?sc_num='+item.sc_num +'">';
                    output += '<img width="60" src="${pageContext.request.contextPath}/upload/' + item.sc_filename + '"></a></td>';
                    output += '<td>';
                    output += '<select name="sc_sell_status">';
                    output += '<option value="0" ' + (item.sc_sellstatus == 0 ? 'selected' : '') + '>판매중</option>';
                    output += '<option value="1" ' + (item.sc_sellstatus == 1 ? 'selected' : '') + '>예약대기</option>';
                    output += '<option value="2" ' + (item.sc_sellstatus == 2 ? 'selected' : '') + '>예약중</option>';
                    output += '<option value="3" ' + (item.sc_sellstatus == 3 ? 'selected' : '') + '>판매완료</option>';
                    output += '</select>';
                    output += '</td>';
                    output += '<td><a href="detail?sc_num='+item.sc_num +'" class="sc-title-fav">' + item.sc_title + '</a></td>';
                    output += '<td>' + item.sc_price + '</td>';
                    output += '<td>' + item.sc_address + '</td>';
                    output += '<td>' + item.sc_modify_date + '</td>';
                    output += '<td><input type="button" value="채팅하기"';
                    output += 'onclick="location.href=\'${pageContext.request.contextPath}/secondchat/chatListForSeller?sc_num=' + item.sc_num + '\'"></td>';
                    output += '<td><input type="button" value="끌어올리기" class="sc_up" data-num="' + item.sc_num + '" ' + (item.sc_sellstatus !== 0 ? 'disabled' : '') + '></td>';
                    output += '<td>';
                    output += '<input type="button" value="수정" onclick="location.href=\'update?sc_num=' + item.sc_num + '\'" ><br>';
                    //output += '<input type="button" value="삭제"><br>';
                    output += '<input type="button" value="삭제" onclick="location.href=\'delete?sc_num=' + item.sc_num + '\'" ><br>';
                    output += '<input type="button" value="숨기기">';
                    output += '</td>';
                    output += '</tr>';
		
                    // 해당 탭의 tbody에 동적으로 생성한 내용 추가
                    $('#tab-6 tbody').append(output);
                });
            },
            error: function() {
                alert('네트워크 오류 발생');
            }
        });//end of ajax
    }//end of function
    
    //끌어올리기 - 등록일 sysdate로 update   (전체, 판매중 부분만)
    $(document).on('click', '.sc_up', function(){
    	let sc_num = $(this).attr('data-num');
    	 $.ajax({
 	        url: 'updateSysdate',
 	        type: 'post',
 	        data: {sc_num: sc_num},
 	        dataType: 'json',
 	        success: function(param) {
 	        	alert('최상단 UP하기 사용!')
 	        },
 	        error: function() {
 	            alert('네트워크 오류 발생');
 	        }
 	    });
    });
    
    //판매중
    $('#sc_forSale').click(function(){
    	$.ajax({
            url: 'sc_forSale',
            type: 'post',
            data: { mem_num: ${memberVO.mem_num}},
            dataType: 'json',
            success: function(param) {
            	// 해당 탭의 tbody에 동적으로 생성한 내용 추가
                $('#tab-7 tbody').empty();
            	
                $(param.forSaleList).each(function(index, item) {
                    let output = '<tr>';
                    output += '<td><a href="detail?sc_num='+item.sc_num +'"><img width="60" src="${pageContext.request.contextPath}/upload/' + item.sc_filename + '"></a></td>';
                    output += '<td>';
                    output += '<select id="sc_sell_status" name="sc_sell_status">';
                    output += '<option value="0" ' + (item.sc_sellstatus == 0 ? 'selected' : '') + '>판매중</option>';
                    output += '<option value="1" ' + (item.sc_sellstatus == 1 ? 'selected' : '') + '>예약대기</option>';
                    output += '<option value="2" ' + (item.sc_sellstatus == 2 ? 'selected' : '') + '>예약중</option>';
                    output += '<option value="3" ' + (item.sc_sellstatus == 3 ? 'selected' : '') + '>판매완료</option>';
                    output += '</select>';
                    output += '</td>';
                    output += '<td><a href="detail?sc_num='+item.sc_num +'" class="sc-title-fav">' + item.sc_title + '</a></td>';
                    output += '<td>' + item.sc_price + '</td>';
                    output += '<td>' + item.sc_address + '</td>';
                    output += '<td>' + item.sc_modify_date + '</td>';
                    output += '<td><input type="button" value="채팅하기"></td>';
                    output += '<td><input type="button" value="끌어올리기" class="sc_up" data-num="'+item.sc_num+'"></td>';
                    /* output += '<td><input type="button" value="끌어올리기"></td>'; */
                    output += '<td>';
                    output += '<input type="button" value="수정"><br>';
                    output += '<input type="button" value="삭제"><br>';
                    //output += '<input type="button" value="삭제" onclick="location.href=\'delete?sc_num=' + item.sc_num + '\'" ><br>';
                    output += '<input type="button" value="숨기기">';
                    output += '</td>';
                    output += '</tr>';
		
                    // 해당 탭의 tbody에 동적으로 생성한 내용 추가
                    $('#tab-7 tbody').append(output);
                });
            },
            error: function() {
                alert('네트워크 오류 발생');
            }
    	});
    });
    
    
    //예약 대기
    $('#sc_waitReserve').click(function(){
    	$.ajax({
            url: 'sc_waitReserve',
            type: 'post',
            data: { mem_num: ${memberVO.mem_num} },
            dataType: 'json',
            success: function(param) {
            	// 해당 탭의 tbody에 동적으로 생성한 내용 추가
                $('#tab-8 tbody').empty();
            	
                $(param.waitReserveList).each(function(index, item) {
                    let output = '<tr>';
                    output += '<td><a href="detail?sc_num='+item.sc_num +'"><img width="60" src="${pageContext.request.contextPath}/upload/' + item.sc_filename + '"></a></td>';
                    output += '<td>';
                    output += '<select name="sc_sell_status">';
                    output += '<option value="0" ' + (item.sc_sellstatus == 0 ? 'selected' : '') + '>판매중</option>';
                    output += '<option value="1" ' + (item.sc_sellstatus == 1 ? 'selected' : '') + '>예약대기</option>';
                    output += '<option value="2" ' + (item.sc_sellstatus == 2 ? 'selected' : '') + '>예약중</option>';
                    output += '<option value="3" ' + (item.sc_sellstatus == 3 ? 'selected' : '') + '>판매완료</option>';
                    output += '</select>';
                    output += '</td>';
                    output += '<td><a href="detail?sc_num='+item.sc_num +'" class="sc-title-fav">' + item.sc_title + '</a></td>';
                    output += '<td>' + item.sc_price + '</td>';
                    output += '<td>' + item.sc_address + '</td>';
                    output += '<td>' + item.sc_order_reg_date + '</td>';
                    output += '<td>' + item.sc_buyer_nickname + '</td>';
                    output += '<td><input type="button" value="채팅하기"></td>';
                    output += '<td>';
                    output += '<input type="button" id="updateOrderReserve" value="예약확정" data-num="'+item.sc_num+'"><br>';
                    output += '<input type="button" value="예약거절"><br>';
                    output += '</td>';
                    output += '</tr>';
		
                    // 해당 탭의 tbody에 동적으로 생성한 내용 추가
                    $('#tab-8 tbody').append(output);
                });
            },
            error: function() {
                alert('네트워크 오류 발생');
            }
    	});
    });
    //예약 대기 페이지에서 예약 확정 클릭 시 ajax   - 동적
    $(document).on('click', '#updateOrderReserve', function(){
	    let sc_num = $(this).attr('data-num');
	    $.ajax({
	        url: 'updateOrderReserve',
	        type: 'post',
	        data: {sc_num: sc_num},
	        dataType: 'json',
	        success: function(param) {
	            alert('예약이 확정되었습니다.');
	        },
	        error: function() {
	            alert('네트워크 오류 발생');
	        }
	    });
	});
    
    //예약 중
    $('#sc_reserve').click(function(){
    	$.ajax({
            url: 'sc_reserve',
            type: 'post',
            data: { mem_num: ${memberVO.mem_num} },
            dataType: 'json',
            success: function(param) {
            	// 해당 탭의 tbody에 동적으로 생성한 내용 추가
                $('#tab-9 tbody').empty();
            	
                $(param.reserveList).each(function(index, item) {
                    let output = '<tr>';
                    output += '<td><a href="detail?sc_num='+item.sc_num +'"><img width="60" src="${pageContext.request.contextPath}/upload/' + item.sc_filename + '"></a></td>';
                    output += '<td>';
                    output += '<select name="sc_sell_status">';
                    output += '<option value="0" ' + (item.sc_sellstatus == 0 ? 'selected' : '') + '>판매중</option>';
                    output += '<option value="1" ' + (item.sc_sellstatus == 1 ? 'selected' : '') + '>예약대기</option>';
                    output += '<option value="2" ' + (item.sc_sellstatus == 2 ? 'selected' : '') + '>예약중</option>';
                    output += '<option value="3" ' + (item.sc_sellstatus == 3 ? 'selected' : '') + '>판매완료</option>';
                    output += '</select>';
                    output += '</td>';
                    output += '<td><a href="detail?sc_num='+item.sc_num +'" class="sc-title-fav">' + item.sc_title + '</a></td>';
                    output += '<td>' + item.sc_price + '</td>';
                    output += '<td>' + item.sc_address + '</td>';
                    output += '<td>' + item.sc_modify_date + '</td>';
                    output += '<td><input type="button" value="채팅하기"></td>';
                    output += '<td>';
                    output += '<input type="button" value="수정"><br>';
                    output += '<input type="button" value="삭제"><br>';
                    //output += '<input type="button" value="삭제" onclick="location.href=\'delete?sc_num=' + item.sc_num + '\'" ><br>';
                    output += '<input type="button" value="숨기기">';
                    output += '</td>';
                    output += '</tr>';
		
                    // 해당 탭의 tbody에 동적으로 생성한 내용 추가
                    $('#tab-9 tbody').append(output);
                });
            	
            },
            error: function() {
                alert('네트워크 오류 발생');
            }
    	});
    });
    
    
    //거래완료
    $('#sc_sellFin').click(function(){
    	$.ajax({
            url: 'sc_sellFin',
            type: 'post',
            data: { mem_num: ${memberVO.mem_num} },
            dataType: 'json',
            success: function(param) {
            	// 해당 탭의 tbody에 동적으로 생성한 내용 추가
                $('#tab-10 tbody').empty();
            	
                $(param.sellFinList).each(function(index, item) {
                    let output = '<tr>';
                    output += '<td><a href="detail?sc_num='+item.sc_num +'"><img width="60" src="${pageContext.request.contextPath}/upload/' + item.sc_filename + '"></a></td>';
                    output += '<td>';
                    output += '<select class="sc_sell_status" name="sc_sell_status">';
                    output += '<option value="0" ' + (item.sc_sellstatus == 0 ? 'selected' : '') + '>판매중</option>';
                    output += '<option value="1" ' + (item.sc_sellstatus == 1 ? 'selected' : '') + '>예약대기</option>';
                    output += '<option value="2" ' + (item.sc_sellstatus == 2 ? 'selected' : '') + '>예약중</option>';
                    output += '<option value="3" ' + (item.sc_sellstatus == 3 ? 'selected' : '') + '>판매완료</option>';
                    output += '</select>';
                    output += '</td>';
                    output += '<td><a href="detail?sc_num='+item.sc_num +'" class="sc-title-fav">' + item.sc_title + '</a></td>';
                    output += '<td>' + item.sc_price + '</td>';
                    output += '<td>' + item.sc_address + '</td>';
                    output += '<td>' + item.sc_modify_date + '</td>';
                    output += '<td><input type="button" value="채팅하기"></td>';
                    output += '<td>';
                    output += '<input type="button" value="수정"><br>';
                    output += '<input type="button" value="삭제"><br>';
                    //output += '<input type="button" value="삭제" onclick="location.href=\'delete?sc_num=' + item.sc_num + '\'" ><br>';
                    output += '<input type="button" value="숨기기">';
                    output += '</td>';
                    output += '</tr>';
		
                    // 해당 탭의 tbody에 동적으로 생성한 내용 추가
                    $('#tab-10 tbody').append(output);
                });
            },
            error: function() {
                alert('네트워크 오류 발생');
            }
    	});
    });
    
  	//숨김
  	/*
    $('#sc_sellFin').click(function(){
    	$.ajax({
            url: 'sc_sellFin',
            type: 'post',
            data: { mem_num: ${memberVO.mem_num} },
            dataType: 'json',
            success: function(param) {
            	// 해당 탭의 tbody에 동적으로 생성한 내용 추가
                $('#tab-10 tbody').empty();
            },
            error: function() {
                alert('네트워크 오류 발생');
            }
    	});
    });
    */
  	
    //페이지 들어올 때 자동으로 ajax 실행된다("전체"가 먼저 실행되서 목록에 보여진다)
    SecondsellAll();

    //"전체"클릭 시 ajax 실행된다
    $('#sc_sellAll').click(function() {
        SecondsellAll();
    });
});
</script>
    
<!-- Menu Start -->
<div class="container-fluid menu py-6">
    <div class="container">
        <div class="tab-class text-center">
            <ul class="nav nav-pills d-inline-flex justify-content-center mb-5">
            	<!-- 전체 -->
                <li class="nav-item p-2">
                    <a id="sc_sellAll" class="d-flex py-2 mx-2  rounded-pill active" 
                     	data-bs-toggle="pill" href="#tab-6">
                        <span class="text-dark" style="width: 150px;">전체</span>
                    </a>
                </li>
                <!-- 판매중 -->
                <li class="nav-item p-2">
                    <a id="sc_forSale" class="d-flex py-2 mx-2 rounded-pill" 
                    	 data-bs-toggle="pill" href="#tab-7">
                        <span class="text-dark" style="width: 150px;">판매중</span>
                    </a>
                </li>
                <!-- 예약대기 -->
                <li class="nav-item p-2">
                    <a id="sc_waitReserve" class="d-flex py-2 mx-2 rounded-pill" 
                    	data-bs-toggle="pill" href="#tab-8">
                        <span class="text-dark" style="width: 150px;">예약대기</span>
                    </a>
                </li>
                <!-- 예약중 -->
                <li class="nav-item p-2">
                    <a id="sc_reserve" class="d-flex py-2 mx-2 rounded-pill" data-bs-toggle="pill" href="#tab-9">
                        <span class="text-dark" style="width: 150px;">예약중</span>
                    </a>
                </li>
                <!-- 거래완료 -->
                <li class="nav-item p-2">
                    <a id="sc_sellFin" class="d-flex py-2 mx-2  rounded-pill" data-bs-toggle="pill" href="#tab-10">
                        <span class="text-dark" style="width: 150px;">판매완료</span>
                    </a>
                </li>
                <!-- 숨김 -->
                <li class="nav-item p-2">
                    <a id="sc_hide" class="d-flex py-2 mx-2  rounded-pill" data-bs-toggle="pill" href="#tab-11">
                        <span class="text-dark" style="width: 150px;">숨김</span>
                    </a>
                </li>
            </ul>
            <div class="tab-content">
            	<!-- 전체 -->
                <div id="tab-6" class="tab-pane fade show p-0 active">
                    <div class="row g-4">
                        <div class="col-lg-12">
                            <div class="menu-item d-flex align-items-center">
                                <div class="w-100 d-flex flex-column text-start ps-4">
                                    <table class="table">
										<thead>
										  <tr>
										    <th scope="col">사진</th>
										    <th scope="col">판매상태</th>
										    <th scope="col">글제목</th>
										    <th scope="col">가격</th>
										    <th scope="col">동네</th>
										    <th scope="col">최근수정일</th>
										    <th scope="col">채팅하기</th>
										    <th scope="col">끌어올리기</th>
										    <th scope="col">기능</th>
										  </tr>
										</thead>
										<tbody>
										  
										</tbody>
									</table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                
                <!-- 판매중 -->
                <div id="tab-7" class="tab-pane fade show p-0">
                    <div class="row g-4">
                        <div class="col-lg-12">
                            <div class="menu-item d-flex align-items-center">
                                <div class="w-100 d-flex flex-column text-start ps-4">
                                    <table class="table">
										<thead>
										  <tr>
										    <th scope="col">사진</th>
										    <th scope="col">판매상태</th>
										    <th scope="col">글제목</th>
										    <th scope="col">가격</th>
										    <th scope="col">동네</th>
										    <th scope="col">최근수정일</th>
										    <th scope="col">채팅하기</th>
										    <th scope="col">끌어올리기</th>
										    <th scope="col">기능</th>
										  </tr>
										</thead>
										<tbody>
										  
										</tbody>
									</table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>    
                
                <!-- 예약대기 -->
                <div id="tab-8" class="tab-pane fade show p-0">
                    <div class="row g-4">
                    
                        <div class="col-lg-12">
                            <div class="menu-item d-flex align-items-center">
                                <div class="w-100 d-flex flex-column text-start ps-4">
                                    <table class="table">
										<thead>
										  <tr>
										    <th scope="col">사진</th>
										    <th scope="col">판매상태</th>
										    <th scope="col">글제목</th>
										    <th scope="col">가격</th>
										    <th scope="col">동네</th>
										    <th scope="col">예약요청일</th>
										    <th scope="col">구매자</th>
										    <th scope="col">채팅하기</th>
										    <th scope="col">예약</th>
										  </tr>
										</thead>
										<tbody>
										  
										</tbody>
									</table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- 예약중 -->
                <div id="tab-9" class="tab-pane fade show p-0">
                    <div class="row g-4">
                        <div class="col-lg-12">
                            <div class="menu-item d-flex align-items-center">
                                <div class="w-100 d-flex flex-column text-start ps-4">
                                    <table class="table">
										<thead>
										  <tr>
										    <th scope="col">사진</th>
										    <th scope="col">판매상태</th>
										    <th scope="col">글제목</th>
										    <th scope="col">가격</th>
										    <th scope="col">동네</th>
										    <th scope="col">최근수정일</th>
										    <th scope="col">채팅하기</th>
										    <th scope="col">기능</th>
										  </tr>
										</thead>
										<tbody>
										  
										</tbody>
									</table>
                                </div>
                            </div>
                        </div>
                        
                    </div>
                </div>
                <!-- 판매완료 -->
                <div id="tab-10" class="tab-pane fade show p-0">
                    <div class="row g-4">
                        <div class="col-lg-12">
                            <div class="menu-item d-flex align-items-center">
                                <div class="w-100 d-flex flex-column text-start ps-4">
                                    <table class="table">
										<thead>
										  <tr>
										    <th scope="col">사진</th>
										    <th scope="col">판매상태</th>
										    <th scope="col">글제목</th>
										    <th scope="col">가격</th>
										    <th scope="col">동네</th>
										    <th scope="col">최근수정일</th>
										    <th scope="col">채팅하기</th>
										    <th scope="col">기능</th>
										  </tr>
										</thead>
										<tbody>
										  
										</tbody>
									</table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="tab-11" class="tab-pane fade show p-0">
                    <div class="row g-4">
                        <div class="col-lg-6">
                            <div class="menu-item d-flex align-items-center">
                                <div class="w-100 d-flex flex-column text-start ps-4">
                                    <div class="d-flex justify-content-between border-bottom border-primary pb-2 mb-2">
                                        <h4>Sabudana Tikki</h4>
                                        <h4 class="text-primary">$90</h4>
                                    </div>
                                    <p class="mb-0">Consectetur adipiscing elit sed dwso eiusmod tempor incididunt ut labore.</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="menu-item d-flex align-items-center">
                                <div class="w-100 d-flex flex-column text-start ps-4">
                                    <div class="d-flex justify-content-between border-bottom border-primary pb-2 mb-2">
                                        <h4>Crispy</h4>
                                        <h4 class="text-primary">$90</h4>
                                    </div>
                                    <p class="mb-0">Consectetur adipiscing elit sed dwso eiusmod tempor incididunt ut labore.</p>
                                </div>
                            </div>
                        </div>
                        
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Menu End -->