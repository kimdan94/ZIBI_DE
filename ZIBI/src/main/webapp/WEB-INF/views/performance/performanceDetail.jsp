<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<div class="container-fluid event py-6">
	<div class="container">
		<h2>영화 상세</h2>
		
		${performance.performance_title}
		<img class="img-fluid rounded" style="width:200px;" src="${pageContext.request.contextPath}/upload/${performance.performance_poster}" alt="">
		${performance.performance_content}
		${performance.performance_start_date}
		${performance.performance_age}


	</div>
</div>