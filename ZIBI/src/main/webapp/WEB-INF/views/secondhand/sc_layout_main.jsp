<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ZIBI</title>
<link href="${pageContext.request.contextPath}/sample/lib/animate/animate.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/sample/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/na.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/jiwon.css" rel="stylesheet">
<tiles:insertAttribute name="css" ignore="true"/>
</head>
<body>
	<tiles:insertAttribute name="header"/>
	<tiles:insertAttribute name="body"/>
</body>
</html>