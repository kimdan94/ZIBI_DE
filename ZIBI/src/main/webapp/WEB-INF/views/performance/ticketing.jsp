<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/selectLocation.js"></script>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<!-- 부트스트랩 시작 원래 5.3.2버전 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<!-- 부트스트랩 끝 -->


        <!-- Blog Start -->
        <div class="container-fluid blog py-6" style="padding:0 200px">
                <div class="text-center wow bounceInUp" data-wow-delay="0.1s">
                    <small class="d-inline-block fw-bold text-dark text-uppercase bg-light border border-primary rounded-pill px-4 py-1 mb-3">Our Blog</small>
                    <h1 class="display-5 mb-5">Be First Who Read News</h1>
                </div>
                <div class="row gx-4 justify-content-center">
                	<!-- -------------- 첫번째 : 영화관 위치 찾기 -------------- -->
                    <div class="col-md-6 col-lg-3 wow bounceInUp" data-wow-delay="0.1s">
                        <div class="blog-item">
                            <div class="blog-content mx-4 d-flex rounded bg-light">
                                <div class="text-dark bg-primary rounded-start">
                                    <div class="h-100 p-3 d-flex flex-column justify-content-center text-center">
                                        <p class="fw-bold mb-0">16</p>
                                        <p class="fw-bold mb-0">Sep</p>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="overflow-hidden rounded justify-content-center">
                            <!-- table > tbody > tr > td / > thead > tr > th -->

								<!-- 지역1 -->
                            	<table id="location1" style="float:left;">
                            	<thead>
                            		<tr>
                            			<th>지역1</th>
                            		</tr>
                            	</thead>
                            	<tbody>
	                            	<c:forEach var="cinema" items="${cinemaList}">
	                            	<tr>
										<td style="border:1px solid black;">${cinema.cinema_location1}</td>
									</tr>
									</c:forEach>
									
								</tbody>
                            	</table>
                            	
                            	
                            	<!-- 지역2 -->
                            	<table id="location2" style="float:left;">
	                            	<thead>
	                            		<tr>
	                            			<th>지역2</th>
	                            		</tr>
	                            	</thead>
	                            	<tbody>
	                            		<!-- ajax 값! -->
	                            	</tbody>
                            	</table>
                            	
                            </div>
                        </div>
                    </div>
                    <!-- -------------- 첫번째 : 영화관 위치 찾기 -------------- -->
                    
                    
                	<!-- -------------- 두번째 : 영화 선택 -------------- -->
                    <div class="col-md-6 col-lg-4 wow bounceInUp" data-wow-delay="0.3s">
                        <div class="blog-item">
                            
                            <div class="blog-content mx-4 d-flex rounded bg-light">
                                <div class="text-dark bg-primary rounded-start">
                                    <div class="h-100 p-3 d-flex flex-column justify-content-center text-center">
                                        <p class="fw-bold mb-0">16</p>
                                        <p class="fw-bold mb-0">Sep</p>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="overflow-hidden rounded">
                                <table style="float:left;">
                                <tbody id="ticketing_Ent">
                                	<!-- ajax -->
		                           	<c:forEach var="performance" items="${list}">
		                           	<tr class="ticketing-ent-row" id="${performance.performance_num}">
										<td class="ticketing-poster"><img id="ticketing-poster-img" src="${pageContext.request.contextPath}/upload/${performance.performance_poster}"></td>
										<td class="ticketing-info">${performance.performance_title}<br>${performance.performance_age}</td>
									</tr>
									</c:forEach>
								</tbody>
                            	</table>
                            </div>
                        </div>
                    </div>
                    <!-- -------------- 두번째 : 영화 선택 -------------- -->
                    
                    
                    
                	<!-- -------------- 세번째 : 날짜 선택 -------------- -->
                    <div class="col-md-6 col-lg-1 wow bounceInUp" data-wow-delay="0.5s">
                        <div class="blog-item">
                            
                             <div class="blog-content mx-4 d-flex rounded bg-light">
                                <div class="text-dark bg-primary rounded-start">
                                    <div class="h-100 p-3 d-flex flex-column justify-content-center text-center">
                                        <p class="fw-bold mb-0">16</p>
                                        <p class="fw-bold mb-0">Sep</p>
                                    </div>
                                </div>
                            </div>
                            <div class="overflow-hidden rounded">
								<div id="date_list" style="height:300px;overflow:scroll;width:110px;">
									<c:forEach var="day" items="${dayList}">
										<input type="button" value="${day.ticketing_date}">
									</c:forEach>
								</div>
                            </div>
                            
                        </div>
                    </div>
                    <!-- -------------- 세번째 : 날짜 선택 -------------- -->
                    
                    <!-- -------------- 네번째 : 최종 선택 -------------- -->
                    <div class="col-md-6 col-lg-4 wow bounceInUp" data-wow-delay="0.5s">
                        <div class="blog-item">
                            
                            <div class="blog-content mx-4 d-flex rounded bg-light">
                                <div class="text-dark bg-primary rounded-start">
                                    <div class="h-100 p-3 d-flex flex-column justify-content-center text-center">
                                        <p class="fw-bold mb-0">16</p>
                                        <p class="fw-bold mb-0">Sep</p>
                                    </div>
                                </div>
                            </div>
                            <!-- 최종 선택할 수 있는 영화 나옴 -->
                            <div class="overflow-hidden rounded" id="resultSelect">
								<!-- ajax -->
                            </div>
                            
                        </div>
                    </div>
                    <!-- -------------- 네번째 : 최종 선택 -------------- -->
                    
                    
                </div>
        </div>
        <!-- Blog End -->
        
<div id="newspan"></div>
  
<form action="updateTicketing" id="update_ticketing" method="post">
	<!-- 상영관 -->
	<input type="hidden" id="cinema_hidden" value=""/>
	<!-- 영화 -->
	<input type="hidden" id="performance_hidden" value=""/>
	<!-- 날짜 -->
	<input type="hidden" id="day_hidden" value="${today}"/><!-- 기본값 항상 있어야 함 -->
	<!-- 최종 선택 -->
	<input type="hidden" id="ent_hidden" value=""/>
	<input type="submit" value="예매하기">
</form>




