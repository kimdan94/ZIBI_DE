<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<h2>영화 list</h2>

<!-- 관리자 button -->
<%-- <c:if test="${count == 0}"> --%>
<input type="button" value="영화 form" onclick="location.href='write'"><!-- /ent/formPage -->
<input type="button" value="상영관 form" onclick="location.href='writeCinema'">
<%-- </c:if> --%>

<form action="list" method="get">
	<input type="search" name="keyword" id="keyword" value="${param.keyword}">
	<input type="submit" value="검색">
	<input type="button" value="목록" onclick="location.href='list'">
</form>

	

	
	
<!-- -----------------------------부트스트랩------------------------------- -->
<!-- Events Start -->
        <div class="container-fluid event py-6">
            <div class="container">
            	<!-- ------------------------------ -->
                <div class="text-center wow bounceInUp" data-wow-delay="0.1s">
                    <small class="d-inline-block fw-bold text-dark text-uppercase bg-light border border-primary rounded-pill px-4 py-1 mb-3">Latest Events</small>
                    <h1 class="display-5 mb-5">Our Social Professional Events Gallery</h1>
                </div>
                <!-- ------------------------------ -->
                <div class="tab-class text-center">
	                <!-- =================== 메뉴 시작 =================== -->
                    <ul class="nav nav-pills d-inline-flex justify-content-center mb-5 wow bounceInUp" data-wow-delay="0.1s">
                        <li class="nav-item p-2">
                            <a class="d-flex mx-2 py-2 border border-primary bg-light rounded-pill active" data-bs-toggle="pill" href="#tab-1">
                                <span class="text-dark" style="width: 150px;">All Events</span>
                            </a>
                        </li>
                        <li class="nav-item p-2">
                            <a class="d-flex py-2 mx-2 border border-primary bg-light rounded-pill" data-bs-toggle="pill" href="#tab-2">
                                <span class="text-dark" style="width: 150px;">Wedding</span>
                            </a>
                        </li>
                        <li class="nav-item p-2">
                            <a class="d-flex mx-2 py-2 border border-primary bg-light rounded-pill" data-bs-toggle="pill" href="#tab-3">
                                <span class="text-dark" style="width: 150px;">Corporate</span>
                            </a>
                        </li>
                        <li class="nav-item p-2">
                            <a class="d-flex mx-2 py-2 border border-primary bg-light rounded-pill" data-bs-toggle="pill" href="#tab-4">
                                <span class="text-dark" style="width: 150px;">Cocktail</span>
                            </a>
                        </li>
                        <li class="nav-item p-2">
                            <a class="d-flex mx-2 py-2 border border-primary bg-light rounded-pill" data-bs-toggle="pill" href="#tab-5">
                                <span class="text-dark" style="width: 150px;">Buffet</span>
                            </a>
                        </li>
                    </ul>
                    <!-- =================== 메뉴 끝 =================== -->
                    <!-- =================== 영화 시작 =================== -->
                    <div class="tab-content">
                        <div id="tab-1" class="tab-pane fade show p-0 active">
                            <div class="row g-4">
                                <div class="col-lg-12">
                                    <div class="row g-4">
                                    <!-- ====================================== 영화 반복문 돌리기 시작 ====================================== -->
                                    	<c:forEach var="performance" items="${list}" varStatus="status">
									
	                                	<!-- ============== 영화 시작 ============== -->
                                        <div class="col-md-6 col-lg-3 wow bounceInUp" data-wow-delay="0.3s">
                                            <div class="event-img position-relative">
                                                <img class="img-fluid rounded w-100" src="${pageContext.request.contextPath}/upload/${performance.performance_poster}" alt="">
                                                <div class="event-overlay d-flex flex-column p-4">
                                                    <h4 class="me-auto">Wedding</h4>
                                                    <input type="button" value="예매하기" onclick="location.href='ticketing?performance_num=${performance.performance_num}'">
                                                    <input type="button" value="영화 상세" onclick="location.href='detail?performance_num=${performance.performance_num}'">
                                                </div>
                                            </div>
                                            <div>${performance.performance_title}</div>
                                            <div>${performance.performance_start_date}</div>
                                            <div>${performance.performance_age}</div>
                                        </div>
                                        <!-- ============== 영화 끝 ============== -->
                                        
                                        </c:forEach>
                                    <!-- ====================================== 영화 반복문 돌리기 끝 ====================================== -->
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- =================== 영화 끝 =================== -->
                </div>
            </div>
        </div>
        <!-- Events End -->
        
        
        
        
        
        
    <!--     
    <c:if test="${count==0}">
	<div>표시할 게시물이 없습니다.</div>
	</c:if>
	<c:if test="${count>0}">
	<c:forEach var="performance" items="${list}" varStatus="status">
		${performance.performance_title}
		<img src="${pageContext.request.contextPath}/upload/${performance.performance_poster}">
		${performance.performance_content}
		${performance.performance_start_date}
		${performance.performance_age}
		${performance.performance_category}
	</c:forEach>
	</c:if>
	 -->
        