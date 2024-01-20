<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<header class="main-header">
	<!-- 추가 정보 입력 유도 시작 -->
	<c:if test="${!empty user && user.mem_name==null}">
		
	</c:if>
	<!-- 추가 정보 입력 유도 끝 -->
	<!-- 회원 메뉴 시작-->
	<div class="container-fluid py-2" id="member_menu">
		<div class="container">
			<div class="row">
				<div class="col-md-12 my-auto text-end">
					<c:if test="${empty user}">
						<img src="${pageContext.request.contextPath}/images/na/header_logout.png" width="15px">
						<a href="${pageContext.request.contextPath}/member/login">로그인</a>
					</c:if>
					<c:if test="${!empty user}">
						<a class="nickname-area">
							<img src="${pageContext.request.contextPath}/images/na/header_member.png" width="15px"> ${user.mem_nickname}님
						</a>
						<a href="${pageContext.request.contextPath}/member/logout">로그아웃</a>
					</c:if>
					<c:if test="${empty user}">
						<a href="${pageContext.request.contextPath}/member/register">회원가입</a>
					</c:if>
					<c:if test="${!empty user && user.mem_auth!=9}">
						<a href="${pageContext.request.contextPath}/member/mypageMain">마이페이지</a>
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
			<nav class="navbar navbar-expand-lg py-2">
				<div class="collapse navbar-collapse" id="navbarCollapse">
					<div class="navbar-nav">
						<a class="nav-link dropdown-toggle" href="${pageContext.request.contextPath}/main/home">메인</a>
						<div class="nav-item dropdown">
							<a class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
								득템찬스 <img src="${pageContext.request.contextPath}/images/na/header_menu.png" width="15px">
							</a>
							<div class="dropdown-menu">
								<a href="${pageContext.request.contextPath}/rental/list" class="dropdown-item">물품 대여</a> 
								<a href="${pageContext.request.contextPath}/secondhand/list" class="dropdown-item">중고거래</a> 
								<a href="${pageContext.request.contextPath}/helper/list" class="dropdown-item">재능기부</a>
							</div>
						</div>
						<div class="nav-item dropdown">
							<a class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
								문화꿀팁 <img src="${pageContext.request.contextPath}/images/na/header_menu.png" width="15px">
							</a>
							<div class="dropdown-menu">
								<a href="${pageContext.request.contextPath}/ent/list" class="dropdown-item">영화 예매</a> 
								<a href="${pageContext.request.contextPath}/book/list" class="dropdown-item">소모임 예약</a> 
								<a href="${pageContext.request.contextPath}/community/list" class="dropdown-item">커뮤니티</a>
							</div>
						</div>
						<div class="nav-item dropdown">
							<a class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
								척척박사 <img src="${pageContext.request.contextPath}/images/na/header_menu.png" width="15px">
							</a>
							<div class="dropdown-menu">
								<a href="${pageContext.request.contextPath}/contents/list" class="dropdown-item">컬럼 구독</a> 
								<a href="${pageContext.request.contextPath}/" class="dropdown-item">1인 가구 정보</a> 
								<a href="${pageContext.request.contextPath}/checklist/list" class="dropdown-item">집 체크리스트</a>
							</div>
						</div>
					</div>
				</div>
				<div class="collapse navbar-collapse justify-content-end">
					<div class="navbar-nav">
						<a href="${pageContext.request.contextPath}/main/home" class="navbar-brand">
							<img id="main_logo" src="${pageContext.request.contextPath}/images/logo_mini.png" width="40px">
						</a>
					</div>
				</div>
			</nav>
		</div>
	</div>
	<!-- 메뉴명 include -->
</header>
<!-- 헤더 끝 -->
