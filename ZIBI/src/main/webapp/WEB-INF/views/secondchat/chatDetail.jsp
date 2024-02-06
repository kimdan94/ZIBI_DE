<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jiwon/message.chat.js"></script>
<!-- Contact Start -->
        <div class="container-fluid contact py-6" id="chatDetail">
            <div class="container">
                <div class="p-5 bg-light rounded contact-form"> 
                    <div class="mb-0" style="background-color:yellow;">
                    	<h3 id="seller_title"><span id="seller_nickname">판매자 : ${chatRoomVO.seller}</span></h3>
                    </div>
                    <div class="row g-4">
                        <div class="col-12 chat-iteminfo">
                            <span class="mb-0">${chatRoomVO.sc_title}</span>
                        </div>
                        <div id="chatting_message"></div>
                        <div>
                            <form method="post" id="chatdetail_form">
                            	<input type="hidden" name="chatroom_num" id="chatroom_num" value="${chatRoomVO.chatroom_num}">
                                <textarea class="w-100 form-control mb-4 p-3 border-primary bg-light" rows="5" cols="10"  name="chat_message" id="chat_message"></textarea>
                                <div id="message_btn">
                                	<button class="w-100 btn btn-primary form-control p-3 border-primary bg-primary rounded-pill" type="submit">Submit Now</button>
                            	</div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Contact End -->

