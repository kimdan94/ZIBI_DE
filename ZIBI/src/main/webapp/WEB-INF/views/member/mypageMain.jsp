<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="container mypageMain">
	<div class="row">
		<div class="col-6 event text-center">
			<div id="tab-1" class="tab-pane fade show p-0 active">
				<div class="event-img position-relative">
					<img class="my-photo img-fluid" src="${pageContext.request.contextPath}/member/photoView" width="400" height="400">
					<div class="event-overlay d-flex flex-column p-4">
						<a data-lightbox="event-1" class="my-auto" id="photo_btn">프로필 사진 수정</a>
					</div>
				</div>
				<div id="photo_choice" style="display: none;">
					<input type="file" id="upload" accept="image/gif,image/png,image/jpeg">
					<input type="button" value="변경" id="photo_submit">
					<input type="button" value="취소" id="photo_reset">
				</div>
				<input type="button" value="나의 오픈 프로필" onclick="location.herf='${pageContext.request.contextPath}/member/'">
			</div>
		</div>
		
		
<!-- Menu Start -->
        <div class="container-fluid menu bg-light py-6 my-6">
            <div class="container">
                <div class="tab-class text-center">
                    <div class="tab-content">
                        <div id="tab-6" class="tab-pane fade show p-0 active">
                            <div class="row g-4">
                                <div class="col-lg-6 wow bounceInUp" data-wow-delay="0.1s">
                                    <div class="menu-item d-flex align-items-center">
                                        <img class="flex-shrink-0 img-fluid rounded-circle" src="img/menu-01.jpg" alt="">
                                        <div class="w-100 d-flex flex-column text-start ps-4">
                                            <div class="d-flex justify-content-between border-bottom border-primary pb-2 mb-2">
                                                <h4>Paneer</h4>
                                                <h4 class="text-primary">$90</h4>
                                            </div>
                                            <p class="mb-0">Consectetur adipiscing elit sed dwso eiusmod tempor incididunt ut labore.</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-6 wow bounceInUp" data-wow-delay="0.2s">
                                    <div class="menu-item d-flex align-items-center">
                                        <img class="flex-shrink-0 img-fluid rounded-circle" src="img/menu-02.jpg" alt="">
                                        <div class="w-100 d-flex flex-column text-start ps-4">
                                            <div class="d-flex justify-content-between border-bottom border-primary pb-2 mb-2">
                                                <h4>Sweet Potato</h4>
                                                <h4 class="text-primary">$90</h4>
                                            </div>
                                            <p class="mb-0">Consectetur adipiscing elit sed dwso eiusmod tempor incididunt ut labore.</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-6 wow bounceInUp" data-wow-delay="0.3s">
                                    <div class="menu-item d-flex align-items-center">
                                        <img class="flex-shrink-0 img-fluid rounded-circle" src="img/menu-03.jpg" alt="">
                                        <div class="w-100 d-flex flex-column text-start ps-4">
                                            <div class="d-flex justify-content-between border-bottom border-primary pb-2 mb-2">
                                                <h4>Sabudana Tikki</h4>
                                                <h4 class="text-primary">$90</h4>
                                            </div>
                                            <p class="mb-0">Consectetur adipiscing elit sed dwso eiusmod tempor incididunt ut labore.</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-6 wow bounceInUp" data-wow-delay="0.4s">
                                    <div class="menu-item d-flex align-items-center">
                                        <img class="flex-shrink-0 img-fluid rounded-circle" src="img/menu-04.jpg" alt="">
                                        <div class="w-100 d-flex flex-column text-start ps-4">
                                            <div class="d-flex justify-content-between border-bottom border-primary pb-2 mb-2">
                                                <h4>Pizza</h4>
                                                <h4 class="text-primary">$90</h4>
                                            </div>
                                            <p class="mb-0">Consectetur adipiscing elit sed dwso eiusmod tempor incididunt ut labore.</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-6 wow bounceInUp" data-wow-delay="0.5s">
                                    <div class="menu-item d-flex align-items-center">
                                        <img class="flex-shrink-0 img-fluid rounded-circle" src="img/menu-05.jpg" alt="">
                                        <div class="w-100 d-flex flex-column text-start ps-4">
                                            <div class="d-flex justify-content-between border-bottom border-primary pb-2 mb-2">
                                                <h4>Bacon</h4>
                                                <h4 class="text-primary">$90</h4>
                                            </div>
                                            <p class="mb-0">Consectetur adipiscing elit sed dwso eiusmod tempor incididunt ut labore.</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-6 wow bounceInUp" data-wow-delay="0.6s">
                                    <div class="menu-item d-flex align-items-center">
                                        <img class="flex-shrink-0 img-fluid rounded-circle" src="img/menu-06.jpg" alt="">
                                        <div class="w-100 d-flex flex-column text-start ps-4">
                                            <div class="d-flex justify-content-between border-bottom border-primary pb-2 mb-2">
                                                <h4>Chicken</h4>
                                                <h4 class="text-primary">$90</h4>
                                            </div>
                                            <p class="mb-0">Consectetur adipiscing elit sed dwso eiusmod tempor incididunt ut labore.</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-6 wow bounceInUp" data-wow-delay="0.7s">
                                    <div class="menu-item d-flex align-items-center">
                                        <img class="flex-shrink-0 img-fluid rounded-circle" src="img/menu-07.jpg" alt="">
                                        <div class="w-100 d-flex flex-column text-start ps-4">
                                            <div class="d-flex justify-content-between border-bottom border-primary pb-2 mb-2">
                                                <h4>Blooming</h4>
                                                <h4 class="text-primary">$90</h4>
                                            </div>
                                            <p class="mb-0">Consectetur adipiscing elit sed dwso eiusmod tempor incididunt ut labore.</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-6 wow bounceInUp" data-wow-delay="0.8s">
                                    <div class="menu-item d-flex align-items-center">
                                        <img class="flex-shrink-0 img-fluid rounded-circle" src="img/menu-08.jpg" alt="">
                                        <div class="w-100 d-flex flex-column text-start ps-4">
                                            <div class="d-flex justify-content-between border-bottom border-primary pb-2 mb-2">
                                                <h4>Sweet</h4>
                                                <h4 class="text-primary">$90</h4>
                                            </div>
                                            <p class="mb-0">Consectetur adipiscing elit sed dwso eiusmod tempor incididunt ut labore.</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div id="tab-7" class="tab-pane fade show p-0">
                            <div class="row g-4">
                                <div class="col-lg-6">
                                    <div class="menu-item d-flex align-items-center">
                                        <img class="flex-shrink-0 img-fluid rounded-circle" src="img/menu-01.jpg" alt="">
                                        <div class="w-100 d-flex flex-column text-start ps-4">
                                            <div class="d-flex justify-content-between border-bottom border-primary pb-2 mb-2">
                                                <h4>Argentinian</h4>
                                                <h4 class="text-primary">$90</h4>
                                            </div>
                                            <p class="mb-0">Consectetur adipiscing elit sed dwso eiusmod tempor incididunt ut labore.</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="menu-item d-flex align-items-center">
                                        <img class="flex-shrink-0 img-fluid rounded-circle" src="img/menu-03.jpg" alt="">
                                        <div class="w-100 d-flex flex-column text-start ps-4">
                                            <div class="d-flex justify-content-between border-bottom border-primary pb-2 mb-2">
                                                <h4>Crispy</h4>
                                                <h4 class="text-primary">$90</h4>
                                            </div>
                                            <p class="mb-0">Consectetur adipiscing elit sed dwso eiusmod tempor incididunt ut labore.</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="menu-item d-flex align-items-center">
                                        <img class="flex-shrink-0 img-fluid rounded-circle" src="img/menu-05.jpg" alt="">
                                        <div class="w-100 d-flex flex-column text-start ps-4">
                                            <div class="d-flex justify-content-between border-bottom border-primary pb-2 mb-2">
                                                <h4>Sabudana Tikki</h4>
                                                <h4 class="text-primary">$90</h4>
                                            </div>
                                            <p class="mb-0">Consectetur adipiscing elit sed dwso eiusmod tempor incididunt ut labore.</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="menu-item d-flex align-items-center">
                                        <img class="flex-shrink-0 img-fluid rounded-circle" src="img/menu-07.jpg" alt="">
                                        <div class="w-100 d-flex flex-column text-start ps-4">
                                            <div class="d-flex justify-content-between border-bottom border-primary pb-2 mb-2">
                                                <h4>Blooming</h4>
                                                <h4 class="text-primary">$90</h4>
                                            </div>
                                            <p class="mb-0">Consectetur adipiscing elit sed dwso eiusmod tempor incididunt ut labore.</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="menu-item d-flex align-items-center">
                                        <img class="flex-shrink-0 img-fluid rounded-circle" src="img/menu-08.jpg" alt="">
                                        <div class="w-100 d-flex flex-column text-start ps-4">
                                            <div class="d-flex justify-content-between border-bottom border-primary pb-2 mb-2">
                                                <h4>Argentinian</h4>
                                                <h4 class="text-primary">$90</h4>
                                            </div>
                                            <p class="mb-0">Consectetur adipiscing elit sed dwso eiusmod tempor incididunt ut labore.</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="menu-item d-flex align-items-center">
                                        <img class="flex-shrink-0 img-fluid rounded-circle" src="img/menu-03.jpg" alt="">
                                        <div class="w-100 d-flex flex-column text-start ps-4">
                                            <div class="d-flex justify-content-between border-bottom border-primary pb-2 mb-2">
                                                <h4>Lemon</h4>
                                                <h4 class="text-primary">$90</h4>
                                            </div>
                                            <p class="mb-0">Consectetur adipiscing elit sed dwso eiusmod tempor incididunt ut labore.</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="menu-item d-flex align-items-center">
                                        <img class="flex-shrink-0 img-fluid rounded-circle" src="img/menu-02.jpg" alt="">
                                        <div class="w-100 d-flex flex-column text-start ps-4">
                                            <div class="d-flex justify-content-between border-bottom border-primary pb-2 mb-2">
                                                <h4>Water Drink</h4>
                                                <h4 class="text-primary">$90</h4>
                                            </div>
                                            <p class="mb-0">Consectetur adipiscing elit sed dwso eiusmod tempor incididunt ut labore.</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="menu-item d-flex align-items-center">
                                        <img class="flex-shrink-0 img-fluid rounded-circle" src="img/menu-01.jpg" alt="">
                                        <div class="w-100 d-flex flex-column text-start ps-4">
                                            <div class="d-flex justify-content-between border-bottom border-primary pb-2 mb-2">
                                                <h4>Salty lemon</h4>
                                                <h4 class="text-primary">$90</h4>
                                            </div>
                                            <p class="mb-0">Consectetur adipiscing elit sed dwso eiusmod tempor incididunt ut labore.</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div id="tab-8" class="tab-pane fade show p-0">
                            <div class="row g-4">
                                <div class="col-lg-6">
                                    <div class="menu-item d-flex align-items-center">
                                        <img class="flex-shrink-0 img-fluid rounded-circle" src="img/menu-01.jpg" alt="">
                                        <div class="w-100 d-flex flex-column text-start ps-4">
                                            <div class="d-flex justify-content-between border-bottom border-primary pb-2 mb-2">
                                                <h4>Crispy water</h4>
                                                <h4 class="text-primary">$90</h4>
                                            </div>
                                            <p class="mb-0">Consectetur adipiscing elit sed dwso eiusmod tempor incididunt ut labore.</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="menu-item d-flex align-items-center">
                                        <img class="flex-shrink-0 img-fluid rounded-circle" src="img/menu-02.jpg" alt="">
                                        <div class="w-100 d-flex flex-column text-start ps-4">
                                            <div class="d-flex justify-content-between border-bottom border-primary pb-2 mb-2">
                                                <h4>Juice</h4>
                                                <h4 class="text-primary">$90</h4>
                                            </div>
                                            <p class="mb-0">Consectetur adipiscing elit sed dwso eiusmod tempor incididunt ut labore.</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="menu-item d-flex align-items-center">
                                        <img class="flex-shrink-0 img-fluid rounded-circle" src="img/menu-03.jpg" alt="">
                                        <div class="w-100 d-flex flex-column text-start ps-4">
                                            <div class="d-flex justify-content-between border-bottom border-primary pb-2 mb-2">
                                                <h4>Orange</h4>
                                                <h4 class="text-primary">$90</h4>
                                            </div>
                                            <p class="mb-0">Consectetur adipiscing elit sed dwso eiusmod tempor incididunt ut labore.</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="menu-item d-flex align-items-center">
                                        <img class="flex-shrink-0 img-fluid rounded-circle" src="img/menu-04.jpg" alt="">
                                        <div class="w-100 d-flex flex-column text-start ps-4">
                                            <div class="d-flex justify-content-between border-bottom border-primary pb-2 mb-2">
                                                <h4>Apple Juice</h4>
                                                <h4 class="text-primary">$90</h4>
                                            </div>
                                            <p class="mb-0">Consectetur adipiscing elit sed dwso eiusmod tempor incididunt ut labore.</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="menu-item d-flex align-items-center">
                                        <img class="flex-shrink-0 img-fluid rounded-circle" src="img/menu-05.jpg" alt="">
                                        <div class="w-100 d-flex flex-column text-start ps-4">
                                            <div class="d-flex justify-content-between border-bottom border-primary pb-2 mb-2">
                                                <h4>Banana</h4>
                                                <h4 class="text-primary">$90</h4>
                                            </div>
                                            <p class="mb-0">Consectetur adipiscing elit sed dwso eiusmod tempor incididunt ut labore.</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="menu-item d-flex align-items-center">
                                        <img class="flex-shrink-0 img-fluid rounded-circle" src="img/menu-06.jpg" alt="">
                                        <div class="w-100 d-flex flex-column text-start ps-4">
                                            <div class="d-flex justify-content-between border-bottom border-primary pb-2 mb-2">
                                                <h4>Sweet Water</h4>
                                                <h4 class="text-primary">$90</h4>
                                            </div>
                                            <p class="mb-0">Consectetur adipiscing elit sed dwso eiusmod tempor incididunt ut labore.</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="menu-item d-flex align-items-center">
                                        <img class="flex-shrink-0 img-fluid rounded-circle" src="img/menu-07.jpg" alt="">
                                        <div class="w-100 d-flex flex-column text-start ps-4">
                                            <div class="d-flex justify-content-between border-bottom border-primary pb-2 mb-2">
                                                <h4>Hot Coffee</h4>
                                                <h4 class="text-primary">$90</h4>
                                            </div>
                                            <p class="mb-0">Consectetur adipiscing elit sed dwso eiusmod tempor incididunt ut labore.</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="menu-item d-flex align-items-center">
                                        <img class="flex-shrink-0 img-fluid rounded-circle" src="img/menu-08.jpg" alt="">
                                        <div class="w-100 d-flex flex-column text-start ps-4">
                                            <div class="d-flex justify-content-between border-bottom border-primary pb-2 mb-2">
                                                <h4>Sweet Potato</h4>
                                                <h4 class="text-primary">$90</h4>
                                            </div>
                                            <p class="mb-0">Consectetur adipiscing elit sed dwso eiusmod tempor incididunt ut labore.</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div id="tab-9" class="tab-pane fade show p-0">
                            <div class="row g-4">
                                <div class="col-lg-6">
                                    <div class="menu-item d-flex align-items-center">
                                        <img class="flex-shrink-0 img-fluid rounded-circle" src="img/menu-06.jpg" alt="">
                                        <div class="w-100 d-flex flex-column text-start ps-4">
                                            <div class="d-flex justify-content-between border-bottom border-primary pb-2 mb-2">
                                                <h4>Sabudana Tikki</h4>
                                                <h4 class="text-primary">$90</h4>
                                            </div>
                                            <p class="mb-0">Consectetur adipiscing elit sed dwso eiusmod tempor incididunt ut labore.</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="menu-item d-flex align-items-center">
                                        <img class="flex-shrink-0 img-fluid rounded-circle" src="img/menu-07.jpg" alt="">
                                        <div class="w-100 d-flex flex-column text-start ps-4">
                                            <div class="d-flex justify-content-between border-bottom border-primary pb-2 mb-2">
                                                <h4>Crispy</h4>
                                                <h4 class="text-primary">$90</h4>
                                            </div>
                                            <p class="mb-0">Consectetur adipiscing elit sed dwso eiusmod tempor incididunt ut labore.</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="menu-item d-flex align-items-center">
                                        <img class="flex-shrink-0 img-fluid rounded-circle" src="img/menu-09.jpg" alt="">
                                        <div class="w-100 d-flex flex-column text-start ps-4">
                                            <div class="d-flex justify-content-between border-bottom border-primary pb-2 mb-2">
                                                <h4>Pizza</h4>
                                                <h4 class="text-primary">$90</h4>
                                            </div>
                                            <p class="mb-0">Consectetur adipiscing elit sed dwso eiusmod tempor incididunt ut labore.</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="menu-item d-flex align-items-center">
                                        <img class="flex-shrink-0 img-fluid rounded-circle" src="img/menu-02.jpg" alt="">
                                        <div class="w-100 d-flex flex-column text-start ps-4">
                                            <div class="d-flex justify-content-between border-bottom border-primary pb-2 mb-2">
                                                <h4>Bacon</h4>
                                                <h4 class="text-primary">$90</h4>
                                            </div>
                                            <p class="mb-0">Consectetur adipiscing elit sed dwso eiusmod tempor incididunt ut labore.</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="menu-item d-flex align-items-center">
                                        <img class="flex-shrink-0 img-fluid rounded-circle" src="img/menu-03.jpg" alt="">
                                        <div class="w-100 d-flex flex-column text-start ps-4">
                                            <div class="d-flex justify-content-between border-bottom border-primary pb-2 mb-2">
                                                <h4>Chicken</h4>
                                                <h4 class="text-primary">$90</h4>
                                            </div>
                                            <p class="mb-0">Consectetur adipiscing elit sed dwso eiusmod tempor incididunt ut labore.</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="menu-item d-flex align-items-center">
                                        <img class="flex-shrink-0 img-fluid rounded-circle" src="img/menu-05.jpg" alt="">
                                        <div class="w-100 d-flex flex-column text-start ps-4">
                                            <div class="d-flex justify-content-between border-bottom border-primary pb-2 mb-2">
                                                <h4>Blooming</h4>
                                                <h4 class="text-primary">$90</h4>
                                            </div>
                                            <p class="mb-0">Consectetur adipiscing elit sed dwso eiusmod tempor incididunt ut labore.</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="menu-item d-flex align-items-center">
                                        <img class="flex-shrink-0 img-fluid rounded-circle" src="img/menu-07.jpg" alt="">
                                        <div class="w-100 d-flex flex-column text-start ps-4">
                                            <div class="d-flex justify-content-between border-bottom border-primary pb-2 mb-2">
                                                <h4>Sweet</h4>
                                                <h4 class="text-primary">$90</h4>
                                            </div>
                                            <p class="mb-0">Consectetur adipiscing elit sed dwso eiusmod tempor incididunt ut labore.</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="menu-item d-flex align-items-center">
                                        <img class="flex-shrink-0 img-fluid rounded-circle" src="img/menu-09.jpg" alt="">
                                        <div class="w-100 d-flex flex-column text-start ps-4">
                                            <div class="d-flex justify-content-between border-bottom border-primary pb-2 mb-2">
                                                <h4>Argentinian</h4>
                                                <h4 class="text-primary">$90</h4>
                                            </div>
                                            <p class="mb-0">Consectetur adipiscing elit sed dwso eiusmod tempor incididunt ut labore.</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div id="tab-10" class="tab-pane fade show p-0">
                            <div class="row g-4">
                                <div class="col-lg-6">
                                    <div class="menu-item d-flex align-items-center">
                                        <img class="flex-shrink-0 img-fluid rounded-circle" src="img/menu-06.jpg" alt="">
                                        <div class="w-100 d-flex flex-column text-start ps-4">
                                            <div class="d-flex justify-content-between border-bottom border-primary pb-2 mb-2">
                                                <h4>Sabudana Tikki</h4>
                                                <h4 class="text-primary">$90</h4>
                                            </div>
                                            <p class="mb-0">Consectetur adipiscing elit sed dwso eiusmod tempor incididunt ut labore.</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="menu-item d-flex align-items-center">
                                        <img class="flex-shrink-0 img-fluid rounded-circle" src="img/menu-07.jpg" alt="">
                                        <div class="w-100 d-flex flex-column text-start ps-4">
                                            <div class="d-flex justify-content-between border-bottom border-primary pb-2 mb-2">
                                                <h4>Crispy</h4>
                                                <h4 class="text-primary">$90</h4>
                                            </div>
                                            <p class="mb-0">Consectetur adipiscing elit sed dwso eiusmod tempor incididunt ut labore.</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="menu-item d-flex align-items-center">
                                        <img class="flex-shrink-0 img-fluid rounded-circle" src="img/menu-09.jpg" alt="">
                                        <div class="w-100 d-flex flex-column text-start ps-4">
                                            <div class="d-flex justify-content-between border-bottom border-primary pb-2 mb-2">
                                                <h4>Pizza</h4>
                                                <h4 class="text-primary">$90</h4>
                                            </div>
                                            <p class="mb-0">Consectetur adipiscing elit sed dwso eiusmod tempor incididunt ut labore.</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="menu-item d-flex align-items-center">
                                        <img class="flex-shrink-0 img-fluid rounded-circle" src="img/menu-02.jpg" alt="">
                                        <div class="w-100 d-flex flex-column text-start ps-4">
                                            <div class="d-flex justify-content-between border-bottom border-primary pb-2 mb-2">
                                                <h4>Bacon</h4>
                                                <h4 class="text-primary">$90</h4>
                                            </div>
                                            <p class="mb-0">Consectetur adipiscing elit sed dwso eiusmod tempor incididunt ut labore.</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="menu-item d-flex align-items-center">
                                        <img class="flex-shrink-0 img-fluid rounded-circle" src="img/menu-03.jpg" alt="">
                                        <div class="w-100 d-flex flex-column text-start ps-4">
                                            <div class="d-flex justify-content-between border-bottom border-primary pb-2 mb-2">
                                                <h4>Chicken</h4>
                                                <h4 class="text-primary">$90</h4>
                                            </div>
                                            <p class="mb-0">Consectetur adipiscing elit sed dwso eiusmod tempor incididunt ut labore.</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="menu-item d-flex align-items-center">
                                        <img class="flex-shrink-0 img-fluid rounded-circle" src="img/menu-05.jpg" alt="">
                                        <div class="w-100 d-flex flex-column text-start ps-4">
                                            <div class="d-flex justify-content-between border-bottom border-primary pb-2 mb-2">
                                                <h4>Blooming</h4>
                                                <h4 class="text-primary">$90</h4>
                                            </div>
                                            <p class="mb-0">Consectetur adipiscing elit sed dwso eiusmod tempor incididunt ut labore.</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="menu-item d-flex align-items-center">
                                        <img class="flex-shrink-0 img-fluid rounded-circle" src="img/menu-07.jpg" alt="">
                                        <div class="w-100 d-flex flex-column text-start ps-4">
                                            <div class="d-flex justify-content-between border-bottom border-primary pb-2 mb-2">
                                                <h4>Sweet</h4>
                                                <h4 class="text-primary">$90</h4>
                                            </div>
                                            <p class="mb-0">Consectetur adipiscing elit sed dwso eiusmod tempor incididunt ut labore.</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Menu End -->	

		<div class="col-6">
			<ul>
				<li>이메일</li>
				<li>${memberVO.mem_email}</li>
				<li>닉네임</li>
				<li>${memberVO.mem_nickname}</li>
			</ul>
			<c:if test="${!empty memberVO.mem_name}">
				<ul>
					<li>이름</li>
					<li>${memberVO.mem_name}</li>
				</ul>
				<ul>
					<li>연락처</li>
					<li>${memberVO.mem_phone}</li>
				</ul>
				<ul>
					<li>주소</li>
					<li>${memberVO.mem_address1} ${memberVO.mem_address2} ${memberVO.mem_zipcode}</li>
				</ul>
				<input type="button" value="정보 수정하기" class="btn btn-secondary" onclick="location.href='${pageContext.request.contextPath}/member/mypageUpdate'">
			</c:if>
			<c:if test="${empty memberVO.mem_name}">
				<input type="button" value="추가 정보 입력 후 편하게 사이트를 이용하세요" class="btn btn-secondary" onclick="location.href='${pageContext.request.contextPath}/member/mypageUpdate'">
			</c:if>
			<input type="button" value="비밀번호 변경" class="btn btn-secondary" onclick="location.href='${pageContext.request.contextPath}/member/'">
			<input type="button" value="회원 탈퇴" class="btn btn-secondary" onclick="location.href='${pageContext.request.contextPath}/member/'">
				
		</div>
	</div>
