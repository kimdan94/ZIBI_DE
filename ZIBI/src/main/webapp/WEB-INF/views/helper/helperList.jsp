<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="${pageContext.request.contextPath}/css/de.css" rel="stylesheet">
<!-- Icon Font Stylesheet -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"/>
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">
<!-- Template Stylesheet -->
<link href="${pageContext.request.contextPath}/css/na.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/common.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/layout.css" rel="stylesheet">
<!-- 내용 시작 -->
 <div class="tab-class text-center">
                    <ul class="nav nav-pills d-inline-flex justify-content-center mb-5 wow" data-wow-delay="0.1s">
                        <li class="nav-item p-2">
                            <a class="d-flex py-2 mx-2 border border-primary bg-white rounded-pill active" data-bs-toggle="pill">
                                <span class="text-dark" style="width: 150px;">벌레</span>
                            </a>
                        </li>
                        <li class="nav-item p-2">
                            <a class="d-flex py-2 mx-2 border border-primary bg-white rounded-pill" data-bs-toggle="pill">
                                <span class="text-dark" style="width: 150px;">조립</span>
                            </a>
                        </li>
                        <li class="nav-item p-2">
                            <a class="d-flex py-2 mx-2 border border-primary bg-white rounded-pill" data-bs-toggle="pill">
                                <span class="text-dark" style="width: 150px;">수리</span>
                            </a>
                        </li>
                        <li class="nav-item p-2">
                            <a class="d-flex py-2 mx-2 border border-primary bg-white rounded-pill" data-bs-toggle="pill">
                                <span class="text-dark" style="width: 150px;">소분</span>
                            </a>
                        </li>
                        <li class="nav-item p-2">
                            <a class="d-flex py-2 mx-2 border border-primary bg-white rounded-pill" data-bs-toggle="pill">
                                <span class="text-dark" style="width: 150px;">기타</span>
                            </a>
                        </li>
                    </ul>
</div>                    
<div>
<div class="container-fluid contact py-6">
	<div class="d-flex justify-content-center">
		<div class="rounded login-form col-md-4 col-lg-6">
	<h2 class="align-center">재능기부 게시판 목록</h2>
	<form action="list" id="search_form" method="get">
			<div>
				<select name="keyfield" id="keyfield">
					<option value="1" <c:if test="${param.keyfield==1}">selected</c:if>>제목</option>
					<option value="2" <c:if test="${param.keyfield==2}">selected</c:if>>내용</option>
					<option value="3" <c:if test="${param.keyfield==3}">selected</c:if>>주소</option>
					<option value="4" <c:if test="${param.keyfield==4}">selected</c:if>>제목+내용</option>
				</select>
			</div>
			<div>
				<input type="search" name="keyword" id="keyword"
				class="form-control bg-transparent p-2 helper-btn-size" value="${param.keyword}">
				<input type="submit" value="찾기" class="">
			</div>
			<div>
				
				<input type="button" value="목록" onclick="location.href='list'"> 
			</div>
	<div class="align-right">
		<select id="order" name="order">
			<option value="1" <c:if test="${param.order==1}">selected</c:if>>최신순</option>
			<option value="2" <c:if test="${param.order==2}">selected</c:if>>조회수</option>
			<option value="3" <c:if test="${param.order==3}">selected</c:if>>스크랩</option>
		</select>
		<c:if test="${!empty user}">
		<input type="button" value="글쓰기" onclick="location.href='write'">
		</c:if>
	</div>
	</form>
	<c:if test="${count == 0}">
		<div class="result-display">표시할 게시물이 없습니다.</div>
	</c:if>
	<c:if test="${count > 0}">
	<c:forEach var="helper" items="${list}">
            <div class="align-center">${helper.helper_title}</div>
			<div class="align-center"><a href="detail?helper_num=${helper.helper_num}">${helper.helper_address1}</a></div>
			<div class="align-center">${helper.mem_nickname}</div>
			<div class="align-center">${helper.helper_reg_date}</div>
			<div>
			<c:if test="${helper.helper_category ==  1}"><div>벌레</div></c:if>
			<c:if test="${helper.helper_category ==  2}"><div>조립</div></c:if>
			<c:if test="${helper.helper_category ==  3}"><div>수리</div></c:if>
			<c:if test="${helper.helper_category ==  4}"><div>소분</div></c:if>
			<c:if test="${helper.helper_category ==  5}"><div>기타</div></c:if>
			</div>        
</c:forEach>
	<table class="striped-table">
		<tr>
			<th>글 제목</th>
			<th>지역</th>
			<th>작성자</th>
			<th>등록일</th>
			<th>카테고리</th>
		</tr>
		<c:forEach var="helper" items="${list}">
			<tr>
			<td class="align-center">${helper.helper_title}</td>
			<td class="align-center"><a href="detail?helper_num=${helper.helper_num}">${helper.helper_address1}</a></td>
			<td class="align-center">${helper.mem_nickname}</td>
			<td class="align-center">${helper.helper_reg_date}</td>
			<td class="align-center">
			<c:if test="${helper.helper_category ==  1}"><div>벌레</div></c:if>
			<c:if test="${helper.helper_category ==  2}"><div>조립</div></c:if>
			<c:if test="${helper.helper_category ==  3}"><div>수리</div></c:if>
			<c:if test="${helper.helper_category ==  4}"><div>소분</div></c:if>
			<c:if test="${helper.helper_category ==  5}"><div>기타</div></c:if>
			</td>
		</tr>
		</c:forEach>
	</table>
	<div class="align-center">${page}</div>
	</c:if>
</div>
</div>
</div>
</div>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(function(){
	//검색 유효성 체크
	$('#search_form').submit(function(){
		if($('#keyword').val().trim()==''){
			alert('검색어를 입력하세요!');
			$('#keyword').val('').focus();
			return false;
		}
	});//end of submit
	
	//정렬 선택
	$('#order').change(function(){					//여러개 연결할 땐 &로 연결
		location.href='list?keyfield='+$('#keyfield').val()+'&keyword='+$('#keyword').val()+'&order='+$('#order').val();
	});
	
});//end of function
</script>
<!-- 내용 끝 -->

























