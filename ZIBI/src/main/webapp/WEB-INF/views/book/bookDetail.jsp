<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 내용 시작 -->
<c:if test="${book.book_onoff == 2}">
	<script type="text/javascript">
		location.replace('list');
	</script>
</c:if>
<div class="container" id="book_detail">
	<div class="d-flex justify-content-center">
		<div class="rounded col-lg-10">
			<div class="text-center" style="margin-left:20px;">
				<c:if test="${book.book_category == 0}"><div style="background:#0f4b43;" class="book-first">취미 소모임</div></c:if>
                <c:if test="${book.book_category == 1}"><div style="background:#5eaf08;" class="book-first">원데이 클래스</div></c:if>
                <c:if test="${book.book_category == 2}"><div style="background:#486627;" class="book-first">스터디 모임</div></c:if>
			</div>
			<div style="float:left;">
				<c:if test="${empty book.book_thumbnailName}">
					<img class="book-thumb" src="${pageContext.request.contextPath}/images/jy/thumbnail_basic.png">
				</c:if>
				<c:if test="${!empty book.book_thumbnailName}">
					<img class="book-thumb" src="${pageContext.request.contextPath}/upload/${book.book_thumbnailName}">
				</c:if>
			</div>
			<table>
				<tr>
					<td class="match-guide">
						<c:if test="${book.book_match == 1}">
							<span>✅ 승인이 필요 없는 모임이에요!</span>
						</c:if>
						<c:if test="${book.book_match == 2}">
							<span>✅ 주최자의 승인이 필요한 모임이에요!</span>
						</c:if>
					</td>
				</tr>
				<tr>
					<td>
						<h4>${book.book_title} (${book.book_headcount}/${book.book_maxcount}명)</h4>
					</td>
				</tr>
				<tr>
					<td class="book-expense">
						<c:if test="${empty book.book_expense}">
							무료
						</c:if>
						<c:if test="${!empty book.book_expense}">
							<fmt:formatNumber value="${book.book_expense}"/>원
						</c:if>
					</td>
				</tr>	
				<tr class="book-profileArea">
					<td>
						<c:if test="${user.mem_num != book.mem_num}">
							<img class="book-profile" src="${pageContext.request.contextPath}/member/viewProfile?mem_num=${book.mem_num}">
							<span class="book-nick">${book.mem_nickname}</span>
						</c:if>
						<c:if test="${!empty user && user.mem_num == book.mem_num}">
							<input type="button" value="모집 완료하기" class="bookd-btn-green w-100"
								id="complete_btn" data-num="${book.book_num}">
						</c:if>
					</td>
				</tr>
			</table>
			<hr size="3" width="100%">
			<div>
				<span class="book-span">모임 후기</span>
				<br><br>
				<%-- 모임 후기 --%>
			</div>
			<hr size="3" width="100%">
			<div class="book-listDiv">
				<span class="book-span">모임 소개</span>
				<br><br>
				${book.book_content}
			</div>
			<hr size="3" width="100%">
			<div class="book-listDiv">
				<span class="book-span">모임 장소</span>
				<br><br>
				${book.book_address1} ${book.book_address2}
			</div>
			<div class="book-listDiv">
				<span class="book-span">모임 일정</span>
				<br><br>
				${book.book_gatheringDate}
			</div>
			<div class="book-listDiv">
				<span class="book-span">준비물</span>
				<br><br>
				<c:if test="${empty book.book_kit}">
					준비물 없음
				</c:if>
				<c:if test="${!empty book.book_kit}">
					${book.book_kit}
				</c:if>
			</div>
			<div class="align-center">
				<c:if test="${!empty user && user.mem_num == book.mem_num}">
					<input type="button" value="수정"
						onclick="location.href='update?book_num=${book.book_num}'"
						class="bookd-btn w-25">
					<input type="button" value="모임 취소"
						onclick="location.href='cancel?book_num=${book.book_num}'"
						class="bookd-btn-green w-25">	
				</c:if>
				<c:if test="${!empty user && user.mem_num != book.mem_num}">
					<input type="button" value="참여 신청하기" id="book_apply" 
						class="bookd-btn-green w-25">
				</c:if>
					<input type="button" value="목록으로" 
						onclick="location.href='list'" class="bookd-btn w-25">
			</div>
		</div>
	</div>
