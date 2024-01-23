<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 부트스트랩 시작 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<!-- 부트스트랩 끝 -->


        <!-- Blog Start -->
        <div class="container-fluid blog py-6" style="padding:0 200px">
            <!-- <div class="container"> -->
                <div class="text-center wow bounceInUp" data-wow-delay="0.1s">
                    <small class="d-inline-block fw-bold text-dark text-uppercase bg-light border border-primary rounded-pill px-4 py-1 mb-3">Our Blog</small>
                    <h1 class="display-5 mb-5">Be First Who Read News</h1>
                </div>
                <div class="row gx-4 justify-content-center">
                	<!-- -------------- 첫번째 -------------- -->
                    <div class="col-md-6 col-lg-4 wow bounceInUp" data-wow-delay="0.1s">
                        <div class="blog-item">
                            <div class="blog-content mx-4 d-flex rounded bg-light">
                                <div class="text-dark bg-primary rounded-start">
                                    <div class="h-100 p-3 d-flex flex-column justify-content-center text-center">
                                        <p class="fw-bold mb-0">16</p>
                                        <p class="fw-bold mb-0">Sep</p>
                                    </div>
                                </div>
                                <a href="#" class="h5 lh-base my-auto h-100 p-3">How to get more test in your food from</a>
                            </div>
                            
                            <div class="overflow-hidden rounded justify-content-center">
                            	<table style="float:left;">
                            	<c:forEach var="cinema" items="${cinemaList}">
                            	<tr>
									<th>${cinema.cinema_location1}</th>
								</tr>
								</c:forEach>
                            	</table>
                            	<table style="float:left;">
                            	<c:forEach var="cinema" items="${cinemaList}">
                            	<tr>
									<th>${cinema.cinema_location1}</th>
								</tr>
								</c:forEach>
                            	</table>
                            
                            </div>
                            
                        </div>
                    </div>
                    
                    
                	<!-- -------------- 두번째 -------------- -->
                    <div class="col-md-6 col-lg-4 wow bounceInUp" data-wow-delay="0.3s">
                        <div class="blog-item">
                            
                            <div class="blog-content mx-4 d-flex rounded bg-light">
                                <div class="text-dark bg-primary rounded-start">
                                    <div class="h-100 p-3 d-flex flex-column justify-content-center text-center">
                                        <p class="fw-bold mb-0">16</p>
                                        <p class="fw-bold mb-0">Sep</p>
                                    </div>
                                </div>
                                <a href="#" class="h5 lh-base my-auto h-100 p-3">How to get more test in your food from</a>
                            </div>
                            
                            <div class="overflow-hidden rounded">
                                <table style="float:left;">
                            	<c:forEach var="performance" items="${list}">
                            	<tr>
									<th><img src="${pageContext.request.contextPath}/upload/${performance.performance_poster}"></th>
									<th>${performance.performance_title}</th>
									<th>${performance.performance_age}</th>
								</tr>
								</c:forEach>
                            	</table>
                            </div>
                            
                        </div>
                    </div>
                    
                    
                    
                	<!-- -------------- 세번째 -------------- -->
                    <div class="col-md-6 col-lg-4 wow bounceInUp" data-wow-delay="0.5s">
                        <div class="blog-item">
                            
                            <div class="blog-content mx-4 d-flex rounded bg-light">
                                <div class="text-dark bg-primary rounded-start">
                                    <div class="h-100 p-3 d-flex flex-column justify-content-center text-center">
                                        <p class="fw-bold mb-0">16</p>
                                        <p class="fw-bold mb-0">Sep</p>
                                    </div>
                                </div>
                                <a href="#" class="h5 lh-base my-auto h-100 p-3">How to get more test in your food from</a>
                            </div>
                            
                            <div class="overflow-hidden rounded">
                                <img src="img/blog-3.jpg" class="img-fluid w-100" alt="">
                            </div>
                            
                        </div>
                    </div>
                </div>
            <!-- </div> -->
        </div>
        <!-- Blog End -->
        
  
<!-- 
${pageContext.request.contextPath}/upload/95fd7192-7f36-4a14-ba47-f7eb1eecae5d_movie_1.jpg
${pageContext.request.contextPath}/upload/55de25e2-945b-4c37-859c-29a98d098062_movie_2.jpg
 -->
        
<!-- Carousel 시작 -->
<!-- <div id="demo" class="carousel slide" data-bs-ride="carousel"> --><!-- 움직임 -->
<div id="demo" class="carousel slide"><!-- 안 움직임 -->

  <!-- Indicators/dots -->
  <!-- <div class="carousel-indicators">
    <button type="button" data-bs-target="#demo" data-bs-slide-to="0" class="active"></button>
    <button type="button" data-bs-target="#demo" data-bs-slide-to="1"></button>
    <button type="button" data-bs-target="#demo" data-bs-slide-to="2"></button>
  </div> -->
  
  <!-- The slideshow/carousel -->
  <div class="carousel-inner" style="width:500px;"><!-- width로 크기 조정해주깅 -->
    <div class="carousel-item active" style="width:500px;">
      <%-- <img src="${pageContext.request.contextPath}/upload/55de25e2-945b-4c37-859c-29a98d098062_movie_2.jpg" alt="Los Angeles" class="d-block" style="width:500px;"> --%>
      <span style="width:100px;height:100px;color:red;border:solid">1 asdf</span>
      <span style="width:100px;height:100px;color:red;border:solid">2 asdf</span>
      <span style="width:100px;height:100px;color:red;border:solid">3 asdf</span>
      <span style="width:100px;height:100px;color:red;border:solid">4 asdf</span>
      <span style="width:100px;height:100px;color:red;border:solid">5 asdf</span>
      <span style="width:100px;height:100px;color:red;border:solid">6 asdf</span>
      <span style="width:100px;height:100px;color:red;border:solid">7 asdf</span>
      <span style="width:100px;height:100px;color:red;border:solid">8 asdf</span>
      <span style="width:100px;height:100px;color:red;border:solid">9 asdf</span>
    </div>
    <div class="carousel-item" style="width:500px;">
      <img src="${pageContext.request.contextPath}/upload/95fd7192-7f36-4a14-ba47-f7eb1eecae5d_movie_1.jpg" alt="Chicago" class="d-block" style="width:500px;">
    </div>
    <div class="carousel-item" style="width:500px;">
      <img src="${pageContext.request.contextPath}/upload/95fd7192-7f36-4a14-ba47-f7eb1eecae5d_movie_1.jpg" alt="New York" class="d-block" style="width:500px;">
    </div>
  </div>
  
  <!-- Left and right controls/icons -->
  <button class="" type="button" data-bs-target="#demo" data-bs-slide="prev"><!-- 위치 조정 -->
  <!-- <button class="carousel-control-prev" type="button" data-bs-target="#demo" data-bs-slide="prev"> -->
    <span class="carousel-control-prev-icon"></span>
  </button>
  <button class="" type="button" data-bs-target="#demo" data-bs-slide="next">
  <!-- <button class="carousel-control-next" type="button" data-bs-target="#demo" data-bs-slide="next"> -->
    <span class="carousel-control-next-icon"></span>
  </button>
</div>
<!-- Carousel 끝 -->

       