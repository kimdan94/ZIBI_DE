<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 메인 바디 시작 -->
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
<div class="container">
	<div class="main-content">
		<h5>ZIBI의 다양한 메뉴를 만나보세요</h5>
		<div class="owl-carousel">
			<div class="bg-light rounded service-item">
				<div class="service-content d-flex justify-content-center p-4">
					<div class="service-content-icon text-center">
						<h4 class="mb-3">
							<a href="${pageContext.request.contextPath}/book/list">모임 참여</a>
						</h4>
						<p class="mb-1">모임을 만들어 지비러들끼리 소통을 활성화하세요</p>
					</div>
				</div>
			</div>
			<div class="bg-light rounded service-item">
				<div class="service-content d-flex justify-content-center p-4">
					<div class="service-content-icon text-center">
						<h4 class="mb-3">
							<a href="${pageContext.request.contextPath}/ent/list">영화 감상</a>
						</h4>
						<p class="mb-1">지비러를 위한 영화를 특별한 가격으로 감상하세요</p>
					</div>
				</div>
			</div>
			<div class="bg-light rounded service-item">
				<div class="service-content d-flex justify-content-center p-4">
					<div class="service-content-icon text-center">
						<h4 class="mb-3">
							<a href="${pageContext.request.contextPath}/rental/list">물품 대여</a>
						</h4>
						<p class="mb-1">한 번만 사용할 물건들을 지비러에게서 빌려보세요</p>
					</div>
				</div>
			</div>
			<div class="bg-light rounded service-item">
				<div class="service-content d-flex justify-content-center p-4">
					<div class="service-content-icon text-center">
						<h4 class="mb-3">
							<a href="${pageContext.request.contextPath}/checklist/list">집 체크리스트</a>
						</h4>
						<p class="mb-1">집을 이사할 때 ZIBI의 체크리스트를 활용해보세요</p>
					</div>
				</div>
			</div>
			<div class="bg-light rounded service-item">
				<div class="service-content d-flex justify-content-center p-4">
					<div class="service-content-icon text-center">
						<h4 class="mb-3">
							<a href="${pageContext.request.contextPath}/secondhand/list">중고거래</a>
						</h4>
						<p class="mb-1">더이상 사용하지 않는 물품을 거래하세요</p>
					</div>
				</div>
			</div>
			<div class="bg-light rounded service-item">
				<div class="service-content d-flex justify-content-center p-4">
					<div class="service-content-icon text-center">
						<h4 class="mb-3">
							<a href="${pageContext.request.contextPath}/contents/list">컬럼 구독</a>
						</h4>
						<p class="mb-1">지비러들과 유용한 정보를 주고받으세요</p>
					</div>
				</div>
			</div>
			<div class="bg-light rounded service-item">
				<div class="service-content d-flex  justify-content-center p-4">
					<div class="service-content-icon text-center">
						<h4 class="mb-3">
							<a href="${pageContext.request.contextPath}/helper/list">재능 기부</a>
						</h4>
						<p class="mb-1">나의 사소한 재능을 기부하세요</p>
					</div>
				</div>
			</div>
			<div class="bg-light rounded service-item">
				<div class="service-content d-flex justify-content-center p-4">
					<div class="service-content-icon text-center">
						<h4 class="mb-3">
							<a href="${pageContext.request.contextPath}/">1인 가구 정보</a>
						</h4>
						<p class="mb-1">1인 가구 정보를 열람하세요</p>
					</div>
				</div>
			</div>
			<div class="bg-light rounded service-item">
				<div class="service-content d-flex justify-content-center p-4">
					<div class="service-content-icon text-center">
						<h4 class="mb-3">
							<a href="${pageContext.request.contextPath}/community/list">커뮤니티</a>
						</h4>
						<p class="mb-1">지비러들끼리 간편하게 소통하세요</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
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