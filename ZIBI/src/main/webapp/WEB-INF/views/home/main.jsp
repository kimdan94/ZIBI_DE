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
	
	<div id="carouselExampleIndicators2" class="carousel slide" data-bs-ride="carousel">
		<div class="carousel-inner">
		
			<div class="carousel-item active">
			
				<div class="bg-light rounded service-item">
					<div class="service-content d-flex justify-content-center p-4">
						<div class="service-content-icon text-center">
							<h4 class="mb-3">
								<a href="${pageContext.request.contextPath}/book/list">모임 참여</a>
							</h4>
							<p class="mb-1">모임을 만들거나 참여하여<br>지비러들끼리 소통을 활성화하세요</p>
						</div>
					</div>
				</div>
			
			</div>
			<div class="carousel-item">
				
				
				
			</div>
			<div class="carousel-item">
				
				
				
			</div>
		</div>
		<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators2" data-bs-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span>
			<span class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators2" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span>
			<span class="visually-hidden">Next</span>
		</button>
	</div>
	

	<!--
	<div class="container-fluid service py-6">
		<div class="row g-4">
			<div class="col-lg-3 col-md-6 col-sm-12 wow bounceInUp" data-wow-delay="0.1s">
				<div class="bg-light rounded service-item">
					<div class="service-content d-flex justify-content-center p-4">
						<div class="service-content-icon text-center">
							<h4 class="mb-3">
								<a href="${pageContext.request.contextPath}/book/list">모임 참여</a>
							</h4>
							<p class="mb-1">모임을 만들거나 참여하여<br>지비러들끼리 소통을 활성화하세요</p>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-3 col-md-6 col-sm-12 wow bounceInUp" data-wow-delay="0.1s">
				<div class="bg-light rounded service-item">
					<div class="service-content d-flex justify-content-center p-4">
						<div class="service-content-icon text-center">
							<h4 class="mb-3">
								<a href="${pageContext.request.contextPath}/ent/list">영화 감상</a>
							</h4>
							<p class="mb-1">1인 가구를 위해 엄선된 영화를<br>특별한 가격으로 누려보세요</p>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-3 col-md-6 col-sm-12 wow bounceInUp" data-wow-delay="0.7s">
				<div class="bg-light rounded service-item">
					<div class="service-content d-flex justify-content-center p-4">
						<div class="service-content-icon text-center">
							<h4 class="mb-3">
								<a href="${pageContext.request.contextPath}/rental/list">물품 대여</a>
							</h4>
							<p class="mb-1">한 번만 사용할 물건들을<br>지비러에게서 빌려보세요</p>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-3 col-md-6 col-sm-12 wow bounceInUp" data-wow-delay="0.5s">
				<div class="bg-light rounded service-item">
					<div class="service-content d-flex justify-content-center p-4">
						<div class="service-content-icon text-center">
							<h4 class="mb-3">
								<a href="${pageContext.request.contextPath}/checklist/list">집 체크리스트</a>
							</h4>
							<p class="mb-1">집을 이사할 때<br>ZIBI의 체크리스트를 활용해보세요</p>
						</div>
					</div>
				</div>
			</div>

			<div class="col-lg-2 col-md-6 col-sm-12 wow bounceInUp" data-wow-delay="0.3s">
				<div class="bg-light rounded service-item">
					<div class="service-content d-flex justify-content-center p-4">
						<div class="service-content-icon text-center">
							<h4 class="mb-3">
								<a href="${pageContext.request.contextPath}/secondhand/list">중고거래</a>
							</h4>
							<p class="mb-1">더이상 사용하지 않는<br>물품을 거래하세요</p>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-3 col-md-6 col-sm-12 wow bounceInUp" data-wow-delay="0.7s">
				<div class="bg-light rounded service-item">
					<div class="service-content d-flex justify-content-center p-4">
						<div class="service-content-icon text-center">
							<h4 class="mb-3">
								<a href="${pageContext.request.contextPath}/contents/list">컬럼 구독</a>
							</h4>
							<p class="mb-1">지비러들과<br>유용한 정보를 주고받으세요</p>
						</div>
					</div>
				</div>
			</div>

			<div class="col-lg-2 col-md-6 col-sm-12 wow bounceInUp" data-wow-delay="0.5s">
				<div class="bg-light rounded service-item">
					<div class="service-content d-flex  justify-content-center p-4">
						<div class="service-content-icon text-center">
							<h4 class="mb-3">
								<a href="${pageContext.request.contextPath}/helper/list">재능 기부</a>
							</h4>
							<p class="mb-1">나의 사소한 재능을<br>기부하세요</p>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-3 col-md-6 col-sm-12 wow bounceInUp" data-wow-delay="0.7s">
				<div class="bg-light rounded service-item">
					<div class="service-content d-flex justify-content-center p-4">
						<div class="service-content-icon text-center">
							<h4 class="mb-3">
								<a href="${pageContext.request.contextPath}/">1인 가구 정보</a>
							</h4>
							<p class="mb-1">1인 가구 정보를<br>열람하세요</p>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-2 col-md-6 col-sm-12 wow bounceInUp" data-wow-delay="0.3s">
				<div class="bg-light rounded service-item">
					<div class="service-content d-flex justify-content-center p-4">
						<div class="service-content-icon text-center">
							<h4 class="mb-3">
								<a href="${pageContext.request.contextPath}/community/list">커뮤니티</a>
							</h4>
							<p class="mb-1">지비러들끼리<br>간편하게 소통하세요</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	 -->
</div>
<!-- 메인 바디 끝 -->