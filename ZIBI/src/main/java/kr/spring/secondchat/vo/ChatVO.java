package kr.spring.secondchat.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ChatVO {
	private int chat_num;			//채팅 메시지 식별 번호//pk
	private String chat_message;	//채팅 메시지 내용
	private Date chat_reg_date;		//채팅 등록일
	private int chat_read_check;	//메시지 읽음 체크(0:안읽음, 1:읽음)
	private int chatroom_num;		//채팅방 식별 번호//fk
	private int mem_num;			//회원 식별 번호//fk
	
	
}
