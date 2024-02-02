<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<link href="${pageContext.request.contextPath}/css/yeeun.css" rel="stylesheet">   
<!-- 내용 시작 -->
<form>
<div class="align-center">리스트 보기</div>
<div style="border-bottom:1px solid black;height=5px;"></div>
<input type="button" value="전체" onclick="location.href='checkList.jsp'">&nbsp;<input type="button" value="내 리스트" onclick="location.href='checkMyList'">
<div style="border-bottom:1px solid black;height=5px;"></div>
<div class="page-main">
<br>

 	<input type="button" value="새로운 매물 체크 시작하기" onclick="location.href='checkWrite'">
</div>
</form>