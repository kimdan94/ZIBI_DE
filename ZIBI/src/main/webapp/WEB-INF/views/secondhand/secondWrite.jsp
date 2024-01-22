<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/ckeditor.js"></script>
<script type="text/javascript">
    $(document).ready(function() {
        // Disable the "카테고리 선택" option
        $("#categorm_form option[value='']").prop("disabled", true);
    });
</script>

<div class="container">
	<div class="d-flex justify-content-center">
		<div class="rounded sc-writeform col-md-4 col-lg-6">
			<form:form action="write" id="sc_write" modelAttribute="secondVO">
				
				<div>
					<form:label path="sc_title">제목</form:label>
					<form:input path="sc_title" class="w-100 form-control p-3 mb-4" placeholder="제목"/>
				</div>
				
				<div>
                    <form:label path="sc_category">카테고리</form:label>
                    <form:select path="sc_category" class="w-100 form-select p-3 mb-4" id="categorm_form">
                    	<form:option value="" disabled="disabled" label="카테고리 선택"/>
       					<form:option value="1" label="의류/액세서리" />
        				<form:option value="2" label="도서/티켓/문구" />
        				<form:option value="3" label="뷰티" />
   	 					<form:option value="4" label="전자기기" />
        				<form:option value="5" label="식품" />
        				<form:option value="6" label="기타" />
                    </form:select>
                </div>
				
				
				<form:button class="w-100 btn btn-light form-control p-3 rounded-pill">상품 등록</form:button>
			</form:form>

		</div>
	</div>
</div>
