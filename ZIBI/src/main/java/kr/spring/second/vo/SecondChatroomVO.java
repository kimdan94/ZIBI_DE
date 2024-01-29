package kr.spring.second.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class SecondChatroomVO {
	private int chatroom_num;  	//채팅방 식별 번호	//pk  
	private int sc_num;      	//판매글 번호    //fk
	private int seller_num;		//판매자 회원 번호//fk
	private int buyer_num;		//구매자 회원번호 //fk
	
	//매핑
	private SecondChatVO secondChatVO;
}
