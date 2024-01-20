package kr.spring.member.controller;

import java.util.HashMap;
import java.util.Map;
import java.util.regex.Pattern;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.spring.member.service.MemberService;
import kr.spring.member.vo.MemberVO;

@Controller
public class MemberAjaxController {
	
	@Autowired
	private MemberService memberService;
	
	/*----------이메일 중복 체크----------*/
	@RequestMapping("/member/checkEmail")
	@ResponseBody
	public Map<String,String> checkEmail(@RequestParam String mem_email){
		
		Map<String, String> map = new HashMap<String, String>();
		
		MemberVO memberVO = memberService.selectMember(mem_email);
		
		if(memberVO!=null) { //이메일이 중복인 경우
			map.put("result", "emailDuplicated");
		} else {
			if(!Pattern.matches("^[a-zA-Z0-9+-\\_.]+@[a-zA-Z0-9-]+\\.[a-zA-Z0-9-.]+$",mem_email)) { //이메일 미중복, 패턴 불일치
				map.put("result", "notMatchPattern");
			} else { //이메일 미중복, 패턴 일치
				map.put("result", "emailNotFound");
			}
		}
		return map;
	}
	
	/*----------닉네임 중복 체크----------*/
	@RequestMapping("/member/checkNickname")
	@ResponseBody
	public Map<String,String> checkNickname(@RequestParam String mem_nickname, HttpSession session){
		
		Map<String, String> map = new HashMap<String, String>();
		
		MemberVO user = (MemberVO)session.getAttribute("user"); //로그인된 사용자 정보를 읽어 옴
		MemberVO memberVO = memberService.checkNickname(mem_nickname); //파라미터로 받은 닉네임 체크
		
		if(user!=null && mem_nickname.equals(user.getMem_nickname())) { //로그인된 경우, 원래 닉네임은 사용 가능
			map.put("result", "originalNickName");
		} else if(memberVO!=null) { //닉네임 중복
			map.put("result", "nicknameDuplicated");
		}else { //닉네임 미중복
			if(!Pattern.matches("^[가-힣]*$",mem_nickname)) { //형식 불일치
				map.put("result", "notMatchPattern"); //특수문자를 제외한 닉네임만 입력 가능
			} else { //닉네임 미중복, 패턴 일치
				map.put("result", "nicknameNotFound");
			}
		}
		return map;
	}
	
	/*----------연락처 중복 체크----------*/
	@RequestMapping("/member/checkPhone")
	@ResponseBody
	public Map<String,String> checkPhone(@RequestParam String mem_phone, HttpSession session){
		
		Map<String, String> map = new HashMap<String, String>();
		
		MemberVO user = (MemberVO)session.getAttribute("user"); //로그인된 사용자 정보를 읽어 옴
		MemberVO memberVO = memberService.checkPhone(mem_phone); //파라미터로 받은 연락처 체크
		
		if(user!=null && mem_phone.equals(user.getMem_phone())) { //로그인된 경우, 원래 연락처는 사용 가능
			map.put("result", "originalPhone");
		} else if(memberVO!=null) { //연락처 중복
			map.put("result", "phoneDuplicated");
		}else { //닉네임 미중복
			if(!Pattern.matches("^010-([0-9]{3,4})-([0-9]{4})$",mem_phone)) { //형식 불일치
				map.put("result", "notMatchPattern"); //특수문자를 제외한 닉네임만 입력 가능
			} else { //연락처 미중복, 패턴 일치
				map.put("result", "phoneNotFound");
			}
		}
		return map;
	}
	
}
