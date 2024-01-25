package kr.spring.second.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.spring.member.vo.MemberVO;
import kr.spring.second.service.SecondService;
import kr.spring.second.vo.SecondFavVO;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class SecondAjaxController {
	@Autowired
	private SecondService secondService;
	/*============================
	 * 부모글 찜 읽기
	 *============================*/
	@RequestMapping("/secondhand/sc_getFav")
	@ResponseBody	
	public Map<String,Object> getFav(SecondFavVO scfav, HttpSession session){
		log.debug("<<중고거래 찜 SecondFavVO>> : " + scfav);
		
		Map<String,Object> mapJson = new HashMap<String,Object>();
		MemberVO user = (MemberVO)session.getAttribute("user");
		if(user==null) {
			mapJson.put("status", "noFav");//count만 표시하고 상태는 선택하지 않은 
		}else {
			//로그인된 회원번호 셋팅
			scfav.setMem_num(user.getMem_num());
			
			SecondFavVO secondFav = secondService.selectFav(scfav);
			if(secondFav!=null) {//이미 찜 등록한 경우
				mapJson.put("status", "yesFav");
			}else {
				mapJson.put("status", "noFav");
			}
		}
		//좋아요수
		mapJson.put("count", secondService.selectFavCount(scfav.getSc_num()));
		
		return mapJson;
	}
	
	/*============================
	 * 부모글 찜 등록/삭제  (토글 형태)
	 *============================*/
	@RequestMapping("/secondhand/sc_writeFav")
	@ResponseBody					//scfav에는 전달된 sc_num만 값이 들어있음
	public Map<String,Object> sc_writeFav(SecondFavVO scfav, HttpSession session){
		log.debug("<<중고거래 상세글 찜 등록/삭제 SecondFavVO>> " + scfav);
		
		Map<String,Object> mapJson = new HashMap<String,Object>();
		
		MemberVO user = (MemberVO)session.getAttribute("user");
		if(user==null) {
			mapJson.put("result", "logout");
		}else {
			//로그인된 회원번호 셋팅
			scfav.setMem_num(user.getMem_num());
			
			//이전에 찜을 등록했는지 여부 확인
			SecondFavVO secondFav = secondService.selectFav(scfav);//한건의 데이터 읽어옴
			if(secondFav!=null) {//이미 찜 등록한 경우
				secondService.deleteFav(scfav);//찜 삭제
				mapJson.put("status", "noFav");
			}else {//아직 찜 안 한 경우
				secondService.insertFav(scfav);//좋아요 등록
				mapJson.put("status", "yesFav");
			}
			mapJson.put("result", "success");
			//찜 수 						
			mapJson.put("count",secondService.selectFavCount(scfav.getSc_num()));
		}
		return mapJson;
	}
}
