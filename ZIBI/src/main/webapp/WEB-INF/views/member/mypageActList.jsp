<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="member-page">
	<c:if test="${count==0}">
		<div class="justify-content-center no-data">
			ZIBI에서 활동한 내역이 없습니다 😟
		</div>
	</c:if>
	<c:if test="${count>0}">
		<div class="text-end mypage-category">
			<select id="category" class="selectbox" name="category">
				<option value="1" <c:if test="${param.category==1}">selected</c:if>>전체</option>
				<option value="2" <c:if test="${param.category==2}">selected</c:if>>커뮤니티</option>
				<option value="3" <c:if test="${param.category==3}">selected</c:if>>댓글</option>
				<option value="4" <c:if test="${param.category.substring(0,1)=='4'}">selected</c:if>>좋아요/스크랩</option><!-- 4로 시작하는 카테고리를 읽어옴 -->
				<option value="5" <c:if test="${param.category==5}">selected</c:if>>중고거래 찜</option>
			</select>
		</div>
		<div class="mypage-list text-center">
			<div class="row">
				<div class="col-3">카테고리</div>
				<div class="col-5">제목</div>
				<div class="col-4">일시</div>
			</div>
			<c:forEach var="act" items="${list}">
				<div class="row">
					<div class="col-3 text-center">
						<c:if test="${act.category==2}">커뮤니티</c:if>
						<c:if test="${act.category==3}">댓글</c:if>
						<c:if test="${act.subCategory==1}">커뮤니티 좋아요</c:if>
						<c:if test="${act.subCategory==2}">재능기부 스크랩</c:if>
						<c:if test="${act.subCategory==3}">소모임 스크랩</c:if>
					</div>
					<div class="col-5">
						<c:if test="${act.category==2}">
							<a href="${pageContext.request.contextPath}/community/detail?community_num=${act.num}">${act.title}</a>
						</c:if>
						<c:if test="${act.category==3}">
							<a href="${pageContext.request.contextPath}/community/detail?community_num=${act.num}">${act.title}</a>
						</c:if>
						<c:if test="${act.subCategory==1}">
							<a href="${pageContext.request.contextPath}/community/detail?community_num=${act.num}">${act.title}</a>
						</c:if>
						<c:if test="${act.subCategory==2}">
							<a href="${pageContext.request.contextPath}/helper/=${act.num}">${act.title}</a>
						</c:if>
						<c:if test="${act.subCategory==3}">
							<a href="${pageContext.request.contextPath}/book/=${act.num}">${act.title}</a>
						</c:if>
					</div>
					<div class="col-4 text-center">${act.reg_date}</div>
				</div>
			</c:forEach>
		</div>
		<div class="text-center">${page}</div>
	</c:if>
</div>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script>
	$('#act_btn').toggleClass("mem-btn");
	$('#act_btn').toggleClass("mem-btn-green");
	
	//카테고리 선택 이벤트
	$('#category').change(function(){
		if($(this).val()==5){
			location.href = '/secondhand/secondfavList';
		} else{
			location.href = 'mypageAct?category='+$('#category').val();
		}
	});//end of change
</script>