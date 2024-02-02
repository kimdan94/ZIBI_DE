<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<div class="member-page policy-page">
	<h2>${district_name}</h2>
	<form:form action="policyModify" modelAttribute="policyVO">
		<div class="row">
			<input type="hidden" value="${district_num}">
			<div class="col-6">
				<p>위도</p>
				<form:input path="district_latitude" class="form-control"/>
				<form:errors path="district_latitude"/>
			</div>
			<div class="col-6">
				<p>경도</p>
				<form:input path="district_lonitude" class="form-control"/>
				<form:errors path="district_lonitude"/>
			</div>
		</div>
		<div class="row">
			<div class="col-12">
				<p>정책 사이트 URL</p>
				<form:input path="policy_url" class="form-control"/>
				<form:errors path="policy_url"/>
			</div>
		</div>
		<div class="row">
			<form:button class="btn mem-btn-green">수정</form:button>
		</div>
	</form:form>
</div>
<script type="text/javascript">
	$('#policy_btn').toggleClass("mem-btn");
	$('#policy_btn').toggleClass("mem-btn-green");
</script>