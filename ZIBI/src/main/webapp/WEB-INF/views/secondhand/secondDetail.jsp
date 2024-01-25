<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2b2c8d108f8ba3676d57626832ac387e&libraries=services"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/second.fav.js"></script>


<!-- About Satrt -->
<div class="container-fluid py-6">
    
        <div class="row g-5 align-items-center">
            <div class="col-lg-5 wow bounceInUp">
                <img src="${pageContext.request.contextPath}/upload/${second.sc_filename}" class="img-fluid rounded" alt="">
            </div>
            <div class="col-lg-7 wow bounceInUp">
                <small class="d-inline-block fw-bold text-dark text-uppercase bg-light border border-primary rounded-pill px-4 py-1 mb-3">About Us</small>
                <h1 class="display-5 mb-4">${second.sc_title}</h1>
                <p class="mb-4">${second.sc_price}원</p>
                
                <div class="row g-4 text-dark mb-5">
               		
                
                
                	<!-- 
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
                     -->
                     
                     
                   
                     
                </div>
               
                	
            	
            </div>
        </div>
    </div>
</div>
<!-- About End -->

<br><br>

