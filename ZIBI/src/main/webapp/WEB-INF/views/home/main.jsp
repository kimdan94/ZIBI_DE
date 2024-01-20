<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 메인 바디 시작 -->
<div class="container-fluid event py-2">
    <div class="container">
    	<%-- 캐러셀 이미지 삽입 --%>
    	<div class="d-flex justify-content-center"><%-- 재정렬 필요 --%>
	    	<div class="site-content">
				<p><img src="${pageContext.request.contextPath}/images/logo_rec.png" width="90px"></p>
				<p>1인 가구를 위한 정보가 가득한 곳</p>
			</div>
		</div>
		<!-- 사이트 설명 시작 -->
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
		<!-- 사이트 설명 끝 -->
		<!-- 개별 카테고리 최신 글 시작 --><%-- 최신글 링크 걸기 --%>
		<div class="tab-class text-center">
            <div class="tab-content">
                <div id="tab-1" class="tab-pane fade show p-0 active">
                    <div class="row g-4">
                        <div class="col-lg-12">
                            <div class="row g-4">
                                <div class="col-md-6 col-lg-3 wow bounceInUp" data-wow-delay="0.1s">
                                    <div class="event-img position-relative">
                                        <img class="img-fluid rounded w-100" src="${pageContext.request.contextPath}/sample/img/event-1.jpg">
                                        <div class="event-overlay d-flex flex-column p-4">
                                            <h4 class="me-auto">닌텐도 양도합니다~!</h4>
                                            <a href="${pageContext.request.contextPath}/sample/img/event-1.jpg" data-lightbox="event-1" class="my-auto">
                                            	<img class="fas fa-search-plus text-dark fa-2x" width="30px" src="${pageContext.request.contextPath}/images/na/main_magnifier.png">
                                            </a>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6 col-lg-3 wow bounceInUp" data-wow-delay="0.3s">
                                    <div class="event-img position-relative">
                                        <img class="img-fluid rounded w-100" src="${pageContext.request.contextPath}/sample/img/event-2.jpg">
                                        <div class="event-overlay d-flex flex-column p-4">
                                            <h4 class="me-auto">전세 사기범이 잡혔다네요</h4>
                                            <a href="img/event-2.jpg" data-lightbox="event-2" class="my-auto">
                                            	<img class="fas fa-search-plus text-dark fa-2x" width="30px" src="${pageContext.request.contextPath}/images/na/main_magnifier.png">
                                            </a>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6 col-lg-3 wow bounceInUp" data-wow-delay="0.5s">
                                    <div class="event-img position-relative">
                                        <img class="img-fluid rounded w-100" src="${pageContext.request.contextPath}/sample/img/event-3.jpg">
                                        <div class="event-overlay d-flex flex-column p-4">
                                            <h4 class="me-auto">외계인 2</h4>
                                            <a href="img/event-3.jpg" data-lightbox="event-3" class="my-auto">
                                            	<img class="fas fa-search-plus text-dark fa-2x" width="30px" src="${pageContext.request.contextPath}/images/na/main_magnifier.png">
                                            </a>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6 col-lg-3 wow bounceInUp" data-wow-delay="0.7s">
                                    <div class="event-img position-relative">
                                        <img class="img-fluid rounded w-100" src="${pageContext.request.contextPath}/sample/img/event-4.jpg">
                                        <div class="event-overlay d-flex flex-column p-4">
                                            <h4 class="me-auto">퍼스널컬러 31차</h4>
                                            <a href="img/event-4.jpg" data-lightbox="event-4" class="my-auto">
                                            	<img class="fas fa-search-plus text-dark fa-2x" width="30px" src="${pageContext.request.contextPath}/images/na/main_magnifier.png">
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
        <!-- 개별 카테고리 최신 글 끝 -->
    </div>
</div>
<!-- 메인 바디 끝 -->