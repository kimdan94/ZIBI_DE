<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link href="${pageContext.request.contextPath}/common/css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/yeeun.css" rel="stylesheet">
<!-- 내용 시작 -->
<style>
.fav-div{
 	float:left;
 	width:50%;
}
.social-div{
	float:left;
	width:50%;
	text-align:right;
}
</style>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/videoAdapter.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/community.fav.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/community.reply.js"></script>
<div class="container" style="width:1000px";>
	<h2>${community.community_title}</h2>
	<br>
	<ul class="detail-info">
		<li><img
			src="${pageContext.request.contextPath}/member/viewProfile?mem_num=${community.mem_num}"
			width="40" height="40" class="my-photo"></li>
		<li style="text-size:10pt;">${community.mem_nickname} <input type="button" value="팔로우"><br> <c:if
				test="${!empty community.community_modify_date}">
			최근 수정일 : ${community.community_modify_date}
			</c:if> <c:if test="${empty community.community_modify_date}">
			작성일 : ${community.community_reg_date}&nbsp;
			</c:if>조회 : ${community.community_hit}
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
	<div class="fav-div">
		<%-- 좋아요 --%>
		<img id="output_fav" data-num="${community.community_num}"
			src="${pageContext.request.contextPath}/images/yeeun/co_fav.png"
			width="40"> <span id="output_fcount"></span>
		<%-- 댓글수 --%>
		<img id="output_reply" data-num="${community.community_num}"
			src="${pageContext.request.contextPath}/images/yeeun/co_reply.jpg"
			width="40"> <span id="output_rcount"></span>
	</div>
	<!-- SNS share websites -->
	<script type="text/javascript" async>
		var url_default_ks = "https://story.kakao.com/share?url=";
		var url_default_fb = "https://www.facebook.com/sharer/sharer.php?u=";
		var url_default_tw_txt = "https://twitter.com/intent/tweet?text=";
		var url_default_tw_url = "&url=";
		var url_default_naver = "http://share.naver.com/web/shareView.nhn?url=";
		var title_default_naver = "&title=";
		var url_this_page = location.href;
		var title_this_page = document.title;
		var url_combine_ks = url_default_ks + url_this_page;
		var url_combine_fb = url_default_fb + url_this_page;
		var url_combine_tw = url_default_tw_txt + document.title
				+ url_default_tw_url + url_this_page;
		var url_combine_naver = url_default_naver + encodeURI(url_this_page)
				+ title_default_naver + encodeURI(title_this_page);
	</script>

	<!-- SNS share buttons -->
	<div class="social-div">
		<!-- Facebook share button -->
		<a href=""
			onclick="window.open(url_combine_fb, '', 'scrollbars=no, width=600, height=600'); return false;">
			<img src="../images/yeeun/facebook.png" title="페이스북으로 공유하기"
			class="sharebtn_custom" style="width: 32px;">&nbsp;
		</a>
		<!-- Twitter share button -->
		<a href=""
			onclick="window.open(url_combine_tw, '', 'scrollbars=no, width=600, height=600'); return false;">
			<img src="../images/yeeun/twitter.png" title="트위터로 공유하기"
			class="sharebtn_custom" style="width: 32px;">&nbsp;
		</a>
		<!-- Naver share button -->
		<a href=""
			onclick="window.open(url_combine_naver, '', 'scrollbars=no, width=600, height=600'); return false;">
			<img src="../images/yeeun/nav.png" title="네이버로 공유하기"
			class="sharebtn_custom" style="width: 32px;">&nbsp;
		</a>
		<!-- Kakao story share button -->
		<a href=""
			onclick="window.open(url_combine_ks, '', 'scrollbars=no, width=600, height=600'); return false;">
			<img src="../images/yeeun/kakao.png" title="카카오스토리로 공유하기"
			class="sharebtn_custom" style="width: 32px;">
		</a>
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
		<span class="re-title">댓글<span id="output_wcount"></span></span>
		<form id="re_form">
			<input type="hidden" name="community_num"
				value="${community.community_num}" id="community_num">
			<c:if test="${!empty user}">
				<div id="re_first">
					<span class="letter-count">300/300</span>
				</div>
				<textarea rows="3" cols="500" name="re_content" id="re_content"
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