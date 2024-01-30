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
	<div class="mypage-list text-center">
		<div class="row">
			<div class="col-2">활동 번호</div>
			<div class="col-3">카테고리</div>
			<div class="col-4">제목</div>
			<div class="col-3">일자</div>
		</div>
		
		<%-- forEach 사용 --%>
		<div class="row">
			<div class="col-2">5</div>
			<div class="col-3 ">커뮤니티</div>
			<div class="col-4">
				<a href="#">용감한 시민 보신 분?</a>
			</div>
			<div class="col-3">2024/01/21</div>
		</div>
		
	</div>
</div>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/na/mypageProfileImage.js"></script><!-- 프로필 사진 변경 -->
<script>
	$('#act_btn').toggleClass("mem-btn");
	$('#act_btn').toggleClass("mem-btn-green");
</script>