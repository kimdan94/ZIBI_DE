<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript"	src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>

        <!-- 결제창 Start -->
        <div class="container-fluid blog py-6">
            <div class="container">
                <div class="text-center wow bounceInUp" data-wow-delay="0.1s">
                    <small class="d-inline-block fw-bold text-dark text-uppercase bg-light border border-primary rounded-pill px-4 py-1 mb-3">Our Blog</small>
                    <h1 class="display-5 mb-5">Be First Who Read News</h1>
                </div>
                <div class="row gx-4 justify-content-center">
                
                
                	<!-- 예매 정보 시작 -->
                    <div class="col-md-6 col-lg-4 wow" >
                        <div class="blog-item">
                            <div class="blog-content mx-4 d-flex rounded bg-light">
                                <div class="text-dark bg-primary rounded-start">
                                    <div class="h-100 p-3 d-flex flex-column justify-content-center text-center">
                                        <p class="fw-bold mb-0">16</p>
                                        <p class="fw-bold mb-0">Sep</p>
                                    </div>
                                </div>
                                <p class="h5 lh-base my-auto h-100 p-3">예매정보</p>
                            </div>
                            <div class="overflow-hidden rounded" style="background-color:pink; height:600px;">
                            	<p>제목 : ${payPerformance.performance_title}</p>
                            	<p><img class="img-fluid rounded" src="${pageContext.request.contextPath}/upload/${payPerformance.performance_poster}" alt="" style="width:150px;"></p>
                            	<p>연령 : ${payPerformance.performance_age}</p>
                            	<p>영화관 : ${payCinema.cinema_theater}</p>
                            	<p>일시 : ${payTicketing.ticketing_date} ${payTicketing.ticketing_start_time}</p>
                            	<p></p>
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
                                        <p class="fw-bold mb-0">16</p>
                                        <p class="fw-bold mb-0">Sep</p>
                                    </div>
                                </div>
                                <p class="h5 lh-base my-auto h-100 p-3">결제수단</p>
                            </div>
                            <div class="overflow-hidden rounded" style="background-color:pink; height:600px;">
                            asdf
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
                                        <p class="fw-bold mb-0">16</p>
                                        <p class="fw-bold mb-0">Sep</p>
                                    </div>
                                </div>
                                <p class="h5 lh-base my-auto h-100 p-3">결제하기</p>
                            </div>
                            <div class="overflow-hidden rounded" style="background-color:pink; height:600px;">
                            asdf
                            </div>
                        </div>
                    </div>
                    <!-- 결제하기 시작 -->
                    
                    
                </div>
            </div>
        </div>
        <!-- 결제창 End -->

