package kr.spring.secondchat.dao;

import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import kr.spring.secondchat.vo.ChatRoomVO;

@Mapper
public interface ChatMapper {
	//채팅방 체크								//판매글 번호			구매자 회원번호
	@Select("SELECT * FROM chatroom WHERE sc_num=#{sc_num} AND buyer_num=#{buyer_num}")
	public ChatRoomVO selectroomcheck(Map<String,Object> map);
	//채팅방 번호 생성
	@Select("SELECT chatroom_seq.nextval FROM dual")
	public int selectChatRoomNum();
	//판매자 구하기
	@Select("SELECT mem_num FROM second WHERE sc_num=#{sc_num}")
	public int selectSellerNum(int sc_num);
	//채팅방 생성
	@Insert("INSERT INTO chatroom (chatroom_num,sc_num,seller_num,buyer_num) VALUES (#{chatroom_num},#{sc_num},#{seller_num},#{buyer_num})")
	public void insertChatRoom(ChatRoomVO chatRoomVO); 
	//채팅방 관련 정보 구하기 - 
	public ChatRoomVO selectChatroomDetail(int chatroom_num);
}
