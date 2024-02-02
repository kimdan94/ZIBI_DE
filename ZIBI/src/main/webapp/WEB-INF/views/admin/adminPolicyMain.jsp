<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="member-page policy-main">
	<div class="text-end">
		
	</div>
	<div class="row text-center">
		<div class="col-1"></div>
		<div class="col-2">행정구역명</div>
		<div class="col-3">위도</div>
		<div class="col-3">경도</div>
		<div class="col-3">정책 사이트</div>
	</div>
	<div class="row text-center">
	
		<!-- foreach -->
		<div class="col-1">
			<a href="${pageContext.request.contextPath}/admin/policyModify?district_num=${policyVO.district_num}">수정</a>
		</div>
		<div class="col-1">${policyVO.district_name}</div>
		<div class="col-3">${policyVO.district_latitude}</div>
		<div class="col-3">${policyVO.district_lonitude}</div>
		<div class="col-4">
			<a href="">
				${policyVO.policy_url}
			</a>
		</div>
		
	</div>
</div>
<script type="text/javascript">
	$('#deal_btn').toggleClass("mem-btn");
	$('#deal_btn').toggleClass("mem-btn-green");
</script>