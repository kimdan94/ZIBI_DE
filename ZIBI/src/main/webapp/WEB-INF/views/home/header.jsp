<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 회원 메뉴 시작-->
<div class="container-fluid py-2" id="member_menu">
	<div class="container">
		<div class="row">
			<div class="col-md-12 my-auto text-end">
				<c:if test="${empty user}">
                	<a href="${pageContext.request.contextPath}/member/login">로그인</a>
				</c:if>
				<c:if test="${!empty user}">
					<a href="${pageContext.request.contextPath}/member/logout">로그아웃</a>
				</c:if>
				<c:if test="${empty user}">
					<a href="${pageContext.request.contextPath}/member/register">회원가입</a>
				</c:if>
				<c:if test="${!empty user && user.mem_auth!=9}">
					<a href="${pageContext.request.contextPath}/member/mypageMain">
						마이페이지
					</a>
				</c:if>
				<c:if test="${!empty user && user.mem_auth==9}">
					<a href="${pageContext.request.contextPath}/">관리자 페이지</a>
				</c:if>
				<a href="${pageContext.request.contextPath}/notice/list">고객센터</a>
            </div>
        </div>
    </div>
</div>
<!-- 회원 메뉴 끝-->
<!-- 헤더 시작 -->
<div class="container-fluid nav-bar">
	<div class="container">
        <nav class="navbar navbar-light navbar-expand-lg py-4">
           	<a href="${pageContext.request.contextPath}/main/home" class="navbar-brand">
           		<img id="main_logo" src="${pageContext.request.contextPath}/images/logo_rec.png" width="150px">
           	</a>
        </nav>
    </div>
</div>           
<div class="container-fluid nav-bar">
    <div class="container">
        <nav class="navbar navbar-light navbar-expand-lg py-2">
            <div class="collapse navbar-collapse justify-content-end" id="navbarCollapse">
                <div class="navbar-nav">
                    <div class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown">득템찬스</a>
                        <div class="dropdown-menu">
                            <a href="${pageContext.request.contextPath}/rental/list" class="dropdown-item">대여</a>
                            <a href="${pageContext.request.contextPath}/secondhand/list" class="dropdown-item">중고거래</a>
                            <a href="${pageContext.request.contextPath}/helper/list" class="dropdown-item">재능기부</a>
                        </div>
                    </div>
                     <div class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown">문화꿀팁</a>
                        <div class="dropdown-menu">
                            <a href="${pageContext.request.contextPath}/ent/list" class="dropdown-item">예매</a>
                            <a href="${pageContext.request.contextPath}/book/list" class="dropdown-item">예약</a>
                            <a href="${pageContext.request.contextPath}/community/list" class="dropdown-item">커뮤니티</a>
                        </div>
                    </div>
                     <div class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown">척척박사</a>
                        <div class="dropdown-menu">
                            <a href="${pageContext.request.contextPath}/contents/list" class="dropdown-item">컬럼 구독</a>
                            <a href="${pageContext.request.contextPath}/" class="dropdown-item">1인 가구 정보</a>
                            <a href="${pageContext.request.contextPath}/checklist/list" class="dropdown-item">집 체크리스트</a>
                        </div>
                    </div>
                </div>
            </div>
        </nav>
    </div>
</div>
<!-- 헤더 끝 -->
