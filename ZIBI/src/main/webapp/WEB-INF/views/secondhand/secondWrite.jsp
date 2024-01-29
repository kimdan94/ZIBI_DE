<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/ckeditor.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/uploadAdapter.js"></script>
<script type="text/javascript">
    $(document).ready(function() {
        // Disable the "카테고리 선택" option
        $("#categorm_form option[value='']").prop("disabled", true);
    });
</script>


<div>
	<div class="d-flex justify-content-center">
		<div class="rounded sc-writeform col-md-4 col-lg-6">
			<form:form action="write" id="sc_write" modelAttribute="secondVO" enctype="multipart/form-data">
				<div>
					<form:label path="sc_title">제목</form:label>
					<form:input path="sc_title" class="w-100 form-control p-3" placeholder="제목"/>
					<form:errors path="sc_title" cssClass="error-color"/>
				</div>
				
				<div>
                    <form:label path="sc_category">카테고리</form:label>
                    <form:select path="sc_category" class="w-100 form-select p-3" id="categorm_form">
                    	<form:option value="0" disabled="disabled" label="카테고리 선택"/>
       					<form:option value="1" label="의류/액세서리" />
        				<form:option value="2" label="도서/티켓/문구" />
        				<form:option value="3" label="뷰티" />
   	 					<form:option value="4" label="전자기기" />
        				<form:option value="5" label="식품" />
        				<form:option value="6" label="기타" />
                    </form:select>
                </div>
				
				<div>
					<form:label path="sc_price">가격</form:label>
					<!-- <input type="number" id="sc_price" class="w-100 form-control p-3" placeholder="판매가격"> -->
					<%-- <form:input path="sc_price" class="w-100 form-control p-3" placeholder="판매가격"/> --%>
					<form:input path="sc_price" type="number" class="w-100 form-control p-3" placeholder="판매가격"/>
					<form:errors path="sc_price" cssClass="error-color"/>
				</div>
				<div>
					<form:label path="upload">썸네일 이미지</form:label>
					<br>
					<input type="file" name="upload" id="upload">
				</div>
				<div>
					<form:label path="sc_content">내용을 입력하세요</form:label>
					<form:textarea path="sc_content"/>
					<form:errors path="sc_content" cssClass="error-color"/>
					<script>
						function MyCustomUploadAdapterPlugin(editor){
							editor.plugins.get('FileRepository').createUploadAdapter = (loader) => {
								return new UploadAdapter(loader);
							}
						}
					
						ClassicEditor
							.create(document.querySelector('#sc_content'),{
								extraPlugins:[MyCustomUploadAdapterPlugin]
							})
							.then(editor => {
								window.editor = editor;
							})
							.catch(error => {
								console.error(error);
							});
					</script>
				</div>
			
				<div class="sc_status">
					<form:label path="sc_status">상품 상태</form:label>
					<br>
					<form:radiobutton path="sc_status" id="sc_status1" value="1"/><label for="sc_status1">중고</label>
					<form:radiobutton path="sc_status" id="sc_status2" value="2"/><label for="sc_status2">새상품</label>
				</div>
				<div class="sc_way">
					<form:label path="sc_way">거래 방법</form:label>
					<br>
					<form:radiobutton path="sc_way" id="sc_way1" value="1"/><label for="sc_way1">직거래</label>
					<form:radiobutton path="sc_way" id="sc_way2" value="2"/><label for="sc_way2">택배</label>
				</div>
				
				
				<form:button class="w-100 btn btn-light form-control p-3 rounded-pill">상품 등록</form:button>
			</form:form>

		</div>
	</div>
</div>