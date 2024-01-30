<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="openProfile">
	<div class="row justify-content-center">
		<div class="col-5">
			<img src="${pageContext.request.contextPath}/sample/img/event-1.jpg">
		</div>
		<div class="col-2 align-self-center">
			<input type="button" value="팔로우" class="btn mem-btn" id="follow_btn">
			<p>팔로워 <span id="follower"></span>명</p>
		</div>
	</div>

	<div class="row row-cols-1 row-cols-md-4">
	
		<%-- forEach 사용 --%>
			<div class="col">
				<div class="card">
					<img src="${pageContext.request.contextPath}/images/na/sample1.jpg" class="card-img-top">
					<div class="card-body">
						<h5 class="card-title">제목</h5>
						<p class="card-text">내용</p>
					</div>
					<div class="card-footer">
						<small class="text-muted">등록일</small>
					</div>
				</div>
			</div>
		<%-- forEach 사용 --%>
		
			<div class="col">
				<div class="card h-100">
					<img src="${pageContext.request.contextPath}/images/na/sample1.jpg" class="card-img-top">
					<div class="card-body">
						<h5 class="card-title">제목</h5>
						<p class="card-text">내용</p>
					</div>
					<div class="card-footer">
						<small class="text-muted">등록일</small>
					</div>
				</div>
			</div>
			<div class="col">
				<div class="card h-100">
					<img src="${pageContext.request.contextPath}/images/na/sample1.jpg" class="card-img-top">
					<div class="card-body">
						<h5 class="card-title">제목</h5>
						<p class="card-text">내용</p>
					</div>
					<div class="card-footer">
						<small class="text-muted">등록일</small>
					</div>
				</div>
			</div>
			<div class="col">
				<div class="card h-100">
					<img src="${pageContext.request.contextPath}/images/na/sample1.jpg" class="card-img-top">
					<div class="card-body">
						<h5 class="card-title">제목</h5>
						<p class="card-text">내용</p>
					</div>
					<div class="card-footer">
						<small class="text-muted">등록일</small>
					</div>
				</div>
			</div>
			<div class="col">
				<div class="card h-100">
					<img src="${pageContext.request.contextPath}/images/na/sample1.jpg" class="card-img-top">
					<div class="card-body">
						<h5 class="card-title">제목</h5>
						<p class="card-text">내용</p>
					</div>
					<div class="card-footer">
						<small class="text-muted">등록일</small>
					</div>
				</div>
			</div>
		
	</div>
</div>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/na/follow.js"></script>