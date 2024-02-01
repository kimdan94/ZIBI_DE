<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 메인 바디 시작 -->
<div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
	<div class="carousel-indicators">
		<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
		<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 0"></button>
	</div>
	<div class="carousel-inner">
		<div class="carousel-item active " style="background: #f4faff;">
			<div class="cmain-content">
				<h2>1인 가구 정보를 여기서!</h2>
				<h1>ZIBI</h1>
				<h5>가장 핫한 플랫폼</h5>
				<small id="img_site">Image by jcomp on Freepik</small>
			</div>
			<div class="cmain-photo">
				<img src="${pageContext.request.contextPath}/images/na/main-photo2.jpg" height="500">
			</div>
		</div>
		<div class="carousel-item" style="background: #ededed;">
			<div class="cmain-photo">
				<img src="${pageContext.request.contextPath}/upload/${perf.performance_poster}" height="500">
			</div>
			<div class="cmain-content">
				<h1>
					<a href="${pageContext.request.contextPath}/performance/detail?performance_num=${perf.performance_num}">${perf.performance_title}</a>
				</h1>
				<h5>${perf.performance_content}</h5>
				<small>${perf.performance_start_date}</small>
			</div>
			
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
		<h5>ZIBI의 다양한 메뉴를 만나보세요!</h5>
		<div class="owl-carousel">
			<div class="bg-light rounded service-item">
				<div class="service-content d-flex justify-content-center p-4">
					<div class="service-content-icon text-center">
						<h4 class="mb-3">
							<a href="${pageContext.request.contextPath}/book/list">👥 모임 참여</a>
						</h4>
						<p class="mb-1">모임을 만들어 지비러들끼리 소통을 활성화하세요</p>
					</div>
				</div>
			</div>
			<div class="bg-light rounded service-item">
				<div class="service-content d-flex justify-content-center p-4">
					<div class="service-content-icon text-center">
						<h4 class="mb-3">
							<a href="${pageContext.request.contextPath}/performance/list">🎬 영화 감상</a>
						</h4>
						<p class="mb-1">지비러를 위한 영화를 특별한 가격으로 감상하세요</p>
					</div>
				</div>
			</div>
			<div class="bg-light rounded service-item">
				<div class="service-content d-flex justify-content-center p-4">
					<div class="service-content-icon text-center">
						<h4 class="mb-3">
							<a href="${pageContext.request.contextPath}/checklist/list">🏠 집 체크리스트</a>
						</h4>
						<p class="mb-1">집을 이사할 때 ZIBI의 체크리스트를 활용해보세요</p>
					</div>
				</div>
			</div>
			<div class="bg-light rounded service-item">
				<div class="service-content d-flex justify-content-center p-4">
					<div class="service-content-icon text-center">
						<h4 class="mb-3">
							<a href="${pageContext.request.contextPath}/secondhand/list">🤝 중고거래</a>
						</h4>
						<p class="mb-1">더이상 사용하지 않는 물품을 거래하세요</p>
					</div>
				</div>
			</div>
			<div class="bg-light rounded service-item">
				<div class="service-content d-flex  justify-content-center p-4">
					<div class="service-content-icon text-center">
						<h4 class="mb-3">
							<a href="${pageContext.request.contextPath}/helper/list">🙋 재능 기부</a>
						</h4>
						<p class="mb-1">나의 사소한 재능을 기부하세요</p>
					</div>
				</div>
			</div>
			<div class="bg-light rounded service-item">
				<div class="service-content d-flex justify-content-center p-4">
					<div class="service-content-icon text-center">
						<h4 class="mb-3">
							<a href="${pageContext.request.contextPath}/">ℹ️ 1인 가구 정보</a>
						</h4>
						<p class="mb-1">1인 가구 정보를 열람하세요</p>
					</div>
				</div>
			</div>
			<div class="bg-light rounded service-item">
				<div class="service-content d-flex justify-content-center p-4">
					<div class="service-content-icon text-center">
						<h4 class="mb-3">
							<a href="${pageContext.request.contextPath}/community/list">✍️ 커뮤니티</a>
						</h4>
						<p class="mb-1">지비러들끼리 간편하게 소통하세요</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<c:if test="${count>0}">
		<div class="main-content">
			<h5>최근 소식을 감상하세요!</h5>
			<div class="container-fluid team py-6">
				<div class="row g-4">
					<c:forEach var="content" items="${list}">
						<div class="col-lg-3 col-md-6">
							<div class="team-item rounded">
								<div class="team-img">
									<c:if test="${!empty content.photo}">
										<img class="img-fluid rounded" src="${pageContext.request.contextPath}/upload/${content.photo}" >
									</c:if>
									<c:if test="${empty content.photo}">
										<img class="img-fluid rounded" src="${pageContext.request.contextPath}/images/na/no-image.png">
									</c:if>
								</div>
								<div class="team-content text-center py-3 rounded-bottom">
									<h6 class="text-primary">
										<c:if test="${content.category==1}">
											<a href="${pageContext.request.contextPath}/book/detail?book_num=${content.num}" class="my-auto text-center">
												${content.title}
											</a>
										</c:if>
										<c:if test="${content.category==2}">
											<a href="${pageContext.request.contextPath}/helper/detail?helper_num=${content.num}" class="my-auto text-center">
												${content.title}
											</a>
										</c:if>
										<c:if test="${content.category==3}">
											<a href="${pageContext.request.contextPath}/community/detail?community_num=${content.num}" class="my-auto text-center">
												${content.title}
											</a>
										</c:if>
										<c:if test="${content.category==4}">
											<a href="${pageContext.request.contextPath}/secondhand/detail?sc_num=${content.num}" class="my-auto text-center">
												${content.title}
											</a>
										</c:if>
									</h6>
									<p class="mb-0">
										<c:if test="${content.category==1}">👥 소모임 예약</c:if>
										<c:if test="${content.category==2}">🙋 재능 기부</c:if>
										<c:if test="${content.category==3}">✍️ 커뮤니티</c:if>
										<c:if test="${content.category==4}">🤝 중고 거래</c:if>
									</p>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</c:if>
</div>
<c:if test="${!empty message}">
	<div class="wrap" id="mainModal">
		<div class="modal_box">
			<p>
				<img src="${pageContext.request.contextPath}/images/logo_mini.png">
				ZIBI와 함께 해주셔서 감사합니다<br>
				<c:if test="${message=='quitNaver'}">(네이버 연동은 사용자가 직접 해지하셔야 합니다)</c:if>
			</p>
			<div>
				<button class="btn mem-btn" id="cancel-btn" onclick="$('#mainModal').hide();">홈으로</button>
				<c:if test="${message=='quitNaver'}"><button class="btn mem-btn-green" onclick="location.href='https://nid.naver.com/'">네이버 연동 해지</button></c:if>
			</div>
		</div>
	</div>
</c:if>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/sample/lib/owlcarousel/owl.carousel.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/na/owlCarousel.js"></script>
<!-- 메인 바디 끝 -->