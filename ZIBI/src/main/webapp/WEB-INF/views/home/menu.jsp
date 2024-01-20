<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<header class="header-menu">
	<div class="container-fluid nav-bar menu-title">
		<div class="container">
			<nav class="navbar navbar-expand-lg py-4">
				<div class="collapse navbar-collapse" id="navbarCollapse">
					${pageName}
				</div>
				<div class="collapse navbar-collapse justify-content-end">
					홈 > ${pageName}
				</div>
			</nav>
		</div>
	</div>
</header>