<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 거래 후기 작성 폼 -->
<div class="container">
	<div class="d-flex justify-content-center">
		<div class="rounded col-md-4 col-lg-6">
			<form action="secondReview" id="second_review" method="post">
				<div class="review-title">
					${second.mem_nickname}님과 거래가 어떠셨나요?
				</div>
				<div class="review-txt1">매너를 평가해주세요!</div>
				<div class="review-txt2">1개 이상 선택해주세요.</div>
				
				<fieldset class="rate">
                    <input type="radio" id="rating10" name="rating" value="10"><label for="rating10" title="5점"></label>
                    <input type="radio" id="rating9" name="rating" value="9"><label class="half" for="rating9" title="4.5점"></label>
                    <input type="radio" id="rating8" name="rating" value="8"><label for="rating8" title="4점"></label>
                    <input type="radio" id="rating7" name="rating" value="7"><label class="half" for="rating7" title="3.5점"></label>
                    <input type="radio" id="rating6" name="rating" value="6"><label for="rating6" title="3점"></label>
                    <input type="radio" id="rating5" name="rating" value="5"><label class="half" for="rating5" title="2.5점"></label>
                    <input type="radio" id="rating4" name="rating" value="4"><label for="rating4" title="2점"></label>
                    <input type="radio" id="rating3" name="rating" value="3"><label class="half" for="rating3" title="1.5점"></label>
                    <input type="radio" id="rating2" name="rating" value="2"><label for="rating2" title="1점"></label>
                    <input type="radio" id="rating1" name="rating" value="1"><label class="half" for="rating1" title="0.5점"></label>
                </fieldset>
				
				
				
			<div class=" col-lg-9">
				<p class="mb-4">
					The contact form is currently inactive. Get a functional and
					working contact form with Ajax & PHP in a few minutes. Just copy
					and paste the files, add a little code and you're done. <a
						href="https://htmlcodex.com/contact-form">Download Now</a>.
				</p>
				
					<input type="text"
						class="w-100 form-control p-3 mb-4 border-primary bg-light"
						placeholder="Your Name"> <input type="email"
						class="w-100 form-control p-3 mb-4 border-primary bg-light"
						placeholder="Enter Your Email">
					<textarea
						class="w-100 form-control mb-4 p-3 border-primary bg-light"
						rows="4" cols="10" placeholder="Your Message"></textarea>
					<button
						class="w-100 btn btn-primary form-control p-3 border-primary bg-primary rounded-pill"
						type="submit">Submit Now</button>
				
			</div>
			</form>
		</div>
	</div>
</div>

<!-- Contact End -->