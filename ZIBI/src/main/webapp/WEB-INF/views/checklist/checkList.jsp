<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<link href="${pageContext.request.contextPath}/css/yeeun.css" rel="stylesheet">   
<!-- 내용 시작 -->
<form>
<div class="align-center">
<h3>목록</h3>
</div>
<HR width="50%" align="center">
<div class="check_btn">
<input type="button" value="전체" class="check-btn-green w-25" onclick="location.href='checkList.jsp'">&nbsp;<input type="button" value="내 리스트" class="check-btn w-25" onclick="location.href='checkMyList'">
</div>
<HR width="50%" align="center">
<c:if test="${count == 0}">
<div class="result-display1">표시할 게시물이 없습니다.</div></c:if>
<c:if test="${count > 0}">
<div>


</div>
</c:if>
<input type="button" value="새로운 매물 체크 시작하기" class="btn  che-btn-green w-50" onclick="location.href='checkwrite'">
</form>
