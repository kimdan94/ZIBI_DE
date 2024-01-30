<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="container page-width">
	<div class="member-page">
		<div class="mypage-follow">
			<div class="row justify-content-center">
				<div class="col-4">
					<img src="${pageContext.request.contextPath}/sample/img/event-1.jpg">
				</div>
				<div class="col-3 align-self-center">
					<h5>홍길동</h5>
					<p>팔로워 3명</p>
				</div>
			</div>
			<div class="all-card">
				<%-- forEach 사용 --%>
					<div class="card">
						<img src="${pageContext.request.contextPath}/sample/img/event-1.jpg" class="card-img-top">
						<div class="card-body">
							<h5 class="card-title">바퀴벌레 잡아드립니다</h5>
							<p class="card-text">
								바퀴벌레 제가 잘잡습니다 진짭니다
							</p>
						</div>
					</div>
					
					<div class="card">
						<div class="card-body">
							<h5 class="card-title">치킨 맛있던데</h5>
							<p class="card-text">
								동래 112번지 그 집이요
							</p>
						</div>
					</div>
					
					<div class="card">
						<img src="${pageContext.request.contextPath}/sample/img/event-1.jpg" class="card-img-top">
						<div class="card-body">
							<h5 class="card-title">바퀴벌레 잡아드립니다</h5>
							<p class="card-text">
								바퀴벌레 제가 잘잡습니다 진짭니다
							</p>
						</div>
					</div>
					
					<div class="card">
						<div class="card-body">
							<h5 class="card-title">치킨 맛있던데</h5>
							<p class="card-text">
								동래 112번지 그 집이요
							</p>
						</div>
					</div>
					
					<div class="card">
						<img src="${pageContext.request.contextPath}/sample/img/event-1.jpg" class="card-img-top">
						<div class="card-body">
							<h5 class="card-title">바퀴벌레 잡아드립니다</h5>
							<p class="card-text">
								바퀴벌레 제가 잘잡습니다 진짭니다
							</p>
						</div>
					</div>
					
			</div>
		</div>
	</div>
</div>