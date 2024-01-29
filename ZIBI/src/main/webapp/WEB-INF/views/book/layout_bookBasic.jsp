<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title><tiles:getAsString name="tabtitle"/></title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/common.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/jy.css" rel="stylesheet">
	<style>@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap');</style>
	
	<%-- title 아이콘 변경 --%>
	<link rel="icon" href="${pageContext.request.contextPath}/images/logo_tab.png"/>
	<link rel="apple-touch-icon" href="${pageContext.request.contextPath}/images/logo_tab.png"/>
</head>
<body>
	<tiles:insertAttribute name="header"/>
	<div class="container-fluid nav-bar menu-title">
		<div class="container">
			<nav class="navbar navbar-expand-lg py-4">
				<div class="collapse navbar-collapse" id="navbarCollapse">
					<tiles:getAsString name="title"/>
				</div>
			</nav>
		</div>
	</div>
	<tiles:insertAttribute name="body"/>
	<tiles:insertAttribute name="footer"/>
	<a href="#" class="btn btn-light btn-md-square rounded-circle back-to-top">
		<img src="${pageContext.request.contextPath}/images/na/up_menu.png" width="15px">
	</a> 
</body>
</html>