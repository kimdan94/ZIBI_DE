<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2b2c8d108f8ba3676d57626832ac387e&libraries=services"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/second.fav.js"></script>


<!-- About Satrt -->
<div class="container-fluid py-6">
    <div class="container">
        <div class="row g-5 align-items-center">
            <div class="col-lg-5 wow bounceInUp">
                <img src="${pageContext.request.contextPath}/upload/${second.sc_filename}" class="img-fluid rounded" alt="">
            </div>
            <div class="col-lg-7 wow bounceInUp">
                <small class="d-inline-block fw-bold text-dark text-uppercase bg-light border border-primary rounded-pill px-4 py-1 mb-3">About Us</small>
                <h1 class="display-5 mb-4">${second.sc_title}</h1>
                <p class="mb-4">${second.sc_price}원</p>
                
                <div class="row g-4 text-dark mb-5" style="border-top:2px solid #eeeeee;">
               			<!-- 칸 나누는 구역 -->
                	<div class="container-fluid" style="background-color: gray;">
				        <div class="row">
				            <!-- row 1 (total : 12) -->
				            <div class="col-4" style="background-color: #F8ECD1;">
				                <p>상품 상태</p>
				                <p><c:if test="${second.sc_status == 1}">중고</c:if>
				                	<c:if test="${second.sc_status == 2}">새 상품</c:if>
				                </p>
				            </div>
				            <div class="col-4" style="background-color: #DEB6AB;">
				                <p>거래 방법</p>
				                <p><c:if test="${second.sc_way == 1}">직거래</c:if>
				                   <c:if test="${second.sc_way == 2}">택배</c:if>
				                </p>
				            </div>
				            <div class="col-4" style="background-color: #AC7D88;">
				                <p>거래 지역</p>
				                <p>${second.sc_address}</p>
				            </div>
				         </div>
				    </div>
                </div>
                	<!-- 사용자가 없거나, 게시글 작성자가 아닐때   -->
               	<c:if test="${user.mem_num != second.mem_num}">
	                <!-- 찜 -->
	                <img id="output_fav" data-num="${second.sc_num}"
	                	src="${pageContext.request.contextPath}/images/jiwon/sc_fav.png">
	                <span id="output_fcount"></span>
	                <a href="${pageContext.request.contextPath}/secondchat/chatListForBuyer?sc_num=${second.sc_num}" class="btn btn-primary py-3 px-5 rounded-pill">채팅</a>
	                <a href="" class="btn btn-primary py-3 px-5 rounded-pill">바로 예약</a>
                </c:if>
                <c:if test="${!empty user && user.mem_num == second.mem_num}">
                <div class="row g-4 text-dark mb-5" style="border-top:2px solid #eeeeee;">
                	<div class="container-fluid" style="background-color: gray;">
				        <div class="row">
				            <!-- row 1 (total : 12) -->
				            <div class="col-4" style="background-color: #F8ECD1;">
				            	<a href="update?sc_num=${second.sc_num}">
					                <img src="${pageContext.request.contextPath}/images/jiwon/sc_modifylogo.png" 
					                	class="sc_modifylogo" width="30">
					                	<br>
					                <span>상품 수정</span>
				                </a>
				            </div>
				            <div class="col-4" id="" style="background-color: #DEB6AB;">
				            	<a href="#" onclick="">	
					            	<img src="${pageContext.request.contextPath}/images/jiwon/sc_status_modifylogo.png" 
					            		class="sc_status_modifylogo" width="30">
					            		<br>
					                <span>상태 변경</span>
				                </a>
				            </div>
				            <div class="col-4" style="background-color: #AC7D88;">
				            	<a href="#" onclick="">	
					            	<img src="${pageContext.request.contextPath}/images/jiwon/sc_deletelogo.png" 
					            		class="sc_deletelogo" width="30">
					                <span>상품 삭제</span>
				                </a>
				            </div>
				    	</div>
				    </div>
                </div>
                </c:if> 
            </div>
        </div>
    </div>
</div>
<!-- About End -->

<br><br>

<!-- About Satrt -->
<div class="container-fluid py-6">
    <div class="container" style="border-top:3px solid #eeeeee;">
        <div class="row g-5 align-items-center">
            
            <div class="col-lg-7 wow bounceInUp" data-wow-delay="0.3s">
                <small class="d-inline-block fw-bold text-dark text-uppercase bg-light border border-primary rounded-pill px-4 py-1 mb-3">About Us</small>
                <h1 class="display-5 mb-4">${second.sc_title}</h1>
                <p class="mb-4">${second.sc_content}</p>
                <div class="row g-4 text-dark mb-5">
                	
                    <div class="col-sm-6">
                        <i class="fas fa-share text-primary me-2"></i>Fresh and Fast food Delivery
                    </div>
                    <div class="col-sm-6">
                        <i class="fas fa-share text-primary me-2"></i>24/7 Customer Support
                    </div>
                    <div class="col-sm-6">
                        <i class="fas fa-share text-primary me-2"></i>Easy Customization Options
                    </div>
                    <div class="col-sm-6">
                        <i class="fas fa-share text-primary me-2"></i>Delicious Deals for Delicious Meals
                    </div>
                </div>
                <a href="" class="btn btn-primary py-3 px-5 rounded-pill">About Us<i class="fas fa-arrow-right ps-2"></i></a>
            </div>
            
            <div class="col-lg-5 wow bounceInUp" data-wow-delay="0.1s">
            <!-- 지도 수정 예정 -->
            	
            </div>
            
            
        </div>
    </div>
</div>
<!-- About End -->