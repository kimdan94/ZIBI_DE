<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="member-page">
	<div class="text-end mypage-category">
		<select id="order" name="order">
			<option value="1" <c:if test="${param.order==1}">selected</c:if>>커뮤니티</option>
			<option value="2" <c:if test="${param.order==2}">selected</c:if>>댓글</option>
			<option value="3" <c:if test="${param.order==3}">selected</c:if>>찜</option>
			<option value="4" <c:if test="${param.order==4}">selected</c:if>>좋아요</option>
			<option value="5" <c:if test="${param.order==5}">selected</c:if>>스크랩</option>
			<option value="6" <c:if test="${param.order==6}">selected</c:if>>직접 문의</option>
		</select>
	</div>
	<div class="mypage-follow">
	
		<%-- forEach 사용 --%>
			<div class="row justify-content-center">
				<div class="col-5">
					<img src="${pageContext.request.contextPath}/sample/img/event-1.jpg">
				</div>
				<div class="col-7">
					<span>
						<a href="#">🗣️단무지</a>
					</span>
					<h5>
						<a href="#">고기 무료 나눔</a>
					</h5>
					<p>고기를 받았는데 다 못 먹을 것 같아서...</p>
				</div>
			</div>
		
	</div>
</div>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/na/mypageProfileImage.js"></script><!-- 프로필 사진 변경 -->
<script>
	$('#follow_btn').toggleClass("mem-btn");
	$('#follow_btn').toggleClass("mem-btn-green");
</script>