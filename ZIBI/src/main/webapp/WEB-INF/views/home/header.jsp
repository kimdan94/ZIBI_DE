<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 헤더 시작 -->
<div class="container-fluid nav-bar">
    <div class="container">
        <nav class="navbar navbar-light navbar-expand-lg py-4">
            <h1 class="text-primary fw-bold mb-0">
            	<a href="${pageContext.request.contextPath}/main/home" class="navbar-brand">로고삽입해라</a>
            </h1>
            <button class="navbar-toggler py-2 px-3" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                <span class="fa fa-bars text-primary"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarCollapse">
                <div class="navbar-nav mx-auto">
                    <a href="${pageContext.request.contextPath}/main/home" class="nav-item nav-link">메인</a>
                    <div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle active" data-bs-toggle="dropdown">득템찬스</a>
                        <div class="dropdown-menu bg-light">
                            <a href="${pageContext.request.contextPath}/rental/list" class="dropdown-item active">대여</a>
                            <a href="${pageContext.request.contextPath}/secondhand/list" class="dropdown-item">중고거래</a>
                            <a href="${pageContext.request.contextPath}/helper/list" class="dropdown-item">재능기부</a>
                        </div>
                    </div>
                     <div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle active" data-bs-toggle="dropdown">문화꿀팁</a>
                        <div class="dropdown-menu bg-light">
                            <a href="${pageContext.request.contextPath}/ent/list" class="dropdown-item active">예매</a>
                            <a href="${pageContext.request.contextPath}/book/list" class="dropdown-item">예약</a>
                            <a href="${pageContext.request.contextPath}/community/list" class="dropdown-item">커뮤니티</a>
                        </div>
                    </div>
                     <div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle active" data-bs-toggle="dropdown">척척박사</a>
                        <div class="dropdown-menu bg-light">
                            <a href="${pageContext.request.contextPath}/contents/list" class="dropdown-item active">컬럼 구독</a>
                            <a href="${pageContext.request.contextPath}/" class="dropdown-item">1인 가구 정보</a>
                            <a href="${pageContext.request.contextPath}/checklist/list" class="dropdown-item">집 체크리스트</a>
                        </div>
                    </div>
                    <a href="${pageContext.request.contextPath}/" class="nav-item nav-link">로그인/로그아웃</a>
                    <a href="${pageContext.request.contextPath}/" class="nav-item nav-link">회원가입/마이페이지/관리자페이지</a>
                    <a href="${pageContext.request.contextPath}/notice/list" class="nav-item nav-link">공지</a>
                </div>
                <button class="btn-search btn btn-primary btn-md-square me-4 rounded-circle d-none d-lg-inline-flex" data-bs-toggle="modal" data-bs-target="#searchModal"><i class="fas fa-search"></i></button>
                <a href="" class="btn btn-primary py-2 px-4 d-none d-xl-inline-block rounded-pill">Book Now</a>
            </div>
        </nav>
    </div>
</div>
<!-- 헤더 끝 -->
