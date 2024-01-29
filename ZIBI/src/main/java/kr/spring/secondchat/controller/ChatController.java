package kr.spring.secondchat.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.spring.member.vo.MemberVO;
import kr.spring.secondchat.service.ChatService;
import kr.spring.secondchat.vo.ChatRoomVO;
import lombok.extern.slf4j.Slf4j;
//중고거래 채팅 controller
@Controller
@Slf4j
public class ChatController {
	@Autowired
	private ChatService chatService;
	
	/*================================
	 * 중고거래 채팅
	 *================================*/
	//구매자가 상세페이지에서 채팅하기 버튼 클릭할 때   chatListForBuyer에서 채팅방 생성 여부 처리 한 후 
	@GetMapping("/secondchat/chatListForBuyer")
	public String chatListForBuyer(@RequestParam int sc_num,HttpSession session) {
		log.debug("<<채팅- 채팅방 여부 진입 sc_num >> : " + sc_num);
		
		
		//세션에 로그인된 회원 정보 user에 저장
		MemberVO user = (MemberVO)session.getAttribute("user");
		
		Map<String,Object> map = new HashMap<String,Object>();
		
		map.put("sc_num", sc_num);//판매글 번호
		map.put("buyer_num", user.getMem_num());//로그인한 회원번호를 buyer_num으로 전달(구매자 회원번호)
		
		ChatRoomVO chatroom = chatService.selectroomcheck(map);//db에 레코드가 있다면 한건의 레코드 읽어오고, 없다면 null
		log.debug("<<채팅- 채팅방 여부 chatroom>> : " + chatroom);
		//판매자 구하기 
		int seller_num = chatService.selectSellerNum(sc_num);
		log.debug("<<채팅- 판매자 구하기 seller_num>> : " + seller_num);
		
		//insert에 데이터를 전달해주기 위해 자바빈 생성 
		ChatRoomVO chatRoomVO = new ChatRoomVO();
		chatRoomVO.setSc_num(sc_num);
		chatRoomVO.setBuyer_num(user.getMem_num());
		chatRoomVO.setSeller_num(seller_num);
		log.debug("<<채팅- chatRoomVO에 데이터 세팅 후 > : " + chatRoomVO);
		//채팅방 체크
		if(chatroom!=null) {//이미 채팅방이 생성되어있는 경우 				 	
			return "redirect:/secondchat/chatDetail?chatroom_num=" + chatroom.getChatroom_num();
		}
		//채팅방이 생성되어 있지 않아 채팅방 생성한다
		chatService.insertChatRoom(chatRoomVO);
		return "redirect:/secondchat/chatDetail?chatroom_num=" + chatService.selectroomcheck(map).getChatroom_num();
	}
	
	//채팅 메시지 페이지 호출 - 화면 호출만
	@GetMapping("/secondchat/chatDetail")
	public String chatDetail(@RequestParam int chatroom_num, Model model, HttpSession session) {
		//화면 호출만 - chatroomvo에 데이터 담아서 가져오기 조인햇 seller buyer num 가져옥
		MemberVO user = (MemberVO)session.getAttribute("user");
		
		ChatRoomVO chatRoomVO = chatService.selectChatroomDetail(chatroom_num);
		log.debug("<<채팅 메시지 페이지 호출 - chatRoomVO >> : " + chatRoomVO);
		
		
		return "chatDetail";
	}
	
	
	
	/*
	 * //채팅 메시지 읽기
	 * 
	 * @RequestMapping("/secondchat/chatDetailAjax")
	 * 
	 * @ResponseBody public Map<String,Object> chatDetailAjax(@RequestParam int
	 * cahtroom_num, HttpSession session) { //메시지를 읽어오기 chatroom_num,
	 * user.mem_num->mem_num =>mem_num은 읽었는지 체크하기 위해서
	 * 
	 * Map<String,Object> mapAjax = new HashMap<String,Object>();
	 * 
	 * 
	 * return mapAjax; }
	 */
}