</div>
<%-- 참여 신청 폼(모달) --%>
<div id="bookApplyModal" style="display: none">
	<div class="modal_box">
		<div class="title-phrase2">
			이 모임에 참여할래요!
			<img src="${pageContext.request.contextPath}/images/jy/close.png" 
				id="close_btn" onclick="javascript:closeModalAction()">
		</div>
		<div class="applySub">
			참여 신청 모임
		</div>
		<hr size="3" noshade="noshade" width="100%">
		<ul>
			<li style="float:left;">
				<c:if test="${empty book.book_thumbnailName}">
					<img src="${pageContext.request.contextPath}/images/jy/thumbnail_basic.png">
				</c:if>
				<c:if test="${!empty book.book_thumbnailName}">
					<img src="${pageContext.request.contextPath}/upload/${book.book_thumbnailName}">
				</c:if>
			</li>
			<li class="applyTitle">
				${book.book_title}
			</li>
			<li>
				<span>✅ ${book.book_address1} ${book.book_address2}</span>
			</li>
			<li>
				<c:if test="${book.book_match == 1}">
					✅ 바로 승인/ 
				</c:if>
				<c:if test="${book.book_match == 2}">
					✅ 승인 필요/ 
				</c:if>
				<c:if test="${empty book.book_expense}">
					무료/ 
				</c:if>
				<c:if test="${!empty book.book_expense}">
					<fmt:formatNumber value="${book.book_expense}"/>원/  
				</c:if>
				<c:if test="${empty book.book_kit}">
					준비물 없음
				</c:if>
				<c:if test="${!empty book.book_kit}">
					${book.book_kit}
				</c:if>
			</li>
		</ul>
		<div class="applySub">
			신청자 정보
		</div>
		<hr size="3" noshade="noshade" width="100%">
			<div class="applyDiv">
				<label for="mem_name">이름</label>
				<input type="text" name="mem_name" autocomplete="off"
					id="mem_name" class="form-control" required/>
				<span id="nameValid" class="error-phrase"></span>
			</div>
			<div class="applyDiv2">	
				<label for="mem_email">이메일</label>
				<input type="email" name="mem_email" autocomplete="off"
					id="mem_email" class="form-control" required/>
				<span class="guide-phrase">*입력하신 이메일 주소로 신청 완료 메일이 전송됩니다. 실제 사용하고 계신 이메일을 기입해 주세요.</span>
				<br>
				<span id="emailValid" class="error-phrase"></span>
			</div>
			<div class="applyDiv">
				<label for="mem_phone">연락처</label>
				<input type="text" name="mem_phone" autocomplete="off"
					id="mem_phone" class="form-control" required/>
				<span id="phoneValid" class="error-phrase"></span>
			</div>
			<div>
				<label for="agree">개인 정보 수집에 동의합니다.</label>
				<input type="checkbox" id="agree" required>
				<br>
				<span id="agreeValid" class="error-phrase"></span>
			</div>
			<div style="margin-bottom:12px;">
				<label for="notify">참여를 원하는 모임의 안내사항을 전부 확인하였습니다.</label>
				<input type="checkbox" id="notify" required>
				<br>
				<span id="notifyValid" class="error-phrase"></span>
			</div>	
			<button id="apply_btn" class="default-btn" data-num="${book.book_num}" 
				data-apply="${user.mem_num}" data-state="${book.book_state}" 
				data-onoff="${book.book_onoff}" data-g="${book.book_gatheringDate}">참여하기</button>
			<img src="${pageContext.request.contextPath}/images/jy/loading.gif" id="apply_loading">		
	</div>
	<div class="modal-bg"></div>
</div>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jy/book.apply.js"></script>
<!-- 내용 끝 -->