<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link rel="icon" href="${pageContext.request.contextPath}/images/logo_tab.png"/>
<link rel="apple-touch-icon" href="${pageContext.request.contextPath}/images/logo_tab.png"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/helper.scrap.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/helper.solution.js"></script>
<!-- 내용 시작 -->
<div class="container-fluid contact py-6">
	<div class="d-flex justify-content-center">
		<div class="rounded login-form col-md-4 col-lg-6">
		<h2>글 상세</h2>
		<!-- 해결중,해결완료 토클 넣어야함 -->
		<div class="align-right">
		<c:if test="${!empty user}">
		<!-- 해결중&해결완료 토글 -->
		<div>
		<img id="output_solution" data-num="${helper.helper_num}" class="toggle"
			src="${pageContext.request.contextPath}/images/de/toggle1.png" width="50">
		<br>
		<span id="output_text">[해결 중]</span>
		</div>
		<input type="button" value="글수정" onclick="location.href='update?helper_num=${helper.helper_num}'">
		<input type="button" value="글삭제" onclick="location.href='delete?helper_num=${helper.helper_num}'">
		<input type="button" value="목록" onclick="location.href='list?helper_num=${helper.helper_num}'">
		</c:if>
		</div>
		<div>
		조회수 : ${helper.helper_hit}
		</div>
		<div>
		<c:if test="${empty helper.helper_filename}">
		<img src="${pageContext.request.contextPath}/images/de/noimg.png"
			style="width:500px; height:500px;" >
		</c:if>
		<c:if test="${!empty helper.helper_filename}">
		<img src="${pageContext.request.contextPath}/upload/${helper.helper_filename}"
			style="width:500px; height:500px;" >
		</c:if>
		</div>
		<div>
		<!-- 프로필 이미지 넣어야함 -->
			닉네임 : ${helper.mem_nickname}
			<br>
			<c:if test="${!empty helper.helper_modify_date}">
			최근 수정일 : ${helper.helper_modify_date}
			</c:if>
			<c:if test="${empty helper.helper_modify_date}">
			작성일 : ${helper.helper_reg_date}
			</c:if>
			조회수 : ${helper.helper_hit}
	</div>		
	<div>
		제목 : ${helper.helper_title}
	</div>
		
	<div>
		${helper.helper_content}
	</div>
	<!-- 지도 넣어야함 -->
	<div class="align-right">
		<c:if test="${!empty user}">
		<div>
		<!-- 스크랩 -->		
		<img id="output_scrap" data-num="${helper.helper_num}" 
			src="${pageContext.request.contextPath}/images/de/heart1.png" width="40">
		<!-- 스크랩 개수 -->
		<span id="output_scount"></span>	
	</div>
									<!-- 채팅 보류 -->
		<input type="button" value="채팅하기" onclick="location.href='talk?helper_num=${helper.helper_num}'">
		</c:if>
	</div>	
	
		
</div>
</div>
</div>


<!-- 내용 끝 -->