<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 메인 바디 시작 -->
<div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
	<div class="carousel-indicators">
		<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
		<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
		<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
	</div>
	<div class="carousel-inner"><%-- 대표글 링크 걸기 --%>
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
		<h5>ZIBI의 다양한 메뉴를 만나보세요 🤩</h5>
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
							<a href="${pageContext.request.contextPath}/performance/list">영화 감상</a>
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
	<div class="main-content">
		<h5>최근 소식을 감상하세요 😉</h5>
		<!-- Events Start -->
		<div class="container-fluid event py-6">
			<div id="tab-1" class="tab-pane fade show p-0">
				<div class="row g-4">
					<div class="col-lg-12">
						<div class="row g-4">

							<%-- 게시글 테이블 전체 조인 후 forEach로 돌리기 --%>
							<div class="col-md-6 col-lg-3 wow bounceInUp"
								data-wow-delay="0.1s">
								<div class="event-img position-relative">
									<img class="img-fluid rounded w-100" src="${pageContext.request.contextPath}/sample/img/event-1.jpg">
									<div class="event-overlay d-flex flex-column p-4">
										<p>#소모임 예약</p>
										<h4 class="me-auto">퍼스널 컬러 32차 모집</h4>
										<a href="img/event-1.jpg" data-lightbox="event-1"class="my-auto text-center">
											<img class="img-fluid rounded w-100" src="${pageContext.request.contextPath}/images/na/main_magnifier.png">
										</a>
										<span>안녕하세요~ 퍼스널컬러 전문가 단무지입니다. 금주에 갑자기 모집하는...</span>
									</div>
								</div>
							</div>
							<%-- 게시글 테이블 전체 조인 후 forEach로 돌리기 --%>

							<div class="col-md-6 col-lg-3 wow bounceInUp"
								data-wow-delay="0.3s">
								<div class="event-img position-relative">
									<img class="img-fluid rounded w-100" src="${pageContext.request.contextPath}/sample/img/event-2.jpg" alt="">
									<div class="event-overlay d-flex flex-column p-4">
										<h4 class="me-auto">외계인 2부</h4>
										<a href="img/event-2.jpg" data-lightbox="event-2"
											class="my-auto"> <img class="img-fluid rounded w-100"
											src="${pageContext.request.contextPath}/images/na/main_magnifier.png">
										</a>
									</div>
								</div>
							</div>
							<div class="col-md-6 col-lg-3 wow bounceInUp"
								data-wow-delay="0.5s">
								<div class="event-img position-relative">
									<img class="img-fluid rounded w-100"
										src="${pageContext.request.contextPath}/sample/img/event-3.jpg"
										alt="">
									<div class="event-overlay d-flex flex-column p-4">
										<h4 class="me-auto">망치 대여해드립니다</h4>
										<a href="img/event-3.jpg" data-lightbox="event-3"
											class="my-auto"> <img class="img-fluid rounded w-100"
											src="${pageContext.request.contextPath}/images/na/main_magnifier.png">
										</a>
									</div>
								</div>
							</div>
							<div class="col-md-6 col-lg-3 wow bounceInUp"
								data-wow-delay="0.7s">
								<div class="event-img position-relative">
									<img class="img-fluid rounded w-100"
										src="${pageContext.request.contextPath}/sample/img/event-4.jpg"
										alt="">
									<div class="event-overlay d-flex flex-column p-4">
										<h4 class="me-auto">닌텐도 팔아요</h4>
										<a href="img/event-4.jpg" data-lightbox="event-4"
											class="my-auto"> <img class="img-fluid rounded w-100"
											src="${pageContext.request.contextPath}/images/na/main_magnifier.png">
										</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<c:if test="${!empty message}">
	<div class="wrap" id="mainModal">
		<div class="modal_box">
			<p>
				<img src="${pageContext.request.contextPath}/images/logo_mini.png">
				ZIBI와 함께 해주셔서 감사합니다<br>
				<c:if test="${message=='quitNaver'}">(네이버 연동은 사용자가 직접 해지해야 합니다)</c:if>
			</p>
			<div>
				<button class="btn mem-btn" id="cancel-btn" onclick="$('#mainModal').hide();">홈으로</button>
				<c:if test="${message=='quitNaver'}"><button class="btn mem-btn-green" onclick="location.href='https://nid.naver.com/'">네이버 연동 해지</button></c:if>
			</div>
		</div>
	</div>
</c:if>
<c:if test="${!empty user && empty user.mem_name}">
	<div class="wrap" id="mainModal">
		<div class="modal_box">
			<p>
				<img src="${pageContext.request.contextPath}/images/logo_mini.png">
				추가 정보를 입력하시고 더 편하게 ZIBI를 즐기세요!
			</p>
			<div>
				<input type="button" class="btn mem-btn-green" value="추가 정보 입력" onclick="location.href='${pageContext.request.contextPath}/member/mypageUpdate'">
				<button class="btn mem-btn" id="cancel-btn" onclick="$('#mainModal').hide();">홈으로</button>
			</div>	
		</div>
	</div>
</c:if>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/sample/lib/owlcarousel/owl.carousel.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/na/owlCarousel.js"></script>
<!-- 메인 바디 끝 -->