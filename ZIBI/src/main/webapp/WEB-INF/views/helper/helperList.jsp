<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix='c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 내용 시작 -->
<div>
	<h2>재능기부 게시판 목록</h2>
	<div class="align-right">
		<c:if test="${!empty user}">
		<input type="button" value="글쓰기" onclick="location.href='helperWrite'">
		</c:if>
	</div>
</div>