<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta content="width=device-width, initial-scale=1.0" name="viewport">
	<meta content="" name="keywords">
	<meta content="" name="description">
	<title>${pageName}</title>
	<style>@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap');</style>
	<!-- Icon Font Stylesheet -->
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"/>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">
	<!-- Libraries Stylesheet -->
	<link href="${pageContext.request.contextPath}/sample/lib/animate/animate.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/sample/lib/lightbox/css/lightbox.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/sample/lib/owlcarousel/owl.carousel.min.css" rel="stylesheet">
	<!-- Customized Bootstrap Stylesheet -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Template Stylesheet -->
	<link href="${pageContext.request.contextPath}/css/na.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/common.css" rel="stylesheet">
</head>
<body>
	<tiles:insertAttribute name="header"/>
	<tiles:insertAttribute name="menu"/>
	<tiles:insertAttribute name="body"/>
	<tiles:insertAttribute name="footer"/>
	<a href="#" class="btn btn-light btn-md-square rounded-circle back-to-top">
		<img src="${pageContext.request.contextPath}/images/na/up_menu.png" width="15px">
	</a> 
</body>
</html>