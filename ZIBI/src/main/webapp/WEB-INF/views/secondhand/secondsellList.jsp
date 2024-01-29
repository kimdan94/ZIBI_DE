<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
    $(document).ready(function() {
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
                        output += '<td><img width="60" src="${pageContext.request.contextPath}/upload/' + item.sc_filename + '"></td>';
                        output += '<td>';
                        output += '<select id="sc_sell_status" name="sc_sell_status">';
                        output += '<option value="0" ' + (item.sc_sellstatus == 0 ? 'selected' : '') + '>판매중</option>';
                        output += '</select>';
                        output += '</td>';
                        output += '<td>' + item.sc_title + '</td>';
                        output += '<td>' + item.sc_price + '</td>';
                        output += '<td>' + item.sc_address + '</td>';
                        output += '<td>' + item.sc_modify_date + '</td>';
                        output += '<td><input type="button" value="채팅하기"></td>';
                        output += '<td><input type="button" value="끌어올리기"></td>';
                        output += '<td>';
                        output += '<input type="button" value="수정"><br>';
                        output += '<input type="button" value="삭제"><br>';
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
            });
        }

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
            <ul class="nav nav-pills d-inline-flex justify-content-center mb-5 wow" data-wow-delay="0.1s">
                <li class="nav-item p-2">
                    <a id="sc_sellAll" class="d-flex py-2 mx-2 border border-primary bg-white rounded-pill active" data-bs-toggle="pill" href="#tab-6">
                        <span class="text-dark" style="width: 150px;">전체</span>
                    </a>
                </li>
                
                <li class="nav-item p-2">
                    <a class="d-flex py-2 mx-2 border border-primary bg-white rounded-pill" data-bs-toggle="pill" href="#tab-7">
                        <span class="text-dark" style="width: 150px;">판매중</span>
                    </a>
                </li>
                <li class="nav-item p-2">
                    <a class="d-flex py-2 mx-2 border border-primary bg-white rounded-pill" data-bs-toggle="pill" href="#tab-8">
                        <span class="text-dark" style="width: 150px;">예약대기</span>
                    </a>
                </li>
                <li class="nav-item p-2">
                    <a class="d-flex py-2 mx-2 border border-primary bg-white rounded-pill" data-bs-toggle="pill" href="#tab-9">
                        <span class="text-dark" style="width: 150px;">예약중</span>
                    </a>
                </li>
                <li class="nav-item p-2">
                    <a class="d-flex py-2 mx-2 border border-primary bg-white rounded-pill" data-bs-toggle="pill" href="#tab-10">
                        <span class="text-dark" style="width: 150px;">거래완료</span>
                    </a>
                </li>
                <li class="nav-item p-2">
                    <a class="d-flex py-2 mx-2 border border-primary bg-white rounded-pill" data-bs-toggle="pill" href="#tab-11">
                        <span class="text-dark" style="width: 150px;">숨김</span>
                    </a>
                </li>
            </ul>
            <div class="tab-content">
            	<!-- 전체 -->
                <div id="tab-6" class="tab-pane fade show p-0 active">
                    <div class="row g-4">
                        <div class="col-lg-12 wow" data-wow-delay="0.1s">
                            <div class="menu-item d-flex align-items-center">
                                <img class="flex-shrink-0 img-fluid rounded-circle" src="img/menu-01.jpg" alt="">
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
                
                
                <div id="tab-7" class="tab-pane fade show p-0">
                    <div class="row g-4">
                        <div class="col-lg-6">
                            <div class="menu-item d-flex align-items-center">
                                <img class="flex-shrink-0 img-fluid rounded-circle" src="img/menu-01.jpg" alt="">
                                <div class="w-100 d-flex flex-column text-start ps-4">
                                    <div class="d-flex justify-content-between border-bottom border-primary pb-2 mb-2">
                                        <h4>Argentinian</h4>
                                        <h4 class="text-primary">$90</h4>
                                    </div>
                                    <p class="mb-0">Consectetur adipiscing elit sed dwso eiusmod tempor incididunt ut labore.</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="menu-item d-flex align-items-center">
                                <img class="flex-shrink-0 img-fluid rounded-circle" src="img/menu-03.jpg" alt="">
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
                <div id="tab-8" class="tab-pane fade show p-0">
                    <div class="row g-4">
                        <div class="col-lg-6">
                            <div class="menu-item d-flex align-items-center">
                                <img class="flex-shrink-0 img-fluid rounded-circle" src="img/menu-01.jpg" alt="">
                                <div class="w-100 d-flex flex-column text-start ps-4">
                                    <div class="d-flex justify-content-between border-bottom border-primary pb-2 mb-2">
                                        <h4>Crispy water</h4>
                                        <h4 class="text-primary">$90</h4>
                                    </div>
                                    <p class="mb-0">Consectetur adipiscing elit sed dwso eiusmod tempor incididunt ut labore.</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="menu-item d-flex align-items-center">
                                <img class="flex-shrink-0 img-fluid rounded-circle" src="img/menu-02.jpg" alt="">
                                <div class="w-100 d-flex flex-column text-start ps-4">
                                    <div class="d-flex justify-content-between border-bottom border-primary pb-2 mb-2">
                                        <h4>Juice</h4>
                                        <h4 class="text-primary">$90</h4>
                                    </div>
                                    <p class="mb-0">Consectetur adipiscing elit sed dwso eiusmod tempor incididunt ut labore.</p>
                                </div>
                            </div>
                        </div>
                        
                    </div>
                </div>
                <div id="tab-9" class="tab-pane fade show p-0">
                    <div class="row g-4">
                        <div class="col-lg-6">
                            <div class="menu-item d-flex align-items-center">
                                <img class="flex-shrink-0 img-fluid rounded-circle" src="img/menu-06.jpg" alt="">
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
                                <img class="flex-shrink-0 img-fluid rounded-circle" src="img/menu-07.jpg" alt="">
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
                <div id="tab-10" class="tab-pane fade show p-0">
                    <div class="row g-4">
                        <div class="col-lg-6">
                            <div class="menu-item d-flex align-items-center">
                                <img class="flex-shrink-0 img-fluid rounded-circle" src="img/menu-06.jpg" alt="">
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
                                <img class="flex-shrink-0 img-fluid rounded-circle" src="img/menu-07.jpg" alt="">
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
                <div id="tab-11" class="tab-pane fade show p-0">
                    <div class="row g-4">
                        <div class="col-lg-6">
                            <div class="menu-item d-flex align-items-center">
                                <img class="flex-shrink-0 img-fluid rounded-circle" src="img/menu-06.jpg" alt="">
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
                                <img class="flex-shrink-0 img-fluid rounded-circle" src="img/menu-07.jpg" alt="">
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