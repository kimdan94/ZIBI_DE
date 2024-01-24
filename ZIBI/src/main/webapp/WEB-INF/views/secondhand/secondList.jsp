<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div> 
	<div class="scmain-btn">
	<button type="button" class="chat-btn" onclick="location.href='write'">
		<img src="${pageContext.request.contextPath}/images/jiwon/chat_icon.png" width="22px">
			<span class="chat-txt">채팅하기</span>
	</button>
	<button type="button" class="sell-btn" onclick="location.href='write'">
		<img src="${pageContext.request.contextPath}/images/jiwon/sc_writelogo.png" width="22px">
			<span class="sell-txt">판매하기</span>
	</button>
	<button type="button" class="sc-mypage-btn" onclick="location.href='write'">
		<img src="${pageContext.request.contextPath}/images/jiwon/second_mypage.png" width="22px">
			<span class="scmypage-txt">내 상점</span>
	</button>
	</div>
	<div>
		<form action="list" id="search_form" method="get">
			<ul class="search">
				<li><input type="search" name="keyword" id="keyword"
					value="${param.keyword}"></li>
				<li><input type="submit" value="찾기"> <input
					type="button" value="목록" onclick="location.href='list'"></li>
			</ul>
		</form>
		<c:if test="${count == 0}">
		<div class="result-display">표시할 게시물이 없습니다.</div>
		</c:if>
		<c:if test="${count > 0}">
		<div class="container-fluid service py-6">
    	    <div class="container">
            	<div class="text-center">
               		<small class="d-inline-block fw-bold text-dark text-uppercase bg-light border border-primary rounded-pill px-4 py-1 mb-3">Our Services</small>
                	<h1 class="display-5 mb-5">중고거래 인기상품</h1>
            	</div>
            	<div class="row g-4">
            		<c:forEach var="second" items="${list}">
                	<div class="col-lg-3 col-md-6 col-sm-12">
                    	<div class="bg-light rounded service-items">
                        	<div class="service-content d-flex align-items-center justify-content-center p-4">
                            	<div class="service-content-icon text-center" style="background:pink;">
                            		<a href="detail?sc_num=${second.sc_num}">
                                		<img src="${pageContext.request.contextPath}/upload/${second.sc_filename}" style="width:100%; height:180px;">
                                		<span class="mb-4">${second.sc_price}원</span>
                                		<br>
                                		<span class="mb-3">${second.sc_reg_date}</span><br>
                            		</a>
                            	</div>
                        	</div>
                    	</div>
                	</div>
                	</c:forEach>
                	<div class="float-clear align-center">${page}</div>
            	</div>
        	</div>
    	</div>
    	<!-- Service End -->
    	</c:if>
	</div>
</div>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(function(){
	//검색 유효성 체크
	$('#search_form').submit(function(){
		if($('#keyword').val().trim()==''){
			alert('검색어를 입력하세요!');
			$('#keyword').val('').focus();
			return false;
		}
	});//end of submit
	
	//정렬 기능 추가
});
</script>