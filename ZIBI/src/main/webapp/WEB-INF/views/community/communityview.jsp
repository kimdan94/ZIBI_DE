<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- 내용 시작 -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/videoAdapter.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/community.fav.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/community.reply.js"></script>
<div class="container">
	<h2>${community.community_title}</h2>
	<ul class="detail-info">
		<li><img
			src="${pageContext.request.contextPath}/member/viewProfile?mem_num=${community.mem_num}"
			width="40" height="40" class="my-photo"></li>
		<li>${community.mem_nickname} <input type="button" value="팔로우"><br> <c:if
				test="${!empty community.community_modify_date}">
			최근 수정일 : ${community.community_modify_date}
			</c:if> <c:if test="${empty community.community_modify_date}">
			작성일 : ${community.community_reg_date}
			</c:if> 조회 : ${community.community_hit}
		</li>
	</ul>
	<hr>
	<c:if test="${!empty community.community_filename}">
		<ul>
			<li>첨부파일 : <a
				href="file?community_num=${community.community_num}">${community.community_filename}</a></li>
		</ul>
	</c:if>
	<hr size="1" width="100%">
	<c:if
		test="${fn:endsWith(community.community_filename,'.jpg') ||
				  fn:endsWith(community.community_filename,'.JPG') ||					
				  fn:endsWith(community.community_filename,'.jpeg') ||
				  fn:endsWith(community.community_filename,'.JPEG') ||
				  fn:endsWith(community.community_filename,'.gif') ||	
				  fn:endsWith(community.community_filename,'.GIF') ||
				  fn:endsWith(community.community_filename,'.png') ||
				  fn:endsWith(community.community_filename,'.PNG')}">
		<div class="align-center">
			<img
				src="${pageContext.request.contextPath}/upload/${community.community_filename}"
				class="detail-img">
		</div>
	</c:if>
	<div class="detail-content">${community.community_content}</div>
	<div>
		<%-- 좋아요 --%>
		<img id="output_fav" data-num="${community.community_num}"
			src="${pageContext.request.contextPath}/images/yeeun/co_fav.png"
			width="40"> <span id="output_fcount"></span>
		<%-- 댓글수 --%>
		<img id="output_reply" data-num="${community.community_num}"
			src="${pageContext.request.contextPath}/images/yeeun/co_reply.png"
			width="40"> <span id="output_rcount"></span>
	</div>
	<hr size="1" width="100%">
	<hr>
	<div class="align-right">
		<c:if test="${!empty user && user.mem_num == community.mem_num}">
			<input type="button" value="수정"
				onclick="location.href='update?community_num=${community.community_num}'">
			<input type="button" value="삭제" id="delete_btn">
			<script type="text/javascript">
				let delete_btn = document.getElementById('delete_btn');
				delete_btn.onclick = function() {
					let choice = confirm('삭제하시겠습니까?');
					if (choice) {
						location.href = 'delete?community_num=${community.community_num}';
					}
				};
			</script>
		</c:if>
		<input type="button" value="목록" onclick="location.href='list'">
	</div>
	<hr size="1" width="100%">
	<!-- 댓글 시작 -->
	<div id="reply_div">
		<span class="re-title">댓글 달기</span>
		<form id="re_form">
			<input type="hidden" name="community_num"
				value="${community.community_num}" id="community_num">

			<c:if test="${!empty user}">
				<div id="re_first">
					<span class="letter-count">300/300</span>
				</div>
				<textarea rows="3" cols="50" name="re_content" id="re_content"
					class="rep-content" placeholder="댓글을 남겨주세요."
					<c:if test="${empty user}">disabled="disabled"</c:if>=""><c:if
						test="${empty user}">로그인해야 작성할 수 있습니다.</c:if></textarea><input type="submit" value="전송">
			</c:if>
		</form>
	</div>
	<!-- 댓글 목록 출력 시작 -->
	<div id="output"></div>
	<div class="paging-button" style="display: none;">
		<input type="button" value="더보기">
	</div>
	<div id="loading" style="display: none;">
		<img src="${pageContext.request.contextPath}/images/yeeun/loading.gif"
			width="100" height="100">
	</div>
	<!-- 댓글 목록 출력 끝 -->
	<!-- 댓글 끝 -->
</div>
<!-- 내용 끝 -->