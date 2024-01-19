package kr.spring.member.controller;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.spring.member.service.MemberService;
import kr.spring.member.vo.MemberVO;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class MypageController {
	
	//의존 관계 주입
	@Autowired
	private MemberService memberService;
	
	//VO 초기화
	@ModelAttribute
	public MemberVO initCommand(HttpSession session) {
		MemberVO user = (MemberVO)session.getAttribute("user");
		return user;
	}
	
	//마이페이지 메인
	@RequestMapping("/member/mypageMain")
	public String mypageMain() {
		
		return "mypageMain"; //타일즈
	}
	
	//회원 정보 수정폼
	@GetMapping("/member/mypageUpdate")
	public String mypageUpdateForm() {
		return "mypageUpdate";
	}
	
	//회원 정보 수정 submit
	@PostMapping("/member/mypageUpdate")
	public String mypageUpdateSubmit(@Valid MemberVO memberVO, BindingResult result) {
		
		//유효성 체크
		if(result.hasErrors()) return mypageUpdateForm();
		
		log.debug("<<회원 정보 수정>> : " + memberVO);
		
		//update 진행
		memberService.updateMemberDetail(memberVO);
		
		return "mypageMain";
	}
	
}
