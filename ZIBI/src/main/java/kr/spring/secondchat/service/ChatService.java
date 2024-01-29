package kr.spring.secondchat.service;

import java.util.Map;

import kr.spring.secondchat.vo.ChatRoomVO;

public interface ChatService {
	//채팅방 체크
	public ChatRoomVO selectroomcheck(Map<String,Object> map);
	
	//판매자 구하기 
	public int selectSellerNum(int sc_num);
	//채팅방 생성
	public void insertChatRoom(ChatRoomVO chatRoomVO); //selectChatRoomNum있음.
	//채팅방 관련 정보 구하기 - 
	public ChatRoomVO selectChatroomDetail(int chatroom_num);
}
