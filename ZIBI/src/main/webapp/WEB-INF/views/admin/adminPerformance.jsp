<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div>
	<input type="button" value="영화 form" onclick="location.href='write'"><!-- /performance/formPage -->
<input type="button" value="상영관 form" onclick="location.href='writeCinema'">
<input type="button" value="날짜 form" onclick="location.href='writePerformanceDate'">
</div>
<script type="text/javascript">
	$('#perf_btn').toggleClass("mem-btn");
	$('#perf_btn').toggleClass("mem-btn-green");
</script>