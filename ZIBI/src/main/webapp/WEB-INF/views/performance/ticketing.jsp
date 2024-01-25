<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/selectLocation.js"></script>
<!-- 부트스트랩 시작 원래 5.3.2버전 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<!-- 부트스트랩 끝 -->

<form action="" method="post">

        <!-- Blog Start -->
        <div class="container-fluid blog py-6" style="padding:0 200px">
                <div class="text-center wow bounceInUp" data-wow-delay="0.1s">
                    <small class="d-inline-block fw-bold text-dark text-uppercase bg-light border border-primary rounded-pill px-4 py-1 mb-3">Our Blog</small>
                    <h1 class="display-5 mb-5">Be First Who Read News</h1>
                </div>
                <div class="row gx-4 justify-content-center">
                	<!-- -------------- 첫번째 : 영화관 위치 찾기 -------------- -->
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
                                <a href="#" class="h5 lh-base my-auto h-100 p-3">How to get more test in your food from</a>
                            </div>
                            
                            <div class="overflow-hidden rounded">
                                <table style="float:left;">
                                <tbody id="ticketing_Ent">
		                           	<c:forEach var="performance" items="${list}">
		                           	<tr id="${performance.performance_num}">
										<th><img src="${pageContext.request.contextPath}/upload/${performance.performance_poster}"></th>
										<th>${performance.performance_title}</th>
										<th>${performance.performance_age}</th>
									</tr>
									</c:forEach>
								</tbody>
                            	</table>
                            </div>
                        </div>
                    </div>
                    <!-- -------------- 두번째 : 영화 선택 -------------- -->
                    
                    
                    
                	<!-- -------------- 세번째 : 날짜 선택 -------------- -->
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
                    <!-- -------------- 세번째 : 날짜 선택 -------------- -->
                    
                    
                </div>
        </div>
        <!-- Blog End -->
        
  
</form>










<!-- 
${pageContext.request.contextPath}/upload/95fd7192-7f36-4a14-ba47-f7eb1eecae5d_movie_1.jpg
${pageContext.request.contextPath}/upload/55de25e2-945b-4c37-859c-29a98d098062_movie_2.jpg
 -->
        
<!-- Carousel 시작 날짜에 넣기!! -->
<!-- <div id="demo" class="carousel slide" data-bs-ride="carousel"> --><!-- 움직임 -->
<div id="demo" class="carousel slide"><!-- 안 움직임 -->
  
  <!-- The slideshow/carousel -->
  <div class="carousel-inner" style="width:500px;"><!-- width로 크기 조정해주깅 -->
    <div class="carousel-item active" style="width:500px;">
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
<!-- https://www.w3schools.com/bootstrap5/bootstrap_carousel.php Carousel -->

<br><br><br><br><br><br><br><br><br><br><br><br>

<div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
	<div class="carousel-indicators">
		<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
		<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
		<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
	</div>
	<div class="carousel-inner">
		<div class="carousel-item active">
			<img src="${pageContext.request.contextPath}/images/na/sample1.jpg" class="d-block">
		</div>
		<div class="carousel-item">
			<img src="${pageContext.request.contextPath}/images/na/sample2.jpg" class="d-block">
		</div>
		<div class="carousel-item">
			<img src="${pageContext.request.contextPath}/images/na/sample3.jpg" class="d-block">
		</div>
	</div>
	<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
		<span class="carousel-control-prev-icon" aria-hidden="true"></span>
		<span class="visually-hidden">Previous</span>
	</button>
	<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
		<span class="carousel-control-next-icon" aria-hidden="true"></span>
		<span class="visually-hidden">Next</span>
	</button>
</div>



<script src="${pageContext.request.contextPath}/sample/lib/owlcarousel/owl.carousel.min.js"></script>
<script type="text/javascript">
var owl = $('.owl-carousel');
owl.owlCarousel({
    loop:true,
    nav:true,
    margin:10,
    responsive:{
        0:{items:1},
        600:{items:3},            
        960:{items:5},
        1200:{items:6 }
    }
});
owl.on('mousewheel', '.owl-stage', function (e) {
    if (e.originalEvent.deltaY>0) {
        owl.trigger('next.owl');
    } else {
        owl.trigger('prev.owl');
    }
    e.preventDefault();
});
	
</script>
<!-- 메인 바디 끝 -->

