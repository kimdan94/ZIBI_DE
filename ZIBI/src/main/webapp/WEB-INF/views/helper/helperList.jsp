<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="${pageContext.request.contextPath}/css/de.css" rel="stylesheet">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/helper.solution.js"></script>
<!-- 내용 시작 -->
<div class="text-center">
	<ul class="nav nav-pills d-inline-flex justify-content-center mb-2">
		<li class="nav-item p-2">
		<a class="btn mem-btn-green radius border-width" 
			data-bs-toggle="pill" href="#" onclick="location.href='list?helper_select=1'"> <span class="text-dark" style="width: 150px;">헬프미</span></a>
		</li>
		<li class="nav-item p-2">
		<a class="btn mem-btn-green radius border-width"
			data-bs-toggle="pill" href="#" onclick="location.href='list?helper_select=2'"> <span class="text-dark" style="width: 150px;">헬프유</span></a>
		</li>
	</ul>
</div>
<div>
<div class="container-fluid contact py-6">
	<div class="d-flex justify-content-center">
		<div class="rounded col-md-4 col-lg-6">
	<div class="text-center">
	<ul class="nav nav-pills justify-content-center mb-3">
		<li class="nav-item p-2">
		<a class="d-flex py-2 mx-2 border bg-white rounded-pill"
			href="#" onclick="location.href='list?helper_select=${param.helper_select}'"> <span class="text-dark" style="width: 70px;">전체</span></a>
		</li>
		<li class="nav-item p-2">
		<a class="d-flex py-2 mx-2 border bg-white rounded-pill"
			href="#" onclick="location.href='list?helper_select=${param.helper_select}&helper_category=1'"> <span class="text-dark" style="width: 70px;">벌레</span></a>
		</li>
		<li class="nav-item p-2">
		<a class="d-flex py-2 mx-2 border bg-white rounded-pill"
			href="#" onclick="location.href='list?helper_select=${param.helper_select}&helper_category=2'"> <span class="text-dark" style="width: 70px;">조립</span></a>
		</li>
		<li class="nav-item p-2">
		<a class="d-flex py-2 mx-2 border bg-white rounded-pill"
			href="#" onclick="location.href='list?helper_select=${param.helper_select}&helper_category=3'"> <span class="text-dark" style="width: 70px;">수리</span></a>
		</li>
		<li class="nav-item p-2">
		<a class="d-flex py-2 mx-2 border bg-white rounded-pill"
			href="#" onclick="location.href='list?helper_select=${param.helper_select}&helper_category=4'"> <span class="text-dark" style="width: 70px;">소분</span></a>
		</li>
		<li class="nav-item p-2">
		<a class="d-flex py-2 mx-2 border bg-white rounded-pill"
			href="#" onclick="location.href='list?helper_select=${param.helper_select}&helper_category=5'"> <span class="text-dark" style="width: 70px;">기타</span></a>
		</li>
	</ul>
</div>
	<form action="list" id="search_form" method="get">
			<div class="margin-keyword">
				<select name="keyfield" id="keyfield" class="float-left border-color2">
					<option value="1" <c:if test="${param.keyfield==1}">selected</c:if>>제목</option>
					<option value="2" <c:if test="${param.keyfield==2}">selected</c:if>>내용</option>
					<option value="3" <c:if test="${param.keyfield==3}">selected</c:if>>주소</option>
					<option value="4" <c:if test="${param.keyfield==4}">selected</c:if>>제목+내용</option>
				</select>
			</div>
			<div class="align-center">
				<input type="search" name="keyword" id="keyword"
				class="w-50 form-control p-3 float-left margin border-keyword" value="${param.keyword}">
				<div class="float-right"><input type="image" src="../images/de/search.png" class="input-group-text p-3 search-size"></div>
			</div>
			<br>
			<div class="align-right">
			<c:if test="${!empty user}">
			<input type="button" value="글쓰기" onclick="location.href='write'"
			 	class="d-inline-block fw-bold text-dark text-uppercase bg-light border rounded-pill px-4 py-1 mb-1 float-rigth margin1">
			</c:if>
			<input type="button" value="목록으로" onclick="location.href='list'"
				class="d-inline-block fw-bold text-dark text-uppercase bg-light border rounded-pill px-4 py-1 mb-1 float-rigth margin">
			</div>	
			<br><br>
	<div class="float-rigth">
		<select id="order" name="order" class="align-center">
			<option value="1" <c:if test="${param.order==1}">selected</c:if>>최신순</option>
			<option value="2" <c:if test="${param.order==2}">selected</c:if>>조회수</option>
			<option value="3" <c:if test="${param.order==3}">selected</c:if>>스크랩</option>
		</select>
	</div>
	</form>
	<br><br>
	<c:if test="${count == 0}">
		<div class="result-display">표시할 게시물이 없습니다.</div>
	</c:if>
	<hr size="8" width="100%" class="hr-line">
	<c:if test="${count > 0}">
	<c:forEach var="helper" items="${list}">
			<div class="float-left margin-top2" style="font-size:20px;"> 
			<c:if test="${helper.helper_select == 1}"><div>헬프미</div></c:if>
			<c:if test="${helper.helper_select == 2}"><div>헬프유</div></c:if>
			<hr size="3" noshade="noshade" width="100%">
			<c:if test="${helper.helper_category ==  1}"><div>벌레</div></c:if>
			<c:if test="${helper.helper_category ==  2}"><div>조립</div></c:if>
			<c:if test="${helper.helper_category ==  3}"><div>수리</div></c:if>
			<c:if test="${helper.helper_category ==  4}"><div>소분</div></c:if>
			<c:if test="${helper.helper_category ==  5}"><div>기타</div></c:if>
			</div>        
			<div class="float-left1">
			<c:if test="${empty helper.helper_filename}">
			<img src="${pageContext.request.contextPath}/images/de/noimg.png"
			style="width:200px; height:200px; padding:10px;">
			</c:if>
			<c:if test="${!empty helper.helper_filename}">
			<img src="${pageContext.request.contextPath}/upload/${helper.helper_filename}"
			style="width:200px; height:200px; padding:10px;" class="radius">
			</c:if>
			</div>
			<div class="float-left2 align-center">
            <div class="align-center font-size1 margin-top2"><a href="detail?helper_num=${helper.helper_num}">${helper.helper_title}</a></div><br>
			<div class="align-center">${helper.helper_address1}</div><br>
			<div class="align-center">${helper.mem_nickname}</div><div class="align-center">
			${helper.helper_reg_date}</div>
			</div>
			<br>
			<hr size="3" noshade="noshade" width="100%"> 
</c:forEach>
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
		if(${!empty param.helper_category}){
			location.href='list?keyfield='+$('#keyfield').val()+'&keyword='+$('#keyword').val()+'&order='+$('#order').val()+'&helper_select=${param.helper_select}&helper_category=${param.helper_category}';
		}else{
			location.href='list?keyfield='+$('#keyfield').val()+'&keyword='+$('#keyword').val()+'&order='+$('#order').val();
		}
	});
	
});//end of function
</script>
<!-- 내용 끝 -->