</div>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(function(){
	
		//프로필 사진 변경 선택 시 버튼 노출
		$('#photo_btn').click(function(){
			$('#photo_choice').show();
		});
		
		//기존 이미지 저장
		let old_photo = $('.my-photo').attr('src');
		//변경할 이미지 변수 선언
		let new_photo;
	
		//파일 선택 시
		$('#upload').change(function(){
			new_photo = this.files[0]; //변경할 이미지 저장
			
			if(!new_photo){ //선택창에서 파일 선택을 취소할 경우
				$('.my-photo').attr('src',old_photo); //기존 이미지로
				return;
			}
			
			//용량체크
			if(new_photo.size > 1024*1024){
				alert("용량 초과");
				$('.my-photo').attr('src',old_photo); //기존 이미지로
				$(this).val(''); //파일명 지우기
			}
			
			//미리보기
			let reader = new FileReader(); //사진 파일을 읽어오기 위한 객체 생성
			reader.readAsDataURL(new_photo); //객체를 이용해 선택한 파일을 읽어 옴
			reader.onload = function(){ //파일을 다 읽어오면
				$('.my-photo').attr('src',reader.result); //이미지 미리보기 처리
			};
		});
		
		//전송 클릭 시 업로드
		$('#photo_submit').click(function(){
			
			//유효성 체크
			if($('#upload').val()==''){
				alert('파일 선택 필요');
				$('#upload').focus();
				return;
			}
			
			//전송할 파일
			let form_data = new FormData();
			form_data.append('upload',new_photo);
			
			//서버와 통신
			$.ajax({
				url: '../member/updateMyPhoto',
				type: 'post',
				data: form_data,
				dataType: 'json',
				contentType: false,
				processData: false,
				success: function(param){
					if(param.result=='logout'){
						alert('로그아웃');
					} else if(param.result=='success'){
						alert('성공');
						old_photo = $('.my-photo').attr('src');
						$('#photo_choice').hide();
					} else{
						alert('등록 오류');
					}
				},
				error: function(){
					alert('네트워크 오류');
				}
			});
			
		});
		
		//취소 버튼 클릭 시 리셋
		$('#photo_reset').click(function(){
			$('.my-photo').attr('src',old_photo);
			$('#photo_choice').hide();
		});
	});
</script>